---
layout: post
title: Building My Homelab - Part 2
date: 2021-12-24 19:00:00
categories: Dev blog update
---

# Building My Homelab - Part II

In this section, I will be talking about what underlying technology stack I opted to use.

## Core Technology Stack

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

Inside my server, I have setup [Linux Swag](https://docs.linuxserver.io/general/swag). The reason I chose this image is 
that it completly automates the fetching and configution of an SSL certificate.

Next, since Swag is based on the Nginx Docker image, it is setup to work as a reverse proxy. Right now, I am redirecting the
Jekyll blog:

- https://davidsciacchettano.dev -> server:4000

With the docker-compose running, it magically redirects the request to my blog! :D

This works with all the other services... None yet... LOL!