.. status: ok


9.65 RadixExpansion
-------------------

It possible to expand numbers in general bases.

Here we expand 111 in base 5. This means


.. spadInput
::

	111::RadixExpansion(5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 421   |
+-------+




.. spadType

:sub:`Type: RadixExpansion 5`



You can expand fractions to form repeating expansions.


.. spadInput
::

	(5/24)::RadixExpansion(2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 0.00110‾   |
+------------+




.. spadType

:sub:`Type: RadixExpansion 2`




.. spadInput
::

	(5/24)::RadixExpansion(3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 0.012‾   |
+----------+




.. spadType

:sub:`Type: RadixExpansion 3`




.. spadInput
::

	(5/24)::RadixExpansion(8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 0.152‾   |
+----------+




.. spadType

:sub:`Type: RadixExpansion 8`




.. spadInput
::

	(5/24)::RadixExpansion(10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 0.2083‾   |
+-----------+




.. spadType

:sub:`Type: RadixExpansion 10`



For bases from 11 to 36 the letters A through Z are used.


.. spadInput
::

	(5/24)::RadixExpansion(12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 0.26   |
+--------+




.. spadType

:sub:`Type: RadixExpansion 12`




.. spadInput
::

	(5/24)::RadixExpansion(16)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 0.35‾   |
+---------+




.. spadType

:sub:`Type: RadixExpansion 16`




.. spadInput
::

	(5/24)::RadixExpansion(36)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 0.7I   |
+--------+




.. spadType

:sub:`Type: RadixExpansion 36`



For bases greater than 36, the ragits are separated by blanks.


.. spadInput
::

	(5/24)::RadixExpansion(38)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 0.734312512‾   |
+----------------+




.. spadType

:sub:`Type: RadixExpansion 38`



The RadixExpansion type provides operations to obtain the individual
ragits. Here is a rational number in base 8.


.. spadInput
::

	a := (76543/210)::RadixExpansion(8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 554.37307‾   |
+--------------+




.. spadType

:sub:`Type: RadixExpansion 8`



The operation wholeRagitswholeRagitsRadixExpansion returns a list of the
ragits for the integral part of the number.


.. spadInput
::

	w := wholeRagits a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [5,5,4]   |
+-----------+




.. spadType

:sub:`Type: List Integer`



The operations prefixRagitsprefixRagitsRadixExpansion and
cycleRagitscycleRagitsRadixExpansion return lists of the initial and
repeating ragits in the fractional part of the number.


.. spadInput
::

	f0 := prefixRagits a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [3]   |
+-------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	f1 := cycleRagits a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [7,3,0,7]   |
+-------------+




.. spadType

:sub:`Type: List Integer`



You can construct any radix expansion by giving the whole, prefix and
cycle parts. The declaration is necessary to let FriCAS know the base of
the ragits.


.. spadInput
::

	u:RadixExpansion(8):=wholeRadix(w)+fractRadix(f0,f1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 554.37307‾   |
+--------------+




.. spadType

:sub:`Type: RadixExpansion 8`



If there is no repeating part, then the list [0] should be used.


.. spadInput
::

	v: RadixExpansion(12) := fractRadix([1,2,3,11], [0])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 0.123B0‾   |
+------------+




.. spadType

:sub:`Type: RadixExpansion 12`



If you are not interested in the repeating nature of the expansion, an
infinite stream of ragits can be obtained using
fractRagitsfractRagitsRadixExpansion.


.. spadInput
::

	fractRagits(u)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [3,7,3,0,7,7‾]   |
+------------------+




.. spadType

:sub:`Type: Stream Integer`



Of course, it's possible to recover the fraction representation:


.. spadInput
::

	a :: Fraction(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 76543210   |
+------------+




.. spadType

:sub:`Type: Fraction Integer`



More examples of expansions are available in
`DecimalExpansionXmpPage <section-9.15.html#DecimalExpansionXmpPage>`__
, `BinaryExpansionXmpPage <section-9.4.html#BinaryExpansionXmpPage>`__
, and
`HexadecimalExpansionXmpPage <section-9.33.html#HexadecimalExpansionXmpPage>`__
.



