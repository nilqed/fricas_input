.. status: ok


9.87 WuWenTsunTriangularSet
---------------------------

The WuWenTsunTriangularSet domain constructor implements the
characteristic set method of Wu Wen Tsun. This algorithm computes a list
of triangular sets from a list of polynomials such that the algebraic
variety defined by the given list of polynomials decomposes into the
union of the regular-zero sets of the computed triangular sets. The
constructor takes four arguments. The first one, R, is the coefficient
ring of the polynomials; it must belong to the category IntegralDomain.
The second one, E, is the exponent monoid of the polynomials; it must
belong to the category OrderedAbelianMonoidSup. The third one, V, is the
ordered set of variables; it must belong to the category OrderedSet. The
last one is the polynomial ring; it must belong to the category
RecursivePolynomialCategory(R,E,V). The abbreviation for
WuWenTsunTriangularSet is WUTSET.

Let us illustrate the facilities by an example.

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



Now call the WuWenTsunTriangularSet domain constructor.


.. spadInput
::

	T := WUTSET(R,E,V,P)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| WuWenTsunTriangularSet(Integer,  IndexedExponentsOrderedVariableList[x,y,z,t],  OrderedVariableList[x,y,z,t],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[x,y,z,t]))   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




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



Compute a characteristic set of the system.


.. spadInput
::

	characteristicSet(lp)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------+
| {z5-t4,t4z2y2+2t3z4y+(-t7+2t4-t)z6+t6z,(t3-1)z3x-z3y-t3}   |
+------------------------------------------------------------+




.. spadType

:sub:`Type: Union( WuWenTsunTriangularSet(Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList
[x,y,z,t])),...)



Solve the system.


.. spadInput
::

	zeroSetSplit(lp)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------+
| [{t,z,y,x},{t3-1,z5-t4,z3y+t3,zx2-t},{z5-t4,t4z2y2+2t3z4y+(-t7+2t4-t)z6+t6z,(t3-1)z3x-z3y-t3}]   |
+--------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List WuWenTsunTriangularSet(Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))



The RegularTriangularSet and SquareFreeRegularTriangularSet domain
constructors, the LazardSetSolvingPackage package constructors as well
as, SquareFreeRegularTriangularSet and ZeroDimensionalSolvePackage
package constructors also provide operations to compute triangular
decompositions of algebraic varieties. These five constructor use a
special kind of characteristic sets, called regular triangular sets.
These special characteristic sets have better properties than the
general ones. Regular triangular sets and their related concepts are
presented in the paper On the Theories of Triangular sets By P. Aubry,
D. Lazard and M. Moreno Maza (to appear in the Journal of Symbolic
Computation). The decomposition algorithm (due to the third author)
available in the four above constructors provide generally better
timings than the characteristic set method. In fact, the WUTSET
constructor remains interesting for the purpose of manipulating
characteristic sets whereas the other constructors are more convenient
for solving polynomial systems.

Note that the way of understanding triangular decompositions is detailed
in the example of the RegularTriangularSet constructor.



