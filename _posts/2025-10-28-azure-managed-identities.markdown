---
layout: post
title: Azure Managed Identities
date: 2025-10-28 19h29
categories: Dev blog update
---

# Why am I writing this?

Lately, I am doing more and more Azure stuff and find that terms are thrown around that I have trouble understanding. I, of course, went on Youtube and looked up a video on Azure. One by John Saville on Managed Identities popped up.

As a student in computer science, I decided I should listen, learn, take notes, and eventually apply.

To make sure I really understand it, I will write it here so that I am an idiot.

# What are managed identities?

An Azure Managed Identity can be broken down into 2 categories:
- System Assigned Managed Identity (SAMI)
- User Assigned Managed Identity (UAMI)

## System Assigned Managed Identites (SAMI)

Thet are created exactly as you probably imagine. SAMIs are created by Azure when creating resources. You tell Azure to create one. A Service Principal is created and stored in Active Directory. Its lifecycle is tied to the resource.

To use it, you give it permissions, or Role Assignments. For example, you can create a Virtual Machine with a SAMI. The corresponding Service Principal can then be assigned roles where apps in the VM can access other resources, like a Key Vault.

## User Assigned Managed Identities (UAMI)

A User Assigned Managed Identity is a separate resource created by you. 