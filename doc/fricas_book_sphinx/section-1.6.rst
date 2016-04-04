.. status: ok


1.6 Expanding to Higher Dimensions
----------------------------------

To get higher dimensional aggregates, you can create one-dimensional
aggregates with elements that are themselves aggregates, for example,
lists of lists, one-dimensional arrays of lists of multisets, and so on.
For applications requiring two-dimensional homogeneous aggregates, you
will likely find two-dimensional arrays matrix and matrices most useful.


The entries in *TwoDimensionalArray* and *Matrix* objects are all the same
type, except that those for Matrix must belong to a *Ring*. You create and
access elements in roughly the same way. Since matrices have an
understood algebraic structure, certain algebraic operations are
available for matrices but not for arrays. Because of this, we limit our
discussion here to Matrix, that can be regarded as an extension of
TwoDimensionalArray. See TwoDimensionalArray for more information about
arrays. For more information about FriCAS's linear algebra facilities,
see Matrix, Permanent, SquareMatrix, Vector, see Section
`ugProblemEigen <section-8.4.html#ugProblemEigen>`__ (computation of
eigenvalues and eigenvectors), and Section
`ugProblemLinPolEqn <section-8.5.html#ugProblemLinPolEqn>`__ (solution
of linear and polynomial equations).

You can create a matrix from a list of lists, matrix:creating where each
of the inner lists represents a row of the matrix.


.. spadInput
::

	m := matrix([ [1,2], [3,4] ])


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
    1 & 2 \\
    3 & 4
  \end{array}
  \right]

.. spadType
:sub:`Type: Matrix Integer`



The collections construct (see
`ugLangIts <section-5.5.html#ugLangIts>`__) is useful for creating
matrices whose entries are given by formulas.


.. spadInput
::

	matrix([ [1/(i + j - x) for i in 1..4] for j in 1..4])


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cccc}
   -{1 \over {x -2}} & -{1 \over {x -3}} & -{1 \over {x -4}} 
        & -{1 \over {x -5}} \\
   -{1 \over {x -3}} & -{1 \over {x -4}} & -{1 \over {x -5}} 
        & -{1 \over {x -6}} \\
   -{1 \over {x -4}} & -{1 \over {x -5}} & -{1 \over {x -6}} 
        & -{1 \over {x -7}} \\
   -{1 \over {x -5}} & -{1 \over {x -6}} & -{1 \over {x -7}} 
        & -{1 \over {x -8}}
  \end{array}
  \right]

 
.. spadType
:sub:`Type: Matrix Fraction Polynomial Integer`



Let vm denote the three by three Vandermonde matrix.


.. spadInput
::

	vm := matrix [ [1,1,1], [x,y,z], [x*x,y*y,z*z] ]


.. spadMathAnswer
.. spadMathOutput
.. math::
 
  \left[
  \begin{array}{ccc}
   1 & 1 & 1 \\
   x & y & z \\
  {{x} ^ {2}} & {{y} ^ {2}} & {{z} ^ {2}}
  \end{array}
  \right]


.. spadType
:sub:`Type: Matrix Polynomial Integer`



Use this syntax to extract an entry in the matrix.


.. spadInput
::

	vm(3,3)


.. spadMathAnswer
.. spadMathOutput
.. math::

   {z} ^ {2}

.. spadType

:sub:`Type: Polynomial Integer`



You can also pull out a row or a column.


.. spadInput
::

	column(vm,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

   \left[
    1, \: y, \: {{y} ^ {2}}
   \right]


.. spadType
:sub:`Type: Vector Polynomial Integer`



You can do arithmetic.


.. spadInput
::

	vm * vm


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{ccc}
  {{{x} ^ {2}}+x+1} & {{{y} ^ {2}}+y+1} & {{{z} ^ {2}}+z+1} \\
  {{{{x} ^ {2}} \  z}+{x \  y}+x} & {{{{y} ^ {2}} \  z}+{{y} ^ {2}}+x} &
  {{{z} ^ {3}}+{y \  z}+x} \\
  {{{{x} ^ {2}} \  {{z} ^ {2}}}+{x \  {{y} ^ {2}}}+{{x} ^ {2}}} &
  {{{{y} ^ {2}} \  {{z} ^ {2}}}+{{y} ^ {3}}+{{x} ^ {2}}} & {{{z} ^
  {4}}+{{{y} ^ {2}} \  z}+{{x} ^ {2}}}
  \end{array}
  \right]


.. spadType
:sub:`Type: Matrix Polynomial Integer`



You can perform operations such as transpose, trace, and determinant.


.. spadInput
::

	factor determinant vm


.. spadMathAnswer
.. spadMathOutput
.. math::

  {\left( y -x
  \right)}
  \  {\left( z -y
  \right)}
  \  {\left( z -x
  \right)}

.. spadType
:sub:`Type: Factored Polynomial Integer`

