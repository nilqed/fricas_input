.. status: ok


9.72 SingleInteger
------------------

The SingleInteger domain is intended to provide support in FriCAS for
machine integer arithmetic. It is generally much faster than (bignum)
Integer arithmetic but suffers from a limited range of values. Since
FriCAS can be implemented on top of various dialects of Lisp, the actual
representation of small integers may not correspond exactly to the host
machines integer representation.

In the CCL implementation of AXIOM (Release 2.1 onwards) the underlying
representation of SingleInteger is the same as Integer. The underlying
Lisp primitives treat machine-word sized computations specially.

You can discover the minimum and maximum values in your implementation
by using minminSingleInteger and maxmaxSingleInteger.


.. spadInput
::

	min()$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| -134217728   |
+--------------+




.. spadType

:sub:`Type: SingleInteger`




.. spadInput
::

	max()$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 134217727   |
+-------------+




.. spadType

:sub:`Type: SingleInteger`



To avoid confusion with Integer, which is the default type for integers,
you usually need to work with declared variables
(`ugTypesDeclarePage <ugTypesDeclarePage>`__ in Section
`ugTypesDeclareNumber <ugTypesDeclareNumber>`__ ) ...


.. spadInput
::

	a := 1234 :: SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1234   |
+--------+




.. spadType

:sub:`Type: SingleInteger`



or use package calling (`ugTypesPkgCallPage <ugTypesPkgCallPage>`__ in
Section `ugTypesPkgCallNumber <ugTypesPkgCallNumber>`__ ).


.. spadInput
::

	b := 124$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 124   |
+-------+




.. spadType

:sub:`Type: SingleInteger`



You can add, multiply and subtract SingleInteger objects, and ask for
the greatest common divisor (gcd).


.. spadInput
::

	gcd(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: SingleInteger`



The least common multiple (lcm) is also available.


.. spadInput
::

	lcm(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 76508   |
+---------+




.. spadType

:sub:`Type: SingleInteger`



Operations mulmodmulmodSingleInteger, addmodaddmodSingleInteger,
submodsubmodSingleInteger, and invmodinvmodSingleInteger are
similar---they provide arithmetic modulo a given small integer. Here is
5*6mod13.


.. spadInput
::

	mulmod(5,6,13)$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: SingleInteger`



To reduce a small integer modulo a prime, use
positiveRemainderpositiveRemainderSingleInteger.


.. spadInput
::

	positiveRemainder(37,13)$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 11   |
+------+




.. spadType

:sub:`Type: SingleInteger`



Operations AndAndSingleInteger, OrOrSingleInteger, xorxorSingleInteger,
and NotNotSingleInteger provide bit level operations on small integers.


.. spadInput
::

	And(3,4)$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: SingleInteger`



Use shift(int,numToShift) to shift bits, where i is shifted left if
numToShift is positive, right if negative.


.. spadInput
::

	shift(1,4)$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 16   |
+------+




.. spadType

:sub:`Type: SingleInteger`




.. spadInput
::

	shift(31,-1)$SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 15   |
+------+




.. spadType

:sub:`Type: SingleInteger`



Many other operations are available for small integers, including many
of those provided for Integer. To see the other operations, use the
Browse HyperDoc facility (`ugBrowsePage <ugBrowsePage>`__ in Section
`ugBrowseNumber <ugBrowseNumber>`__ ).



