.. status: ok



9.11 Complex
------------

The Complex constructor implements complex objects over a commutative
ring R. Typically, the ring R is Integer, Fraction Integer, Float or
DoubleFloat. R can also be a symbolic type, like Polynomial Integer. For
more information about the numerical and graphical aspects of complex
numbers, see `ugProblemNumeric <section-8.1.html#ugProblemNumeric>`__ .

Complex objects are created by the complexcomplexComplex operation.


.. spadInput
::

	a := complex(4/3,5/2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 43+52i   |
+----------+




.. spadType

:sub:`Type: Complex Fraction Integer`




.. spadInput
::

	b := complex(4/3,-5/2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 43-52i   |
+----------+




.. spadType

:sub:`Type: Complex Fraction Integer`



The standard arithmetic operations are available.


.. spadInput
::

	a + b


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 83   |
+------+




.. spadType

:sub:`Type: Complex Fraction Integer`




.. spadInput
::

	a - b


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 5i   |
+------+




.. spadType

:sub:`Type: Complex Fraction Integer`




.. spadInput
::

	a * b


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 28936   |
+---------+




.. spadType

:sub:`Type: Complex Fraction Integer`



If R is a field, you can also divide the complex objects.


.. spadInput
::

	a / b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| -161289+240289i   |
+-------------------+




.. spadType

:sub:`Type: Complex Fraction Integer`



Use a conversion (`ugTypesConvertPage <ugTypesConvertPage>`__ in Section
`ugTypesConvertNumber <ugTypesConvertNumber>`__ ) to view the last
object as a fraction of complex integers.


.. spadInput
::

	% :: Fraction Complex Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| -15+8i15+8i   |
+---------------+




.. spadType

:sub:`Type: Fraction Complex Integer`



The predefined macro %i is defined to be complex(0,1).


.. spadInput
::

	3.4 + 6.7 * %i


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 3.4+6.7i   |
+------------+




.. spadType

:sub:`Type: Complex Float`



You can also compute the conjugateconjugateComplex and normnormComplex
of a complex number.


.. spadInput
::

	conjugate a


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 43-52i   |
+----------+




.. spadType

:sub:`Type: Complex Fraction Integer`




.. spadInput
::

	norm a


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 28936   |
+---------+




.. spadType

:sub:`Type: Fraction Integer`



The realrealComplex and imagimagComplex operations are provided to
extract the real and imaginary parts, respectively.


.. spadInput
::

	real a


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 43   |
+------+




.. spadType

:sub:`Type: Fraction Integer`




.. spadInput
::

	imag a


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 52   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



The domain Complex Integer is also called the Gaussian integers. If R is
the integers (or, more generally, a EuclideanDomain), you can compute
greatest common divisors.


.. spadInput
::

	gcd(13 - 13*%i,31 + 27*%i)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 5+i   |
+-------+




.. spadType

:sub:`Type: Complex Integer`



You can also compute least common multiples.


.. spadInput
::

	lcm(13 - 13*%i,31 + 27*%i)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 143-39i   |
+-----------+




.. spadType

:sub:`Type: Complex Integer`



You can factorfactorComplex Gaussian integers.


.. spadInput
::

	factor(13 - 13*%i)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| -(1+i)(2+3i)(3+2i)   |
+----------------------+




.. spadType

:sub:`Type: Factored Complex Integer`




.. spadInput
::

	factor complex(2,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -i(1+i)2   |
+------------+




.. spadType

:sub:`Type: Factored Complex Integer`





