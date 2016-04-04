.. status: ok


9.16 DistributedMultivariatePolynomial
--------------------------------------

DistributedMultivariatePolynomial which is abbreviated as DMP and
HomogeneousDistributedMultivariatePolynomial, which is abbreviated as
HDMP, are very similar to MultivariatePolynomial except that they are
represented and displayed in a non-recursive manner.


.. spadInput
::

	(d1,d2,d3) : DMP([z,y,x],FRAC INT)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The constructor DMP orders its monomials lexicographically while HDMP
orders them by total order refined by reverse lexicographic order.


.. spadInput
::

	d1 := -4*z + 4*y^2*x + 16*x^2 + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| -4z+4y2x+16x2+1   |
+-------------------+




.. spadType

:sub:`Type: DistributedMultivariatePolynomial([z,y,x],Fraction Integer)`




.. spadInput
::

	d2 := 2*z*y^2 + 4*x + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 2zy2+4x+1   |
+-------------+




.. spadType

:sub:`Type: DistributedMultivariatePolynomial([z,y,x],Fraction Integer)`




.. spadInput
::

	d3 := 2*z*x^2 - 2*y^2 - x


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 2zx2-2y2-x   |
+--------------+




.. spadType

:sub:`Type: DistributedMultivariatePolynomial([z,y,x],Fraction Integer)`



These constructors are mostly used in Gröbner basis calculations.


.. spadInput
::

	groebner [d1,d2,d3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [z-15682745x6-1264305x5+6305x4+182549x3-2047610x2-1032745x-285710980,y2+1122745x6-84305x5-1264305x4-13549x3+84305x2+17722745x+22745,x7+294x6-1716x4-118x3+132x2+1516x+14]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List DistributedMultivariatePolynomial([z,y,x],Fraction Integer)`




.. spadInput
::

	(n1,n2,n3) : HDMP([z,y,x],FRAC INT)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	n1 := d1


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| 4y2x+16x2-4z+1   |
+------------------+




.. spadType

:sub:`Type: HomogeneousDistributedMultivariatePolynomial([z,y,x],Fraction`
Integer)




.. spadInput
::

	n2 := d2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 2zy2+4x+1   |
+-------------+




.. spadType

:sub:`Type: HomogeneousDistributedMultivariatePolynomial([z,y,x],Fraction`
Integer)




.. spadInput
::

	n3 := d3


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 2zx2-2y2-x   |
+--------------+




.. spadType

:sub:`Type: HomogeneousDistributedMultivariatePolynomial([z,y,x],Fraction`
Integer)



Note that we get a different Gröbner basis when we use the HDMP
polynomials, as expected.


.. spadInput
::

	groebner [n1,n2,n3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------+
| [y4+2x3-32x2+12z-18,x4+294x3-18y2-74zx-916x-14,zy2+2x+12,y2x+4x2-z+14,zx2-y2-12x,z2-4y2+2x2-14z-32x]   |
+--------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List HomogeneousDistributedMultivariatePolynomial([z,y,x],Fraction`
Integer)



GeneralDistributedMultivariatePolynomial is somewhat more flexible in
the sense that as well as accepting a list of variables to specify the
variable ordering, it also takes a predicate on exponent vectors to
specify the term ordering. With this polynomial type the user can
experiment with the effect of using completely arbitrary term orderings.
This flexibility is mostly important for algorithms such as Gr\\"{o}bner
basis calculations which can be very sensitive to term ordering.

For more information on related topics, see
`ugIntroVariablesPage <ugIntroVariablesPage>`__ in Section
`ugIntroVariablesNumber <ugIntroVariablesNumber>`__ ,
`ugTypesConvertPage <ugTypesConvertPage>`__ in Section
`ugTypesConvertNumber <ugTypesConvertNumber>`__ ,
`PolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
,
`UnivariatePolynomialXmpPage <section-9.83.html#UnivariatePolynomialXmpPage>`__
, and
`MultivariatePolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
.



