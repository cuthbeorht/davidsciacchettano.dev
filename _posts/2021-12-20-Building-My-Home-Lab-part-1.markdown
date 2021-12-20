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

#### TrueNAS

I heard a lot of good things about FreeNAS. And since my main goal was to serve my music collection to my local
network, it felt like a good starting point.

I installed it and stared playing around with it. I tried to get Plex running on it. I kept getting errors installing Plex. I couldn't create mounts.
After a few hours, I gave up. This is nothing against the quality of the OS. I uts didn't have any patience.

#### Proxmox

Proxmox was my second choice. I had less luck with it than TrueNAS. I found it way too complex for my needs.

#### Ubuntu Server

After trying TrueNAS and Proxmox, I decided to use a simple Linux server. It works, and is all I needed.