---
layout: post
title: Redoing My Homelab
date: 2022-03-06 06h00
categories: Dev blog update
---

# Redoing My Homelab

## What's Going On?

So, you kay have noticed a dip in my talking about my home lab. I tried to install and setup K3S on my Raspberry Pi 4 cluster; That didn't work out too well. I then tried to go the docker-compose setup. That worked out but I decided against it since it was using my gaming PC running linux. I didn't want to monopolize it anymore, so I stopped using it.

## Setting up my cluster

First and foremost, I need to setup my cluster. I need an OS! I am going to try using Raspberry Pi's new 64-bit OS, Raspbien OS 64-bit edition for Raspberry Pi 4 - 8 Gb.

- Use an Imaging app to install the OS or whichever method you like to create a bootable SD card
- Put the SD card into the Pi and start it
- Stop the Pi and put the SD card back into the PC to edit the files
- Edit the following files:
  - cmdline.txt:
    - Add the following to the end of the first line:
    
    `cgroup_memory=1 cgroup_enable=memory ip=<ip_address>::<gateway>:255.255.255.0:<hostname>:<network_interface>:off`

    - IP Address: Whatever you want the IP address of your Pi to be on the network
    - Gateway: The default gateway of your network
    - Subnet mask: Usually 255.255.255.0
    - Hostname: Whatever host you want
    - Network Interface: Usually `eth0`
    - Auto Configuration: Off normally
  - config.txt:
    - Add a line:

    `arm_64bit=1`

    Forces using the 64bit kernel of the linux distro under the hood
  - In the boot drive again, add an empty file, `ssh`.

And we're done!

## Install K3S

This will install K3S without Treafik and using mode 644 so that Kubectl is accessible as a regular user. 

`curl -sfL https://get.k3s.io | sh -s - server --write-kubeconfig-mode 644 --no-deploy traefik --no-deploy servicelb`

## Create an Nginx Ingress Controller

Always find the latest version here: https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal-clusters

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/baremetal/deploy.yaml`

## Modify RPi DHCP Configuration

Modify the file `/etc/dhcpcd.conf`:

```init
interface eth0
static ip_address=192.168.1.100/24
static ip6_address=fd51:42f8:caae:d92e::ff/64
static routers=192.168.1.1
static domain_name_servers=192.168.1.200 8.8.8.8 fd51:42f8:caae:d92e::1
```

# Install Kubernetes (k3s)

```bash
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC=" --disable servicelb --disable traefik"
curl -sfL https://get.k3s.io | sh -
```

# Install Helm

- Use the Installation script found on their (homepage)[https://github.com/helm/helm/releases]
- Configure official charts

```bash
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
#"stable" has been added to your repositories
helm repo update
```

# Install MetalLB

```bash
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
helm install metallb bitnami/metallb --namespace kube-system \
  --set configInline.address-pools[0].name=default \
  --set configInline.address-pools[0].protocol=layer2 \
  --set configInline.address-pools[0].addresses[0]=192.168.1.240-192.168.1.250

```
# Create Kubernetes Dashboard

## Setup & Install K8S Dashboard
```bash
export GITHUB_URL=https://github.com/kubernetes/dashboard/releases
export VERSION_KUBE_DASHBOARD=$(curl -w '%{url_effective}' -I -L -s -S ${GITHUB_URL}/latest -o /dev/null | sed -e 's|.*/||')
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/${VERSION_KUBE_DASHBOARD}/aio/deploy/recommended.yaml
```

## Create Dashboard Users

- dashboard.admin-user.yml

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
```

- dashboard.admin-user-role.yml

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: admin-user
    namespace: kubernetes-dashboard
```

## Create Nginx Ingress

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: kubernetes-dashboard-ingress
  namespace: kubernetes-dashboard
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - host: dashboard.cuthbeorht.home
    http:
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: kubernetes-dashboard
              port:
                number: 443
```

## Create Simple Nginx Ingress Controller

The latest can be found here: https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal-clusters

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/baremetal/deploy.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: ingress-nginx-controller-loadbalancer
  namespace: ingress-nginx
spec:
  selector:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
  ports:
    - name: http
      port: 80
      protocol: TCP
      targetPort: 80
    - name: https
      port: 443
      protocol: TCP
      targetPort: 443
  type: LoadBalancer
```