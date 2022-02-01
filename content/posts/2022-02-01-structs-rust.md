---
title: structs in rust
date: 2022-02-01 07:39:53
author: bsantanad
draft: false
---


# structs in rust

notes from the fifth chapter of [the book][book], keep in mind that all this info
is better explained in there, and the examples are pretty much the same :)

## small intro

Today we are going to talk about structs in rust, they have some similarities
with C structs, but they also have a few differences. Rust is not an OOP lang,
so this is the closer you'll get to have a class in here, if you are coming
from an OOP language think of an struct like a class that only has attributes,
and it can also have methods, but nothing more, not inheritance and all those
things.

## defining and instantiating structs

basically you write keyword `struct` and the name of the entire struct.
```
struct User {
    active: bool,
    username: String,
    email: String,
    age: u32,
}
```

once you definite it you can instantiate, like this:
```
fn main() {
    let user = User {
        email: String::from("john@example.com"),
        username: String::from("johnsmith12"),
        active: true,
        age: 32,
    };

    // more code
}
```

you can access each element of the struct by writing a dot, so:
```
println!("{}", user.email);
```
in this case.

If you want to modify the value of `user.email` the whole struct should be
mutable. Rust do not support letting some items of the struct be mutable and
some not. You would have to do:
```
let mut user = User {
    email: String::from("john@example.com"),
    username: String::from("johnsmith12"),
    active: true,
    age: 32,
};
user.email = String::from("johndoe@example.com");

println!("{}", user.email);
```

Lets now create a function, that builds a user
```
fn build_user(email: String, username: String, age: u32) -> User {
    User {
        email,
        username,
        age,
        active: true,
    }
}
```

as you can notice we are not doing the tedious `email: email,` assignation, if
the param in the function has exactly the same name as the item in the script
we can simplify thing by just writing it once and rust will know what's up.

## create instance form instance

Say you have declared `user` and now you need to declare `user2` and you realise
that's `user2` has the same data as `user`, except from the email, rust have a nice
trick for that:

```
let user = User {
    email: String::from("john@example.com"),
    username: String::from("johnsmith12"),
    active: true,
    age: 32,
};

let user2 = User {
    email: String::from("johnsmith@example.com"),
    ..user
};
```

you can just write the diff fields and then type `..user` user in this case
being the name of the instance we wanted to use.

**Important**, remember all those thing about [ownership in rust][own]? Well
they apply also here, in this case we can not longer access the `user.username`
value, because we borrowed it to user2. So calling user.username will prevent
the code from compiling. But age and active will have no problems, because
they are in the stack not the heap, and that means they implement the Copy
trait.

## tuple structs

You can create structs without specifying the name of the fields. _You
mean like tuples?_ yes, exactly like tuples. But in this case we are defining
a new data type so it is not just some random tuple, here's an example.

```
struct Color(i32, i32, i32);
struct Point(i32, i32, i32);

let white = Color(255, 255, 255);
let origin = Point(0, 0, 0);

println!("{}", white.2);
```
Output
```
255
```

You can access the field with a dot a num (index value). Even though they have
the same fields they are diff so you can not use them interchangeably.

### unit-like structs

is a struct without any field:
```
struct Always;

let subject = Always;
```
idk yet why this is useful but in the chapter 10 we will see this more in
depth

[book]: https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html
[own]: https://bsantanad.com/posts/2021-04-29-ownership-rust/
