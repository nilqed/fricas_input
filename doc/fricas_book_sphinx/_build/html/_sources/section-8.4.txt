.. status: ok
Index <book-index.html>`__



8.4 Computation of Eigenvalues and Eigenvectors
-----------------------------------------------

In this section we show you some of FriCAS's facilities for computing
and eigenvalue manipulating eigenvalues and eigenvectors, also called
eigenvector characteristic values and characteristic vectors,
characteristic:value respectively. characteristic:vector

Let's first create a matrix with integer entries.


.. spadInput
::

	m1 := matrix [ [1,2,1],[2,1,-2],[1,-2,4] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [12121-21-24]   |
+-----------------+




.. spadType

:sub:`Type: Matrix Integer`



To get a list of the rational eigenvalues, use the operation
eigenvalues.


.. spadInput
::

	leig := eigenvalues(m1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| [5,(%K|%K2-%K-5)]   |
+----------------------+




.. spadType

:sub:`Type: List Union(Fraction Polynomial Integer,SuchThat(Symbol,Polynomial`
Integer))



Given an explicit eigenvalue, eigenvector computes the eigenvectors
corresponding to it.


.. spadInput
::

	eigenvector(first(leig),m1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [[0-121]]   |
+-------------+




.. spadType

:sub:`Type: List Matrix Fraction Polynomial Fraction Integer`



The operation eigenvectors returns a list of pairs of values and
vectors. When an eigenvalue is rational, FriCAS gives you the value
explicitly; otherwise, its minimal polynomial is given, (the polynomial
of lowest degree with the eigenvalues as roots), together with a
parametric representation of the eigenvector using the eigenvalue. This
means that if you ask FriCAS to solve the minimal polynomial, then you
can substitute these roots polynomial:minimal into the parametric form
of the corresponding eigenvectors. minimal polynomial

You must be aware that unless an exact eigenvalue has been computed, the
eigenvector may be badly in error.


.. spadInput
::

	eigenvectors(m1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------+
| [[eigval=5,eigmult=1,eigvec=[[0-121]]],[eigval=(%L|%L2-%L-5),eigmult=1,eigvec=[[%L21]]]]   |
+---------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Record(eigval: Union(Fraction Polynomial`
Integer,SuchThat(Symbol,Polynomial Integer)),eigmult:
NonNegativeInteger,eigvec: List Matrix Fraction Polynomial Integer)



Another possibility is to use the operation radicalEigenvectors tries to
compute explicitly the eigenvectors in terms of radicals. radical


.. spadInput
::

	radicalEigenvectors(m1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------+
| [[radval=21+12,radmult=1,radvect=[[21+1221]]],[radval=-21+12,radmult=1,radvect=[[-21+1221]]],[radval=5,radmult=1,radvect=[[0-121]]]]   |
+----------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Record(radval: Expression Integer,radmult: Integer,radvect:`
List Matrix Expression Integer)



Alternatively, FriCAS can compute real or complex approximations to the
approximation eigenvectors and eigenvalues using the operations
realEigenvectors or complexEigenvectors. They each take an additional
argument to specify the precision required. precision In the real case,
this means that each approximation will be within of the actual result.
In the complex case, this means that each approximation will be within
of the actual result in each of the real and imaginary parts.

The precision can be specified as a Float if the results are desired in
floating-point notation, or as Fraction Integer if the results are to be
expressed using rational (or complex rational) numbers.


.. spadInput
::

	realEigenvectors(m1,1/1000)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------------------+
| [[outval=5,outmult=1,outvect=[[0-121]]],[outval=57172048,outmult=1,outvect=[[5717204821]]],[outval=-36692048,outmult=1,outvect=[[-3669204821]]]]   |
+----------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Record(outval: Fraction Integer,outmult: Integer,outvect:`
List Matrix Fraction Integer)



If an n by n matrix has n distinct eigenvalues (and therefore n
eigenvectors) the operation eigenMatrix gives you a matrix of the
eigenvectors.


.. spadInput
::

	eigenMatrix(m1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [21+12-21+12022-12111]   |
+--------------------------+




.. spadType

:sub:`Type: Union(Matrix Expression Integer,...)`




.. spadInput
::

	m2 := matrix [ [-5,-2],[18,7] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [-5-2187]   |
+-------------+




.. spadType

:sub:`Type: Matrix Integer`




.. spadInput
::

	eigenMatrix(m2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



If a symmetric matrix matrix:symmetric has a basis of orthonormal
eigenvectors, then basis:orthonormal orthonormalBasis computes a list of
these vectors. orthonormal basis


.. spadInput
::

	m3 := matrix [ [1,2],[2,1] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [1221]   |
+----------+




.. spadType

:sub:`Type: Matrix Integer`




.. spadInput
::

	orthonormalBasis(m3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [[-1212],[1212]]   |
+--------------------+




.. spadType

:sub:`Type: List Matrix Expression Integer`





Index <book-index.html>`__
