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

## Setting up the Pi after installing the OS

- SSH into the Pi
- Become root: `sudo su -`
- Install IPTables if necessary
- Enable IPTables: `sudo iptables`
- Run this command:

```bash
sudo iptables -F
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
```

- Install K3S on the master node: `curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s`
- Get the master node's token: `cat /var/lib/rancher/k3s/server/node-token`
- Setup[ the other nodes:]

```bash
curl -sfL https://get.k3s.io | K3S_TOKEN="<the tokenfrom the master>" K3S_URL="https://192.168.1.100:6443" K3S_NODE_NAME="some node anme" sh -
```

# Deploy a test Service

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
          name: web
          protocol: TCP
        readinessProbe:
          httpGet:
            port: web
            path: /
```

Run `kuberctyl apply -f <filename>`

## Deploy a NodePort

Need a service, called nodeport to expose the Nginx deployment

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-nodeport
spec:
  type: NodePort
  selector:
    app: nginx #same as app in deployment
  ports:
    - name: web
      port: 80
      targetPort: web
      nodePort: 31111
```

Run `kuberctyl apply -f <filename>`

And that's as far as I got. Next step, is to set up Rancher in an easy-tu-use way.