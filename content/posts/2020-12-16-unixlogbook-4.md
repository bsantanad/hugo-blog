---
title: FreeBSD-Unix Logbook 4, Directory Structure
date: 2020-12-16 16:10:00
author: bsantanad
draft: false
---

# Directory Structure

The most important directory is root or _"/"_. This directory is the first
mounted at boot time, and it contains the base system necessary to prepare
the os for multi-user operation.[(1)][dir]

The root directory contains _mount points_ (directory where additional file
systems can be insterted onto a parent file system).

Standard mount points include _/usr/_, _/var/_, _/tmp/_, _/mnt/_, and _/cdrom/_
.

Overview of common directories:

| dir             | description                                                                                                                 |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------|
| /               | root directory of the file system                                                                                           |
| /bin/           | user utilities fundamental to single-user and multi-user env                                                                |
| /boot/          | files used during operating system boostrap  (self-starting processes that are supposed to continue without external input) |
| /boot/defaults/ | _loader.conf_. The file contains descriptive information on bootstrapping the system                                        |
| /cdrom/         | default mount pint for CD-ROM drives                                                                                        |
| /dev/           | devices nodes. [more info][intro]                                                                                           |
| /etc/           | system config files and scripts                                                                                             |
| /etc/defaults/  | default system config files                                                                                                 |
| /etc/mail/      | config files for mail transport agents                                                                                      |
| /etc/periodic/  | scripts that run daily, weekly and monthly                                                                                  |
| /mnt/           | empty dir used by sysadmins as a temporary mount point                                                                      |
| /proc/          | process file system. [procfs(5)][procfs]                                                                                    |
| /rescue/        | common utilities intended for use in recovering a badly damaged system.  [rescue(8)][rescue]                                |
| /root/          | home dir for root account                                                                                                   |
| /sbin/          | like /bin/ but for system instead of user                                                                                   |
| /media/         | contains subdir to be used as mount points for removable media (cds, usb, floppy disks)                                     |
| /tmp/           | temporary files that are usually not preserved across a system reboot                                                       |
| /usr/           | the majority of user utilities and apps                                                                                     |
| /usr/bin/       | common utilities, programming tools and apps                                                                                |
| /usr/include/   | standard C include files                                                                                                    |
| /usr/lib/       | archive libraries                                                                                                           |
| /usr/libdata/   | various types of utility data files                                                                                         |
| /usr/libexec/   | system daemons and utilities executed by other programs                                                                     |
| /usr/local/     | local executables and libs.                                                                                                 |
| /usr/sbin/      | system daemons and utilities exectued by users                                                                              |
| /usr/share/     | architecture-independent files.                                                                                             |
| /usr/obj/       | architecture-specific target tree                                                                                           |
| /usr/scr/       | BSD and/or local source files.                                                                                              |

More info [hier(7)][hier]


## Disclaimer
I'm basing this whole thing on the FreeBSD handbook, if you want a better and
more complete explication of what's being said here, consult the [handbook][hb]

[rescue]: https://www.freebsd.org/cgi/man.cgi?query=rescue&sektion=8&manpath=freebsd-release-ports
[procfs]:https://www.freebsd.org/cgi/man.cgi?query=procfs&sektion=5&manpath=freebsd-release-ports
[intro]: https://www.freebsd.org/cgi/man.cgi?query=intro&sektion=4&manpath=freebsd-release-ports
[hier]: https://www.freebsd.org/cgi/man.cgi?query=hier&sektion=7&manpath=freebsd-release-ports
[dir]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/dirstructure.html
[hb]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/users-synopsis.html

