.. status: ok


9.40 LazardSetSolvingPackage
----------------------------

The LazardSetSolvingPackage package constructor solves polynomial
systems by means of Lazard triangular sets. However one condition is
relaxed: Regular triangular sets whose saturated ideals have positive
dimension are not necessarily normalized.

The decompositions are computed in two steps. First the algorithm of
Moreno Maza (implemented in the RegularTriangularSet domain constructor)
is called. Then the resulting decompositions are converted into lists of
square-free regular triangular sets and the redundant components are
removed. Moreover, zero-dimensional regular triangular sets are
normalized.

Note that the way of understanding triangular decompositions is detailed
in the example of the RegularTriangularSet constructor.

The LazardSetSolvingPackage constructor takes six arguments. The first
one, R, is the coefficient ring of the polynomials; it must belong to
the category GcdDomain. The second one, E, is the exponent monoid of the
polynomials; it must belong to the category OrderedAbelianMonoidSup. the
third one, V, is the ordered set of variables; it must belong to the
category OrderedSet. The fourth one is the polynomial ring; it must
belong to the category RecursivePolynomialCategory(R,E,V). The fifth one
is a domain of the category RegularTriangularSetCategory(R,E,V,P) and
the last one is a domain of the category
SquareFreeRegularTriangularSetCategory(R,E,V,P). The abbreviation for
LazardSetSolvingPackage is LAZM3PK.

 N.B. For the purpose of solving zero-dimensional algebraic systems, see
also LexTriangularPackage and ZeroDimensionalSolvePackage. These
packages are easier to call than LAZM3PK. Moreover, the
ZeroDimensionalSolvePackage package provides operations to compute
either the complex roots or the real roots.

We illustrate now the use of the LazardSetSolvingPackage package
constructor with two examples (Butcher and Vermeer).

Define the coefficient ring.


.. spadInput
::

	R := Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| Integer   |
+-----------+




.. spadType

:sub:`Type: Domain`



Define the list of variables,


.. spadInput
::

	ls : List Symbol := [b1,x,y,z,t,v,u,w]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| [b1,x,y,z,t,v,u,w]   |
+----------------------+




.. spadType

:sub:`Type: List Symbol`



and make it an ordered set:


.. spadInput
::

	V := OVAR(ls)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| OrderedVariableList[b1,x,y,z,t,v,u,w]   |
+-----------------------------------------+




.. spadType

:sub:`Type: Domain`



then define the exponent monoid.


.. spadInput
::

	E := IndexedExponents V


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| IndexedExponentsOrderedVariableList[b1,x,y,z,t,v,u,w]   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Define the polynomial ring.


.. spadInput
::

	P := NSMP(R, V)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------+
| NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[b1,x,y,z,t,v,u,w])   |
+------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Let the variables be polynomial.


.. spadInput
::

	b1: P := 'b1


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| b1   |
+------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	x: P := 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	y: P := 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	z: P := 'z


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| z   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	t: P := 't


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| t   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	u: P := 'u


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| u   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	v: P := 'v


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| v   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	w: P := 'w


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| w   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])



Now call the RegularTriangularSet domain constructor.


.. spadInput
::

	T := REGSET(R,E,V,P)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RegularTriangularSet(Integer,  IndexedExponentsOrderedVariableList[b1,x,y,z,t,v,u,w],  OrderedVariableList[b1,x,y,z,t,v,u,w],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[b1,x,y,z,t,v,u,w]))   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Define a polynomial system (the Butcher example).


.. spadInput
::

	p0 := b1 + y + z - t - w


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| b1+y+z-t-w   |
+--------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	p1 := 2*z*u + 2*y*v + 2*t*w - 2*w^2 - w - 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| 2vy+2uz+2wt-2w2-w-1   |
+-----------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	p2 := 3*z*u^2 + 3*y*v^2 - 3*t*w^2 + 3*w^3 + 3*w^2 - t + 4*w


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| 3v2y+3u2z+(-3w2-1)t+3w3+3w2+4w   |
+----------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	p3 := 6*x*z*v - 6*t*w^2 + 6*w^3 - 3*t*w + 6*w^2 - t + 4*w


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| 6vzx+(-6w2-3w-1)t+6w3+6w2+4w   |
+--------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	p4 := 4*z*u^3+ 4*y*v^3+ 4*t*w^3- 4*w^4 - 6*w^3+ 4*t*w-
10*w^2- w- 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| 4v3y+4u3z+(4w3+4w)t-4w4-6w3-10w2-w-1   |
+----------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	p5 := 8*x*z*u*v +8*t*w^3 -8*w^4 +4*t*w^2 -12*w^3 +4*t*w
-14*w^2 -3*w -1


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| 8uvzx+(8w3+4w2+4w)t-8w4-12w3-14w2-3w-1   |
+------------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	p6 := 12*x*z*v^2+12*t*w^3 -12*w^4 +12*t*w^2 -18*w^3 +8*t*w
-14*w^2 -w -1


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| 12v2zx+(12w3+12w2+8w)t-12w4-18w3-14w2-w-1   |
+---------------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	p7 := -24*t*w^3 + 24*w^4 - 24*t*w^2 + 36*w^3 - 8*t*w + 26*w^2 +
7*w + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| (-24w3-24w2-8w)t+24w4+36w3+26w2+7w+1   |
+----------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	lp := [p0, p1, p2, p3, p4, p5, p6, p7]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [b1+y+z-t-w,2vy+2uz+2wt-2w2-w-1,3v2y+3u2z+(-3w2-1)t+3w3+3w2+4w,6vzx+(-6w2-3w-1)t+6w3+6w2+4w,4v3y+4u3z+(4w3+4w)t-4w4-6w3-10w2-w-1,8uvzx+(8w3+4w2+4w)t-8w4-12w3-14w2-3w-1,12v2zx+(12w3+12w2+8w)t-12w4-18w3-14w2-w-1,(-24w3-24w2-8w)t+24w4+36w3+26w2+7w+1]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])



First of all, let us solve this system in the sense of Lazard by means
of the REGSET constructor:


.. spadInput
::

	lts := zeroSetSplit(lp,false)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [{w+1,u,v,t+1,b1+y+z+2},{w+1,v,t+1,z,b1+y+2},{w+1,t+1,z,y,b1+2},{w+1,v-u,t+1,y+z,x,b1+2},{w+1,u,t+1,y,x,b1+z+2},{144w5+216w4+96w3+6w2-11w-1,(12w2+9w+1)u-72w5-108w4-42w3-9w2-3w,(12w2+9w+1)v+36w4+54w3+18w2,(24w3+24w2+8w)t-24w4-36w3-26w2-7w-1,(12uv-12u2)z+(12wv+12w2+4)t+(3w-5)v+36w4+42w3+6w2-16w,2vy+2uz+2wt-2w2-w-1,6vzx+(-6w2-3w-1)t+6w3+6w2+4w,b1+y+z-t-w}]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [b1,x,y,z,t,v,u,w], OrderedVariableList
[b1,x,y,z,t,v,u,w], NewSparseMultivariatePolynomial(
Integer,OrderedVariableList [b1,x,y,z,t,v,u,w]))



We can get the dimensions of each component of a decomposition as
follows.


.. spadInput
::

	[coHeight(ts) for ts in lts]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [3,3,3,2,2,0]   |
+-----------------+




.. spadType

:sub:`Type: List NonNegativeInteger`



The first five sets have a simple shape. However, the last one, which
has dimension zero, can be simplified by using Lazard triangular sets.

Thus we call the SquareFreeRegularTriangularSet domain constructor,


.. spadInput
::

	ST := SREGSET(R,E,V,P)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SquareFreeRegularTriangularSet(Integer,  IndexedExponentsOrderedVariableList[b1,x,y,z,t,v,u,w],  OrderedVariableList[b1,x,y,z,t,v,u,w],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[b1,x,y,z,t,v,u,w]))   |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



and set the LAZM3PK package constructor to our situation.


.. spadInput
::

	pack := LAZM3PK(R,E,V,P,T,ST)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| LazardSetSolvingPackage(Integer,  IndexedExponentsOrderedVariableList[b1,x,y,z,t,v,u,w],  OrderedVariableList[b1,x,y,z,t,v,u,w],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[b1,x,y,z,t,v,u,w]),  RegularTriangularSet(Integer,  IndexedExponentsOrderedVariableList[b1,x,y,z,t,v,u,w],  OrderedVariableList[b1,x,y,z,t,v,u,w],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[b1,x,y,z,t,v,u,w])),  SquareFreeRegularTriangularSet(Integer,  IndexedExponentsOrderedVariableList[b1,x,y,z,t,v,u,w],  OrderedVariableList[b1,x,y,z,t,v,u,w],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[b1,x,y,z,t,v,u,w])))   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



We are ready to solve the system by means of Lazard triangular sets:


.. spadInput
::

	zeroSetSplit(lp,false)$pack


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [{w+1,t+1,z,y,b1+2},{w+1,v,t+1,z,b1+y+2},{w+1,u,v,t+1,b1+y+z+2},{w+1,v-u,t+1,y+z,x,b1+2},{w+1,u,t+1,y,x,b1+z+2},{144w5+216w4+96w3+6w2-11w-1,u-24w4-36w3-14w2+w+1,3v-48w4-60w3-10w2+8w+2,t-24w4-36w3-14w2-w+1,486z-2772w4-4662w3-2055w2+30w+127,2916y-22752w4-30312w3-8220w2+2064w+1561,356x-3696w4-4536w3-968w2+822w+371,2916b1-30600w4-46692w3-20274w2-8076w+593}]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List SquareFreeRegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [b1,x,y,z,t,v,u,w], OrderedVariableList
[b1,x,y,z,t,v,u,w], NewSparseMultivariatePolynomial(Integer,
OrderedVariableList [b1,x,y,z,t,v,u,w]))



We see the sixth triangular set is nicer now: each one of its
polynomials has a constant initial.

We follow with the Vermeer example. The ordering is the usual one for
this system.

Define the polynomial system.


.. spadInput
::

	f0 := (w - v) ^ 2 + (u - t) ^ 2 - 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| t2-2ut+v2-2wv+u2+w2-1   |
+-------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	f1 := t ^ 2 - v ^ 3


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| t2-v3   |
+---------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	f2 := 2 * t * (w - v) + 3 * v ^ 2 * (u - t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| (-3v2-2v+2w)t+3uv2   |
+----------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	f3 := (3 * z * v ^ 2 - 1) * (2 * z * t - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| 6v2tz2+(-2t-3v2)z+1   |
+-----------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])




.. spadInput
::

	lf := [f0, f1, f2, f3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------+
| [t2-2ut+v2-2wv+u2+w2-1,t2-v3,(-3v2-2v+2w)t+3uv2,6v2tz2+(-2t-3v2)z+1]   |
+------------------------------------------------------------------------+




.. spadType

:sub:`Type: List NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[b1,x,y,z,t,v,u,w])



First of all, let us solve this system in the sense of Kalkbrener by
means of the REGSET constructor:


.. spadInput
::

	zeroSetSplit(lf,true)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [{729u6+(-1458w3+729w2-4158w-1685)u4+(729w6-1458w5-2619w4-4892w3-297w2+5814w+427)u2+729w8+216w7-2900w6-2376w5+3870w4+4072w3-1188w2-1656w+529,(2187u4+(-4374w3-972w2-12474w-2868)u2+2187w6-1944w5-10125w4-4800w3+2501w2+4968w-1587)v+(1944w3-108w2)u2+972w6+3024w5-1080w4+496w3+1116w2,(3v2+2v-2w)t-3uv2,((4v-4w)t-6uv2)z2+(2t+3v2)z-1}]   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [b1,x,y,z,t,v,u,w], OrderedVariableList
[b1,x,y,z,t,v,u,w], NewSparseMultivariatePolynomial(Integer,
OrderedVariableList [b1,x,y,z,t,v,u,w]))



We have obtained one regular chain (i.e. regular triangular set) with
dimension 1. This set is in fact a characterist set of the (radical of)
of the ideal generated by the input system lf. Thus we have only the
generic points of the variety associated with lf (for the elimination
ordering given by ls).

So let us get now a full description of this variety.

Hence, we solve this system in the sense of Lazard by means of the
REGSET constructor:


.. spadInput
::

	zeroSetSplit(lf,false)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [{729u6+(-1458w3+729w2-4158w-1685)u4+(729w6-1458w5-2619w4-4892w3-297w2+5814w+427)u2+729w8+216w7-2900w6-2376w5+3870w4+4072w3-1188w2-1656w+529,(2187u4+(-4374w3-972w2-12474w-2868)u2+2187w6-1944w5-10125w4-4800w3+2501w2+4968w-1587)v+(1944w3-108w2)u2+972w6+3024w5-1080w4+496w3+1116w2,(3v2+2v-2w)t-3uv2,((4v-4w)t-6uv2)z2+(2t+3v2)z-1},{27w4+4w3-54w2-36w+23,u,(12w+2)v-9w2-2w+9,6t2-2v-3w2+2w+3,2tz-1},{59049w6+91854w5-45198w4+145152w3+63549w2+60922w+21420,(31484448266904w5-18316865522574w4+23676995746098w3+6657857188965w2+8904703998546w+3890631403260)u2+94262810316408w5-82887296576616w4+89801831438784w3+28141734167208w2+38070359425432w+16003865949120,(243w2+36w+85)v2+(-81u2-162w3+36w2+154w+72)v-72w3+4w2,(3v2+2v-2w)t-3uv2,((4v-4w)t-6uv2)z2+(2t+3v2)z-1},{27w4+4w3-54w2-36w+23,u,(12w+2)v-9w2-2w+9,6t2-2v-3w2+2w+3,3v2z-1}]   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [b1,x,y,z,t,v,u,w], OrderedVariableList
[b1,x,y,z,t,v,u,w], NewSparseMultivariatePolynomial(Integer,
OrderedVariableList [b1,x,y,z,t,v,u,w]))



We retrieve our regular chain of dimension 1 and we get three regular
chains of dimension 0 corresponding to the degenerated cases. We want
now to simplify these zero-dimensional regular chains by using Lazard
triangular sets. Moreover, this will allow us to prove that the above
decomposition has no redundant component. N.B. Generally, decompositions
computed by the REGSET constructor do not have redundant components.
However, to be sure that no redundant component occurs one needs to use
the SREGSET or LAZM3PK constructors.

So let us solve the input system in the sense of Lazard by means of the
LAZM3PK constructor:


.. spadInput
::

	zeroSetSplit(lf,false)$pack


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [{729u6+(-1458w3+729w2-4158w-1685)u4+(729w6-1458w5-2619w4-4892w3-297w2+5814w+427)u2+729w8+216w7-2900w6-2376w5+3870w4+4072w3-1188w2-1656w+529,(2187u4+(-4374w3-972w2-12474w-2868)u2+2187w6-1944w5-10125w4-4800w3+2501w2+4968w-1587)v+(1944w3-108w2)u2+972w6+3024w5-1080w4+496w3+1116w2,(3v2+2v-2w)t-3uv2,((4v-4w)t-6uv2)z2+(2t+3v2)z-1},{81w2+18w+28,729u2-1890w-533,81v2+(-162w+27)v-72w-112,11881t+(972w+2997)uv+(-11448w-11536)u,641237934604288z2+(((78614584763904w+26785578742272)u+236143618655616w+70221988585728)v+(358520253138432w+101922133759488)u+142598803536000w+54166419595008)z+(32655103844499w-44224572465882)uv+(43213900115457w-32432039102070)u},{27w4+4w3-54w2-36w+23,u,218v-162w3+3w2+160w+153,109t2-27w3-54w2+63w+80,1744z+(-1458w3+27w2+1440w+505)t},{27w4+4w3-54w2-36w+23,u,218v-162w3+3w2+160w+153,109t2-27w3-54w2+63w+80,1308z+162w3-3w2-814w-153},{729w4+972w3-1026w2+1684w+765,81u2+72w2+16w-72,702v-162w3-225w2+40w-99,11336t+(324w3-603w2-1718w-1557)u,595003968z2+((-963325386w3-898607682w2+1516286466w-3239166186)u-1579048992w3-1796454288w2+2428328160w-4368495024)z+(9713133306w3+9678670317w2-16726834476w+28144233593)u}]   |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List SquareFreeRegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [b1,x,y,z,t,v,u,w], OrderedVariableList
[b1,x,y,z,t,v,u,w], NewSparseMultivariatePolynomial(Integer,
OrderedVariableList [b1,x,y,z,t,v,u,w]))



Due to square-free factorization, we obtained now four zero-dimensional
regular chains. Moreover, each of them is normalized (the initials are
constant). Note that these zero-dimensional components may be
investigated further with the ZeroDimensionalSolvePackage package
constructor.



