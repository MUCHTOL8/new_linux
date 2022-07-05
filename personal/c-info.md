#c-info

> C language Learning Manual

Related Notes:
======================
c-short.md
=======================


- Check that gcc compiler is installed.

`gcc -c`

- If not installed then install with:

`sudo apt install gcc`

- enable termdebug in your .vimrc to use the gdb debbuger in vim.

`packadd termdebug`

- Start termdebug by typing this in command mode in vim:

`Termdebug`
`Use bash command $termdeb-info for information on how to work termdebug`

- Once you've written a C program you can compile by typing this in command mode:

`:!gcc -g {{program.c}} -o {{program}}`
`Use bash command '$tldr gcc-info' for information on how to work gcc`

--------------------------------THE HELLO WORLD PROGRAM
- For testing purposes, copy and paste this into vim.

#include <stdio.h>

int main(int argc, char *argv[])
{
	printf("Hello World\n");

	return 0;
}



- run the program by going to the directory you outputted it to and typing

`./{{program}}`

"Hello World" should be outputted to your tty.

---------------------------BEGINNING C++ WITH GAMING BOOK NOTES

Chapter 1: Types, Variables, Standard I/O: Lost Fortune

` Standard C++ includes a set of files called the standard library, which includes the file iostream, which defines various things including the object cout.`

- Header Files

`The #include directive tells the preprocessor to include another file in the current one.`

- namespaces

`An area code telling where a specific object, or a group of objects, is defined. It identifies the group to which something belongs.`

- Example Code

`#include <iostream>.`
`std::cout << "Game Over!" << std::endl;`
`-`
`Here I've used std to tell the compiler that i mean the "cout" object from the standard library.`
`You prefix the "scope resolution operator" (::) with a namespace.`
`The "output operator" (<<) funnels whatever is on the open side and sends it to the pointy side.`

- using Directive:

`Ex: #include <iostream>`
`    using namespace std;`
`-`
`This allows you to use anything in the standard library namespace (or whatever library you decide to reference) which will save you a lot of time typing "std::somefunction" in front of every line, but it also has the downside of dumping the contents of the entire standard library into your code which can conflict with objects in other libraries that you may also want to use. The standard library might not be very problematic since most people will try and avoid using object names that conflict with object names in the standard library, but it will likely be problematic if you add an entire library other than std.`


- using Declarations:

`Ex: #include <iostream>`
`    using std::cout;`
`    using std::endl;`
`-`
`This allows you to "make local" only the elements you plan to use and not an entire namespace. YOu will be able to use these elements/objects anywhere in the file you are coding in without prefixing it with the namespace (ex. std::cout).`

`A language purist would say you shouldn’t employ either version of using
and that you should always prefix each and every element from a namespace
with its identifier. In my opinion, that’s like calling your best friend by his
first and last name all the time. It just seems a little too formal.
If you hate typing, you can employ the using directive. A decent compromise
is to employ using declarations. In this book, I’ll employ the using directive
most of the time for brevity’s sake.`

In Windows, you can create a
batch file that runs your console program and pauses, keeping the
console window open so you can see the results of your program. Since
the compiled program is named game_over.exe , you can simply create a
batch file comprising the two lines and save with a .bat extension:
game_over.exe

- Fundamental Types

`bool for true or false1`
`char for single character values`
`int for integers`
`float for single-precision floating point numbers`
`double for double-precision floating point numbers`

- Type Modifiers

`long increases the number of values a variable can hold.`
`short may decrease the storage space requried for a variable`
`signed and unsigned work only with integer types.`
`signed means a variable can store both positive and negative values.`
`unsigned means that a variable can store only postive values.`
`Neither signed nor unsigned change the number of values a variable can hold BUT they do change the range of values.`
`signed is the default for integer types.`

- Table of Types and their Values:

`short in		-32,768 to 32,767`
`unsigned short int	      0 to 65,535`
`int			-2,147,483,648 to 2,147,483,647`
`unsigned int		0 to 4,294,967,295`
`long int		-2,147,483,648 to 2,147,483,647`
`unsigned long int	0 to 4,294,967,295`
`float			3.4E +/- 38 (seven significant digits)`
`double			1.7E +/- 308 (15 significant digits)`
'long double		1.7E +/- 308 (15 significant digits)`
`char			256 character values`
`bool			true or false`
`-`
`The range of values listed depends on your compiler. Your compiler might be different than those listed above.`
`For brevity’s sake, short int can be written as just short, and long
int can be written as just long .`

- Declaring Variables

`C++ allows you to declard multliple variables of the same type in a single statement.`
`Ex. short lives, aliensKilled;`
`The above variables are type short int.`
`-`
`Variables can't start with a number and may only be made of number, letters, and underscores.`

- Initializing Variables / Assigning Variables Values

`cin >> someVariable; will assign whatever the user inputs to the variable someVariable.`
`Variable of the type double can store a number with a fraction part, such as, 1200.67`
`-`
`Wrap Around - if you set a variable larger than it's allowed size it will "warp around" and will go from negative to postive or viz-versa, much the same as a car odometer would when it goes beyonjd it's maximum value.`

- Renaming Types i.e. short, signed, etc.

`We'll rename an unsigned short integer to ushort allowing us to simply type the shorter name ushort. Use typedef, types name(s), new name.`
`ex. typedef unsigned short int ushort;`

- Shortened Assignment Operators

`Operator_____ Example_______ Equivalent To`
`+=____________ x+=5;__________ x = x + 5;`
`-=____________	x-=5;__________	x = x - 5;`
`*=____________	x*=5;__________	x = x * 5;`
`/=____________ x/=5;__________	x = x / 5;`
`%=____________	x%=5;__________	x = x % 5;`
`++x___________	++x;___________	x = x + 1; (adds      the 1 before the line is evaluated)`
`--x___________	--x;___________	x = x - 1; (subtracts the 1 before the line is evaluated)`
`x++___________	x++;___________	x = x + 1; (adds      the 1 after the line is evaluated)`
`x--___________	x--;___________	x = x - 1; (subtracts the 1 after the line is evaluated)`


- Enumerations

`It is a type of list with special rules.`
`enumerations can only hold "a set of unsigned int constants" as the values of it's keys/variables.`
`ex. enum difficulty {NOVICE, EASY, NORMAL, HARD, UNBEATABLE};`
`By default an enumeration starts a 0 and increases by 1, so NOVICE is 0, and EASY is 1, NORMAL is 2, HARD is 3, and UNBEATABLE is 4.`
`ex cont. difficulty myDifficulty = EASY;`
`The variable myDifficulty is a variable of your new enumeration type 'difficulty'.`
`It can only hold values defined in the enumeration 'difficulty.'
`We'll define another enumeration to use in conjunction with 'difficulty' in which we'll explicitly define some of the values.`
`ex. enum shipCost {FIGHTER_COST = 25, BOMBER_COST, CRUISER_COST = 50};`
`Next we will declare a variable of the enum shipCost called myShipCost.`
`ex. shipCost myShipCost = BOMBER_COST;`
`Because I didn't assign a value to BOMBER_COST it is initialized to 26, which is the value of the key before it plus 1.` 



Chapter 2: Truth, Branching, and the Game Loop: Guess My Number
Chapter 3: for Loops, Strings and Arrays: Word Jumble
Chapter 4: The Standard Template Library: Hangman
Chapter 5: Functions: Mad Lib
Chapter 6: References: Tic-Tac-Toe 2.0
Chapter 7: Pointers: Tic-Tac-Toe 2.0
pauseChapter 8: Classes: Critter Caretaker
Chapter 9: Advanced Classes and Dynamic Memory: Game Lobby
Chapter 10: Inheritance and Polymorphism: Blackjack


`.`
`Check tldr c-short`
