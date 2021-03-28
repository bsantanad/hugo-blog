---
title: bash scripting 101
date: 2021-01-06 16:00:00
draft: false
---
## The Book

I won't go into much detail, but I bought a kindle, and I'm reading a book
on bash scripting, you can find the book [here][book]. It's written by Dave
Taylor and Brandon Perry. I'll write my findings here.

## Getting started

* Every command you run is stored in the _PATH_ env variable.
  * you can use _$ echo $PATH_ to see its contents

* To know the path of a command you are running use _which_

```bash
$ which echo
/usr/bin/echo
```

### Login Script

We will add a folder for our scripts, and we want to add it to the _PATH_, we
will name it _scripts_ (The same as in the book).
First we figure out what's to name of our __login script__, in my case it
was _.bashrc_. Then we add
```bash
export PATH="$HOME/scripts/:$PATH"
```
And we are good to go, now when we open a new terminal, it will look into our
folder for _"commands"_ (our shell scripts) to run.

### Subshells and _shebang_

This is our first script


```bash
#!/bin/bash
echo "Hello World"
echo $(which neqn)
cat $(which neqn)
```

The first line is called _shebang_, it will determine what program will be
run to interpret the script.

The third and fourth line uses a _subshell_. This will store the output of
what's inside and throws it into the outer command

Finaly to execute this we most change the permissions of the file. Of course,
you already know all about this after those chapters in the FreeBSD series,
don't you? So we just have to make the file executable with

```bash
$ chmod +x intro
```
And we finally can run it :).

Be expecting more on bash and unix over the next few days.

Happy Coding.

[book]: https://www.amazon.com.mx/Wicked-Cool-Shell-Scripts-2nd/dp/1593276028
