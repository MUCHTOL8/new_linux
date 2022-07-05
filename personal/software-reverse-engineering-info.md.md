# software-reverse-engineering-info.md

> A multi-step plan to learn software reverse engineering.


-----------------------------------------------------
---  |PRACTICAL REVERSE ENGINEERING CURRICULUM|  ----
-----------------------------------------------------
CHAPTER 1 "X86 AND X64" AND CHAPTER 2 "ARM"

- Become comfortable with writing, compiling, and debugging basic programs.

`The C Programming Language by Brian Kernighan and Dennis Ritchie`
`C: A referencce Manual by Samual Harbison`

Become familiary with high-level concepts such as variables, sccopes, functions, pointers, conditionals, loops, call stacks, and libraries. Knowledge of data structures such as stacks, queues, linked lists, and trees might be useful, but they are not entirely necessary for now.

`For disassembly you will need to learn C up to basic level.`
`Expert C Programming: Deep C Secrets by Peter van der Lindel`

- Skim through these to get a better idea of how a program is put together. The key purpose of reading these books is to gain exposure to basic concepts 
`Compilers: Principles, Techniques, and Tools by Alfred Aho, Ravi Sethi, and Jeffrey Ullman`

- For over achievers

`Advanced Compiler Design and Implementation by Steven Muchnicki`

Begin to explore the program's execution environment, whichc includes the processor and operating system. 

- Skim through these to learn to learn about Intel processor

`Intel 64 and IA-32 Architectures Software Developer's Manual, Volume 1: Basic Architecture by Intel - Chapters 2-7`

- For those interested in ARM

`Cortex-A Series Programmer's Guide`
`ARM Architecture Reference Manual ARMv7-A and ARMv7-R Edition by ARM`

In skimming through these manuals you should have a basic appreciation of the technical building blocks of a computing system.

- For a more conceptual understanding, consider:

`Structured Computer Organization by Andrew Tanenbaum`

- All readers should consult: 
`Microsoft PE and COFF specification`


CHAPTER 3 "THE WINDOWS KERNEL"

- For OS concepts such as processes, threads, virtual memory, privilege separation, multi-tasking and so on (but no technical details):

`Modern Operating Systems by Andrew Tanenbaum`

- For technical details on Windows OS, the background chapters provide an excellent and concrete introduction to Windows and good supplementary material for the windows kernel.

`Windows NT Device Driver Development by Peter Viscarola and Anthony Mason`

- For additional inspiration and an excellent treatment of the Windows memory manager.

`What Makes It Page? The Window 7 (x64) Virtual Memory Manager by Enrico Martignetti`

- You Should also consider learning win32 programming.

`Windows System Programming by Johnson Hart`
`Windows via C/C++ by Jeffrey Richter and Christophe Nasarre`


CHAPTER 4 "DEBUGGING AND AUTOMATOIN"

- For Debugging and Automation:

`Inside Windows Debugging: A Practical Guide to Debugging and Tracing Strategies in Windows by Tarik Soulami`

`Advancced Windows Debugging by Mario Hewardt and Daniel Pravat`


CHAPTER 5 "OBFUSCATION"

Requires a good understanding of assembly language.

`Surreptitoius Software: Obfuscation, Watermarking, and Tamperproofing for Software Protection by Christian Collberg and Jasvir Nagra`




REVERSE ENGINEERING TOOLS

- hex dump toolfile 

`od`
`OR`
`hd`

- file type identifier

`file`

- pulling ASCII strings from any file, (including binary?)

`strings`

- disassembler in terminal

`objdump -d`

- Search a binary image(?) for embedded files

`binwalk`
