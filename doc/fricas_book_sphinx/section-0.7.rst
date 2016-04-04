.. status: ok

0.7 Functions, Choices, and Loops
---------------------------------

By now the reader should be able to construct simple one-line
expressions involving variables and different data structures. This
section builds on this knowledge and shows how to use iteration, make
choices, and build functions in FriCAS. At the moment it is assumed that
the reader has a rough idea of how types are specified and constructed
so that they can follow the examples given.

From this point on most examples will be taken from input files.



0.7.1 Reading Code from a File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Input files contain code that will be fed to the command prompt. The
primary different between the command line and an input file is that
indentation matters. In an input file you can specify piles of code by
using indentation.

The names of all input files in FriCAS should end in .input otherwise
FriCAS will refuse to read them.

If an input file is named foo.input you can feed the contents of the
file to the command prompt (as though you typed them) by writing: )read
foo.input.

It is good practice to start each input file with the )clear all command
so that all functions and variables in the current environment are
erased.





0.7.2 Blocks
~~~~~~~~~~~~

The FriCAS constructs that provide looping, choices, and user-defined
functions all rely on the notion of blocks. A block is a sequence of
expressions which are evaluated in the order that they appear except
when it is modified by control expressions such as loops. To leave a
block prematurely use an expression of the form: BoolExpr=>Expr where
BoolExpr is any FriCAS expression that has type Boolean. The value and
type of Expr determines the value and type returned by the block.

If blocks are entered at the keyboard (as opposed to reading them from a
text file) then there is only one way of creating them. The syntax is:
(expression1;expression2;…;expressionN)

In an input file a block can be constructed as above or by placing all
the statements at the same indentation level. When indentation is used
to indicate program structure the block is called a pile. As an example
of a simple block a list of three integers can be constructed using
parentheses:


.. spadInput
::

	( a:=4; b:=1; c:=9; L:=[a,b,c])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,1,9]   





.. spadType

:sub:`Type: List PositiveInteger`



Doing the same thing using piles in an input file you could type:


.. spadVerbatim

::

 L :=
   a:=4
   b:=1
   c:=9
   [a,b,c]




.. spadMathOutput
.. math::


 [4,1,9]   





.. spadType
:sub:`Type: List PositiveInteger`



Since blocks have a type and a value they can be used as arguments to
functions or as part of other expressions. It should be pointed out that
the following example is not recommended practice but helps to
illustrate the idea of blocks and their ability to return values:


.. spadVerbatim

::

 sqrt(4.0 +
          a:=3.0
          b:=1.0
          c:=a + b
          c
     )




.. spadMathOutput
.. math::


 2.8284271247461900976   





.. spadType

:sub:`Type: Float`



Note that indentation is extremely important. If the example above had
the pile starting at ``a:=`` moved left by two spaces so that the a
was under the ( of the first line then the interpreter would signal an
error. Furthermore if the closing parenthesis ) is moved up to give


.. spadVerbatim

::

 sqrt(4.0 +
          a:=3.0
          b:=1.0
          c:=a + b
          c)




.. spadVerbatim

.. error::

   Line   1: sqrt(4.0 +
            ....A
   Error  A: Missing mate.
   Line   2:          a:=3.0
   Line   3:          b:=1.0
   Line   4:          c:=a + b
   Line   5:          c)
            .........AB
   Error  A: (from A up to B) Ignored.
   Error  B: Improper syntax.
   Error  B: syntax error at top level
   Error  B: Possibly missing a ) 
    5 error(s) parsing 



then the parser will generate errors. If the parenthesis is shifted
right by several spaces so that it is in line with the c thus:


.. spadVerbatim

::

 sqrt(4.0 +
          a:=3.0
          b:=1.0
          c:=a + b
          c
          )




.. spadVerbatim

.. error::

   Line   1: sqrt(4.0 +
            ....A
   Error  A: Missing mate.
   Line   2:          a:=3.0
   Line   3:          b:=1.0
   Line   4:          c:=a + b
   Line   5:          c
   Line   6:          )
            .........A
   Error  A: (from A up to A) Ignored.
   Error  A: Improper syntax.
   Error  A: syntax error at top level
   Error  A: Possibly missing a ) 
    5 error(s) parsing 



a similar error will be raised. Finally, the ) must be indented by at
least one space relative to the sqrt thus:


.. spadVerbatim

::

 sqrt(4.0 +
          a:=3.0
          b:=1.0
          c:=a + b
          c
  )


.. spadMathOutput
.. math::


 2.8284271247461900976   





.. spadType

:sub:`Type: Float`



or an error will be generated.

It can be seen that great care needs to be taken when constructing input
files consisting of piles of expressions. It would seem prudent to add
one pile at a time and check if it is acceptable before adding more,
particularly if piles are nested. However, it should be pointed out that
the use of piles as values for functions is not very readable and so
perhaps the delicate nature of their interpretation should deter
programmers from using them in these situations. Using piles should
really be restricted to constructing functions, etc. and a small amount
of rewriting can remove the need to use them as arguments. For example,
the previous block could easily be implemented as:


.. spadVerbatim

::

 a:=3.0
 b:=1.0
 c:=a + b
 sqrt(4.0 + c)




.. spadVerbatim

::

 a:=3.0




.. spadMathOutput
.. math::


 3.0   





.. spadType

:sub:`Type: Float`




.. spadVerbatim

::

 b:=1.0




.. spadMathOutput
.. math::


 1.0   





.. spadType

:sub:`Type: Float`




.. spadVerbatim

::

 c:=a + b




.. spadMathOutput
.. math::


 4.0   





.. spadType

:sub:`Type: Float`




.. spadVerbatim

::

 sqrt(4.0 + c)




.. spadMathOutput
.. math::


 2.8284271247461900976   





.. spadType

:sub:`Type: Float`



which achieves the same result and is easier to understand. Note that
this is still a pile but it is not as fragile as the previous version.





0.7.3 Functions
~~~~~~~~~~~~~~~

Definitions of functions in FriCAS are quite simple providing two things
are observed. First, the type of the function must either be completely
specified or completely unspecified. Second, the body of the function is
assigned to the function identifier using the delayed assignment
operator ==.

To specify the type of something the ``:`` operator is used. Thus to
define a variable x to be of type Fraction Integer we enter:


.. spadInput
::

	x : Fraction Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



For functions the method is the same except that the arguments are
placed in parentheses and the return type is placed after the symbol ->.
Some examples of function definitions taking zero, one, two, or three
arguments and returning a list of integers are:


.. spadInput
::

	f : () -> List Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	g : (Integer) -> List Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	h : (Integer, Integer) -> List Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	k : (Integer, Integer, Integer) -> List Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Now the actual function definitions might be:


.. spadInput
::

	f() == [ ]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	g(a) == [a]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	h(a,b) == [a,b]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	k(a,b,c) == [a,b,c]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



with some invocations of these functions:


.. spadInput
::

	f()


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f with type () -> List Integer 




.. spadMathOutput
.. math::

 []   
 




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	g(4)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function g with type Integer -> List Integer 




.. spadMathOutput
.. math::


 [4]   





.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	h(2,9)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function h with type (Integer,Integer) -> List Integer 




.. spadMathOutput
.. math::


 [2,9]   





.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	k(-3,42,100)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function k with type (Integer,Integer,Integer) -> List 
       Integer 




.. spadMathOutput
.. math::


 [-3,42,100]   





.. spadType

:sub:`Type: List Integer`



The value returned by a function is either the value of the last
expression evaluated or the result of a return statement. For example,
the following are effectively the same:


.. spadInput
::

	p : Integer -> Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	p x == (a:=1; b:=2; a+b+x)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	p x == (a:=1; b:=2; return(a+b+x))


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Note that a block (pile) is assigned to the function identifier p and
thus all the rules about blocks apply to function definitions. Also
there was only one argument so the parenthese are not needed.

This is basically all that one needs to know about defining functions in
FriCAS -- first specify the complete type and then assign a block to the
function name. The rest of this section is concerned with defining more
complex blocks than those in this section and as a result function
definitions will crop up continually particularly since they are a good
way of testing examples. Since the block structure is more complex we
will use the pile notation and thus have to use input files to read the
piles.





0.7.4 Choices
~~~~~~~~~~~~~

Apart from the => operator that allows a block to exit before the end
FriCAS provides the standard if-then-else construct. The general syntax
is:



if BooleanExpr then Expr1 else Expr2



where else Expr2 can be omitted. If the expression BooleanExpr evaluates
to true then Expr1 is executed otherwise Expr2 (if present) will be
executed. An example of piles and if-then-else is: (read from an input
file)


.. spadVerbatim

::

 h := 2.0
 if h > 3.1 then
       1.0
    else
       z:= cos(h)
       max(x,0.5)




.. spadVerbatim

::

 h := 2.0




.. spadMathOutput
.. math::


 2.0   





.. spadType

:sub:`Type: Float`




.. spadVerbatim

::

 if h > 3.1 then
       1.0
    else
       z:= cos(h)
       max(x,0.5)




.. spadMathOutput
.. math::


 x   





.. spadType

:sub:`Type: Polynomial Float`



Note the indentation -- the else must be indented relative to the if
otherwise it will generate an error (FriCAS will think there are two
piles, the second one beginning with else).

Any expression that has type Boolean can be used as BooleanExpr and the
most common will be those involving the relational operators >, <, and
=. Usually the type of an expression involving the equality operator =
will be Boolean but in those situations when it isn't you may need to
use the ``@`` operator to ensure that it is.





0.7.5 Loops
~~~~~~~~~~~

Loops in FriCAS are regarded as expressions containing another
expression called the loop body. The loop body is executed zero or more
times depending on the kind of loop. Loops can be nested to any depth.



0.7.5.1 The repeat loop
~~~~~~~~~~~~~~~~~~~~~~~

The simplest kind of loop provided by FriCAS is the repeat loop. The
general syntax of this is:



repeat loopBody



This will cause FriCAS to execute loopBody repeatedly until either a
break or return statement is encountered. If loopBody contains neither
of these statements then it will loop forever. The following piece of
code will display the numbers from 1 to 4:


.. spadVerbatim

::

 i:=1
 repeat
   if i > 4 then break
   output(i)
   i:=i+1




.. spadVerbatim

::

 i:=1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 repeat
   if i > 4 then break
   output(i)
   i:=i+1
  
    1
    2
    3
    4




.. spadType

:sub:`Type: Void`



It was mentioned that loops will only be left when either a break or
return statement is encountered so why can't one use the => operator?
The reason is that the => operator tells FriCAS to leave the current
block whereas break leaves the current loop. The return statement leave
the current function.

To skip the rest of a loop body and continue the next iteration of the
loop use the iterate statement (the -- starts a comment in FriCAS)


.. spadVerbatim

::

 i := 0
 repeat
   i := i + 1
   if i > 6 then break
   -- Return to start if i is odd
   if odd?(i) then iterate
   output(i)




.. spadVerbatim

::

 i := 0




.. spadMathOutput
.. math::


 0   





.. spadType

:sub:`Type: NonNegativeInteger`




.. spadVerbatim

::

 repeat
   i := i + 1
   if i > 6 then break
   -- Return to start if i is odd
   if odd?(i) then iterate
   output(i)
  
    2
    4
    6




.. spadType

:sub:`Type: Void`







0.7.5.2 The while loop
~~~~~~~~~~~~~~~~~~~~~~

The while statement extends the basic repeat loop to place the control
of leaving the loop at the start rather than have it buried in the
middle. Since the body of the loop is still part of a repeat loop, break
and => work in the same way as in the previous section. The general
syntax of a while loop is:



while BoolExpr repeat loopBody



As before, BoolExpr must be an expression of type Boolean. Before the
body of the loop is executed BoolExpr is tested. If it evaluates to true
then the loop body is entered otherwise the loop is terminated. Multiple
conditions can be applied using the logical operators such as and or by
using several while statements before the repeat.


.. spadVerbatim

::

 x:=1
 y:=1
 while x < 4 and y < 10 repeat
   output [x,y]
   x := x + 1
   y := y + 2




.. spadVerbatim

::

 x:=1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 y:=1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 while x < 4 and y < 10 repeat
   output [x,y]
   x := x + 1
   y := y + 2
  
    [1,1]
    [2,3]
    [3,5]




.. spadType

:sub:`Type: Void`




.. spadVerbatim

::

 x:=1
 y:=1
 while x < 4 while y < 10 repeat
   output [x,y]
   x := x + 1
   y := y + 2




.. spadVerbatim

::

 x:=1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 y:=1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 while x < 4 while y < 10 repeat
   output [x,y]
   x := x + 1
   y := y + 2
  
    [1,1]
    [2,3]
    [3,5]




.. spadType

:sub:`Type: Void`



Note that the last example using two while statements is not a nested
loop but the following one is:


.. spadVerbatim

::

 x:=1
 y:=1
 while x < 4 repeat
   while y < 10 repeat
     output [x,y]
     x := x + 1
     y := y + 2




.. spadVerbatim

::

 x:=1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 y:=1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 while x < 4 repeat
   while y < 10 repeat
     output [x,y]
     x := x + 1
     y := y + 2
  
    [1,1]
    [2,3]
    [3,5]
    [4,7]
    [5,9]




.. spadType

:sub:`Type: Void`



Suppose we that, given a matrix of arbitrary size, find the position and
value of the first negative element by examining the matrix in row-major
order:


.. spadVerbatim

::

 m := matrix [ [ 21, 37, 53, 14 ],_
               [  8, 22,-24, 16 ],_
               [  2, 10, 15, 14 ],_
               [ 26, 33, 55,-13 ] ]
 lastrow := nrows(m)
 lastcol := ncols(m)
 r := 1
 while r <= lastrow repeat
   c := 1 -- Index of first column
   while c <= lastcol repeat
     if elt(m,r,c) < 0 then
       output [r,c,elt(m,r,c)]
       r := lastrow
       break -- Don't look any further
     c := c + 1
   r := r + 1




.. spadVerbatim

::

 m := matrix [ [ 21, 37, 53, 14 ],_
               [  8, 22,-24, 16 ],_
               [  2, 10, 15, 14 ],_
               [ 26, 33, 55,-13 ] ]



[21375314822-24162101514263355-13]


.. spadType

:sub:`Type: Matrix Integer`




.. spadVerbatim

::

 lastrow := nrows(m)




.. spadMathOutput
.. math::

 4   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 lastcol := ncols(m)




.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 r := 1




.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 while r <= lastrow repeat
   c := 1 -- Index of first column
   while c <= lastcol repeat
     if elt(m,r,c) < 0 then
       output [r,c,elt(m,r,c)]
       r := lastrow
       break -- Don't look any further
     c := c + 1
   r := r + 1
  
    [2,3,- 24]




.. spadType

:sub:`Type: Void`







0.7.5.3 The for loop
~~~~~~~~~~~~~~~~~~~~

The last loop statement of interest is the for loop. There are two ways
of creating a for loop. The first way uses either a list or a segment:



 for var in seg repeat loopBody
  for var in list repeat loopBody



where var is an index variable which is iterated over the values in seg
or list. The value seg is a segment such as 1…10 or 1… and list is a
list of some type. For example:


.. spadVerbatim

::

 for i in 1..10 repeat
   ~prime?(i) => iterate
   output(i)
  
    2
    3
    5
    7




.. spadType

:sub:`Type: Void`




.. spadVerbatim

::

 for w in ["This", "is", "your", "life!"] repeat
   output(w)




.. spadVerbatim

::

 for w in ["This", "is", "your", "life!"] repeat
   output(w)
  
    This
    is
    your
    life!




.. spadType

:sub:`Type: Void`



The second form of the for loop syntax includes a `` such that``
clause which must be of type Boolean:



 for var in seg | BoolExpr repeat loopBody
  for var in list | BoolExpr repeat loopBody



Some examples are:


.. spadVerbatim

::

 for i in 1..10 | prime?(i) repeat
   output(i)
  
    2
    3
    5
    7




.. spadType

:sub:`Type: Void`




.. spadVerbatim

::

 for i in [1,2,3,4,5,6,7,8,9,10] | prime?(i) repeat
   output(i)
  
    2
    3
    5
    7




.. spadType

:sub:`Type: Void`



You can also use a while clause:


.. spadVerbatim

::

 for i in 1.. while i < 7 repeat
   if even?(i) then output(i)
  
    2
    4
    6




.. spadType

:sub:`Type: Void`



Using the `` such that`` clause makes this appear simpler:


.. spadVerbatim

::

 for i in 1.. | even?(i) while i < 7 repeat
   output(i)
  
    2
    4
    6




.. spadType

:sub:`Type: Void`



You can use multiple for clauses to iterate over several sequences in
parallel:


.. spadVerbatim

::

 for a in 1..4 for b in 5..8 repeat
   output [a,b]
  
    [1,5]
    [2,6]
    [3,7]
    [4,8]




.. spadType

:sub:`Type: Void`



As a general point it should be noted that any symbols referred to in
the `` such that`` and while clauses must be pre-defined. This either
means that the symbols must have been defined in an outer level (e.g. in
an enclosing loop) or in a for clause appearing before the `` such
that`` or while. For example:


.. spadVerbatim

::

 for a in 1..4 repeat
   for b in 7..9 | prime?(a+b) repeat
     output [a,b,a+b]
  
    [2,9,11]
    [3,8,11]
    [4,7,11]
    [4,9,13]




.. spadType

:sub:`Type: Void`



Finally, the for statement has a by clause to specify the step size.
This makes it possible to iterate over the segment in reverse order:


.. spadVerbatim

::

 for a in 1..4 for b in 8..5 by -1 repeat
   output [a,b]
  
    [1,8]
    [2,7]
    [3,6]
    [4,5]




.. spadType
:sub:`Type: Void`



Note that without the by -1 the segment 8..5 is empty so there is
nothing to iterate over and the loop exits immediately.
