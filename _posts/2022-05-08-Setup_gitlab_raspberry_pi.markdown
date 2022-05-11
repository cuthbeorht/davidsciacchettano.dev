---
layout: post
title: Setting Up Gitlab Runner on Raspberry Pi
date: 2022-05-08 20:05
categories: Dev blog update
---

# Setting Up Gitlab Runner on Rasbperry Pi

Install a Linux based distro. I tend to install raspbian 64-bit lite since i don't use the UI. To do this, i use the Raspberry PI Imager.

Next, I update the packages: `sudo apt update && suso apt upgrade`

Next, I installed Docker: https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script

Finally, I followed this tutorial on how to setup a Gitlab Runner: https://medium.com/devops-with-valentine/use-your-raspberry-pi-to-run-gitlab-ci-jobs-8cc29fa49dbe
