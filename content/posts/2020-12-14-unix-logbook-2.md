---
title: FreeBSD-Unix Logbook 2, Users and Account Management
date: 2020-12-14 17:18:00
draft: false
---

## Disclaimer
I'm basing this whole thing on the FreeBSD handbook, if you want a better and
more complete explication of what's being said here, consult the [handbook][hb]

## Account Types

There are three types:
* System accounts: are used to run services. (daemon, operator, bind)
* User accounts: are assigned to real people and each have certain information,
    * user name (unique)
    * password
    * user id (UID)
    * group id (GID): Groups are used for controlling access to resources
    * Login class: extension of the group mechanic, more on this later
    * password change time
    * account expiration time
    * Users full name
    * Home directory
    * User Shell: users default env for interacting with the system
* Superuser Account (**root**): manage system, no limitations on privileges. User
most be in *wheel* group in order to use the *su* command.

## Manage Users
Utilities for Managing User Accounts

* adduser - guess what it does
* rmuser - guess what it does
* chpass - tool for changing user database information
* passswd - change user passwords
* pw - modify all aspects of user accounts

You can see all the users in **/etc/passwd** and groups in **etc/group**

## Groups
Utilities for Managing Groups

Add Group and then display it

```bash

    rasp@bar:~ $ pw groupadd <name>
    rasp@bar:~ $ pw groupshow <name>

```

Add User to group

```bash

    rasp@bar:~ $ pw groupmod <name> -M <username>
    rasp@bar:~ $ pw groupshow <name>

```

The _-M_ is a comma-delimited list of users to be added to a new group or
replace an exisiting group.

We can use _-m_ to add without replacing the whole group


Finally,

```bash

    rasp@bar:~ $ id <username>

```

Displays ids of the user

See you later :)

[hb]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/users-synopsis.html
