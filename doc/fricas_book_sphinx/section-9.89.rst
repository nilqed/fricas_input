.. status: ok



9.89 XPolynomial
----------------

The XPolynomial domain constructor implements multivariate polynomials
whose set of variables is Symbol. These variables do not commute. The
only parameter of this construtor is the coefficient ring which may be
non-commutative. However, coefficients and variables commute. The
representation of the polynomials is recursive. The abbreviation for
XPolynomial is XPOLY.

Other constructors like XPolynomialRing, XRecursivePolynomial as well as
XDistributedPolynomial, LiePolynomial and XPBWPolynomial implement
multivariate polynomials in non-commutative variables.

We illustrate now some of the facilities of the XPOLY domain
constructor.

Define a polynomial ring over the integers.


.. spadInput
::

	poly := XPolynomial(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| XPolynomialInteger   |
+----------------------+




.. spadType

:sub:`Type: Domain`



Define a first polynomial,


.. spadInput
::

	pr: poly := 2*x + 3*y-5


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -5+x2+y3   |
+------------+




.. spadType

:sub:`Type: XPolynomial Integer`



and a second one.


.. spadInput
::

	pr2: poly := pr*pr


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| 25+x(-20+x4+y6)+y(-30+x6+y9)   |
+--------------------------------+




.. spadType

:sub:`Type: XPolynomial Integer`



Rewrite pr in a distributive way,


.. spadInput
::

	pd := expand pr


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -5+2x+3y   |
+------------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Integer)`



compute its square,


.. spadInput
::

	pd2 := pd*pd


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| 25-20x-30y+4x2+6xy+6yx+9y2   |
+------------------------------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Integer)`



and checks that:


.. spadInput
::

	expand(pr2) - pd2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Integer)`



We define:


.. spadInput
::

	qr := pr^3


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------+
| -125+x(150+x(-60+x8+y12)+y(-90+x12+y18))+y(225+x(-90+x12+y18)+y(-135+x18+y27))   |
+----------------------------------------------------------------------------------+




.. spadType

:sub:`Type: XPolynomial Integer`



and:


.. spadInput
::

	qd := pd^3


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------+
| -125+150x+225y-60x2-90xy-90yx-135y2+8x3+12x2y+12xyx+18xy2+12yx2+18yxy+18y2x+27y3   |
+------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Integer)`



We truncate qd at degree 3:


.. spadInput
::

	trunc(qd,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| -125+150x+225y-60x2-90xy-90yx-135y2   |
+---------------------------------------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Integer)`



The same for qr:


.. spadInput
::

	trunc(qr,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| -125+x(150+x(-60)+y(-90))+y(225+x(-90)+y(-135))   |
+---------------------------------------------------+




.. spadType

:sub:`Type: XPolynomial Integer`



We define:


.. spadInput
::

	Word := OrderedFreeMonoid Symbol


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| OrderedFreeMonoidSymbol   |
+---------------------------+




.. spadType

:sub:`Type: Domain`



and:


.. spadInput
::

	w: Word := x*y^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| xy2   |
+-------+




.. spadType

:sub:`Type: OrderedFreeMonoid Symbol`



The we can compute the right-quotient of qr by r:


.. spadInput
::

	rquo(qr,w)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 18   |
+------+




.. spadType

:sub:`Type: XPolynomial Integer`



and the shuffle-product of pr by r:


.. spadInput
::

	sh(pr,w::poly)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| x(xyy4+y(xy2+y(-5+x2+y9)))+yxyy3   |
+------------------------------------+




.. spadType

:sub:`Type: XPolynomial Integer`





