.. status: ok



8.3 Manipulating Symbolic Roots of a Polynomial
-----------------------------------------------

In this section we show you how to work with one root or all roots
root:symbolic of a polynomial. These roots are represented symbolically
(as opposed to being numeric approximations). See
`ugxProblemOnePol <section-8.5.html#ugxProblemOnePol>`__ and
`ugxProblemPolSys <section-8.5.html#ugxProblemPolSys>`__ for
information about solving for the roots of one or more polynomials.



8.3.1 Using a Single Root of a Polynomial
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use rootOf to get a symbolic root of a polynomial: rootOf(p,x) returns a
root of p(x).

This creates an algebraic number a. algebraic number number:algebraic


.. spadInput
::

	a := rootOf(a^4+1,a)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| a   |
+-----+




.. spadType

:sub:`Type: Expression Integer`



To find the algebraic relation that defines a, use definingPolynomial.


.. spadInput
::

	definingPolynomial a


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| a4+1   |
+--------+




.. spadType

:sub:`Type: Expression Integer`



You can use a in any further expression, including a nested rootOf.


.. spadInput
::

	b := rootOf(b^2-a-1,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| b   |
+-----+




.. spadType

:sub:`Type: Expression Integer`



Higher powers of the roots are automatically reduced during
calculations.


.. spadInput
::

	a + b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| b+a   |
+-------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	% ^ 5


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| (10a3+11a2+2a-4)b+15a3+10a2+4a-10   |
+-------------------------------------+




.. spadType

:sub:`Type: Expression Integer`



The operation zeroOf is similar to rootOf, except that it may express
the root using radicals in some cases. radical


.. spadInput
::

	rootOf(c^2+c+1,c)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| c   |
+-----+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	zeroOf(d^2+d+1,d)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| -3-12   |
+---------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	rootOf(e^5-2,e)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| e   |
+-----+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	zeroOf(f^5-2,f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 25   |
+------+




.. spadType

:sub:`Type: Expression Integer`







8.3.2 Using All Roots of a Polynomial
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use rootsOf to get all symbolic roots of a polynomial: rootsOf(p,x)
returns a list of all the roots of p(x). If p(x) has a multiple root of
order n, then that root root:multiple appears n times in the list. Make
sure these variables are x0 etc.

Compute all the roots of x**4+1.


.. spadInput
::

	l := rootsOf(x^4+1,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| [%x0,%x0%x1,-%x0,-%x0%x1]   |
+-----------------------------+




.. spadType

:sub:`Type: List Expression Integer`



As a side effect, the variables %x0,%x1 and %x2 are bound to the first
three roots of x**4+1.


.. spadInput
::

	%x0^5


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| -%x0   |
+--------+




.. spadType

:sub:`Type: Expression Integer`



Although they all satisfy x**4+1=0,%x0,%x1, and %x2 are different
algebraic numbers. To find the algebraic relation that defines each of
them, use definingPolynomial.


.. spadInput
::

	definingPolynomial %x0


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| %x04+1   |
+----------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	definingPolynomial %x1


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| %x12+1   |
+----------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	definingPolynomial %x2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| -%x2+%%var   |
+--------------+




.. spadType

:sub:`Type: Expression Integer`



We can check that the sum and product of the roots of x**4+1 are its
trace and norm.


.. spadInput
::

	x3 := last l


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| -%x0%x1   |
+-----------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	%x0 + %x1 + %x2 + x3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| (-%x0+1)%x1+%x0+%x2   |
+-----------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	%x0 * %x1 * %x2 * x3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| %x2%x02   |
+-----------+




.. spadType

:sub:`Type: Expression Integer`



Corresponding to the pair of operations rootOf/ zeroOf in
`ugxProblemOnePol <section-8.5.html#ugxProblemOnePol>`__ , there is an
operation zerosOf that, like rootsOf, computes all the roots of a given
polynomial, but which expresses some of them in terms of radicals.


.. spadInput
::

	zerosOf(y^4+1,y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [-1+12,-1-12,--1-12,--1+12]   |
+-------------------------------+




.. spadType

:sub:`Type: List Expression Integer`



As you see, only one implicit algebraic number was created ( %y1), and
its defining equation is this. The other three roots are expressed in
radicals.


.. spadInput
::

	definingPolynomial %y1


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| %%var2+1   |
+------------+




.. spadType

:sub:`Type: Expression Integer`







