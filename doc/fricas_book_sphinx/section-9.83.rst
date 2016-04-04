.. status: ok



9.83 UnivariatePolynomial
-------------------------

The domain constructor UnivariatePolynomial (abbreviated UP) creates
domains of univariate polynomials in a specified variable. For example,
the domain UP(a1,POLY FRAC INT) provides polynomials in the single
variable a1 whose coefficients are general polynomials with rational
number coefficients.





 Restriction:



FriCAS does not allow you to create types where UnivariatePolynomial is
contained in the coefficient type of Polynomial. Therefore, UP(x,POLY
INT) is legal but POLY UP(x,INT) is not.



.





UP(x,INT) is the domain of polynomials in the single variable x with
integer coefficients.


.. spadInput
::

	(p,q) : UP(x,INT)


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	p := (3*x-1)^2 * (2*x + 8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| 18x3+60x2-46x+8   |
+-------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`




.. spadInput
::

	q := (1 - 6*x + 9*x^2)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| 81x4-108x3+54x2-12x+1   |
+-------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



The usual arithmetic operations are available for univariate
polynomials.


.. spadInput
::

	p^2 + p*q


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| 1458x7+3240x6-7074x5+10584x4-9282x3+4120x2-878x+72   |
+------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



The operation leadingCoefficientleadingCoefficientUnivariatePolynomial
extracts the coefficient of the term of highest degree.


.. spadInput
::

	leadingCoefficient p


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 18   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



The operation degreedegreeUnivariatePolynomial returns the degree of the
polynomial. Since the polynomial has only one variable, the variable is
not supplied to operations like degreedegreeUnivariatePolynomial.


.. spadInput
::

	degree p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The reductum of the polynomial, the polynomial obtained by subtracting
the term of highest order, is returned by
reductumreductumUnivariatePolynomial.


.. spadInput
::

	reductum p


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 60x2-46x+8   |
+--------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



The operation gcdgcdUnivariatePolynomial computes the greatest common
divisor of two polynomials.


.. spadInput
::

	gcd(p,q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 9x2-6x+1   |
+------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



The operation lcmlcmUnivariatePolynomial computes the least common
multiple.


.. spadInput
::

	lcm(p,q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| 162x5+432x4-756x3+408x2-94x+8   |
+---------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



The operation resultantresultantUnivariatePolynomial computes the
resultant of two univariate polynomials. In the case of p and q, the
resultant is 0 because they share a common root.


.. spadInput
::

	resultant(p,q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



To compute the derivative of a univariate polynomial with respect to its
variable, use DDUnivariatePolynomial.


.. spadInput
::

	D p


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 54x2+120x-46   |
+----------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



Univariate polynomials can also be used as if they were functions. To
evaluate a univariate polynomial at some point, apply the polynomial to
the point.


.. spadInput
::

	p(2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 300   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



The same syntax is used for composing two univariate polynomials, i.e.
substituting one polynomial for the variable in another. This
substitutes q for the variable in p.


.. spadInput
::

	p(q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------+
| 9565938x12-38263752x11+70150212x10-77944680x9+58852170x8-32227632x7+13349448x6-4280688x5+1058184x4-192672x3+23328x2-1536x+40   |
+--------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



This substitutes p for the variable in q.


.. spadInput
::

	q(p)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------+
| 8503056x12+113374080x11+479950272x10+404997408x9-1369516896x8-626146848x7+2939858712x6-2780728704x5+1364312160x4-396838872x3+69205896x2-6716184x+279841   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



To obtain a list of coefficients of the polynomial, use
coefficientscoefficientsUnivariatePolynomial.


.. spadInput
::

	l := coefficients p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [18,60,-46,8]   |
+-----------------+




.. spadType

:sub:`Type: List Integer`



From this you can use gcdgcdUnivariatePolynomial and reducereduceList to
compute the content of the polynomial.


.. spadInput
::

	reduce(gcd,l)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Alternatively (and more easily), you can just call
contentcontentUnivariatePolynomial.


.. spadInput
::

	content p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Note that the operation coefficientscoefficientsUnivariatePolynomial
omits the zero coefficients from the list. Sometimes it is useful to
convert a univariate polynomial to a vector whose i-th position contains
the degree i-1 coefficient of the polynomial.


.. spadInput
::

	ux := (x^4+2*x+3)::UP(x,INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| x4+2x+3   |
+-----------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



To get a complete vector of coefficients, use the operation
vectorisevectoriseUnivariatePolynomial, which takes a univariate
polynomial and an integer denoting the length of the desired vector.


.. spadInput
::

	vectorise(ux,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [3,2,0,0,1]   |
+---------------+




.. spadType

:sub:`Type: Vector Integer`



It is common to want to do something to every term of a polynomial,
creating a new polynomial in the process.

This is a function for iterating across the terms of a polynomial,
squaring each term.


.. spadInput
::

	squareTerms(p) == reduce(+,[t^2 for t in monomials p])


.. spadMathAnswer
.. spadType

Void



Recall what p looked like.


.. spadInput
::

	p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| 18x3+60x2-46x+8   |
+-------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



We can demonstrate squareTerms on p.


.. spadInput
::

	squareTerms p


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function squareTerms with type 
   UnivariatePolynomial(x,Integer) -> 
     UnivariatePolynomial(x,Integer) 




.. spadMathOutput
.. math::

+--------------------------+
| 324x6+3600x4+2116x2+64   |
+--------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`



When the coefficients of the univariate polynomial belong to a field,For
example, when the coefficients are rational numbers, as opposed to
integers. The important property of a field is that non-zero elements
can be divided and produce another element. The quotient of the integers
2 and 3 is not another integer. it is possible to compute quotients and
remainders.


.. spadInput
::

	(r,s) : UP(a1,FRAC INT)


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	r := a1^2 - 2/3


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| a12-23   |
+----------+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Integer)`




.. spadInput
::

	s := a1 + 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| a1+4   |
+--------+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Integer)`



When the coefficients are rational numbers or rational expressions, the
operation quoquoUnivariatePolynomial computes the quotient of two
polynomials.


.. spadInput
::

	r quo s


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| a1-4   |
+--------+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Integer)`



The operation remremUnivariatePolynomial computes the remainder.


.. spadInput
::

	r rem s


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 463   |
+-------+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Integer)`



The operation dividedivideUnivariatePolynomial can be used to return a
record of both components.


.. spadInput
::

	d := divide(r, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [quotient=a1-4,remainder=463]   |
+---------------------------------+




.. spadType

:sub:`Type: Record( quotient: UnivariatePolynomial(a1,Fraction Integer),`
remainder: UnivariatePolynomial(a1,Fraction Integer))



Now we check the arithmetic!


.. spadInput
::

	r - (d.quotient * s + d.remainder)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Integer)`



It is also possible to integrate univariate polynomials when the
coefficients belong to a field.


.. spadInput
::

	integrate r


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 13a13-23a1   |
+--------------+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Integer)`




.. spadInput
::

	integrate s


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 12a12+4a1   |
+-------------+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Integer)`



One application of univariate polynomials is to see expressions in terms
of a specific variable.

We start with a polynomial in a1 whose coefficients are quotients of
polynomials in b1 and b2.


.. spadInput
::

	t : UP(a1,FRAC POLY INT)


.. spadMathAnswer
.. spadType

Void



Since in this case we are not talking about using multivariate
polynomials in only two variables, we use Polynomial. We also use
Fraction because we want fractions.


.. spadInput
::

	t := a1^2 - a1/b2 + (b1^2-b1)/(b2+3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| a12-1b2a1+b12-b1b2+3   |
+------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(a1,Fraction Polynomial Integer)`



We push all the variables into a single quotient of polynomials.


.. spadInput
::

	u : FRAC POLY INT := t


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| a12b22+(b12-b1+3a12-a1)b2-3a1b22+3b2   |
+----------------------------------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`



Alternatively, we can view this as a polynomial in the variable This is
a mode-directed conversion: you indicate as much of the structure as you
care about and let FriCAS decide on the full type and how to do the
transformation.


.. spadInput
::

	u :: UP(b1,?)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| 1b2+3b12-1b2+3b1+a12b2-a1b2   |
+-------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(b1,Fraction Polynomial Integer)`



See `ugProblemFactorPage <ugProblemFactorPage>`__ in Section
`ugProblemFactorNumber <ugProblemFactorNumber>`__ for a discussion of
the factorization facilities in FriCAS for univariate polynomials. For
more information on related topics, see
`ugIntroVariablesPage <ugIntroVariablesPage>`__ in Section
`ugIntroVariablesNumber <ugIntroVariablesNumber>`__ ,
`ugTypesConvertPage <ugTypesConvertPage>`__ in Section
`ugTypesConvertNumber <ugTypesConvertNumber>`__ ,
`PolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
,
`MultivariatePolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
, and
`DistributedMultivariatePolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
.



