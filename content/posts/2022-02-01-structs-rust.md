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
```rust
struct User {
    active: bool,
    username: String,
    email: String,
    age: u32,
}
```

once you definite it you can instantiate, like this:
```rust
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
```rust
println!("{}", user.email);
```
in this case.

If you want to modify the value of `user.email` the whole struct should be
mutable. Rust do not support letting some items of the struct be mutable and
some not. You would have to do:
```rust
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
```rust
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

### create instance form instance

Say you have declared `user` and now you need to declare `user2` and you realise
that's `user2` has the same data as `user`, except from the email, rust have a nice
trick for that:

```rust
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

### tuple structs

You can create structs without specifying the name of the fields. _You
mean like tuples?_ yes, exactly like tuples. But in this case we are defining
a new data type so it is not just some random tuple, here's an example.

```rust
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
```rust
struct Always;

let subject = Always;
```
idk yet why this is useful but in the chapter 10 we will see this more in
depth

## println an structure

If you want to print what is inside an structure, you might be tempted to use
`println!("{}", user);` this will not work.

That's because rust does not know how to print the data inside User, it can
print it with commas or without them with curly brackets, anyway it could
print it in a bunch of different ways. The proper way to print an struct
is by implementing a Display method to the struct but, there's a little "hack"
we can use.

We can tell rust that we are debugging the program and that we want to check
what's inside the struct. We will have to modify `println!` a bit, here's an
example:
```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let rect = Rectangle {
        width: 5,
        height: 7,
    };

    println!("{:?}", rect);
}
```
output
```
Rectangle { width: 5, height: 7 }
```

This way we can see what's inside rect even though we have not implemented, a
Display method.

There's other way too, using the `dbg!()` macro. Be careful this macro will
take ownership of the variable you send so it's better to just send the
reference
```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let rect = Rectangle {
        width: 5,
        height: 7,
    };

    dbg!(&rect);
}
```
Output
```
[src/main.rs:12] &rect = Rectangle {
    width: 5,
    height: 7,
}
```
this macro have a little more info on what's going on, it'll be helpful when
debugging big programs

## methods

This is where the fun begins, we can implement methods to the structs, meaning
we can have specific functions for each struct.

Let's say we want to play with rectangle, and want to implement an function
that calculates the area of a rectangle. Yes, we could make a separated
function that you just send the rectangle and it calculate the area, but
wouldn't it be better to have it more tight to the rectangle struct? At the end
of the day, each shape we declare will have their own way to calc the area.

Then we can use a method.

```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
}

fn main() {
    let rect = Rectangle {
        width: 5,
        height: 7,
    };

    println!("area is {}", rect.area());
}
```

Notice how instead of sending the rectangle in the function signature, we send
self, this means, "hey, use me", so it will calculate the area based on the
current `rect` calling the function. Also notice that we still have to worry
about ownership that's why we use the `&`. Having a method that takes ownership
of the values is rare, if you want to modify values you can always use `&mut
self`

Also notice how we call the function, no need to send params because we are
telling to use it on the struct itself.

### creating other more methods

We can create another method inside `impl`. Say for example a method that tells
us is a rectangle fit's inside another rectangle.

I'll let the code speak by it self
```rust
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }

    fn can_hold(&self, rect: Rectangle) -> bool {
        self.area() > rect.area()
    }
}

fn main() {
    let rect = Rectangle {
        width: 5,
        height: 7,
    };

    let rect1 = Rectangle {
        width: 4,
        height: 3,
    };

    println!("can rect hold rect1? {}", rect.can_hold(rect1));
}

```
Output
```
can rect hold rect1? true
```

### associated functions

We can create functions inside `impl` that are not methods, hence they don't
have the `self` operator, this helps keeping the code nice and neat. Say
we want a function to create an square.

We would do that the following way
```rust
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }

    fn can_hold(&self, rect: Rectangle) -> bool {
        self.area() > rect.area()
    }

    fn square(size: u32) -> Rectangle {
        Rectangle {
            width: size,
            height: size,
        }
    }
}

fn main() {
    let rect = Rectangle {
        width: 5,
        height: 7,
    };

    let rect1 = Rectangle {
        width: 4,
        height: 3,
    };

    let square = Rectangle::square(4);
}
```

Notice how we are calling the `square()` function, we write the name of the
struct and then the function name. And the code looks more organised.

I think that's it for this post, this struct part of rust is cool, because
we can have some part of OOP without dealing with the whole inheritance thing
and all those tedious part. It helps understand the code better, and therefore
maintaining it easier.

Hope you enjoyed the post

happy Coding :)
ben


[book]: https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html
[own]: https://bsantanad.com/posts/2021-04-29-ownership-rust/
