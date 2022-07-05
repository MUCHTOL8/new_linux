#SED - Stream Editor

> text manipulation


The Substitute Command 's'

There are four parts to this substitute command:

s	  Substitute command
/../../	  Delimiter
one	  Regular Expression Pattern Search Pattern
ONE	  Replacement string

- substitute one character(s) for another.

`sed/day/night/ <old file >new file`
`OR`
`sed s/day/night/ <old file >new file`

The forward slash is commonly used as a delimiter but you can replace the 3 forward slashes with any other character and it will work the same.

If you get a "Unterminated `s' command" it's because you are missing one of the delimiters.

If you have meta-characters in the command, quotes are necessray.
But quotes are "best practice".


Extended Regular Expressions: -r is a flag saying to treat + and * in a special manner.


sed flags:
-r = extended regular expressions


-n = quiet option to suppress the unmatched text
sed -n '6,9p' {{input file}}


-e = for multiple expressions at once
sed -e '1,4p' -e 31,34p' {{input file}}
prints lines 1 through 4 and 31 through 34.

-p = print  matched lines
sed '1,4p' {{input file}}
prints lines 1 through 4.

^ = represents the start of the line
sed '/^And /p' {{input file}}
finds lines that start with and and prints them.

s = substition
sed 's/day/week/p' {{input file}}
switches the first instance of day to the word week IN EACH LINE.

g = global
sed 's/day/week/gp' {{input file}}
replaces every instances of day with the word week.

i = case-insensitivity
sed 's/day/week/gip' {{input file}}
capitals in day or week will be treated as if they are lower-case.

[] = regex group (pattern specific)
sed -n 's/[Dd]ay/week/gp' {{input-text}}
characters enclosed in brackets are interpreted as "any character from this list of characters".

* = 1 or more
sed -n '1,4 s/  */ /gp' {{input_file}}
the asterisk means zero or more of the preceeding character (which is a space).
the 1,4 will make it substitute on lines 1 through 4.

Each matched item in a search pattern (called subexpressions) can be numbered (up to a maximum of nine items). You can then use these numbers in your sed commands to reference specific subexpressions.


You have to enclose the subexpression in parentheses [()] for this to work. The parentheses also must be preceded by a backward slash (\) to prevent them from being treated as a normal character.



