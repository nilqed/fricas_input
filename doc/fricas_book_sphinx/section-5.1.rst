.. status: ok


5.1 Immediate and Delayed Assignments
-------------------------------------

A variable in FriCAS refers to a value. A variable has a name beginning
with an uppercase or lowercase alphabetic character, ``%``, or
``!``. Successive characters (if any) can be any of the above, digits,
or ?. Case is distinguished. The following are all examples of valid,
distinct variable names:


.. spadVerbatim

::

 a             tooBig?    a1B2c3%!?
 A             %j         numberOfPoints
 beta6         %J         numberofpoints



The ``:=`` operator is the immediate assignment operator.
assignment:immediate Use it to associate a value with a variable.
immediate assignment





The syntax for immediate assignment for a single variable is



variable := expression



| The value returned by an immediate assignment is the value of
expression.





The right-hand side of the expression is evaluated, yielding 1. This
value is then assigned to a.


.. spadInput
::

	a := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The right-hand side of the expression is evaluated, yielding 1. This
value is then assigned to b. Thus a and b both have the value 1 after
the sequence of assignments.


.. spadInput
::

	b := a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



What is the value of b if a is assigned the value 2?


.. spadInput
::

	a := 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



As you see, the value of b is left unchanged.


.. spadInput
::

	b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



This is what we mean when we say this kind of assignment is immediate; b
has no dependency on a after the initial assignment. This is the usual
notion of assignment found in programming languages such as C, C
language:assignment PASCAL PASCAL:assignment and FORTRAN.
FORTRAN:assignment

FriCAS provides delayed assignment with ==. assignment:delayed This
implements a delayed assignment delayed evaluation of the right-hand
side and dependency checking.





The syntax for delayed assignment is



variable == expression



| The value returned by a delayed assignment is the unique value of
Void.





Using a and b as above, these are the corresponding delayed assignments.


.. spadInput
::

	a == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	b == a


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The right-hand side of each delayed assignment is left unevaluated until
the variables on the left-hand sides are evaluated. Therefore this
evaluation and ...


.. spadInput
::

	a


.. spadMathAnswer
.. spadVerbatim

::

 Compiling body of rule a to compute value of type PositiveInteger 




.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



this evaluation seem the same as before.


.. spadInput
::

	b


.. spadMathAnswer
.. spadVerbatim

::

 Compiling body of rule b to compute value of type PositiveInteger 




.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



If we change a to 2


.. spadInput
::

	a == 2


.. spadMathAnswer
.. spadVerbatim

::

    Compiled code for a has been cleared.
    Compiled code for b has been cleared.
    1 old definition(s) deleted for function or rule a 




.. spadType

:sub:`Type: Void`



then a evaluates to 2, as expected, but


.. spadInput
::

	a


.. spadMathAnswer
.. spadVerbatim

::

 Compiling body of rule a to compute value of type PositiveInteger 
 +++ |*0;a;1;G82322| redefined




.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



the value of b reflects the change to a.


.. spadInput
::

	b


.. spadMathAnswer
.. spadVerbatim

::

 Compiling body of rule b to compute value of type PositiveInteger 
 +++ |*0;b;1;G82322| redefined




.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



It is possible to set several variables at the same time
assignment:multiple immediate by using multiple immediate assignment a
tuple of variables and a tuple of expressions. Note that a tuple is a
collection of things separated by commas, often surrounded by
parentheses.





The syntax for multiple immediate assignments is



( var1, var2, ..., varN ) := ( expr1, expr2, ..., exprN )



| The value returned by an immediate assignment is the value of exprN.





This sets x to 1 and y to 2.


.. spadInput
::

	(x,y) := (1,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Multiple immediate assigments are parallel in the sense that the
expressions on the right are all evaluated before any assignments on the
left are made. However, the order of evaluation of these expressions is
undefined.

You can use multiple immediate assignment to swap the values held by
variables.


.. spadInput
::

	(x,y) := (y,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



x has the previous value of y.


.. spadInput
::

	x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



y has the previous value of x.


.. spadInput
::

	y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



There is no syntactic form for multiple delayed assignments. See the
discussion in section `ugUserDelay <section-6.8.html#ugUserDelay>`__
about how FriCAS differentiates between delayed assignments and user
functions of no arguments.



