---
title: ownership in rust
date: 2021-04-29 09:38:23
author: bsantanad
draft: false
---

# ownership in rust

I've been learning rust for the last couple days, and I've like it so far
it's quite interesting and different from other programming langauges,
but it is also simliar in some aspects.

Well, I wont tell you my life story here, these are my notes on the fourth
chapter of [the book][book]

## small intro

Ownership is about how rust manages memory that is no longer at use. Some other
programming languages have memory collectors or tell directly the developer
to free the memory after they are finished with it. Rust does this in a
different way. That's what all this chapter is about.

## stack and heap

I'll start with some basic yet -- if you are not familiar with it --
confusing topic. Stacks and Heaps exisit in every programming language
it's not something you think about often but you are dealing with it
without even realizing. I'll make a super brief explanation here.

* stacks and heaps are parts of your memory available at runtime.
* stacks order store their values _last in, first out_.
* heaps are less organized, it stores data with unkown size at compile
time.

A common example is _arrays_ vs _dynamic arrays_. Arrays have a defined
size at runtime, then, we can store them in the stack, in order no problema.
Dynamic arrays in the other hand doesn't have a fixed value so the allocator
will save a chunk of memory in the heap withou knowing if it will be filled
or not.

An example with code:
```rust
let a: char = 'a'; // this would go into the stack
let a = String::from("am i here?"); // this would go into the heap
```

Clear enough? If not go [here][stack] they will give you a less breif example
hehe.

## what is ownership?

There are 3 golden rules here in rust regarding ownership:

* each value in rust has a variable that's called its owner.
* there can only be one owner at a time
* when the onwer goes out of scope, the value will be dropped.

_How does all this connects with freeing memory?_

The memory allocated for a variable, whether in the stack or the heap, will
be freed when the variable goes out of scope.

```rust
{
    let x: u32 = 5; // variable is valid from this point forward


    // still in scope

} // the scope is over, x memory has been freed
```

_Okay, so now we know when does rust frees the memory of a variable. Then what
does ownership has to do with it?_ Let's see an example:

```rust
fn main(){
    let a = String::from("hello")
    let b = a;

    println!("a is {}", a);
}
```
Here we might expect the output to be:
```bash
a is hello
```
**^^^ this is not the correct output**

Actually that piece of code wont compile at all!! _Why?_ When we declare a
variable that will be stored in the heap we will deal with ownership. In the
snippet above the variable is changing of owner. `a` is no longer the owner
of the `String::from("hello")` pointer, the new owner is `b`.

What actually happens has to do with pointers, at the start of the code we
are telling `a` to point to an address of memory that has the characters
_hello_, then we are telling `b` to point to the same address. Then both
variables will be pointing at the same address of memory. _What will happen
when both variables go out of scope?_ Rust will try to free the memory, but
which memory will it free first? `a` or `b`? and if it frees either of them
first, then when it frees the next one, how is he going to free some address
in memory that has already been freed.

The way rust protects itself from this is chainging that addresses' owner.
We wont be able to use `a` because it's not longer the owner of that memory
address.

Hope I made myself clear.

_What if I want to actually copy the contents of that memory address
antother variable?_

There's a method for that, you can use:
```rust
fn main(){
    let a = String::from("hello")
    let b = a.clone();

    println!("a is {}", a);
}
```
**output**
```bash
a is hello
```

