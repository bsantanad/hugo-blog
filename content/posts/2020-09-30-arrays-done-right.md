---
title: revisit to c - arrays
date: 2020-09-30 18:41:00
draft: false
---

## Personal Stuff

Hi, my last post was almost 4 months ago, so I'll do a quick update of my
life -- if you are here just for the pointers info scroll down --
Well, I've been working remotely at Intel as an intern since June 1,
we are still in quarantine for all the global pandemic stuff, but things
have loosened up a bit at least here in my hometown.

Yesterday a year passed since I started playing guitar, and I see that date
with a little fear, because I should be better than I am.
Anyway, that is the en of the brief update. I hope I'll be posting,
in the next couple of days, at least until I finish this sections on
pointers, for future reference. It was nice to catch up. Hope you're
doing well.

Now, let's go with arrays.

We are taking most of this course information from [here][page]. So
if you want better information, go there!

## Reference

I bought a [book][book] by Stephen Prata, _C Prime Plus_. It covers
all the basic on C programming, so every little piece of knowledge you
read today will be from that book.

Let's start!

## Arrays

So we all know those old good arrays, don't we? I'll just leave a
little expample on how to declare them a some good old tricks

```c
/*little program that show different was to
  initialize an array*/
#include <stdio.h>

#define SIZE 4

int main(void){

    int some_data1[SIZE]; //Not init
    const int some_data2[SIZE] = {1,2,3,4}; //Read only array
    int some_data3[SIZE] = {1,2} // {1,2,0,0}
    int some_data4[] = {1,2,3,4};

    for(i=0; i < sizeof some_data3/ sizeof some_data3[0]; i++)
        printf("%14d%4d%4d%4d\n", some_data1[i],
                some_data2[i], some_data3[i], some_data4[i]);

    return 0;
}
```
Output:

```bash
           194   1   1   1
             0   2   2   2
    2120503431   3   0   3
         32764   4   0   4
```

__NOTE__: Look how we get the size of the array in the for loop,
that's a neat little trick when you don't know how many elements it has.

#### Designated Initializers

If you're using C99, you can use something called _Designated
Initializers_, they're used when you want to only initialize
certain positions.

```c
/*designated initializers*/
#include <stdio.h>

#define SIZE 10

int main(void){

    int some_data[SIZE] = {1, [5] = 101, [1] = 29,31,9};
    int i;

    for(i=0; i < sizeof some_data/ sizeof some_data[0]; i++)
        printf("%4d", some_data[i]);

    return 0;
}

```
Output:

```bash
   0  29  31   9   0 101   0   0   0   0
```
We see the power of Designated Initializers here, they __overwrite__
the value, placed before them. For example, here the last _[1] =
29_ overwrites the _1_ at the beggining.

Other way we can initialize the arrays is this one
```c

    int some_data[] = {1, [5] = 101, [1] = 29,31,9};
    int stuff[] = {[10] = 5};

```
How big the array is? The compiler will make it big enough to accomodate
the initialization values. Pretty cool right?

## Multidimensional Arrays

Maybe you want to make an array of arrays. This is really helpful in
order to mantain your code readable and understandable. How is it done?

* Next Post: In progress...

Happy Coding,
benjaSantana

[book]: https://www.amazon.com/Primer-Plus-6th-Developers-Library/dp/0321928423
