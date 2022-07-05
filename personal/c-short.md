# c-short

> Short list of more important c programming notes.

COMMENTS:

- single line comment 

`// @%@#$%`

- multi-line comment

`/* @#%#@ */`

HEADERS and NAMESPACES:

- preprocessor directive - preprocessor runs before the compiler does.

`#`

- include directive - include the contents of file "iostream" when compiling, aka a header file.

`#include <iostream>`

- <  > signs - compiler searches for the file in the brackets where it keeps all the files that came with the compiler.

`<> (example: <iotstream>`

- using directive - direct access to elements of the std namespace so you don't have to use a Scope Resolution Operator (::) for each element of the std (standard name space).

`using namespace std;`

- Scope Resolution Operator - you insert a SRO between after a namespace and before the function when you are using a function just once and in that specific line.

`:: (example std::cout << "Some string!" << std::endl;) (2 functions are accessed here from std)`

- using declartion - just like using directive but for a single function.

`using std::cout; (cout can be used anywhere in the program when this is used).

- floating point arithmetic - use at least one non real number to get a floating point result.

`7.0 / 3 = 2.333333`

- enum - an enumeration is a set of unsigned int constants called enumerators that by default start at zero and increase by 1 with each element. First you create an enum type. You can set you own element values like so: enum diffculty {NOVICE = 25, EASY, NORMAL = 50}. EASY will have a value of 26.

`enum (example: enum difficulty {NOVICE, EASY, NORMAL, HARD, UNBEATABLE};) an enum type named difficulty.`

- enum - create a variable and set it equal to your enum type. 

`(example difficulty myDifficulty = EASY;) the variable myDifficulty is set to EASY which is equal to 1 and is of the type "difficulty" so it can only hold one of the values defied in the enumeration.`

- booleans - 0 can be interpreted as false and and non-zero value as true.

`bool (example: bool fact = true, fiction = false;)

- if - if statment format

`if expression)`
`statement; (this can be a single statment or a block of statments).

- boolean IF statment

` if (true) assumes that the if statement is true. if (false) assumes the if statement is false.`

- switch case format

`switch (choice)`
`{`
`case value1:`
`statement1;`
`break;`
`case value2:`
`statment2;`
`break;`
`case value3:`
`statement3;`
`break;`
`case valueN:`
`statmentN;`
`break;`
`default:`
`statementN + 1;`

- while loop format - the variable it uses for a condition needs to be initialized before the loop.

`while (expression)`
`statment; (or block ofstatments)`

- do loop format - executes the statement then turns into a while loop AND the variable used as the conditional doesn't need to be declared before the loop.

`do`
`statement;`
`while (expression)`

- Logical Operators - are used in loops and if statements to evaluate things as true or false.

`!, &&, ||`
`NOT, AND, OR`

- Redundant Parentheses - makes an expression clearer without changing how it's evaluated.

`( (username == "S.Meier") && (password == "civilization") )`

- Random Number Generator - uses <cstdlib> and <ctime>.

PAGE 90 - PICK UP HERE



-

`static void`

- output operator - sends string to cout (standard out/terminal).

`<<`

- extraction operator - for getting user input and assigning it to a variable.

`>> (example: cin >> someVar)`

- typedef'ing - create a new name (probably shorter and easier) for an existing data type.

`typedef (example: typedef unsigned short int ushort)(the new type has the name of ushort).

-

`[@#$#@]`

-

`struct`

-

`->`
