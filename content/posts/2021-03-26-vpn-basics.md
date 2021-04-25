---
title: what in the world is a vpn?
date: 2021-03-26 20:01:00
author: bsantanad
draft: false
---
# What?

I'll tell you straight, and without any fancy words, after
this (I hope) you'll understand what a vpn is.

So..., what's a network? A bunch of computers connected with each other
right? nothing spooky, nothing new. For the sake of the argument let's
say that all these computers are in the same physical place, say a lab,
or a building. These computers are visible to each other, so you can chat,
send files or whatever between them. Each of these computers have an
unique id, otherwise we wouldn't know which computer is which, let's call
this unique id: _IP_ ;). So now every computer in our network has an IP.
And since each computer is in the same building let's say they are in
a _local network_.

Now say there's a computer in some other location (physical location),
lets assume that the first lab we talked about was in the UK, and this
other computer is in the US. This computer, let's call it Cliff, wants
to chat, send files and everything with his buddies in the UK, he wants
to be in the same _local network_. But he is so far away, poor Cliff :(.

What does Cliff does? He uses a **vpn**!!!

First there must be a server (there can be several, but for the sake of
simplicity let's assume there's only one) that hosts the vpn, let's be
creative and call this server _the host_. If Cliff want's to do all this
cool things (chat and share files) with his friends in the UK, he will
ask them politely to connect to _the host_ (the vpn server) he just
set up. Now all he has to do is connect to _the host_.

What happens now?, well remember this id every computer had? I think we
called it _IP_. Well now every computer has two of them, the one from
the _local network_ and the one that _the host_ gave to each computer.

Now Cliff can see all the machines connected to the vpn host as if he
were in the UK. Ha lucky Cliff.

That's it, no bell's no whistles, that is a vpn.

## But Hey! What about all those ads I see from SouthVPN.

(This is a bit more techinal sorry :()

Oh yeah, that's right. I almost forgot that, thanks for the reminder.
Well you see, there are people in this world who want to make money.
Just kidding :).

What these companies are doing is quite creative. So I'll oversimplify
again but, do you remember the folks from the lab in UK connected
to the VPN? Well, now whenever they _surf_ the internet, the requests they
are making (Say they want to log in to facepad.com) will
first go to _the host_, and then they'll reach their destiny.

## What? And do that helps them in any way?

It depends, this means all the requests they are making first go to
_the host_ (if you already forgot _the host_ is the vpn server), this
means all the web pages they visit, think they are making the request
from the place where _the host_ is. In this case US.

To put it briefly, all the web pages the folks from UK visit now will
think they're not from the UK but from the US. (because that is where
_the host is_)

This also means that their ISP (internet service provider), will not
know what websites they are visiting. All they'll see is them making
connections to some server in the US: _the host_.

## Does this help privacy?

You bet it does, your ISP can sell the info of the websites you visit
legally. Now all they'll sell is you connecting to _the host_.

Wohoo we are anonymous that's great! Wait.. are we forgetting something?

Cliff!! He set up the server, he can see the websites we visit. Damn
Cliff I bet this was his plan from the beginning we should have never
trusted him.

Now he can see the logs from _the host_ and sell them or do whatever
he wants to.

Wait! Are we forgetting about anyone else? The ISP from _the host_!!
He can also see our logs and sell them. Damn Cliff.

## Let's get serious

In the section above instead of reading Cliff you can read _your vpn
provider_. This means they can see all the data your ISP used to log.

Can you trust them with that data? Well, that's up to you. There are
VPNs that have a no-logs policy meaning they don't store anything.
But to be honest you can't be sure.

**Personal Opinion Warning**
I'd recommend Mullvad VPN, they are the best I've seen in the privacy
aspect. Why? Go read a review on them. I don't want to make this post
to long.

## Do vpn help in privacy in other way?
yes! and I'll talk about it in my next post. They I'll discuss what
gives you more privacy, self host a vpn or buying the service from
someone else.

## Self-Hosting?
Can I be Cliff and make my own _the host_. Well glad you ask, I'll
cover that in the next article.

### Where did you get this info?
teacher and co-workers. No Google Scholar, so take all this with a
grain of salt. :)

happy coding :)

ben
