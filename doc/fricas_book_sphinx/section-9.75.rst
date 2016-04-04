.. status: ok


9.75 SquareFreeRegularTriangularSet
-----------------------------------

The SquareFreeRegularTriangularSet domain constructor implements
square-free regular triangular sets. See the RegularTriangularSet domain
constructor for general regular triangular sets. Let T be a regular
triangular set consisting of polynomials t1, ..., tm ordered by
increasing main variables. The regular triangular set T is square-free
if T is empty or if t1, ..., tm-1 is square-free and if the polynomial
tm is square-free as a univariate polynomial with coefficients in the
tower of simple extensions associated with t1, ..., tm-1.

The main interest of square-free regular triangular sets is that their
associated towers of simple extensions are product of fields.
Consequently, the saturated ideal of a square-free regular triangular
set is radical. This property simplifies some of the operations related
to regular triangular sets. However, building square-free regular
triangular sets is generally more expensive than building general
regular triangular sets.

As the RegularTriangularSet domain constructor, the
SquareFreeRegularTriangularSet domain constructor also implements a
method for solving polynomial systems by means of regular triangular
sets. This is in fact the same method with some adaptations to take into
account the fact that the computed regular chains are square-free. Note
that it is also possible to pass from a decomposition into general
regular triangular sets to a decomposition into square-free regular
triangular sets. This conversion is used internally by the
LazardSetSolvingPackage package constructor.

 N.B. When solving polynomial systems with the
SquareFreeRegularTriangularSet domain constructor or the
LazardSetSolvingPackage package constructor, decompositions have no
redundant components. See also LexTriangularPackage and
ZeroDimensionalSolvePackage for the case of algebraic systems with a
finite number of (complex) solutions.

We shall explain now how to use the constructor
SquareFreeRegularTriangularSet.

This constructor takes four arguments. The first one, R, is the
coefficient ring of the polynomials; it must belong to the category
GcdDomain. The second one, E, is the exponent monoid of the polynomials;
it must belong to the category OrderedAbelianMonoidSup. the third one,
V, is the ordered set of variables; it must belong to the category
OrderedSet. The last one is the polynomial ring; it must belong to the
category RecursivePolynomialCategory(R,E,V). The abbreviation for
SquareFreeRegularTriangularSet is SREGSET.

Note that the way of understanding triangular decompositions is detailed
in the example of the RegularTriangularSet constructor.

Let us illustrate the use of this constructor with one example
(Donati-Traverso). Define the coefficient ring.


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

	ls : List Symbol := [x,y,z,t]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [x,y,z,t]   |
+-------------+




.. spadType

:sub:`Type: List Symbol`



and make it an ordered set;


.. spadInput
::

	V := OVAR(ls)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| OrderedVariableList[x,y,z,t]   |
+--------------------------------+




.. spadType

:sub:`Type: Domain`



then define the exponent monoid.


.. spadInput
::

	E := IndexedExponents V


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| IndexedExponentsOrderedVariableList[x,y,z,t]   |
+------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Define the polynomial ring.


.. spadInput
::

	P := NSMP(R, V)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------+
| NewSparseMultivariatePolynomial(Integer,OrderedVariableList[x,y,z,t])   |
+-------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Let the variables be polynomial.


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
[x,y,z,t])




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
[x,y,z,t])




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
[x,y,z,t])




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
[x,y,z,t])



Now call the SquareFreeRegularTriangularSet domain constructor.


.. spadInput
::

	ST := SREGSET(R,E,V,P)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SquareFreeRegularTriangularSet(Integer,  IndexedExponentsOrderedVariableList[x,y,z,t],  OrderedVariableList[x,y,z,t],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[x,y,z,t]))   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Define a polynomial system.


.. spadInput
::

	p1 := x ^ 31 - x ^ 6 - x - y


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| x31-x6-x-y   |
+--------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	p2 := x ^ 8 - z


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x8-z   |
+--------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	p3 := x ^ 10 - t


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| x10-t   |
+---------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	lp := [p1, p2, p3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [x31-x6-x-y,x8-z,x10-t]   |
+---------------------------+




.. spadType

:sub:`Type: List NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])



First of all, let us solve this system in the sense of Kalkbrener.


.. spadInput
::

	zeroSetSplit(lp)$ST


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| [{z5-t4,tzy2+2z3y-t8+2t5+t3-t2,(t4-t)x-ty-z2}]   |
+--------------------------------------------------+




.. spadType

:sub:`Type: List SquareFreeRegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))



And now in the sense of Lazard (or Wu and other authors).


.. spadInput
::

	zeroSetSplit(lp,false)$ST


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------+
| [{z5-t4,tzy2+2z3y-t8+2t5+t3-t2,(t4-t)x-ty-z2},{t3-1,z5-t,ty+z2,zx2-t},{t,z,y,x}]   |
+------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List SquareFreeRegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))



Now to see the difference with the RegularTriangularSet domain
constructor, we define:


.. spadInput
::

	T := REGSET(R,E,V,P)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RegularTriangularSet(Integer,IndexedExponentsOrderedVariableList[x,y,z,t],OrderedVariableList[x,y,z,t],NewSparseMultivariatePolynomial(Integer,OrderedVariableList[x,y,z,t]))   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



and compute:


.. spadInput
::

	lts := zeroSetSplit(lp,false)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------+
| [{z5-t4,tzy2+2z3y-t8+2t5+t3-t2,(t4-t)x-ty-z2},{t3-1,z5-t,tzy2+2z3y+1,zx2-t},{t,z,y,x}]   |
+------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))



If you look at the second set in both decompositions in the sense of
Lazard, you will see that the polynomial with main variable y is not the
same.

Let us understand what has happened.

We define:


.. spadInput
::

	ts := lts.2


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| {t3-1,z5-t,tzy2+2z3y+1,zx2-t}   |
+---------------------------------+




.. spadType

:sub:`Type: RegularTriangularSet(Integer, IndexedExponents OrderedVariableList`
[x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))




.. spadInput
::

	pol := select(ts,'y)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| tzy2+2z3y+1   |
+---------------+




.. spadType

:sub:`Type: Union( NewSparseMultivariatePolynomial(Integer,`
OrderedVariableList [x,y,z,t]),...)




.. spadInput
::

	tower := collectUnder(ts,'y)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| {t3-1,z5-t}   |
+---------------+




.. spadType

:sub:`Type: RegularTriangularSet(Integer, IndexedExponents OrderedVariableList`
[x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))




.. spadInput
::

	pack := RegularTriangularSetGcdPackage(R,E,V,P,T)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RegularTriangularSetGcdPackage(Integer,  IndexedExponentsOrderedVariableList[x,y,z,t],  OrderedVariableList[x,y,z,t],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[x,y,z,t]),  RegularTriangularSet(Integer,  IndexedExponentsOrderedVariableList[x,y,z,t],  OrderedVariableList[x,y,z,t],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[x,y,z,t])))   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Then we compute:


.. spadInput
::

	toseSquareFreePart(pol,tower)$pack


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [[val=ty+z2,tower={t3-1,z5-t}]]   |
+-----------------------------------+




.. spadType

:sub:`Type: List Record(val: NewSparseMultivariatePolynomial(Integer,`
OrderedVariableList [x,y,z,t]), tower: RegularTriangularSet(Integer,
IndexedExponents OrderedVariableList [x,y,z,t], OrderedVariableList
[x,y,z,t], NewSparseMultivariatePolynomial(Integer, OrderedVariableList
[x,y,z,t])))





