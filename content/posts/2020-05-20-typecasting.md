---
title: typecasting in c
date: 2020-05-20 10:28:00 -0600
draft: false
---

## Welcome back!

So you've come here looking for knowledge, well I can't tell you're in
the right place, but I can tell you what I know on Typecasting.
You can checkoutour last post to learn about __Files I/O__ in
C [click here][ReLearning].

We are taking most of this course information from [here][page].
So if you want better information, go there!

## Typecasting

So basically this is a pretty simple concept, you have a certain type of
variable, int, and you want to transform it into any other for example,
char, well here's where typecasting comes pretty handy.

Why would you want to do this? Well imagine you want to divide two
integers, say 1 and 2 so 1/2, no big deal right? Well, there's
a problem there, because the result it's not an integer. So
the result would be 0, why? Because it's the integer part
of that division. If you want to store the .5 you would have to
_cast_ the division into a float.



```c
#include<stdio.h>

int main(){
    int a = 1;
    int b = 2;
    float c = (float) a/b;

    printf("%f\n", c);
    return 0;
}
```
Output:

```bash
0.500000
```
That was easy, wasn't it? Well it can complicate a bit.

### Void

So, you might not know this, but there's a type of variable that's
void. You did know this? Well I didn't. And this type of variable
is special, because you can cast it two whatever you want! Check this
out.

Here are a few ways to do this.

```c
#include <stdio.h>
int main()
{
    int x = 5;
    void *pointer = &x;
    int *y = (int*) pointer;
    int z = *y;

    printf("%d", z);
    return 0;
}
```
Here's another, when you skip the _z_.

```c
#include <stdio.h>
int main()
{
    int x = 5;
    void *pointer = &x;
    int y = *((int*) pointer);

    printf("%d", y);
    return 0;
}

```

The output of both codes is

```bash
5
```
Maybe you are wondering why did someone would use this. But this happens a
lot with the parameters of some functions, they receive
_func(void *param)_ and inside the function they cast it to
a concrete type of variable. (I don't know if concrete it's the
right way to say it.)

So, this post was brief but I think this is pretty important, specially
the void part, I believe I'll be coming back to this code two see how
two cast things the proper way.

Anyway, hope you found this helpful, read the code slowly, it makes sense
after a while. Cheers!

Past post: [FILES I/O][ReLearning]
Next Post: TODO

Happy Coding,
benjaSantana

[page]: https://www.cprogramming.com/tutorial/c/lesson1.html
[ReLearning]: https://benjasantana.github.io/2020/05/19/Files.html
[nextLesson]: https://benjasantana.github.io/
