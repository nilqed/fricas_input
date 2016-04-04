.. status: ok



9.35 IntegerLinearDependence
----------------------------

The elements v1,…,vn of a module M over a ring R are said to be linearly
dependent over R if there exist c1,…,cn in R, not all 0, such that
c1v1+…cnvn=0. If such ci's exist, they form what is called a linear
dependence relation over R for the vi's.

The package IntegerLinearDependence provides functions for testing
whether some elements of a module over the integers are linearly
dependent over the integers, and to find the linear dependence
relations, if any.

Consider the domain of two by two square matrices with integer entries.


.. spadInput
::

	M := SQMATRIX(2,INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| SquareMatrix(2,Integer)   |
+---------------------------+




.. spadType

:sub:`Type: Domain`



Now create three such matrices.


.. spadInput
::

	m1: M := squareMatrix matrix [ [1, 2], [0, -1] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [120-1]   |
+-----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	m2: M := squareMatrix matrix [ [2, 3], [1, -2] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [231-2]   |
+-----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	m3: M := squareMatrix matrix [ [3, 4], [2, -3] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [342-3]   |
+-----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



This tells you whether m1, m2 and m3 are linearly dependent over the
integers.


.. spadInput
::

	linearlyDependentOverZ? vector [m1, m2, m3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Since they are linearly dependent, you can ask for the dependence
relation.


.. spadInput
::

	c := linearDependenceOverZ vector [m1, m2, m3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [1,-2,1]   |
+------------+




.. spadType

:sub:`Type: Union(Vector Integer,...)`



This means that the following linear combination should be 0.


.. spadInput
::

	c.1 * m1 + c.2 * m2 + c.3 * m3


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [0000]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



When a given set of elements are linearly dependent over R, this also
means that at least one of them can be rewritten as a linear combination
of the others with coefficients in the quotient field of R.

To express a given element in terms of other elements, use the operation
solveLinearlyOverQsolveLinearlyOverQIntegerLinearDependence.


.. spadInput
::

	solveLinearlyOverQ(vector [m1, m3], m2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [12,12]   |
+-----------+




.. spadType

:sub:`Type: Union(Vector Fraction Integer,...)`





