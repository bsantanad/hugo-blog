---
title: set up wifi in raspberry os, no monitor
date: 2021-03-28 22:01:00
draft: false
---

# Set up wifi in raspberry os (no monitor, no keyboard, no mouse)

## what we'll do

**ethernet cable needed**

1. flash image into microsd
2. enable sshd before boot
3. conect raspberry to router
4. connect via ssh
5. set up wifi

_disclamer: I don't know if this is the best way of doing this, but
it works :)_

## flash image to microsd

already discussed this in another [post][flash]

## enable the ssh daemon before first boot

The raspberry OS doesn't enable ssh by default. So we need to enable it,
we could enable it in our first boot, but since we don't have a screen
how would we enable the option.

All we need to do is the following:
After we flashed the image to the microsd, two partitions will be created
_boot_ and _roofts_, if I'm not mistaken. We need to mount the _boot_
partition and add a file in there, this can be done by just:
```bash
touch ssh
```
by just creating a file named **ssh** in the boot partition, raspberry os,
will enable sshd.

if you don't know how to mount a device check
```bash
touch mount
```
for more info

## connect to router

Okay, get up of your chair and go to your router. Connect the ethernet
cable to both the raspberry pi and your router, hear the click in both
sides and plug the raspberry into the power socket.

Depending on the model, you'll see some lights turning on and off,
this is normal don't worry, if nothing turns on, then you didn't connected
the raspberry into the wall or your charger is broken or something :(


## connect via ssh

Okay, so now we know that the raspberry has access to your local
network but we don't know its IP address. There are a couple
ways you can do this but the easiest and simplest is to do:
```bash
ifconfig -a
```
find your IP address, is something like: 192.168.bla1.bla2, once you find it
then we use a tool called nmap, to check for devices in our local network

if nmap it's not installed you can do
```bash
sudo dnf install nmap
```
or use _apt_, if you are in debian

Now, we did the ifconfig for two reasons, first, to know our IP address, and
second to see the __bla1__ number (192.168.bla1.bla2).
The raspberry probably is in the same bla1 number as your computer.

(Please note that __bla1__ isn't the official term :) )

Well, let's do it, let's use nmap
```bash
nmap -F 192.168.<bla1>.1-255
```
replace __bla1__ with your number :)

All the devices in your local network will show up. If you see a lot of them
with the port __22__ open, then unplug your raspberry, run the command,
plug it, wait a few seconds, and run the command again. See what device showed
up when you plugged the raspberry. Most likely this is your raspberry.

In case you only see your computer and other device with the port __22__ open
then probably that's your raspberry. If not, do the "unplug" thing I mentioned

Now all we have to do is
```bash
ssh pi@192.168.<bla1>.<bla2>
```
the IP address is the one you took from the _nmap_ command.

It will ask you something about a key, say __yes__, and then it will
ask you a password. Remeber the password we set in the first step? just
kidding lol. The default password is __raspberry__. Write it down, and
if you see
```bash
pi@raspberrypi:~ $
```
Hurray :) you're in.

## set up wifi
I'd recommend changing the password with
```bash
passwd
```
Then you can run
```bash
sudo raspi-config
```
A GUI will be opened, select __System Options__, and then __Wireless LAN__
write your SSID and passphrase.
Select __finish__

## check everything right

Finally, just run:
```bash
ifconfig -a
```
You must see the wlan0 interface with an IP address. If that's there
congrats! Now you can unplug the ethernet cable, your raspberry has
wifi now.

**NOTE:** Probably not, but the IP from wlan0 can change, take your
precautions. But don't worry you can always use _nmap_ to find it.

Hope that helps,
happy coding :)
ben

[flash]: https://bsantanad.com/posts/2021-03-28-flash-img/
