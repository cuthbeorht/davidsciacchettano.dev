---
layout: post
title: SOLID Principles
date: 2021-08-13 20:34:20
categories: Dev blog update
---

# SOLID Principles

## Single Responsbility Principle

`A class should do one thing and one thingh only. By extension, this means it should have only reason to change.`

Now what the hell does that mean? Well, I will do my best to explain it, or at least **MY** understanding of it. 

Let's create a Plain Old Python Object ( I borrowed this from Plain Ol' Java Object POJO - I'm a Java guy diong Python now. What can I say? I switched over to the dark side :D ):

```python
from datetime import datetime
from typing import Dict


class Email:
    """
    This is a Car object
    """

    sender: str
    receiver: str
    content: str
    date_sent: datetime.datetime

    )
    

```

This is nothing fancy. It's a class in Python that defines a Email object. How original, I know, right? Let's add some logic!

```python

from email_package import EmailLib

class EmailService:
    """
    Provides methods to build a car based on type, number of doors, number of wheels
    """
    def create_connection_to_email_service(self, username, password):
        return EmailLib(username, password)


    def send_email(self, email: Email):
        email_service = self.create_connection_to_email_service(username, password)

        email_service.send({
            sender: email.sender,
            receiver: email.receiver,
            body: email.content
        })

    def print_email(self, email: Email):
        print(f"From: {sender}\nTo: {receiver}\nContent: {content}")
    ...
    # Other methods
```

Ok, let's take some time to digest this. There is a basic object that contains only attributes (Email) and a service class. This service class seems to be doing a lot!

First, it attemps to create a connection to an email sending service. Then, it uses it to send that email. Finally, it prints the email. Simple enough... Or am I doing something fundementally wrong?

Let's apply the Single Responsibility Principle. What is `EmailService` doing? Too much! What happens if the EmailLib changes? We need to use a different one? What if the format of the printing of the email changes? What happens if we need to send mime type of the content?

These are all different reasons for the email to change. This breaks the principle. Let's try to clean it up a little!

```python

class EmailPrinter:

    def print_email(self, email: Email):
        print(f"{email.sender} said on {email.date_sent}: \"{email.content}\"")

class EmailService:

    def __init__(self, email_connection: EmailLib, printer: EmailPrinter):
        self.email_connection = email_connection
        self.email_printer = printer

    def send_email(self, email: Email):
        self.email_connection.send(email)

```

What have I done? Well, I split off the creation to the email service that I use to actually send the email into another class. And, I imported it using dependency injection (a crude form of it, but that's not the point here). Now, if, for some reason the lib needs to change, I change the underlying `EmailLib` and the `EmailService` doesn't need to change!

Next, the printing is pretty cool too! If you notice, I event changed the format to illustrate how changing it would not affect the `EmailService`; Only the EmailPrinter need change.

Now, I will be frank, this is a trivial example to illustrate a point. This will never make it to a real project. So I put forth a challenge: All you software devs out there reading this and telling me I'm crock, next time you write a class, think about how it might change for a minute and remember the Single Responsibility Principle.

Thanks for reading!