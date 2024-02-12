---
layout: post
title: When Sh*t Hits the Fan
date: 2024-02-10 08h00
categories: Incident Management
---

![Sinking ship](/assets/sinking-ship.jpg)

You finish your day, get home, put your bag down and hug yor cats (or kids ;) ). You hear a noise from your phone: A notification... From work. It's almost 7PM, you had a long day and you simply want to wind down. You debate ignoring the message, but your work ethic kicks in and makes you look. It's in the incident channel, never a good sign. Production is down. The web application is not responding and is showing a white screen. The feeling of dread starts in your stomach as you hurridely get your laptop out and venture forth your aid.

You, as a software develoer, or any discipline for that matter, an aspect that tends to get overlooked is incident management. This is something that some people just have or don't... Or is it?

Incident Managment is not complicated, or scary or something to fear. On the contrary, it is something that should be practised in the hopes of never having to use it, like an evactuation safety drill on a boat (the notion of boats will come up a lot in this).

Speaking of boats, consider the following scenario. You are a deckhand on a boat and all of a suddden, an alarm sounds indicating that it is taking on water. What do you do? How do you handle it? Where do you start? Who do you talk to? These are the questions that shoulds normally pop into your mind. Let's tackle them!

**First, DO NOT PANIC!!!!!**

I cannot stress this enough. Panicking leads to more mistakes, miscommunications, and more problems. Yes, something is preventing the system to function normally. People will be inconvenienced. That is secondary. Take a moment and breath. Once you feel like you can focus your thoughts, it's time to start investigating.

**Trust, But Verify**


Going back to the boat analogy, what is the first thing you should do? Well, confirm the problem. Is the boat actually taking on water? Or is the sensor broken or is the alarm broken? You should definitely do your due diligence before venturing forward in the escalation order.  For the sake of argument, we will say that the boat is taking on water and you discover a river of water in the hallway ( I know jack about boats :D ). Alarm confirmed! Now is the time to start alerting people. Find anyone who should be aware of this: the captain, first officer, the chief engineer, the saftey officer, etc. Wake people up, this is an emergency and don't take no for an answer.

**It's Time to go All Sherlock in its a$$**


Once you got your team together, it's time to start drilling down and figuring out what is going on. Everyone you assembled is a specialist in their field, so trust them. At this point, there are different ways to handle the investigative process:

- Each individual could go off in their own direction and take a look, reporting back if they found anything
- Elect a leader or the person responsible for handling emergencies directs the investigative process

There is no wrong way. Use whatever works for you. At some point, someone will find something and say "Guys, I found a hole in the hull. This is where the water is coming from!". And we move on to the next point.

**What is Duct Tape?**

Stop the ship from sinking. Do whatever you have to to prevent more water from getting in. This is not the time to impress your peers with you mad welding skills or your ability to calculate the amount of water entering the boat based on ocean temperature. It is imperative that you prevent the problem from getting worse. Slap duct tape over it, cover it with a metal plate and weld it there. As long as the water stops, do it.

Once the water stopped, now is the time to dig down further and figure out what went wrong. The pressure is off and you can breath a little easier, but not too easy. The problem is temporaroily fixed. Did the pipe burst? Did a valve fail? Did someone make a hole by accident (not going to assume malicious intent. That's for another post). Again, there are many ways to do this and there is no wrong way other than to stop here. There needs to be a permanent fix put into place.

**I am Jack of All Trades!**

Finally, once the cause discovered, take the time to plan out a repair. However you decide to do it, as long as the fix is permanent.

**Putting it all together**

Congratulations, the boat is saved and you sail off into the sunset. But wait, production is still down, your boss is calling, yelling at you, your team mates are scrambling. Take a moment, breath and let's go through the steps.

Is there really a problem? Did you confirm it? Check the website. Is it actually down? Or just down for you? How about in incognito mode? Is it reproducible? If so, great, production is down! 

Move onto the next step, figure out what's going on. What do the logs say? Was there a commit that broke something? Is your hosting service down? Is it your backend? Is it a database problem? Once you pinpoint the problem, put a quick fix in place so that you can be running as soon as possible. This could include a commit rollback, database restore, manual intervention, new commit, etc.

Once that done, you can now take the time to figure out exactly what went wrong and decide how to put in place a more permanent fix. You could even get together with your peers and determine the root cause, discuss it, propose a proper fix and figure out a way to prevent a similar situation.

Finally, pat yourself on the back, accept the praise of your peers and wallow in their admiration of your mad incident management skills.