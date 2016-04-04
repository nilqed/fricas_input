.. status: ok



9.37 Kernel
-----------

A kernel is a symbolic function application (such as sin(x+ y)) or a
symbol (such as x). More precisely, a non-symbol kernel over a set S is
an operator applied to a given list of arguments from S. The operator
has type BasicOperator (see
`BasicOperatorXmpPage <section-9.3.html#BasicOperatorXmpPage>`__ ) and
the kernel object is usually part of an expression object (see
`ExpressionXmpPage <section-9.21.html#ExpressionXmpPage>`__ ).

Kernels are created implicitly for you when you create expressions.


.. spadInput
::

	x :: Expression Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Expression Integer`



You can directly create a symbol kernel by using the kernelkernelKernel
operation.


.. spadInput
::

	kernel x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Kernel Expression Integer`



This expression has two different kernels.


.. spadInput
::

	sin(x) + cos(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| sin(x)+cos(x)   |
+-----------------+




.. spadType

:sub:`Type: Expression Integer`



The operator kernelskernelsExpression returns a list of the kernels in
an object of type Expression.


.. spadInput
::

	kernels %


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [sin(x),cos(x)]   |
+-------------------+




.. spadType

:sub:`Type: List Kernel Expression Integer`



This expression also has two different kernels.


.. spadInput
::

	sin(x)^2 + sin(x) + cos(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| sin(x)2+sin(x)+cos(x)   |
+-------------------------+




.. spadType

:sub:`Type: Expression Integer`



The sin(x) kernel is used twice.


.. spadInput
::

	kernels %


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [sin(x),cos(x)]   |
+-------------------+




.. spadType

:sub:`Type: List Kernel Expression Integer`



An expression need not contain any kernels.


.. spadInput
::

	kernels(1 :: Expression Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| []   |
+------+




.. spadType

:sub:`Type: List Kernel Expression Integer`



If one or more kernels are present, one of them is designated the main
kernel.


.. spadInput
::

	mainKernel(cos(x) + tan(x))


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| tan(x)   |
+----------+




.. spadType

:sub:`Type: Union(Kernel Expression Integer,...)`



Kernels can be nested. Use heightheightKernel to determine the nesting
depth.


.. spadInput
::

	height kernel x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



This has height 2 because the x has height 1 and then we apply an
operator to that.


.. spadInput
::

	height mainKernel(sin x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	height mainKernel(sin cos x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	height mainKernel(sin cos (tan x + sin x))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Use the operatoroperatorKernel operation to extract the operator
component of the kernel. The operator has type BasicOperator.


.. spadInput
::

	operator mainKernel(sin cos (tan x + sin x))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| sin   |
+-------+




.. spadType

:sub:`Type: BasicOperator`



Use the namenameKernel operation to extract the name of the operator
component of the kernel. The name has type Symbol. This is really just a
shortcut for a two-step process of extracting the operator and then
calling namenameBasicOperator on the operator.


.. spadInput
::

	name mainKernel(sin cos (tan x + sin x))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| sin   |
+-------+




.. spadType

:sub:`Type: Symbol`



FriCAS knows about functions such as sin, cos and so on and can make
kernels and then expressions using them. To create a kernel and
expression using an arbitrary operator, use
operatoroperatorBasicOperator.

Now f can be used to create symbolic function applications.


.. spadInput
::

	f := operator 'f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| f   |
+-----+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	e := f(x, y, 10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| f(x,y,10)   |
+-------------+




.. spadType

:sub:`Type: Expression Integer`



Use the is?is?Kernel operation to learn if the operator component of a
kernel is equal to a given operator.


.. spadInput
::

	is?(e, f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



You can also use a symbol or a string as the second argument to
is?is?Kernel.


.. spadInput
::

	is?(e, 'f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Use the argumentargumentKernel operation to get a list containing the
argument component of a kernel.


.. spadInput
::

	argument mainKernel e


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [x,y,10]   |
+------------+




.. spadType

:sub:`Type: List Expression Integer`



Conceptually, an object of type Expression can be thought of a quotient
of multivariate polynomials, where the variables are kernels. The
arguments of the kernels are again expressions and so the structure
recurses. See
`ExpressionXmpPage <section-9.21.html#ExpressionXmpPage>`__ for
examples of using kernels to take apart expression objects.



