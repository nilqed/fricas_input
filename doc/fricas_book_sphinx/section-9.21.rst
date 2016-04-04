.. status: ok


9.21 Expression
---------------

Expression is a constructor that creates domains whose objects can have
very general symbolic forms. Here are some examples:

This is an object of type Expression Integer.


.. spadInput
::

	sin(x) + 3*cos(x)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| sin(x)+3cos(x)2   |
+-------------------+




.. spadType

:sub:`Type: Expression Integer`



This is an object of type Expression Float.


.. spadInput
::

	tan(x) - 3.45*x


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| tan(x)-3.45x   |
+----------------+




.. spadType

:sub:`Type: Expression Float`



This object contains symbolic function applications, sums, products,
square roots, and a quotient.


.. spadInput
::

	(tan sqrt 7 - sin sqrt 11)^2 / (4 - cos(x - y))


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------+
| -tan(7)2+2sin(11)tan(7)-sin(11)2cos(y-x)-4   |
+----------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`



As you can see, Expression actually takes an argument domain. The
coefficients of the terms within the expression belong to the argument
domain. Integer and Float, along with Complex Integer and Complex Float
are the most common coefficient domains.

The choice of whether to use a Complex coefficient domain or not is
important since FriCAS can perform some simplifications on real-valued
objects


.. spadInput
::

	log(exp x)@Expression(Integer)


.. spadMathAnswer
x


.. spadType

:sub:`Type: Expression Integer`



... which are not valid on complex ones.


.. spadInput
::

	log(exp x)@Expression(Complex Integer)


.. spadMathAnswer
log(ex)


.. spadType

:sub:`Type: Expression Complex Integer`



Many potential coefficient domains, such as AlgebraicNumber, are not
usually used because Expression can subsume them.


.. spadInput
::

	sqrt 3 + sqrt(2 + sqrt(-5))


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| -5+2+3   |
+----------+




.. spadType

:sub:`Type: AlgebraicNumber`




.. spadInput
::

	% :: Expression Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| -5+2+3   |
+----------+




.. spadType

:sub:`Type: Expression Integer`



Note that we sometimes talk about an object of type Expression. This is
not really correct because we should say, for example, an object of type
Expression Integer or an object of type Expression Float. By a similar
abuse of language, when we refer to an expression in this section we
will mean an object of type Expression R for some domain R.

The FriCAS documentation contains many examples of the use of
Expression. For the rest of this section, we'll give you some pointers
to those examples plus give you some idea of how to manipulate
expressions.

It is important for you to know that Expression creates domains that
have category Field. Thus you can invert any non-zero expression and you
shouldn't expect an operation like factor to give you much information.
You can imagine expressions as being represented as quotients of
multivariate polynomials where the variables are kernels (see
`KernelXmpPage <section-9.37.html#KernelXmpPage>`__ ). A kernel can
either be a symbol such as x or a symbolic function application like
sin(x + 4). The second example is actually a nested kernel since the
argument to sin contains the kernel x.


.. spadInput
::

	height mainKernel sin(x + 4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Actually, the argument to sin is an expression, and so the structure of
Expression is recursive.
`KernelXmpPage <section-9.37.html#KernelXmpPage>`__ demonstrates how to
extract the kernels in an expression.

Use the HyperDoc Browse facility to see what operations are applicable
to expression. At the time of this writing, there were 262 operations
with 147 distinct name in Expression Integer. For example,
numernumerExpression and denomdenomExpression extract the numerator and
denominator of an expression.


.. spadInput
::

	e := (sin(x) - 4)^2 / ( 1 - 2*y*sqrt(- y) )


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| -sin(x)2+8sin(x)-162y-y-1   |
+-----------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	numer e


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| -sin(x)2+8sin(x)-16   |
+-----------------------+




.. spadType

:sub:`Type: SparseMultivariatePolynomial(Integer,Kernel Expression Integer)`




.. spadInput
::

	denom e


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 2y-y-1   |
+----------+




.. spadType

:sub:`Type: SparseMultivariatePolynomial(Integer,Kernel Expression Integer)`



Use DDExpression to compute partial derivatives.


.. spadInput
::

	D(e, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------+
| (4ycos(x)sin(x)-16ycos(x))-y-2cos(x)sin(x)+8cos(x)4y-y+4y3-1   |
+----------------------------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`



See `ugIntroCalcDerivPage <ugIntroCalcDerivPage>`__ in Section
`ugIntroCalcDerivNumber <ugIntroCalcDerivNumber>`__ for more examples of
expressions and derivatives.


.. spadInput
::

	D(e, [x, y], [1, 2])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| (((-2304y7+960y4)cos(x)sin(x)+(9216y7-3840y4)cos(x))-y+(-960y9+2160y6-180y3-3)cos(x)sin(x)+(3840y9-8640y6+720y3+12)cos(x))((256y12-1792y9+1120y6-112y3+1)-y-1024y11+1792y8-448y5+16y2)   |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`



See `ugIntroCalcLimitsPage <ugIntroCalcLimitsPage>`__ in Section
`ugIntroCalcLimitsNumber <ugIntroCalcLimitsNumber>`__ and
`ugIntroSeriesPage <ugIntroSeriesPage>`__ in Section
`ugIntroSeriesNumber <ugIntroSeriesNumber>`__ for more examples of
expressions and calculus. Differential equations involving expressions
are discussed in `ugProblemDEQPage <ugProblemDEQPage>`__ in Section
`ugProblemDEQNumber <ugProblemDEQNumber>`__ . Chapter 8 has many
advanced examples: see
`ugProblemIntegrationPage <ugProblemIntegrationPage>`__ in Section
`ugProblemIntegrationNumber <ugProblemIntegrationNumber>`__ for a
discussion of FriCAS's integration facilities.

When an expression involves no symbol kernels (for example, x), it may
be possible to numerically evaluate the expression.

If you suspect the evaluation will create a complex number, use
complexNumeric.


.. spadInput
::

	complexNumeric(cos(2 - 3*%i))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| -4.1896256909688072301+9.109227893755336598i   |
+------------------------------------------------+




.. spadType

:sub:`Type: Complex Float`



If you know it will be real, use numeric.


.. spadInput
::

	numeric(tan 3.8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| 0.77355609050312607286   |
+--------------------------+




.. spadType

:sub:`Type: Float`



The numeric operation will display an error message if the evaluation
yields a calue with an non-zero imaginary part. Both of these operations
have an optional second argument n which specifies that the accuracy of
the approximation be up to n decimal places.

When an expression involves no symbolic application kernels, it may be
possible to convert it a polynomial or rational function in the
variables that are present.


.. spadInput
::

	e2 := cos(x^2 - y + 3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| cos(y-x2-3)   |
+---------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	e3 := asin(e2) - %pi/2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| -y+x2+3   |
+-----------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	e3 :: Polynomial Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| -y+x2+3   |
+-----------+




.. spadType

:sub:`Type: Polynomial Integer`



This also works for the polynomial types where specific variables and
their ordering are given.


.. spadInput
::

	e3 :: DMP([x, y], Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| x2-y+3   |
+----------+




.. spadType

:sub:`Type: DistributedMultivariatePolynomial([x,y],Integer)`



Finally, a certain amount of simplication takes place as expressions are
constructed.


.. spadInput
::

	sin %pi


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	cos(%pi / 4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 22   |
+------+




.. spadType

:sub:`Type: Expression Integer`



For simplications that involve multiple terms of the expression, use
simplify.


.. spadInput
::

	tan(x)^6 + 3*tan(x)^4 + 3*tan(x)^2 + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| tan(x)6+3tan(x)4+3tan(x)2+1   |
+-------------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	simplify %


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 1cos(x)6   |
+------------+




.. spadType

:sub:`Type: Expression Integer`



See `ugUserRulesPage <ugUserRulesPage>`__ in Section
`ugUserRulesNumber <ugUserRulesNumber>`__ for examples of how to write
your own rewrite rules for expressions.



