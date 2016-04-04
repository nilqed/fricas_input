.. status: ok



9.74 SquareMatrix
-----------------

The top level matrix type in FriCAS is Matrix (see
`MatrixXmpPage <section-9.52.html#MatrixXmpPage>`__ ), which provides
basic arithmetic and linear algebra functions. However, since the
matrices can be of any size it is not true that any pair can be added or
multiplied. Thus Matrix has little algebraic structure. Sometimes you
want to use matrices as coefficients for polynomials or in other
algebraic contexts. In this case, SquareMatrix should be used. The
domain SquareMatrix(n,R) gives the ring of n by n square matrices over
R. Since SquareMatrix is not normally exposed at the top level, you must
expose it before it can be used.


.. spadInput
::

	)set expose add constructor SquareMatrix


.. spadMathAnswer
.. spadVerbatim

::

    SquareMatrix is now explicitly exposed in frame G82322 



Once SQMATRIX has been exposed, values can be created using the
squareMatrixsquareMatrixSquareMatrix function.


.. spadInput
::

	m := squareMatrix [ [1,-%i],[%i,4] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1-ii4]   |
+-----------+




.. spadType

:sub:`Type: SquareMatrix(2,Complex Integer)`



The usual arithmetic operations are available.


.. spadInput
::

	m*m - m


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [1-4i4i13]   |
+--------------+




.. spadType

:sub:`Type: SquareMatrix(2,Complex Integer)`



Square matrices can be used where ring elements are required. For
example, here is a matrix with matrix entries.


.. spadInput
::

	mm := squareMatrix [ [m, 1], [1-m, m^2] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [[1-ii4][1001][0i-i-3][2-5i5i17]]   |
+-------------------------------------+




.. spadType

:sub:`Type: SquareMatrix(2,SquareMatrix(2,Complex Integer))`



Or you can construct a polynomial with square matrix coefficients.


.. spadInput
::

	p := (x + m)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| x2+[2-2i2i8]x+[2-5i5i17]   |
+----------------------------+




.. spadType

:sub:`Type: Polynomial SquareMatrix(2,Complex Integer)`



This value can be converted to a square matrix with polynomial
coefficients.


.. spadInput
::

	p::SquareMatrix(2, ?)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [x2+2x+2-2ix-5i2ix+5ix2+8x+17]   |
+----------------------------------+




.. spadType

:sub:`Type: SquareMatrix(2,Polynomial Complex Integer)`



For more information on related topics, see
`ugTypesWritingModesPage <ugTypesWritingModesPage>`__ in Section
`ugTypesWritingModesNumber <ugTypesWritingModesNumber>`__ ,
`ugTypesExposePage <ugTypesExposePage>`__ in Section
`ugTypesExposeNumber <ugTypesExposeNumber>`__ , and
`MatrixXmpPage <section-9.52.html#MatrixXmpPage>`__ .



