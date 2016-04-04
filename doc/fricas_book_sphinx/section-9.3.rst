.. status: ok


9.3 BasicOperator
-----------------

A basic operator is an object that can be symbolically applied to a list
of arguments from a set, the result being a kernel over that set or an
expression. In addition to this section, please see
`ExpressionXmpPage <section-9.21.html#ExpressionXmpPage>`__ and
`KernelXmpPage <section-9.37.html#KernelXmpPage>`__ for additional
information and examples.

You create an object of type BasicOperator by using the
operatoroperatorBasicOperator operation. This first form of this
operation has one argument and it must be a symbol. The symbol should be
quoted in case the name has been used as an identifier to which a value
has been assigned.

A frequent application of BasicOperator is the creation of an operator
to represent the unknown function when solving a differential equation.

Let y be the unknown function in terms of x.


.. spadInput
::

	y := operator 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



This is how you enter the equation y'' + y' + y = 0.


.. spadInput
::

	deq := D(y x, x, 2) + D(y x, x) + y x = 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| y′′(x)+y′(x)+y(x)=0   |
+-----------------------+




.. spadType

:sub:`Type: Equation Expression Integer`



To solve the above equation, enter this.


.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| [particular=0,basis=[cos(x32)e(-x2),e(-x2)sin(x32)]]   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer, basis: List`
Expression Integer),...)



Use the single argument form of operatoroperatorBasicOperator (as above)
when you intend to use the operator to create functional expressions
with an arbitrary number of arguments

Nary means an arbitrary number of arguments can be used in the
functional expressions.


.. spadInput
::

	nary? y


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	unary? y


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Use the two-argument form when you want to restrict the number of
arguments in the functional expressions created with the operator.

This operator can only be used to create functional expressions with one
argument.


.. spadInput
::

	opOne := operator('opOne, 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| opOne   |
+---------+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	nary? opOne


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	unary? opOne


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Use arityarityBasicOperator to learn the number of arguments that can be
used. It returns "false" if the operator is nary.


.. spadInput
::

	arity opOne


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: Union(NonNegativeInteger,...)`



Use namenameBasicOperator to learn the name of an operator.


.. spadInput
::

	name opOne


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| opOne   |
+---------+




.. spadType

:sub:`Type: Symbol`



Use is?is?BasicOperator to learn if an operator has a particular name.


.. spadInput
::

	is?(opOne, 'z2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



You can also use a string as the name to be tested against.


.. spadInput
::

	is?(opOne, "opOne")


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



You can attached named properties to an operator. These are rarely used
at the top-level of the FriCAS interactive environment but are used with
FriCAS library source code.

By default, an operator has no properties.


.. spadInput
::

	properties y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| table()   |
+-----------+




.. spadType

:sub:`Type: AssociationList(String,None)`



The interface for setting and getting properties is somewhat awkward
because the property values are stored as values of type None.

Attach a property by using setPropertysetPropertyBasicOperator.


.. spadInput
::

	setProperty(y, "use", "unknown function" :: None )


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	properties y


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| table("use"=NONE)   |
+---------------------+




.. spadType

:sub:`Type: AssociationList(String,None)`



We know the property value has type String.


.. spadInput
::

	property(y, "use") :: None pretend String


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| "unknownfunction"   |
+---------------------+




.. spadType

:sub:`Type: String`



Use deleteProperty!deleteProperty!BasicOperator to destructively remove
a property.


.. spadInput
::

	deleteProperty!(y, "use")


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	properties y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| table()   |
+-----------+




.. spadType

:sub:`Type: AssociationList(String,None)`





