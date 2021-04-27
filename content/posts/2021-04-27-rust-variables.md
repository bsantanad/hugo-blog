---
title: variables immutability in rust
date: 2021-04-27 10:24:05
author: bsantanad
draft: false
---

# variables and mutability

If you read the last post you already know I'm getting into learning
rust. I've liked it so far. I'd read the first two chapters of
[the book][book]. The notes on the first are in the last post and the
second was a little project, if you are really interested in the latter I
have it in my github account [here][project], you can go and check it out.

These are my notes from the third chapter, hope they are of any use to you

## immutability

Variables work in a particular way here in rust, they don't work as you might
use them in _C_ or _python_. It's actually quite interesting.

In rust the variables are immutable by default... You mean like constants? Not
quite. Let's start by the simplest of operations.

```rust
let a = 3;
let b = 2;
println!("a is {}", a);
a = b;
println!("a is {}", a);
```
**^^^ Won't Compile**

You would expect that the output is `2` right? Well **No!** Haven't you
heard me? Variables are immutable by default, this means that we can't change
the value at runtime. This helps prevent errors you can read [the book][book]
for more details.

Then how could we remove this immutable property of our variable?
```rust
let mut a = 3;
let b = 2;
println!("a is {}", a);
a = b;
println!("a is {}", a);
```
Now this will compile, and the output is:
```bash
a is 3
a is 2
```

Okay so, if variables don't have the `mut` thing they behave like
constants. Well nope.

### Constants

There are also constant in rust, you can declare them like this,
```rust
const MAX_POINTS: u32 = 100_000;
```
you can declare them in any scope, and their value won't change.

It's convention to name them in snake\_case but with CAPS, so SNAKE\_CASE.

They are really useful for constants (lol), for example let's say you have
a game and you want to set the max health, constants will help.

How does this differ from variables without `mut`? Well for starters,
a variable by default is still _variable, they are immutable yes, but
you can set the output of a function as the initial value,
or and input from a user. The value can't change later, but the initial value
is, well, _variable_.

Constants in the other hand can't be the input of a user, you must set them
in the code and they will be there forever. Also, a big difference is:

### Shadowing
There's this thing called shadowing, actually it would help our initial example
become more clear:

```rust
let a = 3;
let b = 2;
println!("a is {}", a);
let a = b;
println!("a is {}", a);
```
**Output:**
```bash
a is 3
a is 2
```
_Wait what?! But that variable is immutable we can't change it at
runtime._ No we can't, but we can use shadowing, we can use the `let`
keyword and reassign a new value, it doesn't even have to be the same type!!

```rust
let a = 3;
let b = "hello world";
println!("a is {}", a);
let a = b;
println!("a is {}", a);
```
**Output:**
```bash
a is 3
a is hello world
```

So this way we don't have to declare every variable as mutable, we can use
shadowing, "change" the value every number of times we want, and when we are
done we can let rust have his variable immutable. As I stated above, having
the variables immutable has [benefits][benefist].

One last quick round of examples on shadowing:

#### changing value
```rust
let a = 3;
println!("a is {}", a);
let a = 5;
println!("a is {}", a);
```
**Output:**
```bash
a is 3
a is 5
```

####  using and changing value
```rust
let a = 3;
println!("a is {}", a);
let a = a + 5;
println!("a is {}", a);
```
**Output:**
```bash
a is 3
a is 8
```

#### changing type
```rust
let a = "hello world";
println!("a is {}", a);
let a = a.len();
println!("a is {}", a);
```
**Output:**
```bash
a is hello world
a is 11
```

## Quick Recap

* You declare variables with `let`
* Variables are immutable by default
* You can make them mutable with `mut`
* You declare constants with `const`
* You can use shadowing, to _"shadow"_ the value and/or type of a variable and
change it without changing the name.


[book]: https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html
[project]: https://github.com/bsantanad/rust-projects/tree/main/guess-game
[benefist]: https://jmmv.dev/2018/05/rust-review-immutable-by-default.html
