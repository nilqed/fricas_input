.. status: ok


2.4 Records
-----------

A Record is an object composed of one or more other objects, Record each
of which is referenced with a *selector*.
Components can all belong to the same type or each can have a different
type.





The syntax for writing a Record type is

::

   Record(selector1:type1, selector2:type2, ..., selectorN:typeN)


You must be **careful** if a selector has the same name as a variable in
the workspace. If this occurs, precede the selector name by a single
quote quote.

Record components are implicitly ordered. All the components of a record
can be set at once by assigning the record a bracketed tuple of values
of the proper length. For example:


.. spadInput
::

	r : Record(a:Integer, b: String) := [1, "two"]


.. spadMathAnswer
.. math::

   \mathrm{[a=1,b="two"]}


.. spadType
:sub:`Type: Record(a: Integer,b: String)`



To access a component of a record r, write the name r, followed by a
period, followed by a selector.

The object returned by this computation is a record with two components:
a quotient part and a remainder part.


.. spadInput
::

	u := divide(5,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{[quotient=2,remainder=1]}   

.. spadType
:sub:`Type: Record(quotient: Integer,remainder: Integer)`



This is the quotient part.


.. spadInput
::

	u.quotient


.. spadMathAnswer
.. spadMathOutput
.. math::

  2

.. spadType
:sub:`Type: PositiveInteger`



This is the remainder part.


.. spadInput
::

	u.remainder


.. spadMathAnswer
.. spadMathOutput
.. math::

  1

.. spadType
:sub:`Type: PositiveInteger`



You can use selector expressions on the left-hand side of an assignment
to change destructively the components of a record.


.. spadInput
::

	u.quotient := 8978


.. spadMathAnswer
.. spadMathOutput
.. math::

  8978

.. spadType
:sub:`Type: PositiveInteger`



The selected component quotient has the value 8978, which is what is
returned by the assignment. Check that the value of u was modified.


.. spadInput
::

	u


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{[quotient=8978,remainder=1]}   





.. spadType
:sub:`Type: Record(quotient: Integer,remainder: Integer)`



Selectors are evaluated. Thus you can use variables that evaluate to
selectors instead of the selectors themselves.


.. spadInput
::

	s := 'quotient


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{quotient}   

.. spadType
:sub:`Type: Variable quotient`


Be **careful!** A selector could have the same name as a variable in the
workspace. If this occurs, precede the selector name by a single quote,
as in selector:quoting u.'quotient.


.. spadInput
::

	divide(5,2).s


.. spadMathAnswer
.. spadMathOutput
.. math::

  2

.. spadType
:sub:`Type: PositiveInteger`


Here we declare that the value of bd has two components: a string, to be
accessed via name, and an integer, to be accessed via birthdayMonth.


.. spadInput
::

	bd : Record(name : String, birthdayMonth : Integer)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`


You must initially set the value of the entire Record at once.


.. spadInput
::

	bd := ["Judith", 3]


.. spadMathAnswer
.. spadMathOutput
.. math::

   \mathrm{[name="Judith",birthdayMonth=3]}

.. spadType
:sub:`Type: Record(name: String,birthdayMonth: Integer)`



Once set, you can change any of the individual components.


.. spadInput
::

	bd.name := "Katie"


.. spadMathAnswer
.. spadMathOutput
.. math::

   \mathrm{ "Katie"}   

.. spadType
:sub:`Type: String`


Records may be nested and the selector names can be shared at different
levels.


.. spadInput
::

	r : Record(a : Record(b: Integer, c: Integer), b: Integer)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



The record r has a b selector at two different levels. Here is an
initial value for r.


.. spadInput
::

	r := [ [1,2], 3 ]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{[a=[b=1,c=2],b=3]}

.. spadType
:sub:`Type: Record(a: Record(b: Integer,c: Integer),b: Integer)`



This extracts the b component from the a component of r.


.. spadInput
::

	r.a.b


.. spadMathAnswer
.. spadMathOutput
.. math::

  1

.. spadType
:sub:`Type: PositiveInteger`



This extracts the b component from r.


.. spadInput
::

	r.b


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: PositiveInteger`



You can also use spaces or parentheses to refer to Record components.
This is the same as r.a.


.. spadInput
::

	r(a)


.. spadMathAnswer
.. spadMathOutput
.. math::

   \mathrm{[b=1,c=2]}   

.. spadType
:sub:`Type: Record(b: Integer,c: Integer)`



This is the same as r.b.


.. spadInput
::

	r b


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: PositiveInteger`


This is the same as r.b:=10.


.. spadInput
::

	r(b) := 10


.. spadMathAnswer
.. spadMathOutput
.. math::

  10

.. spadType
:sub:`Type: PositiveInteger`

Look at r to make sure it was modified.


.. spadInput
::

	r

.. spadMathAnswer
.. spadMathOutput
.. math::

   \mathrm{[a=[b=1,c=2],b=10]}   

.. spadType
:sub:`Type: Record(a: Record(b: Integer,c: Integer),b: Integer)`
