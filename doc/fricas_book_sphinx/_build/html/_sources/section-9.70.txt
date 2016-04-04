.. status: ok


9.70 SegmentBinding
-------------------

The SegmentBinding type is used to indicate a range for a named symbol.

First give the symbol, then an = and finally a segment of values.


.. spadInput
::

	x = a..b


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| x=a..b   |
+----------+




.. spadType

:sub:`Type: SegmentBinding Symbol`



This is used to provide a convenient syntax for arguments to certain
operations.


.. spadInput
::

	sum(i^2, i = 0..n)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`




.. spadInput
::

	draw(x^2, x = -2..2)


.. spadMathAnswer
The left-hand side must be of type Symbol but the right-hand side can be
a segment over any type.


.. spadInput
::

	sb := y = 1/2..3/2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| y=(12)..(32)   |
+----------------+




.. spadType

:sub:`Type: SegmentBinding Fraction Integer`



The left- and right-hand sides can be obtained using the
variablevariableSegmentBinding and segmentsegmentSegmentBinding
operations.


.. spadInput
::

	variable(sb)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	segment(sb)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| (12)..(32)   |
+--------------+




.. spadType

:sub:`Type: Segment Fraction Integer`



For more information on related topics, see
`SegmentXmpPage <section-9.69.html#SegmentXmpPage>`__ and
`UniversalSegmentXmpPage <section-9.84.html#UniversalSegmentXmpPage>`__
.



