.. status: ok



10.6 Diversion: When Things Go Wrong
------------------------------------

Up to now, if you have typed in all the programs exactly as they are in
the book, you have encountered no errors. In practice, however, it is
easy to make mistakes. Computers are unforgiving: your program must be
letter-for-letter correct or you will encounter some error.

One thing that can go wrong is that you can create a syntactically
incorrect program. As pointed out in Diversion 1 the meaning of FriCAS
programs is affected by indentation.

The FriCAS parser will ensure that all parentheses, brackets, and braces
balance, and that commas and operators appear in the correct context.

A common mistake is to misspell an identifier or operation name. These
are generally easy to spot since the interpreter will tell you the name
of the operation together with the type and number of arguments which it
is trying to find.

Another mistake is to either to omit an argument or to give too many.
Again FriCAS will notify you of the offending operation.

Indentation makes your programs more readable. However there are several
ways to create a syntactically valid program. A most common problem
occurs when a line is indented improperly. If this is a first line of a
pile then all the other lines will act as an inner pile to the first
line. If it is a line of the pile other than the first line FriCAS then
thinks that this line is a continuation of the previous line. More
frequently than not a syntactically correct expression is created.
Almost never however will this be a semantically correct. Only when the
program is run will an error be discovered.



