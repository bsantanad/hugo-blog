---
title: FreeBSD-Unix Logbook 3, Permissions
date: 2020-12-15 11:08:00
author: bsantanad
draft: false
---

# Permissions

## Basics

Every file and dir has permissions attached to them. In UNIX there are three
types of access: _read, write and execute_

| Value | Permissions                | Directory Listing |
|-------|----------------------------|-------------------|
| 0     | No read, No write, No exec | ---               |
| 1     | No read, No write, exec    | --x               |
| 2     | No read, write, No exec    | -w-               |
| 3     | No read, write, exec       | -wx               |
| 4     | read, No write, No exec    | r--               |
| 5     | read, No write, exec       | r-x               |
| 6     | read, write, No exec       | rw-               |
| 7     | read, write, exec          | rwx               |

You can display permission using:

```bash

    rasp@bar:~ $ ls -l
    total 0
    -rw-r--r--  1 benja  benja  0 Oct 23 07:21 hello.txt
    -rw-r--r--  1 root   benja  0 Oct 23 07:21 world.txt


```
Let's break it down,
* The first character _'-'_ tells us if the file is a regular file, a
directory among other types of files.
* The next 'rw-' shows the permission of the **owner** of the file
* The next 'r--' gives the permission for the **group** that file belongs to.
* The last 'r--' gives the permission for the **rest** of the world

We can represent this in binary, for example, using the table above we could
say that the permissions of these files would be **644**

You can use [chmod(1)][chmod] to change a file permissions

## Non-Files files

* **Devices** are treated as files that can open, read and write. These are stored
in _/dev/_
* **Directories** are treated as files and have the same permission, just
the exec part is a bit different. If the exec part is enabled this means, you
can access the dir with the command _cd_. In order to list the read
 permission most be active. In orer to delete a file it must have written and
execute.

## File Flags

FreeBSD supports _file flags_. These can only be applied to files (not dir).
With these flags even _root_ can be prevented from removing or modifying files.

This is done with [chflags(1)][chflags]

To make a file undeletable you can do this
```bash

    rasp@bar:~ $ su
    Password:
    root@bar:/home/rasp # chflags sunlink hello.txt
    root@bar:/home/rasp # rm hellot.txt
    rm: hello.txt: Operation not permitted

```
To undo this

```bash

    rasp@bar:~ $ su
    Password:
    root@bar:/home/rasp # chflags unsunlink hello.txt
    root@bar:/home/rasp # rm hellot.txt

```
Finally, to view the flags

```bash

    benja@bar:~ $ ls -lo
    total 4
    -rw-r--r--  1 benja  benja  sunlnk 13 Oct 23 07:49 hello2.txt
    -rw-r--r--  1 root   benja  -       0 Oct 23 07:21 world.txt


```

## setuid, setguid and sticky

There's a difference between **real** user id, and **effective** user id:
* real: UID who owns or starts process
* effective: UID the process runs as.
Example, when a user changes his password. He runs passwd with his **real**
id, but the process runs with root id, in order to avoid permission errors,
 the latter being the **effective** id

Okay now let's see the _setuid_:

If we prefix the permission with 4 we set the _setuid_

```bash

    benja@bar:~ $ chmod 4755 suidexample.sh
    chmod 4755 suidexample.sh
    benja@bar:~ $ ls -l
    total 8
    -rw-r--r--  1 benja  benja  13 Oct 23 07:49 hello2.txt
    -rwsr-xr-x  1 benja  benja  19 Oct 23 08:12 suidexample.sh
    -rw-r--r--  1 root   benja   0 Oct 23 07:21 world.txt

```
Note the _s_ replaced the x, this allows elevated permissions.

To see and example of this in action, we open two terminals, start
changing the password of the current user **no root**

```bash

    benja@bar:~ $ passwd
    Changing local password for benja
    Old Password:

```

While this is running we go to the other terminal and list the processes


```bash

    benja@bar:~ $ ps aux | grep passwd
    root  1154   0.0  0.3 11604 2820  0  I+   08:18     0:00.02 passwd
    benja 1160   0.0  0.3 11132 2396  1  S+   08:21     0:00.01 grep passwd

```
Here we can see the process running as root! Even though we ran it as a user.

The **setguid** works the same but for groups, but we use **2** instead of
**4**. (I'm talking about the prefix)

Lastly the **sticky bit** can strengthen security. When it is set it prevents
deletion of files in directories. Just the owner of the file can delete it.
This one uses a **1** (I'm talking about the prefix)

Lets say myfiles is a dir
```bash

    benja@bar:~ $ chmod 1777 myfiles
    benja@generic:~ $ ls -l
    drwxrwxrwt  2 benja  benja  512 Oct 23 08:27 my_files

```
The sticky bit adds a _t_ in the permissions.

## Disclaimer
I'm basing this whole thing on the FreeBSD handbook, if you want a better and
more complete explication of what's being said here, consult the [handbook][hb]

[chflags]: https://www.freebsd.org/cgi/man.cgi?query=chflags&sektion=1&manpath=freebsd-release-ports
[chmod]: https://www.freebsd.org/cgi/man.cgi?query=chmod&sektion=1&manpath=freebsd-release-ports
[hb]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/users-synopsis.html
