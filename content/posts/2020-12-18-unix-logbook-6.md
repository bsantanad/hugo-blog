---
title: FreeBSD-Unix Logbook 6, Mounting File Systems
date: 2020-12-18 16:00:00
draft: false
---
## _fstab_ File

During the boot process, file systems listed in _/etc/fstab_ are mounted,
except for the ones containing _noauto_. The file contains entries on this
format.

```bash

device  mount-point fstype  options dumpfreq    passno

```
Let's see them one by one:
* device: the device name, explained in the last post or [here][filename]
* mount-point: an existing directory in which to mount the file system.
* fstype: The file system type to pass to [mount(8)][mount]
* options: either _rw_ or _ro_ (read and write or read only), then any other
option.
* dumpfreq: used by [dump(8)][dump] (file system backup), if missing zero is
assumed.
* passno: determines order in which the file systems should be checked.
The root file system has 1, every other must be a number greater than 1. If
zero, these are skipped.

Here's an example:

```bash

    benja@generic:~ $ cat /etc/fstab
    # Custom /etc/fstab for FreeBSD embedded images
    /dev/ufs/rootfs   /       ufs     rw      1       1
    /dev/msdosfs/MSDOSBOOT /boot/msdos msdosfs rw,noatime 0 0
    tmpfs /tmp tmpfs rw,mode=1777,size=50m 0 0

```

## mount(8)

File systems are mounted using [mount(8)][mount].

Basic syntax:

```bash

    # mount <file system name> <where to mount it>

```
For example,

```bash

   root@bar:/home/benja # mount /dev/da0s1 /media/usb_fs/

```
**IMPORTANT**: If you are trying to mount a file system from a Windows machine
you'll have to use

```bash

   root@bar:/home/benja # mount_msdosfs /dev/da0s1 /media/usb_fs/

```
If not it won't work, this distinction does not exist in Linux, so be
careful.

### Find File System name

**IMPORTANT**: The file system names are not the same in Linux and in FreeBSD
take that into account. If you want to scan your ports in linux to see the
file system name you can use

```bash

    #LINUX
    ~ $ fdisk -l

```

In FreeBSD, I didn't find an easy way, you could list the devices in _/dev/_
and try to find yours, check the last post to know how to identify the name.

## umount(8)

Won't go into much detail. Just unmount the file system.

```bash

   root@bar:/home/benja # umount /media/usb_fs/

```

For more info into the commands options go to [mount(8)][mount] or [umount(8)][
umount]

## Disclaimer
I'm basing this whole thing on the FreeBSD handbook, if you want a better and
more complete explication of what's being said here, consult the [handbook][hb]

Thanks for reading :)

[umount]: https://www.freebsd.org/cgi/man.cgi?query=umount&sektion=8&manpath=freebsd-release-ports
[dump]: https://www.freebsd.org/cgi/man.cgi?query=dump&sektion=8&manpath=freebsd-release-ports
[mount]: https://www.freebsd.org/cgi/man.cgi?query=mount&sektion=8&manpath=freebsd-release-ports
[filename]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/disk-organization.html#disks-naming
[hb]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/users-synopsis.html

