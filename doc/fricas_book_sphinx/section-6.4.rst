.. status: ok



6.4 Declaring the Type of Functions
-----------------------------------

In `ugTypesDeclare <section-2.3.html#ugTypesDeclare>`__ we discussed
how to declare a variable to restrict the kind of values that can be
assigned to it. In this section we show how to declare a variable that
refers to function objects.





A function is an object of type



{\\sf Source → Type}



| where Source and Target can be any type. A common type for Source is
Tuple(, ..., ), usually written (, ..., ), to indicate a function of n
arguments.





If g takes an Integer, a Float and another Integer, and returns a
String, the declaration is written:


.. spadInput
::

	g: (Integer,Float,Integer) -> String


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The types need not be written fully; using abbreviations, the above
declaration is:


.. spadInput
::

	g: (INT,FLOAT,INT) -> STRING


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



It is possible for a function to take no arguments. If h takes no
arguments but returns a Polynomial Integer, any of the following
declarations is acceptable.


.. spadInput
::

	h: () -> POLY INT


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	h: () -> Polynomial INT


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	h: () -> POLY Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`







Functions can also be declared when they are being defined. The syntax
for combined declaration/definition is:



functionName(parm1: parmType1, ..., parmN: parmTypeN):
functionReturnType







The following definition fragments show how this can be done for the
functions g and h above.


.. spadVerbatim

::

 g(arg1: INT, arg2: FLOAT, arg3: INT): STRING == ...
 h(): POLY INT == ...



A current restriction on function declarations is that they must involve
fully specified types (that is, cannot include modes involving explicit
or implicit ?). For more information on declaring things in general, see
`ugTypesDeclare <section-2.3.html#ugTypesDeclare>`__ .



