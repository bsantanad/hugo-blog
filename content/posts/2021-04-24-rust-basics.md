---
title: starting out with rust and cargo 
date: 2021-04-24 21:14:00
draft: false
---

# quick background

hi! so recently (I don't now why) I got a sudden itch. This itch wanted me
to learn the ruby programming language. I've been learning golang for a class
this semester and at first I didn't like it that much, but after using it a
a bit more, I'm growing an acquired taste for it. I think rust will be a whole
different story, from the little I've seen I'm already liking it. :)

What you are about to read are notes I took while reading rust's
"[the book][book]". I mostly write this for myself -- it's always good to have
your notes as a blog post and on the web --  but if a gypsy soul end up reading
this and finds anything of use, thanks for reading :)

Finally, everything you'll find here will be explained in a much better way
in [the book][book], so I won't be mad if you go there directly hehe.

Also, I'm assuming you already installed rust in your machine.

# basics

Let's start with the basic stuff, some usefull commands and a simple
_hello world_

## useful commands

this list will keep growing with time

```bash
# basic
rustc --version
rustup doc # local docs
rustc self uninstall # uninstall rust
rustc <file>.rs # compile code
rustfmt <file>.rs # format code

# cargo
cargo new <project dir> # set up a rust project
cargo build # build the current project
cargo run # run the current project
cargo check # check if the project compiles
cargo build --release # build for release
```

## hello world
```rust
fn main() {
    println!("hello world!");
}
```
compile it
```bash
rustc hello.rs
./hello
```
output
```bash
hello world!
```

### break down hello world

* main function is the first to run in every rust program
* the _!_ after `println` means that we are calling a rust macro
not a function (what's the difference you might ask? I have no idea,
at least not yet)
* spaces instead of tabs (4)
* every line ends in `;`

## cargo

there is this command `cargo`, cargo is rust build system and package
manager.

we can do a:
```bash
cargo new <name of project dir>
```
and then if we `cd` to the dir and `ls` it, you'll see a file and a dir
```bash
Cargo.toml
src # <-- this is the dir
```
what cargo does is set up the env in which you'll be working, if we go into
the .toml, we'll see the name, version, author and other project related
stuff. Then we'll see the dependencies that the project has.

the command will also create a `main.rst` for us to use. It
will create a git repository as well.

all the code related stuff should be in the _src_ dir. READMEs and so on
can go in the parent dir.

building and running the project
```bash
cargo build
cargo run
```
this will also generate a Cargo.Lock this has the versions of all the
dependencies you are using, so you dont have to worry about them.

the actual binary is under:
```bash
<project dir>/target/debug/
```
it will have the name of the project.

you can check if your code compiles (faster than cargo build) with:
```bash
cargo check
```
and you can build for release with (slower build, but more efficient
binary)
```bash
cargo build --release
```

[book]: https://doc.rust-lang.org/book/


