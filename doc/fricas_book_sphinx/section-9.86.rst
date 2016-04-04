.. status: ok



9.86 Void
---------

When an expression is not in a value context, it is given type Void. For
example, in the expression


.. spadVerbatim

::

 
   r := (a; b; if c then d else e; f) 



values are used only from the subexpressions c and f: all others are
thrown away. The subexpressions a, b, d and e are evaluated for
side-effects only and have type Void. There is a unique value of type
Void.

You will most often see results of type Void when you declare a
variable.


.. spadInput
::

	a : Integer


.. spadMathAnswer
.. spadType

Void



Usually no output is displayed for Void results. You can force the
display of a rather ugly object by issuing )set message void on.


.. spadInput
::

	)set message void on


.. spadMathAnswer
.. spadInput
::

	b : Fraction Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| "()"   |
+--------+




.. spadType

:sub:`Type: Void`




.. spadInput
::

	)set message void off


.. spadMathAnswer
All values can be converted to type Void.


.. spadInput
::

	3::Void


.. spadMathAnswer
.. spadType

Void



Once a value has been converted to Void, it cannot be recovered.


.. spadInput
::

	% :: PositiveInteger


.. spadMathAnswer
.. spadVerbatim

::

 Cannot convert from type Void to PositiveInteger for value "()"





