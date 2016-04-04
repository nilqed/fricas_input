.. status: ok


9.33 HexadecimalExpansion
-------------------------

All rationals have repeating hexadecimal expansions. The operation
hexhexHexadecimalExpansion returns these expansions of type
HexadecimalExpansion. Operations to access the individual numerals of a
hexadecimal expansion can be obtained by converting the value to
RadixExpansion(16). More examples of expansions are available in the
`DecimalExpansionXmpPage <section-9.15.html#DecimalExpansionXmpPage>`__
, `BinaryExpansionXmpPage <section-9.4.html#BinaryExpansionXmpPage>`__
, and
`RadixExpansionXmpPage <section-9.65.html#RadixExpansionXmpPage>`__ .

This is a hexadecimal expansion of a rational number.


.. spadInput
::

	r := hex(22/7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 3.249‾   |
+----------+




.. spadType

:sub:`Type: HexadecimalExpansion`



Arithmetic is exact.


.. spadInput
::

	r + hex(6/7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: HexadecimalExpansion`



The period of the expansion can be short or long ...


.. spadInput
::

	[hex(1/i) for i in 350..354]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------+
| [0.00BB3EE721A54D88‾,0.00BAB6561‾,0.00BA2E8‾,0.00B9A7862A0FF465879D5F‾,0.00B92143FA36F5E02E4850FE8DBD78‾]   |
+-------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List HexadecimalExpansion`



or very long!


.. spadInput
::

	hex(1/1007)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------+
| 0.0041149783F0BF2C7D13933192AF6980619EE345E91EC2BB9D5CC‾A5C071E40926E54E8DDAE24196C0B2F8A0AAD60DBA57F5D4C8‾536262210C74F1‾   |
+------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: HexadecimalExpansion`



These numbers are bona fide algebraic objects.


.. spadInput
::

	p := hex(1/4)*x^2 + hex(2/3)*x + hex(4/9)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| 0.4x2+0.A‾x+0.71C‾   |
+----------------------+




.. spadType

:sub:`Type: Polynomial HexadecimalExpansion`




.. spadInput
::

	q := D(p, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 0.8x+0.A‾   |
+-------------+




.. spadType

:sub:`Type: Polynomial HexadecimalExpansion`




.. spadInput
::

	g := gcd(p, q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| x+1.5‾   |
+----------+




.. spadType

:sub:`Type: Polynomial HexadecimalExpansion`





