.. status: ok



6.11 Piece-Wise Function Definitions
------------------------------------

To move beyond functions defined in one line, we introduce in this
section functions that are defined piece-by-piece. That is, we say use
this definition when the argument is such-and-such and use this other
definition when the argument is that-and-that.



6.11.1 A Basic Example
~~~~~~~~~~~~~~~~~~~~~~

There are many other ways to define a factorial function for nonnegative
integers. You might function:piece-wise definition say piece-wise
function definition factorial of 0 is 1, otherwise factorial of n is n
times factorial of n-1. Here is one way to do this in FriCAS.

Here is the value for n=0.


.. spadInput
::

	fact(0) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Here is the value for n>0. The vertical bar ``|`` means such that.
such that


.. spadInput
::

	fact(n | n > 0) == n * fact(n - 1)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



What is the value for n=3?


.. spadInput
::

	fact(3)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function fact with type Integer -> Integer 
    Compiling function fact as a recurrence relation.




.. spadMathOutput
.. math::

+-----+
| 6   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



What is the value for n=-3?


.. spadInput
::

	fact(-3)


.. spadMathAnswer
.. spadVerbatim

::

    You did not define fact for argument -3 .



Now for a second definition. Here is the value for n=0.


.. spadInput
::

	facto(0) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Give an error message if n<0.


.. spadInput
::

	facto(n | n < 0) == error "arguments to facto must be non-negative"


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Here is the value otherwise.


.. spadInput
::

	facto(n) == n * facto(n - 1)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



What is the value for n=7?


.. spadInput
::

	facto(3)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function facto with type Integer -> Integer 




.. spadMathOutput
.. math::

+-----+
| 6   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



What is the value for n=-7?


.. spadInput
::

	facto(-7)


.. spadMathAnswer
.. spadVerbatim

::

    Error signalled from user code in function facto: 
       arguments to facto must be non-negative




.. spadType

:sub:`Type: PositiveInteger`



To see the current piece-wise definition of a function, use )display
value.


.. spadInput
::

	)display value facto


.. spadMathAnswer
.. spadVerbatim

::

    Definition:
      facto 0 == 1
      facto (n | n < 0) == 
        error(arguments to facto must be non-negative)
      facto n == n facto(n - 1)



In general a piece-wise definition of a function consists of two or more
parts. Each part gives a piece of the entire definition. FriCAS collects
the pieces of a function as you enter them. When you ask for a value of
the function, it then glues the pieces together to form a function.

The two piece-wise definitions for the factorial function are examples
of recursive functions, that is, functions that are defined in terms of
themselves. Here is an interesting doubly-recursive function. This
function returns the value 11 for all positive integer arguments.

Here is the first of two pieces.


.. spadInput
::

	eleven(n | n < 1) == n + 11


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



And the general case.


.. spadInput
::

	eleven(m) == eleven(eleven(m - 12))


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Compute elevens, the infinite stream of values of eleven.


.. spadInput
::

	elevens := [eleven(i) for i in 0..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [11,11,11,11,11,11,11,11,11,11,…]   |
+-------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



What is the value at n=200?


.. spadInput
::

	elevens 200


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 11   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



What is the FriCAS's definition of eleven?


.. spadInput
::

	)display value eleven


.. spadMathAnswer
.. spadVerbatim

::

    Definition:
      eleven (m | m < 1) == m + 11
      eleven m == eleven(eleven(m - 12))







6.11.2 Picking Up the Pieces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here are the details about how FriCAS creates a function from its
pieces. FriCAS converts the i-th piece of a function definition into a
conditional expression of the form: if predi then expressioni. If any
new piece has a predi that is identical (after all variables are
uniformly named) to an earlier predj, the earlier piece is removed.
Otherwise, the new piece is always added at the end.





| If there are n pieces to a function definition for f, the function
defined f is:
|  if pred1 then expression1 else
|  . . .
|  if predn then expressionn else
|  error "You did not define f for argument <arg>."





You can give definitions of any number of mutually recursive function
definitions, piece-wise or otherwise. No computation is done until you
ask for a value. When you do ask for a value, all the relevant
definitions are gathered, analyzed, and translated into separate
functions and compiled.

Let's recall the definition of eleven from the previous section.


.. spadInput
::

	eleven(n | n < 1) == n + 11


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	eleven(m) == eleven(eleven(m - 12))


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



A similar doubly-recursive function below produces -11 for all negative
positive integers. If you haven't worked out why or how eleven works,
the structure of this definition gives a clue.

This definition we write as a block.


.. spadVerbatim

::

 minusEleven(n) ==
   n >= 0 => n - 11
   minusEleven (5 + minusEleven(n + 7))




.. spadType

:sub:`Type: Void`



Define s(n) to be the sum of plus and minus eleven functions divided by
n. Since 11-11=0, we define s(0) to be 1.


.. spadInput
::

	s(0) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



And the general term.


.. spadInput
::

	s(n) == (eleven(n) + minusEleven(n))/n


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



What are the first ten values of s?


.. spadInput
::

	[s(n) for n in 0..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [1,1,1,1,1,1,1,1,1,1,…]   |
+---------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



FriCAS can create infinite streams in the positive direction (for
example, for index values 0,1,…) or negative direction (for example, for
0,-1,-2,…). Here we would like a stream of values of s(n) that is
infinite in both directions. The function t(n) below returns the n-th
term of the infinite stream [s(0),s(1),s(-1),s(2),s(-2),…] Its
definition has three pieces.

Define the initial term.


.. spadInput
::

	t(1) == s(0)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The even numbered terms are the s(i) for positive i. We use quo rather
than / since we want the result to be an integer.


.. spadInput
::

	t(n | even?(n)) == s(n quo 2)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Finally, the odd numbered terms are the s(i) for negative i. In
piece-wise definitions, you can use different variables to define
different pieces. FriCAS will not get confused.


.. spadInput
::

	t(p) == s(- p quo 2)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Look at the definition of t. In the first piece, the variable n was
used; in the second piece, p. FriCAS always uses your last variable to
display your definitions back to you.


.. spadInput
::

	)display value t


.. spadMathAnswer
.. spadVerbatim

::

    Definition:
      t 1 == s(0)
      t (p | even?(p)) == s(p quo 2)
      t p == s(- p quo 2)



Create a series of values of s applied to alternating positive and
negative arguments.


.. spadInput
::

	[t(i) for i in 1..]


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function s with type Integer -> Fraction Integer 
    Compiling function t with type PositiveInteger -> Fraction Integer 




.. spadMathOutput
.. math::

+---------------------------+
| [1,1,1,1,1,1,1,1,1,1,…]   |
+---------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



Evidently t(n)=1 for all i. Check it at n=100.


.. spadInput
::

	t(100)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`







6.11.3 Predicates
~~~~~~~~~~~~~~~~~

We have already seen some examples of function:predicate predicates
predicate:in function definition
(`ugUserPieceBasic <section-6.11.html#ugUserPieceBasic>`__ ).
Predicates are Boolean-valued expressions and FriCAS uses them for
filtering collections (see `ugLangIts <section-5.5.html#ugLangIts>`__ )
and for placing constraints on function arguments. In this section we
discuss their latter usage.

The simplest use of a predicate is one you don't see at all.


.. spadInput
::

	opposite 'right == 'left


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Here is a longer way to give the opposite definition.


.. spadInput
::

	opposite (x | x = 'left) == 'right


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Try it out.


.. spadInput
::

	for x in ['right,'left,'inbetween] repeat output opposite x


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function opposite with type 
    OrderedVariableList [right, left,inbetween] -> Symbol    
  left
  right
  
 The function opposite is not defined for the given argument(s).



Explicit predicates tell FriCAS that the given function definition piece
is to be applied if the predicate evaluates to true for the arguments to
the function. You can use such constant arguments for integers,
function:constant argument strings, and quoted symbols. constant
function argument The Boolean values true and false can also be used if
qualified with ``@`` or `` $`` and Boolean. The following are all
valid function definition fragments using constant arguments.


.. spadVerbatim

::

 a(1) == ...
 b("unramified") == ...
 c('untested) == ...
 d(true@Boolean) == ...



If a function has more than one argument, each argument can have its own
predicate. However, if a predicate involves two or more arguments, it
must be given after all the arguments mentioned in the predicate have
been given. You are always safe to give a single predicate at the end of
the argument list.

A function involving predicates on two arguments.


.. spadInput
::

	inFirstHalfQuadrant(x | x > 0,y | y < x) == true


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



This is incorrect as it gives a predicate on y before the argument y is
given.


.. spadInput
::

	inFirstHalfQuadrant(x | x > 0 and y < x,y) == true


.. spadMathAnswer
.. spadVerbatim

::

    1 old definition(s) deleted for function or rule inFirstHalfQuadrant




.. spadType

:sub:`Type: Void`



It is always correct to write the predicate at the end.


.. spadInput
::

	inFirstHalfQuadrant(x,y | x > 0 and y < x) == true


.. spadMathAnswer
.. spadVerbatim

::

    1 old definition(s) deleted for function or rule inFirstHalfQuadrant




.. spadType

:sub:`Type: Void`



Here is the rest of the definition.


.. spadInput
::

	inFirstHalfQuadrant(x,y) == false


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Try it out.


.. spadInput
::

	[inFirstHalfQuadrant(i,3) for i in 1..5]


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function inFirstHalfQuadrant with type (PositiveInteger,
       PositiveInteger) -> Boolean 




.. spadMathOutput
.. math::

+---------------------------------+
| [false,false,false,true,true]   |
+---------------------------------+




.. spadType

:sub:`Type: List Boolean`







