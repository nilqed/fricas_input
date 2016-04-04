.. status: ok



9.15 DecimalExpansion
---------------------

All rationals have repeating decimal expansions. Operations to access
the individual digits of a decimal expansion can be obtained by
converting the value to RadixExpansion(10). More examples of expansions
are available in
`BinaryExpansionXmpPage <section-9.4.html#BinaryExpansionXmpPage>`__ ,
`HexadecimalExpansionXmpPage <section-9.33.html#HexadecimalExpansionXmpPage>`__
, and
`RadixExpansionXmpPage <section-9.65.html#RadixExpansionXmpPage>`__ .

The operation decimaldecimalDecimalExpansion is used to create this
expansion of type DecimalExpansion.


.. spadInput
::

	r := decimal(22/7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 3.142857‾   |
+-------------+




.. spadType

:sub:`Type: DecimalExpansion`



Arithmetic is exact.


.. spadInput
::

	r + decimal(6/7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: DecimalExpansion`



The period of the expansion can be short or long ...


.. spadInput
::

	[decimal(1/i) for i in 350..354]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------+
| [0.00285714‾,0.002849‾,0.0028409‾,0.00283286118980169971671388101983‾,0.00282485875706214689265536723163841807909604519774011299435‾]   |
+-----------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List DecimalExpansion`



or very long.


.. spadInput
::

	decimal(1/2049)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 0.000488042947779404587603709126403123474865788189360663738408979990239‾141044411908247925817471937530502684236212786725231820400195217179111‾761835041483650561249389946315275744265495363591996095656417764763299‾170326988775012201073694485114690092728160078086871644704734016593460‾22449975597852611029770619814543679843826256710590531966813079551‾   |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: DecimalExpansion`



These numbers are bona fide algebraic objects.


.. spadInput
::

	p := decimal(1/4)*x^2 + decimal(2/3)*x + decimal(4/9)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| 0.25x2+0.6‾x+0.4‾   |
+---------------------+




.. spadType

:sub:`Type: Polynomial DecimalExpansion`




.. spadInput
::

	q := differentiate(p, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 0.5x+0.6‾   |
+-------------+




.. spadType

:sub:`Type: Polynomial DecimalExpansion`




.. spadInput
::

	g := gcd(p, q)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| x+1.3‾   |
+----------+




.. spadType

:sub:`Type: Polynomial DecimalExpansion`





