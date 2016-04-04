.. status: ok



9.56 Octonion
-------------

The Octonions, also called the Cayley-Dixon algebra, defined over a
commutative ring are an eight-dimensional non-associative algebra. Their
construction from quaternions is similar to the construction of
quaternions from complex numbers (see
`QuaternionXmpPage <section-9.64.html#QuaternionXmpPage>`__ ).

As Octonion creates an eight-dimensional algebra, you have to give eight
components to construct an octonion.


.. spadInput
::

	oci1 := octon(1,2,3,4,5,6,7,8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| 1+2i+3j+4k+5E+6I+7J+8K   |
+--------------------------+




.. spadType

:sub:`Type: Octonion Integer`




.. spadInput
::

	oci2 := octon(7,2,3,-4,5,6,-7,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| 7+2i+3j-4k+5E+6I-7J   |
+-----------------------+




.. spadType

:sub:`Type: Octonion Integer`



Or you can use two quaternions to create an octonion.


.. spadInput
::

	oci3 := octon(quatern(-7,-12,3,-10), quatern(5,6,9,0))


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| -7-12i+3j-10k+5E+6I+9J   |
+--------------------------+




.. spadType

:sub:`Type: Octonion Integer`



You can easily demonstrate the non-associativity of multiplication.


.. spadInput
::

	(oci1 * oci2) * oci3 - oci1 * (oci2 * oci3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| 2696i-2928j-4072k+16E-1192I+832J+2616K   |
+------------------------------------------+




.. spadType

:sub:`Type: Octonion Integer`



As with the quaternions, we have a real part, the imaginary parts i, j,
k, and four additional imaginary parts E, I, J and K. These parts
correspond to the canonical basis (1,i,j,k,E,I,J,K).

For each basis element there is a component operation to extract the
coefficient of the basis element for a given octonion.


.. spadInput
::

	[real oci1, imagi oci1, imagj oci1, imagk oci1, imagE oci1, imagI oci1,
imagJ oci1, imagK oci1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [1,2,3,4,5,6,7,8]   |
+---------------------+




.. spadType

:sub:`Type: List PositiveInteger`



A basis with respect to the quaternions is given by (1,E). However, you
might ask, what then are the commuting rules? To answer this, we create
some generic elements.

We do this in FriCAS by simply changing the ground ring from Integer to
Polynomial Integer.


.. spadInput
::

	q : Quaternion Polynomial Integer := quatern(q1, qi, qj, qk)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| q1+qii+qjj+qkk   |
+------------------+




.. spadType

:sub:`Type: Quaternion Polynomial Integer`




.. spadInput
::

	E : Octonion Polynomial Integer:= octon(0,0,0,0,1,0,0,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| E   |
+-----+




.. spadType

:sub:`Type: Octonion Polynomial Integer`



Note that quaternions are automatically converted to octonions in the
obvious way.


.. spadInput
::

	q * E


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| q1E+qiI+qjJ+qkK   |
+-------------------+




.. spadType

:sub:`Type: Octonion Polynomial Integer`




.. spadInput
::

	E * q


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| q1E-qiI-qjJ-qkK   |
+-------------------+




.. spadType

:sub:`Type: Octonion Polynomial Integer`




.. spadInput
::

	q * 1$(Octonion Polynomial Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| q1+qii+qjj+qkk   |
+------------------+




.. spadType

:sub:`Type: Octonion Polynomial Integer`




.. spadInput
::

	1$(Octonion Polynomial Integer) * q


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| q1+qii+qjj+qkk   |
+------------------+




.. spadType

:sub:`Type: Octonion Polynomial Integer`



Finally, we check that the normnormOctonion, defined as the sum of the
squares of the coefficients, is a multiplicative map.


.. spadInput
::

	o : Octonion Polynomial Integer := octon(o1, oi, oj, ok, oE, oI, oJ, oK)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| o1+oii+ojj+okk+oEE+oII+oJJ+oKK   |
+----------------------------------+




.. spadType

:sub:`Type: Octonion Polynomial Integer`




.. spadInput
::

	norm o


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| ok2+oj2+oi2+oK2+oJ2+oI2+oE2+o12   |
+-----------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	p : Octonion Polynomial Integer := octon(p1, pi, pj, pk, pE, pI, pJ, pK)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| p1+pii+pjj+pkk+pEE+pII+pJJ+pKK   |
+----------------------------------+




.. spadType

:sub:`Type: Octonion Polynomial Integer`



Since the result is 0, the norm is multiplicative.


.. spadInput
::

	norm(o*p)-norm(p)*norm(o)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Polynomial Integer`





