.. status: ok


9.64 Quaternion
---------------

The domain constructor Quaternion implements quaternions over
commutative rings. For information on related topics see
`ComplexXmpPage <section-9.11.html#ComplexXmpPage>`__ and
`OctonionXmpPage <section-9.56.html#OctonionXmpPage>`__ . You can also
issue the system command )show Quaternion to display the full list of
operations defined by Quaternion.

The basic operation for creating quaternions is
quaternquaternQuaternion. This is a quaternion over the rational
numbers.


.. spadInput
::

	q := quatern(2/11,-8,3/4,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 211-8i+34j+k   |
+----------------+




.. spadType

:sub:`Type: Quaternion Fraction Integer`



The four arguments are the real part, the i imaginary part, the j
imaginary part, and the k imaginary part, respectively.


.. spadInput
::

	[real q, imagI q, imagJ q, imagK q]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [211,-8,34,1]   |
+-----------------+




.. spadType

:sub:`Type: List Fraction Integer`



Because q is over the rationals (and nonzero), you can invert it.


.. spadInput
::

	inv q


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| 352126993+15488126993i-48442331j-1936126993k   |
+------------------------------------------------+




.. spadType

:sub:`Type: Quaternion Fraction Integer`



The usual arithmetic (ring) operations are available


.. spadInput
::

	q^6


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------+
| -20294907093193457256313856-482516908511288408i+14475507255341229056j+4825169085110307264k   |
+----------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Quaternion Fraction Integer`




.. spadInput
::

	r := quatern(-2,3,23/9,-89); q + r


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| -2011-5i+11936j-88k   |
+-----------------------+




.. spadType

:sub:`Type: Quaternion Fraction Integer`



In general, multiplication is not commutative.


.. spadInput
::

	q * r - r * q


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| -249518i-1418j-81718k   |
+-------------------------+




.. spadType

:sub:`Type: Quaternion Fraction Integer`



There are no predefined constants for the imaginary i, j, and k parts,
but you can easily define them.


.. spadInput
::

	i:=quatern(0,1,0,0); j:=quatern(0,0,1,0); k:=quatern(0,0,0,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| k   |
+-----+




.. spadType

:sub:`Type: Quaternion Integer`



These satisfy the normal identities.


.. spadInput
::

	[i*i, j*j, k*k, i*j, j*k, k*i, q*i]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [-1,-1,-1,k,i,j,8+211i+j-34k]   |
+---------------------------------+




.. spadType

:sub:`Type: List Quaternion Fraction Integer`



The norm is the quaternion times its conjugate.


.. spadInput
::

	norm q


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 1269931936   |
+--------------+




.. spadType

:sub:`Type: Fraction Integer`




.. spadInput
::

	conjugate q


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 211+8i-34j-k   |
+----------------+




.. spadType

:sub:`Type: Quaternion Fraction Integer`




.. spadInput
::

	q * %


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 1269931936   |
+--------------+




.. spadType

:sub:`Type: Quaternion Fraction Integer`





