.. status: ok


5.2 Blocks
----------

A block is a sequence of expressions evaluated in the order that they
appear, except as modified by control expressions such as break, break
return, return iterate and iterate if-then-else constructions. The value
of a block is the value of the expression last evaluated in the block.

To leave a block early, use =>. For example, i<0=>x. The expression
before the => must evaluate to true or false. The expression following
the => is the return value for the block.

A block can be constructed in two ways:

#. the expressions can be separated by semicolons and the resulting
   expression surrounded by parentheses, and
#. the expressions can be written on succeeding lines with each line
   indented the same number of spaces (which must be greater than zero).
   indentation A block entered in this form is called a pile.

Only the first form is available if you are entering expressions
directly to FriCAS. Both forms are available in .input files.





The syntax for a simple block of expressions entered interactively is



( expression1; expression2; ...; expressionN )



| The value returned by a block is the value of an => expression, or
expressionN if no => is encountered.





In .input files, blocks can also be written using piles. The examples
throughout this book are assumed to come from .input files.

In this example, we assign a rational number to a using a block
consisting of three expressions. This block is written as a pile. Each
expression in the pile has the same indentation, in this case two spaces
to the right of the first line.


.. spadVerbatim

::

 a :=
   i := gcd(234,672)
   i := 3*i^5 - i + 1
   1 / i




.. spadMathOutput
.. math::

+----------+
| 123323   |
+----------+




.. spadType

:sub:`Type: Fraction Integer`



Here is the same block written on one line. This is how you are required
to enter it at the input prompt.


.. spadInput
::

	a := (i := gcd(234,672); i := 3*i^5 - i + 1; 1 / i)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 123323   |
+----------+




.. spadType

:sub:`Type: Fraction Integer`



Blocks can be used to put several expressions on one line. The value
returned is that of the last expression.


.. spadInput
::

	(a := 1; b := 2; c := 3; [a,b,c])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1,2,3]   |
+-----------+




.. spadType

:sub:`Type: List PositiveInteger`



FriCAS gives you two ways of writing a block and the preferred way in an
.input file is to use a pile. file:input Roughly speaking, a pile is a
block whose constituent expressions are indented the same amount. You
begin a pile by starting a new line for the first expression, indenting
it to the right of the previous line. You then enter the second
expression on a new line, vertically aligning it with the first line.
And so on. If you need to enter an inner pile, further indent its lines
to the right of the outer pile. FriCAS knows where a pile ends. It ends
when a subsequent line is indented to the left of the pile or the end of
the file.

Blocks can be used to perform several steps before an assignment
(immediate or delayed) is made.


.. spadVerbatim

::

 d :=
    c := a^2 + b^2
    sqrt(c * 1.3)




.. spadMathOutput
.. math::

+------------------------+
| 2.549509756796392415   |
+------------------------+




.. spadType

:sub:`Type: Float`



Blocks can be used in the arguments to functions. (Here h is assigned
2.1+3.5.)


.. spadVerbatim

::

 h := 2.1 +
    1.0
    3.5




.. spadMathOutput
.. math::

+-------+
| 5.6   |
+-------+




.. spadType

:sub:`Type: Float`



Here the second argument to eval is x=z, where the value of z is
computed in the first line of the block starting on the second line.


.. spadVerbatim

::

 eval(x^2 - x*y^2,
      z := %pi/2.0 - exp(4.1)
      x = z
    )




.. spadMathOutput
.. math::

+------------------------------------------------+
| 58.769491270567072878y2+3453.853104201259382   |
+------------------------------------------------+




.. spadType

:sub:`Type: Polynomial Float`



Blocks can be used in the clauses of if-then-else expressions (see
`ugLangIf <section-5.3.html#ugLangIf>`__ ).


.. spadInput
::

	if h > 3.1 then 1.0 else (z := cos(h); max(z,0.5))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 1.0   |
+-------+




.. spadType

:sub:`Type: Float`



This is the pile version of the last block.


.. spadVerbatim

::

 if h > 3.1 then
     1.0
   else
     z := cos(h)
     max(z,0.5)




.. spadMathOutput
.. math::

+-------+
| 1.0   |
+-------+




.. spadType

:sub:`Type: Float`



Blocks can be nested.


.. spadInput
::

	a := (b := factorial(12); c := (d := eulerPhi(22); factorial(d));b+c)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 482630400   |
+-------------+




.. spadType

:sub:`Type: PositiveInteger`



This is the pile version of the last block.


.. spadVerbatim

::

 a :=
   b := factorial(12)
   c :=
     d := eulerPhi(22)
     factorial(d)
   b+c




.. spadMathOutput
.. math::

+-------------+
| 482630400   |
+-------------+




.. spadType

:sub:`Type: PositiveInteger`



Since c+d does equal 3628855, a has the value of c and the last line is
never evaluated.


.. spadVerbatim

::

 a :=
   c := factorial 10
   d := fibonacci 10
   c + d = 3628855 => c
   d




.. spadMathOutput
.. math::

+-----------+
| 3628800   |
+-----------+




.. spadType

:sub:`Type: PositiveInteger`





