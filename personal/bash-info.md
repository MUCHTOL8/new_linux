# bash-info

> bash terminal and scripting language information guide (currently empty-ish).

- For a copy of .bash_aliases in case of a disaster or emergency:

`tldr .bash_aliases-info`

The operators for comparing numbers include –eq, –lt, and –gt for
comparing equality, less than and greater than, respectively. On the other hand,
string operators for comparing strings include ==, <, and >

Some file-related operators that are available in bash include –f, –d, –e
for checking if a filename is a file, a directory, or checking for the existence of
a file, respectively.

Boolean operators (also called logical operators) in bash are –a, –o, ! for
the AND operation, OR operation, and negation, respectively.


CONDITIONAL LOGIC AND LOOPS

QUICK OVERVIEW OF OPERATORS IN BASH

Arithmetic Operators
String Operators
File Test Operators
Boolean Operators

The expr command is often used to perform arithmetic operations (add, subtract, multiply, or divide) on numeric values.





ARITHMETIC OPERATIONS AND OPERATORS

Arithmetic in POSIX shells is performed with $ and double parentheses,
as shown here:
echo "$(($num1+$num2))"
In addition, you can use command substitution to assign the result of an arithmetic operation to a variable:
num1=3
num2=5
x='echo "$(($num1+$num2))"'
A simpler alternative to the preceding code snippet involves the expr command, which is discussed in the next section.

The expr Command
The previous section shows you how to add two numbers using double parentheses; another technique uses the expr command, as shown here:
expr $num1 + $num2
As you probably expect, the expr command supports arithmetic operations involving hard-coded numbers, as shown in the following example that adds two numbers:
sum=`expr 2 + 2`
echo "The sum: $sum"
This would produce the following result:
The sum: 4
Spaces are required between operators and expressions
(so 2+2 is incorrect)

expressions must be inside “backtick” characters
(also called inverted commas).
sum=`expr 2 + 2`

Bash supports relational operators that are specific to numeric values: they will not work correctly for string values unless their value is numeric.
$a –eq $b checks if $a and $b are equal
$a –ne $b checks if $a and $b are unequal
$a –gt $b checks if $a is larger than $b
$a –lt $b checks if $a is smaller than $b74
$a –ge $b checks if $a is larger or equal to $b
$a –ge $b checks if $a is smaller than or equal to $b


Performing arithmetic conditions on variables or values can be done as follows:
[ $var -eq 0 ] # true when $var equal to 0
[ $var -ne 0 ] # true when $var differs from 0

You can also combine the preceding operators with –a (“AND”) or –o
(“OR”) to specify compound test conditions, as shown here:
[ $var1 -ne 0 -a $var2 -gt 2 ]
[ $var1 -ne 0 -o $var2 -gt 2 ]

The test command performs condition checks and also reduces the number of brackets.
if [ $var -eq 0 ]; then echo "True"; fi
can be written as
if test $var -eq 0 ; then echo "True"; fi


WORKING WITH VARIABLES

assigning values to variables
with double quotes and single quotes:
x="abc"
y="123"
echo "x = $x and y = ${y}"
echo "xy = $x$y"
echo "double and single quotes: $x" '$x'
The preceding code block results in the following output:
x = abc and y = 123
xy = abc123
double and single quotes: abc $x

Make sure that you do not insert any whitespace between a variable and its value. For example, if you type the following command:
z = "abc"
You will see the following output:
-bash: z: command not found
On the other hand, you can insert whitespace between text strings and variables in the echo command, as you saw in the previous code block.

the following syntax is invalid because the variable y is preceded by the $ symbol:
$y=3
-bash: =3: command not found




Illustrates how to assign variables with different values and how to update them.

#length of myvar:
myvar=123456789101112
echo ${#myvar}

#print last 5 characters of myvar:
echo ${myvar: -5}

#10 if myvar was not assigned
echo ${myvar:-10}

#last 10 symbols of myvar
echo ${myvar: -10}

#substitute part of string with echo:
echo ${myvar//123/999}

#add integers a to b and assign to c:
a=5
b=7
c=$((a+b))
echo "a: $a b: $b c: $c"

# other ways to calculate c:
c='expr $a + $b'
echo "c: $c"
c='echo "$a+$b"|bc'
echo "c: $c"
Launch the code in Listing 4.1 and you will see the following output:
15
01112
123456789101112
6789101112
999456789101112
a: 5 b: 7 c: 12



reading characters from input into the variable myvar:
read -n number_of_chars myvar

For example, the following code snippet reads two characters from the command line (in the form of user input) and then displays those two characters:
$ read -n 2 var
echo "var: $var"

Various other options are possible with the read command. For example, the following command reads a password in non-echoed mode:
read -s var Display a message with read using:
read -p "Enter input:" var

There are various operators in bash for testing string variables and combining those operators with Boolean operators. Suppose that the variables x
and y have the values “abc” and "efg", respectively:
[ $x = $y ] is false
[$x != $y ] is true
[ -z $x ] is false because $a has non-zero length
[ -n $x ] is true because $a has non-zero length
[ $x ]
is false because $x is a non-empty string

Keep in mind that the “==” operator is for string comparisons, whereas “-eq” is for numeric tests and numeric comparisons.

determine
whether or not a string has non-zero length, as shown here:
-n s1 String s1 has nonzero length
-z s1 String s1 has zero length

When you perform string comparison, use double square brackets because single brackets can sometimes lead to errors.

Two strings can be compared to determine whether they are the same as follows:
[[ $str1 = $str2 ]]: true when str1 equals str2
[[ $str1 == $str2 ]]: alternative method for string equality check

We can check whether two strings are not the same as follows:
[[ $str1 != $str2 ]]: true when str1 and str2 mismatches

We can find out the alphabetically smaller or larger string as follows:
[[ $str1 > $str2 ]]: true when str1 is alphabetically greater than str2
[[ $str1 < $str2 ]]: true when str1 is alphabetically lesser than str2
[[ -z $str1 ]]:
true if str1 holds an empty string
[[ -n $str1 ]]:
true if str1 holds a non-empty string

Combine multiple string-related conditions using the logical operators && and ||
if [[ -n $str1 ]] && [[ -z $str2 ]] ;
then
commands;
fi
For example:
str1="Not empty "
str2=""
if [[ -n $str1 ]] && [[ -z $str2 ]];
then
echo str1 is non-empty and str2 is empty string.
fi
The output is as follows:
str1 is non-empty and str2 is empty string.

Sometimes you will see bash scripts (such as installation-related shell scripts) that contain compound expressions to perform multiple operations. In particular, the && operator is used to “connect” multiple commands that executed sequentially (in a left-to-right fashion). Each command in the sequence is executed only if all the preceding commands in the sequence executed successfully. If the current command (in a sequence) does not execute successfully, the remaining commands (if any) that appear on the right-side of the failed command will not be executed.




FILE TEST OPERATORS

Bash shell supports numerous operators to test various properties of files.
Suppose that the variable file is a non-empty text file that has read, write, and execute permissions:
-b file Checks if file is a block special file
-c file Checks if file is a character special file
-d file Checks if file is a directory
-e file Checks if file exists
-f file Checks if file is an ordinary file
-g file Checks if file has its set group ID (SGID) bit set
-k file Checks if file has its sticky bit set
-p file Checks if file is a named pipe
-t file Checks if file descriptor is open and associated with a terminal
-u file Checks if file has its set user id (SUID) bit set
-r file Checks if file is readable
-w file Checks if file is writeable
-x file Checks if file is executable
-s file Checks if file has size greater than 0
-e file Checks if file exists
f1 -nt f2 File f1 is newer than file f2
f1 -ot f2 File f1 is older than file f2

An example of testing for the existence of a file with the –e option is shown here:
fpath="/etc/passwd"
if [ -e $fpath ]; then
echo File exists;
else
echo Does not exist;
fi

Combine Boolean operators and file-related operators with the && (“AND”) operator or the || (“OR”) operators. The following example checks if a file exists and also if it has write permissions:
fpath="/tmp/somedata"
if [ -e $fpath ] && [ –w $fpath ]
then
echo "File $fpath exists and is writable"
else
if [ ! -e $fpath ]
then
echo "File $fpath does not exist "
else
echo "File $fpath exists but is not writable"
fi
fi

Notice the use of the && operator in the first if statement in the preceding code block. The following syntax is incorrect because there are two consecutive operators and the bash shell will not interpret the syntax correctly:
if [ -e $fpath -a –w $fpath ]
Notice that compound operators with string operators also use the && or the || operators:
if [[ -n $str1 ]] && [[ -z $str2 ]] ;

However, compound operators with numeric operators do not require the && or the || operators, as shown here:
[ $a -lt 20 -a $b -gt 100 ]




CONDITIONAL LOGIC WITH IF/ELSE/FI STATEMENTS
The following example shows you how to use an if/else/if statement in bash

x=25
if [ $x -lt 30 ]
then
echo "x is less than 30"
else
echo "x is at least 30"
fi




























































