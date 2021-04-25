---
title: pointer basics and structures in c.
date: 2020-05-18 10:20:00 -0600
author: bsantanad
draft: false
---

## Heavier Things

So yesterday we took a look at the basic C stuff: loops, functions,
stdio and more! If you want to check that out click [here][ReLearning],
once you have that covered this is the next step. Good luck!

We are taking most of this course information from [here][page]. So if
you want better information, go there.

## Pointers

What are they? They a re just simply variables that store the direction
of another variable. This will come pretty handy once we get into
dynamic arrays. For now, you just need to know what it is. They're
called pointers because they'll _point_ to another variable direction.

From a pointer you can ask two things, to tell you the __direction__ of
the variable you are pointing to, or to tell you the __value__ of the
direction, so the syntax is different from any other variable.

```c

#include <stdio.h>
int main()
{
    int x,*p;

    p = &x;
    scanf("%d", &x);
    printf("%d\n", *p);
    return 0;
}

```

Okay, what's happening here. To declare a pointer you just add a '_*_'
in the declaration statement. When we use the _p_ without
the _*_, it means we are talking about the direction in which p is
pointing. If we put the _*_ we are asking for the value of that direction.

So in the code we tell _p_ to store the direction of _x_. Note how we
are literally sending the direction by using _&x_. Then we ask for
the value of x. then we print the value of the direction _p_ is
pointing to. That's why we use the _*_ there, because we want
the value not the direction.

If we tried to printf _p_ or _*p_, before we tell it to follow
_&x_, we would have a problem. The OS will note that you are
trying to access memory you don't own, and the program probably would
crash.

We can tell the program to initialize the pointers using free memory
with the _malloc_ function. We'll go in more detail later but for
the moment, take a look on how it works.

```c
#include <stdlib.h>
int main()
{
    int *p = malloc(sizeof(int));
    int *g = malloc(sizeof(*g));

    int *w;

    w = malloc(sizeof(*w));

    free(w);
    free(p);
    free(g);
    return 0;
}
```
In the code we show multiple forms of how we can use the malloc function.

The _free()_ function returns memory to the OS.

## Structures

Some times when programming, it will be convenient to have a name that
refers to a group of other variables, it's kind of like a crippled
class in OOP, this is called a struct.

```c
#include <stdio.h>

struct Vector2D{
    int x;
    int y;
};

int main(){

    struct Vector2D normal;
    struct Vector2D *point;

    point = &normal;

    normal.x = 1;
    normal.y = 3;

    printf("%d\n", normal.x);
    printf("%d\n", point->y);
    return 0;
}
```
Here's an example, let's break it down. First we are defining the
structure Vector2D, this will have an _x_ and a _y_. Then in the
main, we are declaring two "variables" type Vector2D. Note that
the second one is a pointer. Followed by that we tell the pointer
_point_ to follow Vector2D normal. Then we access each element of
_normal_ and assign a value. At the end, we print the value of
x in the normal Vector2D, and then the __value__ of y but accessing it
through the pointer.

### typedef

We can use typedef if we want the code to be more readable and if
we want to save some keystokes. It basically let you rename a type of
data, or say that whenever you write a keyword, you're referring
to a specific struct. Let's see an example and see if it
gets any clearer.

```c
#include <stdio.h>

struct Vector2D{
    int x,y;
};

typedef struct Vector2D Vector2D ;

int main()
{
    Vector2D vector;
    vector.x = 5;
    vector.y = 6;

    printf("(%d, %d)", vector.x, vector.y);
    return 0;

}

```
You can use another notation,

```c
#include <stdio.h>

 typedef struct Vector2D{
    int x,y;
} Vector2D;

int main()
{
    Vector2D vector;
    vector.x = 5;
    vector.y = 6;

    printf("(%d, %d)", vector.x, vector.y);

    return 0;

}

```

Output
```bash
(5, 6)
```

**NOTE:** There's also something like a struct called a Union, it's
pretty much the same, the main difference it's that in a struct
each element has its own separated memory location, meanwhile in the union
all members share the same memory location.

So, now you know a little more about Pointers and Struct, the next
lesson of this _refreshing_ course, will be
on [Arrays and Strings][nextLesson]. Hope to see you there.


Happy Coding,
benjaSantana

[page]: https://www.cprogramming.com/tutorial/c/lesson1.html
[ReLearning]: https://benjasantana.github.io/2020/05/17/ReLearning-C.html
[nextLesson]: https://benjasantana.github.io/2020/05/18/Arrays-Strings.html
