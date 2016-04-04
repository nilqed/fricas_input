.. status: ok


6.2 Macros
----------

A macro provides general textual substitution of macro an FriCAS
expression for a name. You can think of a macro as being a generalized
abbreviation. You can only have one macro in your workspace with a given
name, no matter how many arguments it has.





The two general forms for macros are



| macro name == body
|  macro name(arg1,...) == body



| where the body of the macro can be any FriCAS expression.





For example, suppose you decided that you like to use df for D. You
define the macro df like this.


.. spadInput
::

	macro df == D


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Whenever you type df, the system expands it to D.


.. spadInput
::

	df(x^2 + x + 1,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 2x+1   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`



Macros can be parameterized and so can be used for many different kinds
of objects.


.. spadInput
::

	macro ff(x) == x^2 + 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Apply it to a number, a symbol, or an expression.


.. spadInput
::

	ff z


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| z2+1   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`



Macros can also be nested, but you get an error message if you run out
of space because of an infinite nesting loop.


.. spadInput
::

	macro gg(x) == ff(2*x - 2/3)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



This new macro is fine as it does not produce a loop.


.. spadInput
::

	gg(1/w)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| 13w2-24w+369w2   |
+------------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`



This, however, loops since gg is defined in terms of ff.


.. spadInput
::

	macro ff(x) == gg(-x)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The body of a macro can be a block.


.. spadInput
::

	macro next == (past := present; present := future; future := past +
present)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Before entering next, we need values for present and future.


.. spadInput
::

	present : Integer := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Integer`




.. spadInput
::

	future : Integer := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: Integer`



Repeatedly evaluating next produces the next Fibonacci number.


.. spadInput
::

	next


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: Integer`



And the next one.


.. spadInput
::

	next


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: Integer`



Here is the infinite stream of the rest of the Fibonacci numbers.


.. spadInput
::

	[next for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| [3,5,8,13,21,34,55,89,144,233,…]   |
+------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Bundle all the above lines into a single macro.


.. spadVerbatim

::

 macro fibStream ==
   present : Integer := 1
   future : Integer := 1
   [next for i in 1..] where
     macro next ==
       past := present
       present := future
       future := past + present




.. spadType

:sub:`Type: Void`



Use concatconcatStream to start with the first two Fibonacci numbers
Fibonacci numbers.


.. spadInput
::

	concat([0,1],fibStream)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [0,1,2,3,5,8,13,21,34,55,…]   |
+-------------------------------+




.. spadType

:sub:`Type: Stream Integer`



The library operation fibonacci is an easier way to compute these
numbers.


.. spadInput
::

	[fibonacci i for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [1,1,2,3,5,8,13,21,34,55,…]   |
+-------------------------------+




.. spadType

:sub:`Type: Stream Integer`





