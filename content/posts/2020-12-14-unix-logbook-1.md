---
title: FreeBSD-Unix Logbook 1, Setting things up with Raspberry Pi
date: 2020-12-14 13:23:00
draft: false
---

## Little Back Story

I've been reading a book named [The Cuckoo's Egg][book]. It's placed in the
80s, a hacker have managed to infiltrate the Unix systems in Berkley and the
author of the book Clifford Stoll has to find who he is without the hacker
noticing him.

I was surprised by the amount of detail the book has, it even has the unix
commands they used and Cliff explains what they do. It's a really fun and
interesting book, and if you haven't try it you should give it a read.

I haven't finished yet, but I think the end won't upset me.

With that being said, let's start talking about what I'm doing here. In the
book they mention a lot of this Berkley Unix OS (operating system) and how
good it used to be. So I wonder, what happened to the famous Berkley Unix.

After a short investigation and talking with Iñaky (A computer whiz, unix
expert and luckily a co-worker of mine), I came to the realization that,
Berkley Unix evolved after a few lawsuits and a few fights for copyright
(I won't go into much detail) into what's known as BSD, and latter OpenBSD,
NetBSD and **FreeBSD**. These are operating systems based on Research Unix, the
OS they use in the book.

So then I had two questions: Why is it less popular than linux? And,
Could I try it and learn Unix in an env that resembles the real one
more that Linux?

The first one you'll have to look it up. But the second one, it's the
reason why I'm here.

I decided that I'll take my winter break to learn as much I can about Unix,
using FreeBSD, and its great handbook.

## Where should I install it?

So where should I? I'm running Pop-os in my personal laptop and I'm happy with
it, I wouldn't want to format my drive just to do some testing in FreeBSD. A
Virtual Machine? Maybe but that feels like cheating. An old laptop? I tried
in a little Compaq laptop from the 2010s but came up with a some problems.
Long story short I decided to use a Raspberry Pi I bought for a class last
semester.

I went out, bought a microSD of 8GB returned to my house, flashed the freebsd
img to the sd, everything pretty straight forward and then proceed to
boot the Raspberry Pi.

So quick disclaimer, I don't have a monitor I could use daily to manage the
raspberry, so I was hoping I could connect to the raspberry from my laptop
via SSH. The only problem, I hadn't use SSH before in my life, so I would
need to learn to make this the right way.

I connected the raspberry to my Home TV and started seeing the messages in the
screen. Unfortunately, I hadn't realize that freebsd doesn't support the wifi
card the raspberry pi has. As soon as I realize this I thought my whole small
project had come to an end. I could be using the Home TV for doing this
every day, there is other people that use it, and I'm too lazy to be storing
the cables once I've used them. I thought maybe I could use an Ethernet
connection, but I don't have any ethernet cables.

I went to sleep, and today, the next day, I asked my brother if he by any
chance had an old ethernet cable he used to use to connect his WiiU to the
modem. He had it! I went filled my whole living room with cables crossing,
and boot the thing. After hitting

```bash

    rasp@bar:~ $ ifconfig

```

The cable worked! I could see the ip adress of the raspberry now. Then the
next challenge. How to use SSH, I looked up for books on the internet knowing
that what I wanted to do is like the most basic of all the SSH things to do.
After downloading a demo of an O'Reily book to my kindle app and reading the
first chapter I was ready. I created a user in the raspberry
```bash

    rasp@bar:~ $ adduser

```
I add him to the _wheel_ group, this in order for the user to have root
access or something like that. I think I'll understand better that group thing
after reading the handbook. And then it just took a small command from my
laptop to connect to the raspberry running freebsd
```bash

    laptop@foo:~ $ ssh -l <user> <local ip adress>

```
And there it was the freebsd terminal in the screen of my computer. I know it's
not a super big deal, this was relatively easy, and it didn't take much time.
But I'm still happy with the result.

I think the next step will be to add keys to the ssh connection in order to
avoid having to type my password every time I want to connect.

[book]: https://www.amazon.com/Cuckoos-Egg-Tracking-Computer-Espionage/dp/1416507787
