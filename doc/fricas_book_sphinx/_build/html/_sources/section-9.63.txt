.. status: ok


9.63 Polynomial
---------------

The domain constructor Polynomial (abbreviation: POLY) provides
polynomials with an arbitrary number of unspecified variables.

It is used to create the default polynomial domains in FriCAS. Here the
coefficients are integers.


.. spadInput
::

	x + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| x+1   |
+-------+




.. spadType

:sub:`Type: Polynomial Integer`



Here the coefficients have type Float.


.. spadInput
::

	z - 2.3


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| z-2.3   |
+---------+




.. spadType

:sub:`Type: Polynomial Float`



And here we have a polynomial in two variables with coefficients which
have type Fraction Integer.


.. spadInput
::

	y^2 - z + 3/4


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -z+y2+34   |
+------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`



The representation of objects of domains created by Polynomial is that
of recursive univariate polynomials.The term univariate means one
variable. multivariate means possibly more than one variable.

This recursive structure is sometimes obvious from the display of a
polynomial.


.. spadInput
::

	y ^2 + x*y + y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| y2+(x+1)y   |
+-------------+




.. spadType

:sub:`Type: Polynomial Integer`



In this example, you see that the polynomial is stored as a polynomial
in y with coefficients that are polynomials in x with integer
coefficients. In fact, you really don't need to worry about the
representation unless you are working on an advanced application where
it is critical. The polynomial types created from
DistributedMultivariatePolynomial and
NewDistributedMultivariatePolynomial (discussed in
`DistributedMultivariatePolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
) are stored and displayed in a non-recursive manner.

You see a flat display of the above polynomial by converting to one of
those types.


.. spadInput
::

	% :: DMP([y,x],INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| y2+yx+y   |
+-----------+




.. spadType

:sub:`Type: DistributedMultivariatePolynomial([y,x],Integer)`



We will demonstrate many of the polynomial facilities by using two
polynomials with integer coefficients.

By default, the interpreter expands polynomial expressions, even if they
are written in a factored format.


.. spadInput
::

	p := (y-1)^2 * x * z


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| (xy2-2xy+x)z   |
+----------------+




.. spadType

:sub:`Type: Polynomial Integer`



See `FactoredXmpPage <section-9.22.html#FactoredXmpPage>`__ to see how
to create objects in factored form directly.


.. spadInput
::

	q := (y-1) * x * (z+5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| (xy-x)z+5xy-5x   |
+------------------+




.. spadType

:sub:`Type: Polynomial Integer`



The fully factored form can be recovered by using
factorfactorPolynomial.


.. spadInput
::

	factor(q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| x(y-1)(z+5)   |
+---------------+




.. spadType

:sub:`Type: Factored Polynomial Integer`



This is the same name used for the operation to factor integers. Such
reuse of names is called overloading and makes it much easier to think
of solving problems in general ways. FriCAS facilities for factoring
polynomials created with Polynomial are currently restricted to the
integer and rational number coefficient cases. There are more complete
facilities for factoring univariate polynomials: see
`ugProblemFactorPage <ugProblemFactorPage>`__ in Section
`ugProblemFactorNumber <ugProblemFactorNumber>`__ .

The standard arithmetic operations are available for polynomials.


.. spadInput
::

	p - q^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------+
| (-x2y2+2x2y-x2)z2+((-10x2+x)y2+(20x2-2x)y-10x2+x)z-25x2y2+50x2y-25x2   |
+------------------------------------------------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`



The operation gcdgcdPolynomial is used to compute the greatest common
divisor of two polynomials.


.. spadInput
::

	gcd(p,q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| xy-x   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`



In the case of p and q, the gcd is obvious from their definitions. We
factor the gcd to show this relationship better.


.. spadInput
::

	factor %


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| x(y-1)   |
+----------+




.. spadType

:sub:`Type: Factored Polynomial Integer`



The least common multiple is computed by using lcmlcmPolynomial.


.. spadInput
::

	lcm(p,q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| (xy2-2xy+x)z2+(5xy2-10xy+5x)z   |
+---------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`



Use contentcontentPolynomial to compute the greatest common divisor of
the coefficients of the polynomial.


.. spadInput
::

	content p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Many of the operations on polynomials require you to specify a variable.
For example, resultantresultantPolynomial requires you to give the
variable in which the polynomials should be expressed.

This computes the resultant of the values of p and q, considering them
as polynomials in the variable z. They do not share a root when thought
of as polynomials in z.


.. spadInput
::

	resultant(p,q,z)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| 5x2y3-15x2y2+15x2y-5x2   |
+--------------------------+




.. spadType

:sub:`Type: Polynomial Integer`



This value is 0 because as polynomials in x the polynomials have a
common root.


.. spadInput
::

	resultant(p,q,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Polynomial Integer`



The data type used for the variables created by Polynomial is Symbol. As
mentioned above, the representation used by Polynomial is recursive and
so there is a main variable for nonconstant polynomials.

The operation mainVariablemainVariablePolynomial returns this variable.
The return type is actually a union of Symbol and "failed".


.. spadInput
::

	mainVariable p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| z   |
+-----+




.. spadType

:sub:`Type: Union(Symbol,...)`



The latter branch of the union is be used if the polynomial has no
variables, that is, is a constant.


.. spadInput
::

	mainVariable(1 :: POLY INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



You can also use the predicate ground?ground?Polynomial to test whether
a polynomial is in fact a member of its ground ring.


.. spadInput
::

	ground? p


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

	ground?(1 :: POLY INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



The complete list of variables actually used in a particular polynomial
is returned by variablesvariablesPolynomial. For constant polynomials,
this list is empty.


.. spadInput
::

	variables p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [z,y,x]   |
+-----------+




.. spadType

:sub:`Type: List Symbol`



The degreedegreePolynomial operation returns the degree of a polynomial
in a specific variable.


.. spadInput
::

	degree(p,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	degree(p,y)


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

	degree(p,z)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



If you give a list of variables for the second argument, a list of the
degrees in those variables is returned.


.. spadInput
::

	degree(p,[x,y,z])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1,2,1]   |
+-----------+




.. spadType

:sub:`Type: List NonNegativeInteger`



The minimum degree of a variable in a polynomial is computed using
minimumDegreeminimumDegreePolynomial.


.. spadInput
::

	minimumDegree(p,z)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The total degree of a polynomial is returned by
totalDegreetotalDegreePolynomial.


.. spadInput
::

	totalDegree p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



It is often convenient to think of a polynomial as a leading monomial
plus the remaining terms.


.. spadInput
::

	leadingMonomial p


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| xy2z   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`



The reductumreductumPolynomial operation returns a polynomial consisting
of the sum of the monomials after the first.


.. spadInput
::

	reductum p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| (-2xy+x)z   |
+-------------+




.. spadType

:sub:`Type: Polynomial Integer`



These have the obvious relationship that the original polynomial is
equal to the leading monomial plus the reductum.


.. spadInput
::

	p - leadingMonomial p - reductum p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Polynomial Integer`



The value returned by leadingMonomialleadingMonomialPolynomial includes
the coefficient of that term. This is extracted by using
leadingCoefficientleadingCoefficientPolynomial on the original
polynomial.


.. spadInput
::

	leadingCoefficient p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The operation evalevalPolynomial is used to substitute a value for a
variable in a polynomial.


.. spadInput
::

	p


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| (xy2-2xy+x)z   |
+----------------+




.. spadType

:sub:`Type: Polynomial Integer`



This value may be another variable, a constant or a polynomial.


.. spadInput
::

	eval(p,x,w)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| (wy2-2wy+w)z   |
+----------------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	eval(p,x,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| (y2-2y+1)z   |
+--------------+




.. spadType

:sub:`Type: Polynomial Integer`



Actually, all the things being substituted are just polynomials, some
more trivial than others.


.. spadInput
::

	eval(p,x,y^2 - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| (y4-2y3+2y-1)z   |
+------------------+




.. spadType

:sub:`Type: Polynomial Integer`



Derivatives are computed using the DDPolynomial operation.


.. spadInput
::

	D(p,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| (y2-2y+1)z   |
+--------------+




.. spadType

:sub:`Type: Polynomial Integer`



The first argument is the polynomial and the second is the variable.


.. spadInput
::

	D(p,y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| (2xy-2x)z   |
+-------------+




.. spadType

:sub:`Type: Polynomial Integer`



Even if the polynomial has only one variable, you must specify it.


.. spadInput
::

	D(p,z)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| xy2-2xy+x   |
+-------------+




.. spadType

:sub:`Type: Polynomial Integer`



Integration of polynomials is similar and the
integrateintegratePolynomial operation is used.

Integration requires that the coefficients support division.
Consequently, FriCAS converts polynomials over the integers to
polynomials over the rational numbers before integrating them.


.. spadInput
::

	integrate(p,y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| (13xy3-xy2+xy)z   |
+-------------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`



It is not possible, in general, to divide two polynomials. In our
example using polynomials over the integers, the operation
monicDividemonicDividePolynomial divides a polynomial by a monic
polynomial (that is, a polynomial with leading coefficient equal to 1).
The result is a record of the quotient and remainder of the division.

You must specify the variable in which to express the polynomial.


.. spadInput
::

	qr := monicDivide(p,x+1,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------+
| [quotient=(y2-2y+1)z,remainder=(-y2+2y-1)z]   |
+-----------------------------------------------+




.. spadType

:sub:`Type: Record(quotient: Polynomial Integer,remainder: Polynomial Integer)`



The selectors of the components of the record are quotient and
remainder. Issue this to extract the remainder.


.. spadInput
::

	qr.remainder


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| (-y2+2y-1)z   |
+---------------+




.. spadType

:sub:`Type: Polynomial Integer`



Now that we can extract the components, we can demonstrate the
relationship among them and the arguments to our original expression qr
:= monicDivide(p,x+1,x).


.. spadInput
::

	p - ((x+1) * qr.quotient + qr.remainder)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Polynomial Integer`



If the / operator is used with polynomials, a fraction object is
created. In this example, the result is an object of type Fraction
Polynomial Integer.


.. spadInput
::

	p/q


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| (y-1)zz+5   |
+-------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`



If you use rational numbers as polynomial coefficients, the resulting
object is of type Polynomial Fraction Integer.


.. spadInput
::

	(2/3) * x^2 - y + 4/5


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| -y+23x2+45   |
+--------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`



This can be converted to a fraction of polynomials and back again, if
required.


.. spadInput
::

	% :: FRAC POLY INT


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| -15y+10x2+1215   |
+------------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`




.. spadInput
::

	% :: POLY FRAC INT


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| -y+23x2+45   |
+--------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`



To convert the coefficients to floating point, map the numeric operation
on the coefficients of the polynomial.


.. spadInput
::

	map(numeric,%)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| -1.0y+0.66666666666666666667x2+0.8   |
+--------------------------------------+




.. spadType

:sub:`Type: Polynomial Float`



For more information on related topics, see
`UnivariatePolynomialXmpPage <section-9.83.html#UnivariatePolynomialXmpPage>`__
,
`MultivariatePolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
, and
`DistributedMultivariatePolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
. You can also issue the system command )show Polynomial to display the
full list of operations defined by Polynomial.



