.. status: ok


9.84 UniversalSegment
---------------------

The UniversalSegment domain generalizes Segment by allowing segments
without a hi end point.


.. spadInput
::

	pints := 1..


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 1..   |
+-------+




.. spadType

:sub:`Type: UniversalSegment PositiveInteger`




.. spadInput
::

	nevens := (0..) by -2


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 0..by -2   |
+------------+




.. spadType

:sub:`Type: UniversalSegment NonNegativeInteger`



Values of type Segment are automatically converted to type
UniversalSegment when appropriate.


.. spadInput
::

	useg: UniversalSegment(Integer) := 3..10


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 3..10   |
+---------+




.. spadType

:sub:`Type: UniversalSegment Integer`



The operation hasHihasHiUniversalSegment is used to test whether a
segment has a hi end point.


.. spadInput
::

	hasHi pints


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	hasHi nevens


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	hasHi useg


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



All operations available on type Segment apply to UniversalSegment, with
the proviso that expansions produce streams rather than lists. This is
to accommodate infinite expansions.


.. spadInput
::

	expand pints


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [1,2,3,4,5,6,7,8,9,10,…]   |
+----------------------------+




.. spadType

:sub:`Type: Stream Integer`




.. spadInput
::

	expand nevens


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| [0,-2,-4,-6,-8,-10,-12,-14,-16,-18,…]   |
+-----------------------------------------+




.. spadType

:sub:`Type: Stream Integer`




.. spadInput
::

	expand [1, 3, 10..15, 100..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [1,3,10,11,12,13,14,15,100,101,…]   |
+-------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



For more information on related topics, see
`SegmentXmpPage <section-9.69.html#SegmentXmpPage>`__ ,
`SegmentBindingXmpPage <section-9.70.html#SegmentBindingXmpPage>`__ ,
`ListXmpPage <section-9.1.html#AssociationListXmpPage>`__ , and
`StreamXmpPage <section-9.76.html#StreamXmpPage>`__ .



