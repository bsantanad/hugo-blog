---
title: data types in rust
date: 2021-04-27 13:54:16
author: bsantanad
draft: false
---

# data types

Rust data types are pretty similar to any other programming languages, that's
why I won't go into much detail on what is an integer and so on.

In case you haven't read the other posts, I'm learning rust and  this are my
notes from [the book][book]

## small intro

If you don't specify a data type, the compiler will infer it based on what you
stored in the variable. Rust is a _statically typed_ language, this means
that it must know all the types of the variables in the code at compile time.
There are two groups of data types: scalar types and compound types.

## scalar types

### integer

We can specify that we are using an integer like this:
```rust
fn main(){
    let a: u32 = 120;
}
```

_What does the `u32` means?_ Well, here's a little table with all the integer
sizes we can use:

| length  | signed | unsigned |
|---------|--------|----------|
| 8-bit   | i8     | u8       |
| 16-bit  | i16    | u16      |
| 32-bit  | i32    | u32      |
| 64-bit  | i64    | u64      |
| 128-bit | i128   | u128     |
| arch    | isize  | usize    |

_What's the difference between unsigned and signed?_ a signed integer will
have a sign, for example `-1` is a signed number because it has the minus.
When we are talking about positive numbers we usually don't write the sign.

In other words, we'll use signed when dealing with both negative and positive
numbers, and unsigned when dealing only with positive ones.

_What's the difference between the size?_ Short answer: how big the number
it can store is. Each signed variant can store numbers from _-(2^(n-1))_ to
_(2^(n-1)-1)_, where _n_ is the size. Say for example `i8` _n=8_, then we
can store numbers from **-128** to **127**.

When talking about unsigned numbers we would be talking numbers from
0 to (2^n - 1), then in the same example `u8` would be capable of storing
from **0** to **255**.

If you go with `isize` or `usize` it will check to see the arch of your
computer (32 or 64 bits), and use that.

You can use type suffixes like this:
```rust
fn main(){
    let a = 52u8;
    println!("a is {}", a);
}
```

### floats

same as in other programming languages, we find `f64` and `f32`, the default
one is 64.
```rust
fn main(){
    let a = 5.0;
    let b = 6.0f32;
    println!("a is {}", a);
    println!("b is {}", b);
}
```

### boolean

pretty straight forward:

```rust
fn main(){
    let a = true;
    let b: bool = false;
}
```

### char

chars are specified in single quotes.
```rust
fn main(){
    let a = 'a';
}
```

## compound types

There are two compound types: tuples and arrays both have fixed size (so
no dynamic arrays, or lists. Those are called vectors here and we'll see
them later), the main difference is that the tuples can have elements of
different scalar types, but the array cannot. Both have their first element
with index 0.

### Tuples

These are two valid ways of declaring a tuple.
```rust
fn main(){
    let tup: (u32, f64, bool) = (10, 64.0, true);
    let tup = ('c', 0, 54.2);
}
```

_How do we access the values?_
We can declare a tuple and _"dump"_ the contents of the tuple there, then we
can use the variables inside the tuple like we would use any other variable
```rust
fn main(){
    let tup = ('c', 0, 54.2);
    let (a, b, c) = tup;
    println!("a is {}", a);
}
```
or we can access them without having to declare another variable:
```rust
fn main(){
    let tup = ('c', 0, 54.2);
    println!("first element of tuple {}", tup.0);
}
```
### Arrays

Finally, we got arrays, if you have used arrays in C you'll be pretty familiar
with this. Let's see an example:
```rust
fn main(){
    let a = [1, 2, 4, 3];
}
```
You can specify the scalar type of the elements in an array using this:
```rust
fn main(){
    let a: [u32;4] = [1, 2, 4, 3];
}
```
you write the scalar type, then a `;` and finally you write the size of the
array. Remember all elements in the array must have the same scalar type

If you want to initialize an array with _4_ (or any number) elements and
want all the elements to have the same value, you can do this:
```rust
fn main(){
    let a = ['c';4];
}
```
That's the same as typing `a = ['c', 'c', 'c', 'c']`

You can access the elements of an array by their index, just like in C
```rust
fn main(){
    let a = ['c';4];
    println!("a is {}", a[0]);
}
```
#### safety

Lastly, if in the code above we wrote `a[16]`, it wouldn't even compile. Rust
will check that the index of the element we are trying to use is less than the
length of the array itself. Rust checks this even at runtime, this is one
of the safety principles rust has.

[book]:https://doc.rust-lang.org/book/ch03-02-data-types.html
