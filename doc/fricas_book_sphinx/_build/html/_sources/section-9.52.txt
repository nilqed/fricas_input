.. status: ok


9.52 Matrix
-----------

The Matrix domain provides arithmetic operations on matrices and
standard functions from linear algebra. This domain is similar to the
TwoDimensionalArray domain, except that the entries for Matrix must
belong to a Ring.



9.52.1 Creating Matrices
~~~~~~~~~~~~~~~~~~~~~~~~

There are many ways to create a matrix from a collection of values or
from existing matrices.

If the matrix has almost all items equal to the same value, use
newnewMatrix to create a matrix filled with that value and then reset
the entries that are different.


.. spadInput
::

	m : Matrix(Integer) := new(3,3,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [000000000]   |
+---------------+




.. spadType

:sub:`Type: Matrix Integer`



To change the entry in the second row, third column to 5, use
seteltseteltMatrix.


.. spadInput
::

	setelt(m,2,3,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 5   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



An alternative syntax is to use assignment.


.. spadInput
::

	m(1,2) := 10


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



The matrix was destructively modified.


.. spadInput
::

	m


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| [0100005000]   |
+----------------+




.. spadType

:sub:`Type: Matrix Integer`



If you already have the matrix entries as a list of lists, use
matrixmatrixMatrix.


.. spadInput
::

	matrix [ [1,2,3,4],[0,9,8,7] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [12340987]   |
+--------------+




.. spadType

:sub:`Type: Matrix Integer`



If the matrix is diagonal, use diagonalMatrixdiagonalMatrixMatrix.


.. spadInput
::

	dm := diagonalMatrix [1,x^2,x^3,x^4,x^5]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [100000x200000x300000x400000x5]   |
+-----------------------------------+




.. spadType

:sub:`Type: Matrix Polynomial Integer`



Use setRowsetRowMatrix and setColumnsetColumnMatrix to change a row or
column of a matrix.


.. spadInput
::

	setRow!(dm,5,vector [1,1,1,1,1])


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [100000x200000x300000x4011111]   |
+----------------------------------+




.. spadType

:sub:`Type: Matrix Polynomial Integer`




.. spadInput
::

	setColumn!(dm,2,vector [y,y,y,y,y])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [1y0000y0000yx3000y0x401y111]   |
+---------------------------------+




.. spadType

:sub:`Type: Matrix Polynomial Integer`



Use copycopyMatrix to make a copy of a matrix.


.. spadInput
::

	cdm := copy(dm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [1y0000y0000yx3000y0x401y111]   |
+---------------------------------+




.. spadType

:sub:`Type: Matrix Polynomial Integer`



This is useful if you intend to modify a matrix destructively but want a
copy of the original.


.. spadInput
::

	setelt(dm,4,1,1-x^7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| -x7+1   |
+---------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	[dm,cdm]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------+
| [[1y0000y0000yx300-x7+1y0x401y111],[1y0000y0000yx3000y0x401y111]]   |
+---------------------------------------------------------------------+




.. spadType

:sub:`Type: List Matrix Polynomial Integer`



Use subMatrixsubMatrixMatrix to extract part of an existing matrix. The
syntax is subMatrix(m, firstrow, lastrow, firstcol, lastcol).


.. spadInput
::

	subMatrix(dm,2,3,2,4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [y00yx30]   |
+-------------+




.. spadType

:sub:`Type: Matrix Polynomial Integer`



To change a submatrix, use setsubMatrixsetsubMatrixMatrix.


.. spadInput
::

	d := diagonalMatrix [1.2,-1.3,1.4,-1.5]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| [1.20.00.00.00.0-1.30.00.00.00.01.40.00.00.00.0-1.5]   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: Matrix Float`



If e is too big to fit where you specify, an error message is displayed.
Use subMatrixsubMatrixMatrix to extract part of e, if necessary.


.. spadInput
::

	e := matrix [ [6.7,9.11],[-31.33,67.19] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| [6.79.11-31.3367.19]   |
+------------------------+




.. spadType

:sub:`Type: Matrix Float`



This changes the submatrix of d whose upper left corner is at the first
row and second column and whose size is that of e.


.. spadInput
::

	setsubMatrix!(d,1,2,e)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------+
| [1.26.79.110.00.0-31.3367.190.00.00.01.40.00.00.00.0-1.5]   |
+-------------------------------------------------------------+




.. spadType

:sub:`Type: Matrix Float`




.. spadInput
::

	d


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------+
| [1.26.79.110.00.0-31.3367.190.00.00.01.40.00.00.00.0-1.5]   |
+-------------------------------------------------------------+




.. spadType

:sub:`Type: Matrix Float`



Matrices can be joined either horizontally or vertically to make new
matrices.


.. spadInput
::

	a := matrix [ [1/2,1/3,1/4],[1/5,1/6,1/7] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [121314151617]   |
+------------------+




.. spadType

:sub:`Type: Matrix Fraction Integer`




.. spadInput
::

	b := matrix [ [3/5,3/7,3/11],[3/13,3/17,3/19] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| [3537311313317319]   |
+----------------------+




.. spadType

:sub:`Type: Matrix Fraction Integer`



Use horizConcathorizConcatMatrix to append them side to side. The two
matrices must have the same number of rows.


.. spadInput
::

	horizConcat(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [1213143537311151617313317319]   |
+----------------------------------+




.. spadType

:sub:`Type: Matrix Fraction Integer`



Use vertConcatvertConcatMatrix to stack one upon the other. The two
matrices must have the same number of columns.


.. spadInput
::

	vab := vertConcat(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [1213141516173537311313317319]   |
+----------------------------------+




.. spadType

:sub:`Type: Matrix Fraction Integer`



The operation transposetransposeMatrix is used to create a new matrix by
reflection across the main diagonal.


.. spadInput
::

	transpose vab


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [1215353131316373171417311319]   |
+----------------------------------+




.. spadType

:sub:`Type: Matrix Fraction Integer`







9.52.2 Operations on Matrices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS provides both left and right scalar multiplication.


.. spadInput
::

	m := matrix [ [1,2],[3,4] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [1234]   |
+----------+




.. spadType

:sub:`Type: Matrix Integer`




.. spadInput
::

	4 * m * (-5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [-20-40-60-80]   |
+------------------+




.. spadType

:sub:`Type: Matrix Integer`



You can add, subtract, and multiply matrices provided, of course, that
the matrices have compatible dimensions. If not, an error message is
displayed.


.. spadInput
::

	n := matrix([ [1,0,-2],[-3,5,1] ])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [10-2-351]   |
+--------------+




.. spadType

:sub:`Type: Matrix Integer`



This following product is defined but n * m is not.


.. spadInput
::

	m * n


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [-5100-920-2]   |
+-----------------+




.. spadType

:sub:`Type: Matrix Integer`



The operations nrowsnrowsMatrix and ncolsncolsMatrix return the number
of rows and columns of a matrix. You can extract a row or a column of a
matrix using the operations rowrowMatrix and columncolumnMatrix. The
object returned is a Vector.

Here is the third column of the matrix n.


.. spadInput
::

	vec := column(n,3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [-2,1]   |
+----------+




.. spadType

:sub:`Type: Vector Integer`



You can multiply a matrix on the left by a row vector and on the right
by a column vector.


.. spadInput
::

	vec * m


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [1,0]   |
+---------+




.. spadType

:sub:`Type: Vector Integer`



Of course, the dimensions of the vector and the matrix must be
compatible or an error message is returned.


.. spadInput
::

	m * vec


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [0,-2]   |
+----------+




.. spadType

:sub:`Type: Vector Integer`



The operation inverseinverseMatrix computes the inverse of a matrix if
the matrix is invertible, and returns "failed" if not.

This Hilbert matrix is invertible.


.. spadInput
::

	hilb := matrix([ [1/(i + j) for i in 1..3] for j in 1..3])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| [121314131415141516]   |
+------------------------+




.. spadType

:sub:`Type: Matrix Fraction Integer`




.. spadInput
::

	inverse(hilb)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| [72-240180-240900-720180-720600]   |
+------------------------------------+




.. spadType

:sub:`Type: Union(Matrix Fraction Integer,...)`



This matrix is not invertible.


.. spadInput
::

	mm := matrix([ [1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16] ])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| [12345678910111213141516]   |
+-----------------------------+




.. spadType

:sub:`Type: Matrix Integer`




.. spadInput
::

	inverse(mm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



The operation determinantdeterminantMatrix computes the determinant of a
matrix provided that the entries of the matrix belong to a
CommutativeRing.

The above matrix mm is not invertible and, hence, must have determinant
0.


.. spadInput
::

	determinant(mm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



The operation tracetraceSquareMatrix computes the trace of a square
matrix.


.. spadInput
::

	trace(mm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 34   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



The operation rankrankMatrix computes the rank of a matrix: the maximal
number of linearly independent rows or columns.


.. spadInput
::

	rank(mm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The operation nullitynullityMatrix computes the nullity of a matrix: the
dimension of its null space.


.. spadInput
::

	nullity(mm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The operation nullSpacenullSpaceMatrix returns a list containing a basis
for the null space of a matrix. Note that the nullity is the number of
elements in a basis for the null space.


.. spadInput
::

	nullSpace(mm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [[1,-2,1,0],[2,-3,0,1]]   |
+---------------------------+




.. spadType

:sub:`Type: List Vector Integer`



The operation rowEchelonrowEchelonMatrix returns the row echelon form of
a matrix. It is easy to see that the rank of this matrix is two and that
its nullity is also two.


.. spadInput
::

	rowEchelon(mm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| [12340481200000000]   |
+-----------------------+




.. spadType

:sub:`Type: Matrix Integer`



For more information on related topics, see
`ugIntroTwoDimPage <ugIntroTwoDimPage>`__ in Section
`ugIntroTwoDimNumber <ugIntroTwoDimNumber>`__ ,
`ugProblemEigenPage <ugProblemEigenPage>`__ in Section
`ugProblemEigenNumber <ugProblemEigenNumber>`__ ,
`ugxFloatHilbertPage <ugxFloatHilbertPage>`__ in Section
`ugxFloatHilbertNumber <ugxFloatHilbertNumber>`__ ,
`PermanentXmpPage <section-9.62.html#PermanentXmpPage>`__ ,
`VectorXmpPage <section-9.85.html#VectorXmpPage>`__ ,
`OneDimensionalArrayXmpPage <section-9.57.html#OneDimensionalArrayXmpPage>`__
, and
`TwoDimensionalArrayXmpPage <section-9.82.html#TwoDimensionalArrayXmpPage>`__
.





