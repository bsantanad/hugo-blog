---
title: FreeBSD-Unix Logbook 7, Processes and Daemons
date: 2020-12-20 08:42:00
author: bsantanad
draft: false
---
## Brief Introduction

### Processes

FreeBSD is a mutli-tasking os. Each program running an any given time is called
_process_. Every command starts a process and there are the ones _system
process_ started by FreeBSD.

Each process has a unique PID. Just like files, processes have an owner and a
group, used to determine which files the process can open. Processes also have
a parent, this is the process that started them.

Example: The shell is a process, every command started in the shell will have
the shell as its parent process.

The first process is called _init_ is always the first to start at boot time
and which always has a PID of 1.

### Daemons

Some programs are design to run without continuos user input, and disconnect
from the terminal at first opportunity. Example, a web server respond requests,
they don't wait for user input. These types of programs are called _deamons_.

From greek mythology, they represent and entity neither good nor evil, and
which invisibly performs useful tasks.

There's a convention in the os world to name daemons with a _"d"_ at the end of
the programs name, for example, the Apache web server program is _httpd_,
this is just a convention, so there are programs who do not follow this naming.

## Viewing Processes

To see a static list of the currently running processes use [_ps(1)_][ps]. To
display all running processes and update the dislpay every few seconds use
[_top(1)_][top]

### Process Status, ps(1)

By default, _ps_ only show the processes owned by the user.

```bash

    benja@generic:~ $ ps
    PID TT  STAT    TIME COMMAND
    1011  1  Ss   0:00.03 -sh (sh)
    1018  1  R+   0:00.01 ps

```

Let's see what each column tells us:
* PID: the pid lol.
* TT: The tty the program is running. (Terminal associated with the process)
* STAT: program state
* TIME: The amount of time the process has been running on the CPU. (Usually
not the elapsed time since the program was started, most of that time is spent
waiting)
* COMMAND: The command that was used to start the program.

#### Popular use

A popular use is:

```bash

    benja@generic:~ $ ps auxww

```

* a - all the running processes of all the users
* u - display the username and memory usage of the process'owner
* x - display information about daemons. (Processes that do not have
controlling terminals)
* ww - display full command line (if not it will truncate at the end of screen)

A few columns are added, you can assume what most of them means, I will only,
go on to describe the weird ones.

* VSZ: It includes all the memory that the process can access
* RSS: How much memory is allocated to that process in RAM.

There are other useful options:
* c - displays only the command name, not the full path
* m - displays the processes sorted by memory usage
* r - sort by current cpu usage

#### STAT

So you probably saw the STAT column displaying a lot of letters and didn't
have a clue of what did they mean. Well here are a few common ones:

The first letter can be one of this
* S: Process that is sleeping for less than 20 sec
* R: Runnable process
* D: Marks a process in disk wait. (uninterruptible)
* I: Idle, sleeping more than 20 sec
* T: Stopped process
* Z: Dead process, Zombie

The additional chars can mean this:
* +: the process is in the foreground process group of its control terminal
* <: the process has raised CPU scheduling priority
* E: the process is trying to exit
* N: the process has reduced CPU scheduling priority
* s: the process is session leader
* X: the process is being traced or debugged
* L: the process has pages locked in core

For more info on this interesting topic go check [ps(1)][ps]

### Info about the top CPU process, top(1)

Let's run _top(1)_ and see what pops up.

```bash
benja@generic:~ $ top

last pid:  1016;  load averages:  0.00,  0.00,  0.00    up 0+00:27:06  12:38:34
20 processes:  1 running, 19 sleeping
CPU:  0.1% user,  0.0% nice,  0.0% system,  0.0% interrupt, 99.9% idle
Mem: 11M Active, 1532K Inact, 44M Wired, 16M Buf, 850M Free

  PID USERNAME    THR PRI NICE   SIZE    RES STATE    C   TIME    WCPU COMMAND
 1016 benja         1  20    0    13M  3352K CPU0     0   0:00   0.18% top
  978 benja         1  20    0    19M  8316K select   2   0:00   0.03% sshd
  975 root          1  25    0    19M  8256K select   2   0:00   0.00% sshd
  979 benja         1  20    0    12M  2988K wait     1   0:00   0.00% sh
  921 root          1  20    0    11M  2528K nanslp   2   0:00   0.00% cron
  722 root          1  20    0    11M  2512K select   1   0:00   0.00% syslogd
  965 root          1  52    0    10M  2160K ttyin    0   0:00   0.00% getty
  972 root          1  52    0    10M  2160K ttyin    2   0:00   0.00% getty
  973 root          1  52    0    10M  2156K ttyin    1   0:00   0.00% getty
  970 root          1  52    0    10M  2160K ttyin    0   0:00   0.00% getty
  968 root          1  52    0    10M  2160K ttyin    2   0:00   0.00% getty

```

The output is divided in two sections

**Header**: The first 4-6 lines.
This shows,
* last process PID
* system load averages (how busy the system is)
* system uptime (time since last reboot)
* current time
* how many processes are running
* memory and swap space used
* how much time the CPU is spending in different CPU states.

**Bellow Header**: columns displaying similiar info as [_ps(1)_][ps]
* PID
* username
* cpu time
* memory space taken by the process
    * total size: how much memory the app has needed
    * resident size: how much is actually using now
* PRI - priority

## Killing Processes and Sending Signals

We can communicate with any running process or daemon by sending a signal.
Using [_kill(1)_][kill]. A
user can only send a signal to a process they own. Of course, root can do
anything he pleases.

The os can also send a signal to a process. If the application is badly written
and tries to access memory it doesn't own. Freebsd will send a "Segmentation
Violation" signal _(SIGSEGV)_

There's this signal, __SIGKILL__, that cannot be ignored by the process. It
will stop that process there and then.

### Example

We will use [_inetd(8)_][inetd], to not go into much detail _inetd(8)_, is a
utility that should be run at boot time by _/etc/rc_. It listens for
connections on certain internet sockets. Then it decides what to do with it.

For the example we will send it a signal calles _SIGHUP_, this will make
inetd(8) re-read his configuration file _/etc/inetd.conf_.

First we need to find the inetd(8) PID, using [_pgrep(1)_][pgrep] (this command
finds or signal processes by name).

**Plot twist**: I could find _inetd_ running, so I opened vi in a new terminal,
,and we'll see what happens when it recieves the signal.

```bash

    benja@generic:~ $ pgrep -l vi
    1025 vi

```

Then we send it the signal _SIGHUP_, let's see what happens


```bash

    benja@generic:~ $ /bin/kill -s HUP 1025

```

To know more about the [_kill(1)_][kill] command, go read it's documentation,
here we are just sending the signal _SIGHUP_ to the process 1025 in this case
vi.

#### So what happened?

In my other terminal (the one running vi), a lot of this _~_ symbols were
printed and then this showed up.

```bash

~
~
~
~
~
~
~

Hangup
benja@generic:~ $

```

That was odd, maybe later I could explain what happened, it just consists in
searching what this particular signal does to vi.

**UPDATE**: After doing this again, and printing the currents processes a new
process showed up before _vi_ hanged.

```sh

    1056  1  S+   0:00.03 vi
    1061  1  I+   0:00.04 /usr/sbin/sendmail -odb -t


```
I think maybe it was trying to send a mail? I'd have to look more into it.

**UPDATE 2** pretty sure it was trying to send a mail, looked up the file and
the flags:

* -odb: deliver any mail in background, if supported; otherwise ignored
* -t: read the message to obtain recipients form the To: and Cc: headers in the
message instead of from the command arguments.

**UPDATE 3**

I'm not sure if the mail part was a consequense of sending the SIGHUP. I was just
reading SIGHUP means ("hang up"), and reports that the terminal has been
disconnected. That's odd.

### Common Signals

Before ending this post, I wanted to log this down. When you press, ctrl-C, to
stop a program you are sending a signal!!

* ctrl+c - SIGINT : interrupts process
* ctrl+\ - SIGQUIT : quits process
* ctrl+z - SIGTSTP: cannot be ignored.

Other cool termination signals:

* SIGTERM: ask a process politely if he could terminate
* SIGKILL: immediate program termination. (not possible to block)
* SIGHUP: report user terminal is disconneted

More info on **Standard Signals** [here][signal]

Well I think that would be all for today, I started writing this post the 20th
of december, but I didn't finished until today the 24th.

## Disclaimer
I'm basing this whole thing on the FreeBSD handbook, if you want a better and
more complete explication of what's being said here, consult the [handbook][hb]

Merry Christmas Eve  Benja from the future, I hope you're doing well. :)

Thanks for reading :)


[signal]: https://www.gnu.org/software/libc/manual/html_node/Standard-Signals.html
[pgrep]: https://www.freebsd.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=freebsd-release-ports
[inetd]: https://www.freebsd.org/cgi/man.cgi?query=inetd&sektion=8&manpath=freebsd-release-ports
[kill]: https://www.freebsd.org/cgi/man.cgi?query=kill&sektion=1&manpath=freebsd-release-ports
[top]:https://www.freebsd.org/cgi/man.cgi?query=top&sektion=1&manpath=freebsd-release-ports
[ps]:https://www.freebsd.org/cgi/man.cgi?query=ps&sektion=1&manpath=freebsd-release-ports
[hb]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/users-synopsis.html

