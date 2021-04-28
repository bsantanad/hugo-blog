---
title: expressions and statements in rust
date: 2021-04-27 20:20:53
author: bsantanad
draft: false
---

# expressions, statements and functions in rust

In case you haven't read the other posts, I'm learning rust and  this are my
notes from [the book][book], if you want a more complete explanation please
go there, I won't get mad.

Before talking about statements and expression we must talk about functions.
So what are we waiting for...

## functions

So all this time we have been using the most important function in rust:
the main function it looks something like this.
```rust
fn main(){
    println!("hello world");
}
```
**output**
```bash
hello world
```
pretty, isn't it? Well if we take a closer look we can see how the functions
are built.

* we have the keyword `fn`
* then the name of the function
* then parenthesis
* then curly brackets

Let's create a function of our own
```rust
fn main(){
    println!("hello world");

    my_function();
}

fn my_function(){
    println!("goodbye");
}
```
**output**
```bash
hello world
goodbye
```
that was easy enough, right?

### params

So you might remember from your C or python class that functions can receive
parameters, right? Well, we can do that here as well, it's quite simple

```rust
fn main(){
    println!("hello world");

    my_function(8, -2);
}

fn my_function(a: u32, b: i8){
    println!("i received {} & {}", a, b);
}
```
**output**
```bash
hello world
i received 8 & -2
```
As you can see, we just need to add the data type of the param and send it.
Rust doesn't allow for params without data type and this is done on purpose,
more info [here][book]

_cool, cool, but if I want to return a value, how do I do that?_ Well my
friend, did you read the title?

## expressions & statements

Before going into returning things from a function we need to have this two
concepts pretty clear. In simple words:
* expression returns something
* statements perform some action and don't return anything

So far we have looked at functions with a lot of statements, but we haven't
encounter one that ends in an expression. Usually function will be like that,
have a lot of statements and end in expressions.

`let x = 6;` is a statement, this statement don't return anything it just
assign a value. Now let's see an expression in the wild:

```rust
fn main(){
    let c = my_function(8, 2);
    println!("c is {}", c);
}

fn my_function(a: u32, b: u32) -> u32 {
    println!("i received {} and {}", a, b);
    a + b
}
```
_Hey, you are missing `;` after `a + b`_. __Nope__, that is intentional,
that is an expression.

_Wait what?_ Okay, let's go back a bit, first let's see what changed in our
code.

The `my_function` function now has an `-> u32` after it's signature, this means
that it will return an `u32`, okay? nothing weird so far.

Then when we call it we send 8 and 2, because it receives two `u32`.

Now what the function does after printing what values it received, doesn't
have a semicolon `;`, this means it is an expression, if it had a semicolon,
the complier would get mad.

What we are saying is: sum these two numbers and (because it doesn't have a `;`)
return them. This is no different, like when for example you do `let x = 5;`
that is a statement, but the `5` in there is an expression, the 5 alone is
returning the value of 5.

Did this fried your brains?

You can still use the `return` keyword, but it is only recommended when you want
to return early in the function

If you didn't understand read it again, and if it's still in Chinese, please
go read [the book][book], maybe they can explain it better.

[book]: https://doc.rust-lang.org/book/ch03-03-how-functions-work.html
