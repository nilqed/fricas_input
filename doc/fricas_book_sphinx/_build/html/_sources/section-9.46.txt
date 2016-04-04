.. status: ok



9.46 LinearOrdinaryDifferentialOperator2
----------------------------------------

LinearOrdinaryDifferentialOperator2(A, M) is the domain of linear
ordinary differential operators with coefficients in the differential
ring A and operating on M, an A-module. This includes the cases of
operators which are polynomials in D acting upon scalar or vector
expressions of a single variable. The coefficients of the operator
polynomials can be integers, rational functions, matrices or elements of
other domains.



9.46.1 Differential Operators with Constant Coefficients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example shows differential operators with rational number
coefficients operating on univariate polynomials.

We begin by making type assignments so we can conveniently refer to
univariate polynomials in x over the rationals.


.. spadInput
::

	Q := Fraction Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| FractionInteger   |
+-------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	PQ := UnivariatePolynomial('x, Q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------+
| UnivariatePolynomial(x,FractionInteger)   |
+-------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	x: PQ := 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Fraction Integer)`



Now we assign Dx to be the differential operator
DDLinearOrdinaryDifferentialOperator2 corresponding to d/dx.


.. spadInput
::

	Dx: LODO2(Q, PQ) := D()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| D   |
+-----+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2( Fraction Integer,`
UnivariatePolynomial(x,Fraction Integer))



New operators are created as polynomials in D().


.. spadInput
::

	a := Dx + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| D+1   |
+-------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2( Fraction Integer,`
UnivariatePolynomial(x,Fraction Integer))




.. spadInput
::

	b := a + 1/2*Dx^2 - 1/2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 12D2+D+12   |
+-------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2( Fraction Integer,`
UnivariatePolynomial(x,Fraction Integer))



To apply the operator a to the value p the usual function call syntax is
used.


.. spadInput
::

	p := 4*x^2 + 2/3


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 4x2+23   |
+----------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	a p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 4x2+8x+23   |
+-------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Fraction Integer)`



Operator multiplication is defined by the identity (a*b) p = a(b(p))


.. spadInput
::

	(a * b) p = a b p


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| 2x2+12x+373=2x2+12x+373   |
+---------------------------+




.. spadType

:sub:`Type: Equation UnivariatePolynomial(x,Fraction Integer)`



Exponentiation follows from multiplication.


.. spadInput
::

	c := (1/9)*b*(a + b)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------+
| 172D6+536D5+1324D4+1918D3+7972D2+712D+18   |
+--------------------------------------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2( Fraction Integer,`
UnivariatePolynomial(x,Fraction Integer))



Finally, note that operator expressions may be applied directly.


.. spadInput
::

	(a^2 - 3/4*b + c) (p + 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| 3x2+443x+54136   |
+------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Fraction Integer)`







9.46.2 Differential Operators with Matrix Coefficients Operating on Vectors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is another example of linear ordinary differential operators with
non-commutative multiplication. Unlike the rational function case, the
differential ring of square matrices (of a given dimension) with
univariate polynomial entries does not form a field. Thus the number of
operations available is more limited.

In this section, the operators have three by three matrix coefficients
with polynomial entries.


.. spadInput
::

	PZ := UnivariatePolynomial(x,Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| UnivariatePolynomial(x,Integer)   |
+-----------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	x:PZ := 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Integer)`




.. spadInput
::

	Mat := SquareMatrix(3,PZ)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| SquareMatrix(3,UnivariatePolynomial(x,Integer))   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Domain`



The operators act on the vectors considered as a Mat-module.


.. spadInput
::

	Vect := DPMM(3, PZ, Mat, PZ)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------------+
| DirectProductMatrixModule(3,  UnivariatePolynomial(x,Integer),  SquareMatrix(3,UnivariatePolynomial(x,Integer)),  UnivariatePolynomial(x,Integer))   |
+------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	Modo := LODO2(Mat, Vect)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| LinearOrdinaryDifferentialOperator2(  SquareMatrix(3,UnivariatePolynomial(x,Integer)),  DirectProductMatrixModule(3,  UnivariatePolynomial(x,Integer),  SquareMatrix(3,UnivariatePolynomial(x,Integer)),  UnivariatePolynomial(x,Integer)))   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



The matrix m is used as a coefficient and the vectors p and q are
operated upon.


.. spadInput
::

	m:Mat := matrix [ [x^2,1,0],[1,x^4,0],[0,0,4*x^2] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [x2101x40004x2]   |
+-------------------+




.. spadType

:sub:`Type: SquareMatrix(3,UnivariatePolynomial(x,Integer))`




.. spadInput
::

	p:Vect := directProduct [3*x^2+1,2*x,7*x^3+2*x]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [3x2+1,2x,7x3+2x]   |
+---------------------+




.. spadType

:sub:`Type: DirectProductMatrixModule(3, UnivariatePolynomial(x,Integer),`
SquareMatrix(3,UnivariatePolynomial(x,Integer)),
UnivariatePolynomial(x,Integer))




.. spadInput
::

	q: Vect := m * p


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [3x4+x2+2x,2x5+3x2+1,28x5+8x3]   |
+----------------------------------+




.. spadType

:sub:`Type: DirectProductMatrixModule(3, UnivariatePolynomial(x,Integer),`
SquareMatrix(3,UnivariatePolynomial(x,Integer)),
UnivariatePolynomial(x,Integer))



Now form a few operators.


.. spadInput
::

	Dx : Modo := D()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| D   |
+-----+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2(`
SquareMatrix(3,UnivariatePolynomial(x,Integer)),
DirectProductMatrixModule(3, UnivariatePolynomial(x,Integer),
SquareMatrix(3,UnivariatePolynomial(x,Integer)),
UnivariatePolynomial(x,Integer)))




.. spadInput
::

	a : Modo := Dx + m


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| D+[x2101x40004x2]   |
+---------------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2(`
SquareMatrix(3,UnivariatePolynomial(x,Integer)),
DirectProductMatrixModule(3, UnivariatePolynomial(x,Integer),
SquareMatrix(3, UnivariatePolynomial(x,Integer)),
UnivariatePolynomial(x,Integer)))




.. spadInput
::

	b : Modo := m*Dx + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [x2101x40004x2]D+[100010001]   |
+--------------------------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2( SquareMatrix(3,`
UnivariatePolynomial(x,Integer)), DirectProductMatrixModule(3,
UnivariatePolynomial(x,Integer), SquareMatrix(3,
UnivariatePolynomial(x,Integer)), UnivariatePolynomial(x,Integer)))




.. spadInput
::

	c := a*b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------+
| [x2101x40004x2]D2+[x4+2x+2x4+x20x4+x2x8+4x3+200016x4+8x+1]D+[x2101x40004x2]   |
+-------------------------------------------------------------------------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator2( SquareMatrix(3,`
UnivariatePolynomial(x,Integer)), DirectProductMatrixModule(3,
UnivariatePolynomial(x,Integer), SquareMatrix(3,
UnivariatePolynomial(x,Integer)), UnivariatePolynomial(x,Integer)))



These operators can be applied to vector values.


.. spadInput
::

	a p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| [3x4+x2+8x,2x5+3x2+3,28x5+8x3+21x2+2]   |
+-----------------------------------------+




.. spadType

:sub:`Type: DirectProductMatrixModule(3, UnivariatePolynomial(x,Integer),`
SquareMatrix(3, UnivariatePolynomial(x,Integer)),
UnivariatePolynomial(x,Integer))




.. spadInput
::

	b p


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| [6x3+3x2+3,2x4+8x,84x4+7x3+8x2+2x]   |
+--------------------------------------+




.. spadType

:sub:`Type: DirectProductMatrixModule(3, UnivariatePolynomial(x,Integer),`
SquareMatrix(3, UnivariatePolynomial(x,Integer)),
UnivariatePolynomial(x,Integer))




.. spadInput
::

	(a + b + c) (p + q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| [10x8+12x7+16x6+30x5+85x4+94x3+40x2+40x+17,10x12+10x9+12x8+92x7+6x6+32x5+72x4+28x3+49x2+32x+19,2240x8+224x7+1280x6+3508x5+492x4+751x3+98x2+18x+4]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: DirectProductMatrixModule(3, UnivariatePolynomial(x,Integer),`
SquareMatrix(3, UnivariatePolynomial(x,Integer)),
UnivariatePolynomial(x,Integer))







