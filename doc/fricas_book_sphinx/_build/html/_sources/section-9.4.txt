.. status: ok



9.4 BinaryExpansion
-------------------

All rational numbers have repeating binary expansions. Operations to
access the individual bits of a binary expansion can be obtained by
converting the value to RadixExpansion(2). More examples of expansions
are available in
`DecimalExpansionXmpPage <section-9.15.html#DecimalExpansionXmpPage>`__
,
`HexadecimalExpansionXmpPage <section-9.33.html#HexadecimalExpansionXmpPage>`__
, and
`RadixExpansionXmpPage <section-9.65.html#RadixExpansionXmpPage>`__ .

The expansion (of type BinaryExpansion) of a rational number is returned
by the binarybinaryBinaryExpansion operation.


.. spadInput
::

	r := binary(22/7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 11.001‾   |
+-----------+




.. spadType

:sub:`Type: BinaryExpansion`



Arithmetic is exact.


.. spadInput
::

	r + binary(6/7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 100   |
+-------+




.. spadType

:sub:`Type: BinaryExpansion`



The period of the expansion can be short or long ...


.. spadInput
::

	[binary(1/i) for i in 102..106]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [0.000000101‾,0.000000100111110001000101100101111001110010010101001‾,0.000000100111011‾,0.000000100111‾,0.00000010011010100100001110011111011001010110111100011‾]   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List BinaryExpansion`



or very long.


.. spadInput
::

	binary(1/1007)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 0.000000000100000100010100100101111000001111110000101111110010110001111101‾000100111001001100110001100100101010111101101001100000000110000110011110‾111000110100010111101001000111101100001010111011100111010101110011001010‾010111000000011100011110010000001001001001101110010101001110100011011101‾101011100010010000011001011011000000101100101111100010100000101010101101‾011000001101101110100101011111110101110101001100100001010011011000100110‾001000100001000011000111010011110001‾   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: BinaryExpansion`



These numbers are bona fide algebraic objects.


.. spadInput
::

	p := binary(1/4)*x^2 + binary(2/3)*x + binary(4/9)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| 0.01x2+0.10‾x+0.011100‾   |
+---------------------------+




.. spadType

:sub:`Type: Polynomial BinaryExpansion`




.. spadInput
::

	q := D(p, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 0.1x+0.10‾   |
+--------------+




.. spadType

:sub:`Type: Polynomial BinaryExpansion`




.. spadInput
::

	g := gcd(p, q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| x+1.01‾   |
+-----------+




.. spadType

:sub:`Type: Polynomial BinaryExpansion`





