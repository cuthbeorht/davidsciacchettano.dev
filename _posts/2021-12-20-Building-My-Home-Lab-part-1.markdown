---
layout: post
title: Building My Homelab - Part 1
date: 2021-12-20 19:00:00
categories: Dev blog update
---

# Building My Homelab  -Prt 1

So, I decided to build a homelab. I've been dabling with setting a homelab on a cloud platform for a while.
However, I always found it a tad annoying that I had to pay to simply host content when I had a PC lying around at home.

So, without any more delay, here is my Homelab.

## Part I

I this first part, I will explain why I chose thte OS and underlying technology. Just know, these are my 
choices. They aren't necessarily correct. If you find something wrong or a better way of how to do tihns,
please leave me a comment, or reach out to me. I listen to all feedback.

### Operating System

I tried 3 Operating Systems:

- Ubuntu Server
- Proxmox
- TrueNAS

I heard a lot of good things about FreeNAS. And since my main goal was to serve my music collection to my local
network, it felt like a good starting point.

I installed it and stared playing around with it. I tried to get Plex running on it. I kept getting errors installing Plex. I couldn't create mounts.
After a few hours, I gave up. This is nothing against the quality of the OS. I uts didn't have any patience.

Proxmox was my second choice. I had less luck with it than TrueNAS. I found it way too complex for my needs.

After trying TrueNAS and Proxmox, I decided to use a simple Linux server. It works, and is all I needed.

### Core Technology Stack

I know Docker very well. So, I decided to start out with that. I created a docker-compose.yml file. I won't post the whole docker-compose file here, just enough to get started. The full file can be found on my Github for this project.

```yaml
version: "2.1"
services:
    jekyll:
    image: ghcr.io/cuthbeorht/davidsciacchettano.ca
    container_name: jekyll
    environment:
        - JEKYLL_VERSION=3.8
    command: ['jekyll', 'serve']
    ports:
        - "4000:4000"
    logging:
        driver: gelf
        options:
        gelf-address: "udp://localhost:12201" # Logstash UDP input port
        tag: "jekyll"
```

All this is a simple docker-compose file that creates a container using my image `ghcr.io/cuthbeorht/davidsciacchettano.ca` and exposing the port `4000`.