---
title: apt command
date: 2020-03-12 12:00:00 -0600
draft: false
---

So, it's been almost a week since my last post. To be honest I hadn't read the book, so I didn't have anything to post. Nevertheless, today I did, and also y learn a little more about Linux.

We'll talk about Linux, so I found this [video][linux-video] on YouTube that's supposed to show you not only the basics on Linux but how you can be a __Power User__. So that grabbed my attention and I started watching it, it's 7 hours long, so I decide to watch parts of it. At first It's really just kind of the Linux background, which is pretty interesting, and then they show you basic commands.
The part that I found more interesting was the ¿repo manager? I just realize I don't know if it's called like that. Basically it shows you how to install repos from terminal, and some pretty useful commands for example,

```shell
apt-cache search gimp
```

Will search for all the repos that contain the word gimp.

```shell
apt-cache policy gimp
```

Will show you the version that you have install of gimp

```shell
sudo apt upgrade
```

Will upgrade every repo you have installed.

You can also install a .deb file that you've downloaded online with

```shell
sudo dpgk -i file.deb
sudo apt-get -f install
```

The latter install the missing dependecies

I didn't really understand why and when you had to use sudo. It means that you execute the following command as if you were on root (This is like the god of the computer, it has access to everything). You can't install repos if you are not executing the command with __sudo__

```shell
sudo apt install gimp
```

And last but not least, I also learn how to change the rights to modify a file and even of a whole directory from the command line. Why you would want to use this? To make a file that only the root can modify, modifiable for everyone. You can use the command **ls -l** and see the permissions of the files they are divided in columns.

```shell
-wr--r--r

```
The first three characters are a column, and they refer to the **root**, the second column refers to the **group** and the third to **everyone**. You can change it with this commands.

```shell
sudo chmod 664 file
```

The numbers mean the following:

* 6: change to -rw (-ReadWrite)
* 4: change to --w (--Write)

You also can change the ownership of the file with

```shell
foo@bar:~$ sudo chown -R user:group file
```

__The -R is for changing whole directories__

I believe that covers everything. The next post should be about storage data in Python.

Happy Coding,
benjaSantana

[linux-video]: https://youtu.be/wBp0Rb-ZJak

