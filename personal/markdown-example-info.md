# markdown-example-info

```
The Useful stuff: 

3 backticks (```) on each side of some code to show it without changing it (including blanks spaces).

1 backtick (`) on each side of a bit of code that's inline of a sentence or paragraph breaks the the sentence/paragraph onto 3 lines and turns the quoted bit orange, indents it, and puts it on it's own line.

A hyphen (-) at the beginning of the sentence/paragraph adds a hyphen at the beginning of the sentence/paragraph and turns all of the following text green until their is a blank line (a line with absolutely nothing on it).

1 backtick (`) on each side of a sentence/paragraph indents the sentence/paragraph and turns the enclosed text orange. Multiple of these sentence can be used one row right after another for several lines of unconnected indented orange text.

> adds a right arrow (>) to the beginning of the line which helps to make lines appear distinct from one another.

Unparsed Source Code
=====================
(new_line_1) This is some code `the actual code` and everything followinng it.



(new_line_2) `hello`

> (new_line_3) This should be a block quote but block quotes don't work. 
> (new_line_4) Here is an example of it not working.
> (new_line_5)  Adding > would normally create a block quote.

> (new_line_6) To make use of block quotes you need to add an empty line between the > symbols so they appear on seperate rows.

(new_line_7) It is necessary to add a > symbol on every line or else...
(new_line_8)  Each line will be added to the line before it to make one big long paragraph. But if you don't use the > each line of text will appear on a new line just like you'd expect.

> (new_line_9)

> (new_line_10) Adding a > symbol with no text and surrounded by empty rows will NOT create an empty row in tldr. It all get's put one row after another.
.
.


(new_line_11) Just typing will add white text that will go on it's own line but you can't add empty lines comments in order to seperate them
(new_line_12) This is the second line as an example.

(new_line_13) And this is the third line which has an empty line above it in the markdown file but which won't when displayed in tldr.


(new_line_14) You can't do a codeblock inside of a codeblock so these 3 backticks are messing up my codeblock unless I add something infront of them to de-codeblock them.
(new_line_15) ```

(new_line_16) three backticks to create a code block in which everything will look the way you type it
(new_line_17) including addding empty lines.

(new_line_18) These 3 backticks weren't showing up either.
(new_line_19) ```


Parsed Code Showing New Lines
=============================
```
(new_line_1) This is some code `the actual code` and everything followinng it.



(new_line_2) `hello`

> (new_line_3) This should be a block quote but block quotes don't work. 
> (new_line_4) Here is an example of it not working.
> (new_line_5)  Adding > would normally create a block quote.

> (new_line_6) To make use of block quotes you need to add an empty line between the > symbols so they appear on seperate rows.

(new_line_7) It is necessary to add a > symbol on every line or else...
(new_line_8  Each line will be added to the line before it to make one big long paragraph. But if you don't use the > each line of text will appear on a new line just like you'd expect.

> (new_line_9)

> (new_line_10) Adding a > symbol with no text and surrounded by empty rows will NOT create an empty row in tldr. It all get's put one row after another.
.
.


(new_line_11) Just typing will add white text that will go on it's own line but you can't add empty lines comments in order to seperate them
(new_line_12) This is the second line as an example.

(new_line_13) And this is the third line which has an empty line above it in the markdown file but which won't when displayed in tldr.


(new_line_14) You can't do a codeblock inside of a codeblock so these 3 backticks are messing up my codeblock unless I add something infront of them to de-codeblock them.
(new_line_15) ```

(new_line_16) three backticks to create a code block in which everything will look the way you type it
(new_line_17) including addding empty lines.

(new_line_18) These 3 backticks weren't showing up either.
(new_line_19) ```

```

Parsed Code
============
```
This is some code `the actual code` and everything followinng it.



`hello`

>  This should be a block quote but block quotes don't work. 
> Here is an example of it not working.
> Adding > would normally create a block quote.

> To make use of block quotes you need to add an empty line between the > symbols so they appear on seperate rows.

It is necessary to add a > symbol on every line or else...
Each line will be added to the line before it to make one big long paragraph. But if you don't use the > each line of text will appear on a new line just like you'd expect.

> 

> Adding a > symbol with no text and surrounded by empty rows will NOT create an empty row in tldr. It all get's put one row after another.
.
.


Just typing will add white text that will go on it's own line but you can't add empty lines comments in order to seperate them
This is the second line as an example.

and this is the third line which has an empty line above it in the markdown file but which won't when displayed in tldr.



You can't do a codeblock inside of a codeblock so these 3 backticks are messing up my codeblock unless I add something infront of them to de-codeblock them.
```

three backticks to create a code block in which everything will look the way you type it
including addding empty lines.

```
These 3 backticks weren't showing up either.
