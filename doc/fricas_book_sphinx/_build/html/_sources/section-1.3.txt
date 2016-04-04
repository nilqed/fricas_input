.. status: ok


1.3 The FriCAS Language
-----------------------

The FriCAS language is a rich language for performing interactive
computations and for building components of the FriCAS library. Here we
present only some basic aspects of the language that you need to know
for the rest of this chapter. Our discussion here is intentionally
informal, with details unveiled on an as needed basis. For more
information on a particular construct, we suggest you consult the index.



1.3.1 Arithmetic Expressions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For arithmetic expressions, use the ``+`` and - operator as in
mathematics. Use * for multiplication, and ^ for exponentiation. To
create a fraction, use ``/``. When an expression contains several operators,
those of highest precedence are evaluated first. For arithmetic
operators, ^ has highest precedence, * and / have the next highest
precedence, and ``+`` and ``-`` have the lowest precedence.

FriCAS puts implicit parentheses around operations of higher precedence,
and groups those of equal precedence from left to right.


.. spadInput
::

	1 + 2 - 3 / 4 * 3 ^ 2 - 1


.. spadMathAnswer
.. spadMathOutput
.. math::

  -194   





.. spadType
:sub:`Type: Fraction Integer`



The above expression is equivalent to this.


.. spadInput
::

	((1 + 2) - ((3 / 4) * (3 ^ 2))) - 1


.. spadMathAnswer
.. spadMathOutput
.. math::


  -194   





.. spadType

:sub:`Type: Fraction Integer`



If an expression contains subexpressions enclosed in parentheses, the
parenthesized subexpressions are evaluated first (from left to right,
from inside out).


.. spadInput
::

	1 + 2 - 3/ (4 * 3 ^ (2 - 1))


.. spadMathAnswer
.. spadMathOutput
.. math::


 114   

.. spadType

:sub:`Type: Fraction Integer`




1.3.2 Previous Results
~~~~~~~~~~~~~~~~~~~~~~

Use the percent sign ``%`` to refer to the last result.
result:previous Also, use ``%%" to refer to previous results.
percentpercent@{%%} ``%%(-1)`` is equivalent to ``%``, ``%%(-2)``
returns the next to the last result, and so on. ``%%(1)`` returns the
result from step number 1, ``%%(2)`` returns the result from step
number 2, and so on. ``%%(0)`` is not defined.

This is ten to the tenth power.


.. spadInput
::

	10 ^ 10


.. spadMathAnswer
.. spadMathOutput
.. math::

 10000000000   

.. spadType
:sub:`Type: PositiveInteger`



This is the last result minus one.


.. spadInput
::

	% - 1


.. spadMathAnswer
.. spadMathOutput
.. math::

  9999999999  

.. spadType
:sub:`Type: PositiveInteger`



This is the last result.


.. spadInput
::

	%%(-1)


.. spadMathAnswer
.. spadMathOutput
.. math::


 9999999999   





.. spadType

:sub:`Type: PositiveInteger`



This is the result from step number 1.


.. spadInput
::

	%%(1)


.. spadMathAnswer
.. spadMathOutput
.. math::


 10000000000   

.. spadType
:sub:`Type: PositiveInteger`







1.3.3 Some Types
~~~~~~~~~~~~~~~~

Everything in FriCAS has a type. The type determines what operations you
can perform on an object and how the object can be used.
Chapter~\ `ugTypes <section-2.0.html#ugTypes>`__ is dedicated to the
interactive use of types. Several of the final chapters discuss how
types are built and how they are organized in the FriCAS library.

Positive integers are given type PositiveInteger.


.. spadInput
::

	8


.. spadMathAnswer
.. spadMathOutput
.. math::


 8   
 
.. spadType
:sub:`Type: PositiveInteger`



Negative ones are given type Integer. This fine distinction is helpful
to the FriCAS interpreter.


.. spadInput
::

	-8


.. spadMathAnswer
.. spadMathOutput
.. math::

  -8   





.. spadType

:sub:`Type: Integer`



Here a positive integer exponent gives a polynomial result.


.. spadInput
::

	x^8


.. spadMathAnswer
.. spadMathOutput
.. math::

  x^8

.. spadType
:sub:`Type: Polynomial Integer`



Here a negative integer exponent produces a fraction.


.. spadInput
::

	x^(-8)


.. spadMathAnswer
.. spadMathOutput
.. math::

   \frac{1}{x^8}


.. spadType
:sub:`Type: Fraction Polynomial Integer`



1.3.4 Symbols, Variables, Assignments, and Declarations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A symbol is a literal used for the input of things like the variables in
polynomials and power series.

We use the three symbols x, y, and z in entering this polynomial.


.. spadInput
::

	(x - y*z)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{y} ^ {2}} \  {{z} ^ {2}}} -{2 \  x \  y \  z}+{{x} ^ {2}}

.. spadType
:sub:`Type: Polynomial Integer`



A symbol has a name beginning with an uppercase or lowercase alphabetic
symbol:naming character, ``%``, or ``!``. Successive characters (if
any) can be any of the above, digits, or ?. Case is distinguished: the
symbol points is different from the symbol Points.

A symbol can also be used in FriCAS as a variable. A variable refers to
a value. To assign a value to a variable, variable:naming the operator
``:=`` assignment is used. FriCAS actually has two forms of
assignment: immediate assignment, as discussed here, and delayed
assignment. See Section
`ugLangAssign <section-5.1.html#ugLangAssign>`__ for details. A
variable initially has no restrictions on the kinds of declaration
values to which it can refer.

This assignment gives the value 4 (an integer) to a variable named x.


.. spadInput
::

	x := 4


.. spadMathAnswer
.. spadMathOutput
.. math::

  4

.. spadType
:sub:`Type: PositiveInteger`



This gives the value z+3/5 (a polynomial) to x.


.. spadInput
::

	x := z + 3/5


.. spadMathAnswer
.. spadMathOutput
.. math::

   z+{3 \over 5}

.. spadType
:sub:`Type: Polynomial Fraction Integer`



To restrict the types of objects that can be assigned to a variable, use
a declaration


.. spadInput
::

	y : Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`


After a variable is declared to be of some type, only values of that
type can be assigned to that variable.


.. spadInput
::

	y := 89


.. spadMathAnswer
.. spadMathOutput
.. math::

  89


.. spadType
:sub:`Type: Integer`



The declaration for y forces values assigned to y to be converted to
integer values.


.. spadInput
::

	y := sin %pi


.. spadMathAnswer
.. spadMathOutput
.. math::

  0

.. spadType
:sub:`Type: Integer`



If no such conversion is possible, FriCAS refuses to assign a value to
y.


.. spadInput
::

	y := 2/3


.. spadMathAnswer
.. spadVerbatim

.. warning::

    Cannot convert right-hand side of assignment
    2
    -
    3
       to an object of the type Integer of the left-hand side.



A type declaration can also be given together with an assignment. The
declaration can assist FriCAS in choosing the correct operations to
apply.


.. spadInput
::

	f : Float := 2/3


.. spadMathAnswer
.. spadMathOutput
.. math::

 0.66666666666666666667   


.. spadType
:sub:`Type: Float`



Any number of expressions can be given on input line. Just separate them
by semicolons. Only the result of evaluating the last expression is
displayed.

These two expressions have the same effect as the previous single
expression.


.. spadInput
::

	f : Float; f := 2/3


.. spadMathAnswer
.. spadMathOutput
.. math::

  0.66666666666666666667   

.. spadType
:sub:`Type: Float`



The type of a symbol is either Symbol or Variable(name) where name is
the name of the symbol.

By default, the interpreter gives this symbol the type Variable(q).


.. spadInput
::

	q


.. spadMathAnswer
.. spadMathOutput
.. math::

  q

.. spadType
:sub:`Type: Variable q`


When multiple symbols are involved, Symbol is used.


.. spadInput
::

	[q, r]


.. spadMathAnswer
.. spadMathOutput
.. math::

  [q,r]


.. spadType
:sub:`Type: List OrderedVariableList [q,r]`



What happens when you try to use a symbol that is the name of a
variable?


.. spadInput
::

	f


.. spadMathAnswer
.. spadMathOutput
.. math::

  0.66666666666666666667   

.. spadType
:sub:`Type: Float`



Use a single quote ````' before quote the name to get the symbol.


.. spadInput
::

	'f


.. spadMathAnswer
.. spadMathOutput
.. math::

  f

.. spadType
:sub:`Type: Variable f`



Quoting a name creates a symbol by preventing evaluation of the name as
a variable. Experience will teach you when you are most likely going to
need to use a quote. We try to point out the location of such trouble
spots.





1.3.5 Conversion
~~~~~~~~~~~~~~~~

Objects of one type can usually be converted to objects of several other
types. To convert an object to a new type, use the ``::`` infix
operator. Conversion is discussed in detail in
`ugTypesConvert <section-2.7.html#ugTypesConvert>`__. For example, to
display an object, it is necessary to convert the object to type
OutputForm.

This produces a polynomial with rational number coefficients.


.. spadInput
::

	p := r^2 + 2/3


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{r} ^ {2}}+{2 \over 3}

  
.. spadType
:sub:`Type: Polynomial Fraction Integer`



Create a quotient of polynomials with integer coefficients by using
``::``.


.. spadInput
::

	p :: Fraction Polynomial Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{3 \  {{r} ^ {2}}}+2} \over 3


.. spadType
:sub:`Type: Fraction Polynomial Integer`



Some conversions can be performed automatically when FriCAS tries to
evaluate your input. Others conversions must be explicitly requested.





1.3.6 Calling Functions
~~~~~~~~~~~~~~~~~~~~~~~

As we saw earlier, when you want to add or subtract two values, you
place the arithmetic operator ``+`` or - between the two arguments
denoting the values. To use most other FriCAS operations, however, you
use another syntax: function:calling write the name of the operation
first, then an open parenthesis, then each of the arguments separated by
commas, and, finally, a closing parenthesis. If the operation takes only
one argument and the argument is a number or a symbol, you can omit the
parentheses.

This calls the operation factor with the single integer argument 120.


.. spadInput
::

	factor(120)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{2} ^ {3}} \  3 \  5

 
.. spadType
:sub:`Type: Factored Integer`



This is a call to divide with the two integer arguments 125 and 7.


.. spadInput
::

	divide(125,7)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {quotient={17}}, \: {remainder=6}
  \right]

.. spadType
:sub:`Type: Record(quotient: Integer, remainder: Integer)`



This calls quatern with four floating-point arguments.


.. spadInput
::

	quatern(3.4,5.6,2.9,0.1)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {3.4}+{{5.6} \  i}+{{2.9} \  j}+{{0.1} \  k}

.. spadType
:sub:`Type: Quaternion Float`



This is the same as factorial(10).


.. spadInput
::

	factorial 10


.. spadMathAnswer
.. spadMathOutput
.. math::

  3628800

.. spadType
:sub:`Type: PositiveInteger`



An operation that returns a Boolean value (that is, true or false)
frequently has a name suffixed with a question mark (``?``). For example,
the even? operation returns true if its integer argument is an even
number, false otherwise.

An operation that can be destructive on one or more arguments usually
has a name ending in a exclamation point (``!``). This actually means
that it is allowed to update its arguments but it is not required to do
so. For example, the underlying representation of a collection type may
not allow the very last element to be removed and so an empty object may
be returned instead. Therefore it is important that you use the object
returned by the operation and not rely on a physical change having
occurred within the object. Usually destructive operations are provided
for efficiency reasons.





1.3.7 Some Predefined Macros
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS provides several macros for your convenience.See
`ugUserMacros <section-6.2.html#ugUserMacros>`__ for a discussion on
how to write your own macros. Macros are names macro:predefined (or
forms) that expand to larger expressions for commonly used values.



+------------------+--------------------------------------+
| %i               | The square root of -1.               |
+------------------+--------------------------------------+
| %e               | The base of the natural logarithm.   |
+------------------+--------------------------------------+
| %pi              | π.                                   |
+------------------+--------------------------------------+
| %infinity        | ∞.                                   |
+------------------+--------------------------------------+
| %plusInfinity    | +∞.                                  |
+------------------+--------------------------------------+
| %minusInfinity   | -∞.                                  |
+------------------+--------------------------------------+

To display all the macros (along with anything you have defined in the
workspace), issue the system command ``)display all``.





1.3.8 Long Lines
~~~~~~~~~~~~~~~~

When you enter FriCAS expressions from your keyboard, there will be
times when they are too long to fit on one line. FriCAS does not care
how long your lines are, so you can let them continue from the right
margin to the left side of the next line.

Alternatively, you may want to enter several shorter lines and have
FriCAS glue them together. To get this glue, put an underscore (_) at
the end of each line you wish to continue.


.. spadVerbatim

::

 2_
 +_
 3



is the same as if you had entered


.. spadVerbatim

::

 2+3



FriCAS statements in an input file (see Section
`ugInOutIn <section-4.1.html#ugInOutIn>`__ ), can use indentation to
indicate the program structure . (see Section
`ugLangBlocks <section-5.2.html#ugLangBlocks>`__ ).





1.3.9 Comments
~~~~~~~~~~~~~~

Comment statements begin with two consecutive hyphens or two consecutive
plus signs and continue until the end of the line.

The comment beginning with -- is ignored by FriCAS.


.. spadInput
::

	2 + 3 -- this is rather simple, no?


.. spadMathAnswer
.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: PositiveInteger`



There is no way to write long multi-line comments other than starting
each line with ``--`` or ``++``.

