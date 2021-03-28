---
title: arrays and strings in c.
date: 2020-05-18 19:28:00 -0600
draft: false
---

## More Content!

Hi! Glad to see you here. If you just came from the last post where we
learn about [Pointers and Structs][ReLearning] welcome back! And if
this is the first post you see, you can go and check out the other
"mini refreshers" I've written. Today we will get two know Arrays
and Strings, and how they are managed in C.

We are taking most of this course information from [here][page]. So
if you want better information, go there!

## Arrays

Let's start with the array, I want you to imagine you've got a drawer
cabinet with _n_ drawers, you could store a thing inside each drawer.
And if you wanted someone else to give you a thing in a specific drawer
you would have to tell him in which drawer to check. Okay an array it's
pretty much the same, you have this spaces where you can store data. Look
it my sound confusing at first but let's put an example.

```c
#include <stdio.h>

int main(){

    char name[10];
    int i = 0;

    scanf("%s", name);

    for(i=0; i<10; i++){
        if (name[i] == 'e'){
            printf("your name has an e");
        }
    }

    return 0;
}
```
Okay, so what's happening there? We are declaring an array of chars aka
string, named _name_, this means that we can have strings of characters
like "david" or "michael". Then we can access each element of the array
with _[]_. For example, if the name given is "peter", we could access
each letter in the name by its index, for example:

* name[0] would be 'p'
* name[3] would be 'e'

Note that the index starts with 0, in this case, the higher index of
name would be name[9], __name[10] wouldn't exist__ because that chunk of
memory doesn't belong to this array so the OS won't let you access that
position.

So in the program we read the name of the person and then, check if
there's an 'e' in any of its position and print's it.

__Note__ in this program we could have names bigger than 10 characters.

### Quick Note on Pointers

It's good to point out that if we are storing an array into a pointer we don't have to use the '&':

```c
#include <stdio.h>

int main(){

    char name[10];
    char *name_pointer;

    name_pointer = name;
    scanf("%s", name);
    return 0;
}
```
### Bidimensional Arrays

You could have an array in the form of a matrix, imagine a drawer
cabinet with more than one row of drawers.
```c
#include <stdio.h>

int main(){

    int numbers[2][3];

    numbers[0][0] = 5;
    numbers[1][2] = 3;

    numbers[1][0] = numbers[0][0] + numbers[1][2];

    printf("%d", numbers[1][0]);

}
```

The output would be _8_, so you can bidimensional arrays.

### Another way to set the Size

When declaring a string we could also set the size and the content of
the string like this.

```c
#include <stdio.h>
int main(){
    char book[] = "Great Gatsby";
    printf("%s", book);
    return 0;
}
```
There's a lot of other stuff you can do with an array, we are just
here covering the basics, maybe later in we could do a set of post
for a more advanced C.

## String

So look, strings are arrays of chars, but C adds them a char at the
end to know where the string ends, if you declare

* char hi[] = "hello";

The length of hi wouldn't be 4, it would be 5! Because we need
to account for that last element which tells us that the arrays has ended.

It's not a good idea to read strings with _scanf_, you could do it,
but it's not recommended because it could leave into problems. We
will use another function called __fgets(char *string, int size,
FILE* file)__ this function can also read files, but in
this case we will give the parameter _stdin_ which stands for standard
input, and this will tell it two expect something from the keyboard.

Here's and example,

```c

#include <stdio.h>

int main(){

    char name[10];

    fgets(name, 10, stdin); // (int *string, int size, stdin);
    printf("%s", name);
    return 0;
}

```

This function it's really great, first you give the direction
of the string, and as you might remember, because it's an
array, we don't need to use the _'&'_. Then you set the length of the
string you want to read. __NOTE:__ that this could be smaller than
the string itself.

Look there's something important you need to know when using fgets,
It will "try" to read all the characters you told him, so if there is
space missing and you hit enter, it will store '\n' in your array. And then
in the place you told him you will end, it would store the '\0' meaning
that the string ends here, this might lead into a problem when using...

### string.h library

This library has multiple operations with strings and it's pretty handy,
here's a brief list,

| Function      | Param                                                  | What does it Do                                                              |
| ------------- |:------------------------------------------------------:| ----------------------------------------------------------------------------:|
| strcmp        | int strcmp(const char \*string1, const char \*string2) | Compares two strings, returns 0 if they're equal, not 0 if they're not, CaseSensitive|
| strcat        | char \*strcat(char \*destination, const char \*scr) | Returns a concatenated String of the two strings given  |
| strcpy        | char \*strcpy ( char \*dest, const char \*src )        | Copies one string into the other    |
| strlen        | size\_t \*strcpy ( const char \*string1 )              | Returns the value size of a string without the '\0'    |

Here's a little piece of code implementing some of them,

```c
#include <stdio.h>
#include <string.h>
int main(){

    char fruit[] = "watermelon";
    char juice[] = "apple";

    char appended[50];

    int fruitLen = strlen(fruit);

    printf("The word %s has %d letters\n", fruit, fruitLen);

    strcat(fruit,juice);
    fruitLen = strlen(fruit);

    printf("The word %s has %d letters\n", fruit, fruitLen);

    strcpy(appended, fruit);

    printf("%s\n", appended);


    return 0;
}
```

The output is,

```bash

The word watermelon has 10 letters
The word watermelonapple has 15 letters
watermelonapple

```

__NOTE:__ I've said that giving fgets() a wrong size could lead into
problems because some of these functions, rely on that last character
'\0' to work, so be careful with that.

### Read Array of Strings

```c
#include<stdio.h>
#include<stdlib.h>

#define MAXLENGTH 99

int main(){

    int howManyStrings;
    int i;

    //How many Strings you want.
    scanf("%d", &howManyStrings);

    char *stringList[howManyStrings];

    //Read the array of Strings
    for(i=0; i<howManyStrings; i++){
        stringList[i] = malloc(MAXLENGTH*sizeof(char));
        scanf("%s", stringList[i]);
    }

    //Free memory
    for(i=0; i<howManyStrings; i++){
        free(stringList[i]);
        stringList[i] = NULL;
    }

    return 0;
}
```
Read how many strings you want, in a loop, first assing the memory
then ask for the string.

Past post [Structures and Pointers][ReLearning]

Next post [Files I/O][nextLesson]

Happy Coding,
benjaSantana

[page]: https://www.cprogramming.com/tutorial/c/lesson1.html
[ReLearning]: https://benjasantana.github.io/2020/05/18/Pointers-Structures-C.html
[nextLesson]: https://benjasantana.github.io/2020/05/19/Files.html
