.. status: ok



9.22 Factored
-------------

Factored creates a domain whose objects are kept in factored form as
long as possible. Thus certain operations like * (multiplication) and
gcdgcdFactored are relatively easy to do. Others, such as addition,
require somewhat more work, and the result may not be completely
factored unless the argument domain R provides a factorfactorFactored
operation. Each object consists of a unit and a list of factors, where
each factor consists of a member of R (the base), an exponent, and a
flag indicating what is known about the base. A flag may be one of nil,
sqfr, irred or prime, which mean that nothing is known about the base,
it is square-free, it is irreducible, or it is prime, respectively. The
current restriction to factored objects of integral domains allows
simplification to be performed without worrying about multiplication
order.



9.22.1 Decomposing Factored Objects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this section we will work with a factored integer.


.. spadInput
::

	g := factor(4312)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 237211   |
+----------+




.. spadType

:sub:`Type: Factored Integer`



Let's begin by decomposing g into pieces. The only possible units for
integers are 1 and -1.


.. spadInput
::

	unit(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



There are three factors.


.. spadInput
::

	numberOfFactors(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



We can make a list of the bases, ...


.. spadInput
::

	[nthFactor(g,i) for i in 1..numberOfFactors(g)]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [2,7,11]   |
+------------+




.. spadType

:sub:`Type: List Integer`



and the exponents, ...


.. spadInput
::

	[nthExponent(g,i) for i in 1..numberOfFactors(g)]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [3,2,1]   |
+-----------+




.. spadType

:sub:`Type: List Integer`



and the flags. You can see that all the bases (factors) are prime.


.. spadInput
::

	[nthFlag(g,i) for i in 1..numberOfFactors(g)]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| ["prime","prime","prime"]   |
+-----------------------------+




.. spadType

:sub:`Type: List Union("nil","sqfr","irred","prime")`



A useful operation for pulling apart a factored object into a list of
records of the components is factorListfactorListFactored.


.. spadInput
::

	factorList(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------+
| [[flg="prime",fctr=2,xpnt=3],[flg="prime",fctr=7,xpnt=2],[flg="prime",fctr=11,xpnt=1]]   |
+------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Record(flg: Union("nil","sqfr","irred","prime"), fctr:`
Integer,xpnt: Integer)



If you don't care about the flags, use factorsfactorsFactored.


.. spadInput
::

	factors(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------+
| [[factor=2,exponent=3],[factor=7,exponent=2],[factor=11,exponent=1]]   |
+------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Record(factor: Integer,exponent: Integer)`



Neither of these operations returns the unit.


.. spadInput
::

	first(%).factor


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`







9.22.2 Expanding Factored Objects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Recall that we are working with this factored integer.


.. spadInput
::

	g := factor(4312)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 237211   |
+----------+




.. spadType

:sub:`Type: Factored Integer`



To multiply out the factors with their multiplicities, use
expandexpandFactored.


.. spadInput
::

	expand(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 4312   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`



If you would like, say, the distinct factors multiplied together but
with multiplicity one, you could do it this way.


.. spadInput
::

	reduce(*,[t.factor for t in factors(g)])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 154   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`







9.22.3 Arithmetic with Factored Objects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We're still working with this factored integer.


.. spadInput
::

	g := factor(4312)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 237211   |
+----------+




.. spadType

:sub:`Type: Factored Integer`



We'll also define this factored integer.


.. spadInput
::

	f := factor(246960)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2432573   |
+-----------+




.. spadType

:sub:`Type: Factored Integer`



Operations involving multiplication and division are particularly easy
with factored objects.


.. spadInput
::

	f * g


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 273257511   |
+-------------+




.. spadType

:sub:`Type: Factored Integer`




.. spadInput
::

	f^500


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| 2200031000550071500   |
+-----------------------+




.. spadType

:sub:`Type: Factored Integer`




.. spadInput
::

	gcd(f,g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 2372   |
+--------+




.. spadType

:sub:`Type: Factored Integer`




.. spadInput
::

	lcm(f,g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 243257311   |
+-------------+




.. spadType

:sub:`Type: Factored Integer`



If we use addition and subtraction things can slow down because we may
need to compute greatest common divisors.


.. spadInput
::

	f + g


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2372641   |
+-----------+




.. spadType

:sub:`Type: Factored Integer`




.. spadInput
::

	f - g


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2372619   |
+-----------+




.. spadType

:sub:`Type: Factored Integer`



Test for equality with 0 and 1 by using zero?zero?Factored and
one?one?Factored, respectively.


.. spadInput
::

	zero?(factor(0))


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

	zero?(g)


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

	one?(factor(1))


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

	one?(f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Another way to get the zero and one factored objects is to use package
calling (see `ugTypesPkgCallPage <ugTypesPkgCallPage>`__ in Section
`ugTypesPkgCallNumber <ugTypesPkgCallNumber>`__ ).


.. spadInput
::

	0$Factored(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Factored Integer`




.. spadInput
::

	1$Factored(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: Factored Integer`







9.22.4 Creating New Factored Objects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The mapmapFactored operation is used to iterate across the unit and
bases of a factored object. See
`FactoredFunctionsTwoXmpPage <FactoredFunctionsTwoXmpPage>`__ for a
discussion of mapmapFactored.

The following four operations take a base and an exponent and create a
factored object. They differ in handling the flag component.


.. spadInput
::

	nilFactor(24,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 242   |
+-------+




.. spadType

:sub:`Type: Factored Integer`



This factor has no associated information.


.. spadInput
::

	nthFlag(%,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| "nil"   |
+---------+




.. spadType

:sub:`Type: Union("nil",...)`



This factor is asserted to be square-free.


.. spadInput
::

	sqfrFactor(30,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 302   |
+-------+




.. spadType

:sub:`Type: Factored Integer`



This factor is asserted to be irreducible.


.. spadInput
::

	irreducibleFactor(13,10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1310   |
+--------+




.. spadType

:sub:`Type: Factored Integer`



This factor is asserted to be prime.


.. spadInput
::

	primeFactor(11,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 115   |
+-------+




.. spadType

:sub:`Type: Factored Integer`



A partial inverse to factorListfactorListFactored is
makeFRmakeFRFactored.


.. spadInput
::

	h := factor(-720)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| -24325   |
+----------+




.. spadType

:sub:`Type: Factored Integer`



The first argument is the unit and the second is a list of records as
returned by factorListfactorListFactored.


.. spadInput
::

	h - makeFR(unit(h),factorList(h))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Factored Integer`







9.22.5 Factored Objects with Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some of the operations available for polynomials are also available for
factored polynomials.


.. spadInput
::

	p := (4*x*x-12*x+9)*y*y + (4*x*x-12*x+9)*y + 28*x*x - 84*x +
63


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| (4x2-12x+9)y2+(4x2-12x+9)y+28x2-84x+63   |
+------------------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	fp := factor(p)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| (2x-3)2(y2+y+7)   |
+-------------------+




.. spadType

:sub:`Type: Factored Polynomial Integer`



You can differentiate with respect to a variable.


.. spadInput
::

	D(p,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| (8x-12)y2+(8x-12)y+56x-84   |
+-----------------------------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	D(fp,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| 4(2x-3)(y2+y+7)   |
+-------------------+




.. spadType

:sub:`Type: Factored Polynomial Integer`




.. spadInput
::

	numberOfFactors(%)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`







