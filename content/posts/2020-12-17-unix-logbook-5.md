---
title: FreeBSD-Unix Logbook 5, Disk Organization
date: 2020-12-17 18:20:00
draft: false
---
## Files and Dir

The smallest unit of organization used to find files are filenames, this are
case-sensitive. FreeBSD does not use extensions on a file to determine
whether the file is a program, document, or some other form of data.

Files are stores in directories. Files and directories are referenced by
giving the path to the file with _"/"_. For example "_foo/bar/file.txt_".

## File Systems

A file system stores directories and files, they contain exactly one dir
at the very top level, called _root dir_ for that file system.
This _root dir_ can contain other directories. One file system is designated
the _root file_ or _/_. The other file systems are mounted onto the root one.

File systems are contained in partitions. Each partition is identified by a
letter from _a_ through _h_. Each partition can only contain one file
system.

FreeBSD uses disk space for _swap space_ to provide virtual memory. When the
system runs out of memory, it moves some data that's not currently used to
the swap space, and moves it back in when needed.

Disks are divided into slices, these then are divided into partitions, which
contain file system, and are labelled using letters.

When referring to a partition, include the disk name, "s", the slice
number, and the partition letter.

The following table is taken from the FreeBSD handbook


| name    | meaning                                                                         |
|---------|---------------------------------------------------------------------------------|
| ada0s1a | The first partition (a) on the first slice (s1) on the first SATA disk (ada0).  |
| da1s2e  | The fifth partition (e) on the second slice (s2) on the second SCSI disk (da1). |


Conventions on partitions:
* **a**: contains root file system
* **b**: contains swap space
* **c**: same size as the enclosing slice. A file system would not normally be
created on this partition.

This can be really hard to understand with pure text. So I **strongly
suggest** you see [this][concept] diagram.

## Disclaimer
I'm basing this whole thing on the FreeBSD handbook, if you want a better and
more complete explication of what's being said here, consult the [handbook][hb]

[concept]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/disk-organization.html#basics-concept-disk-model
[hb]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/users-synopsis.html

