.. status: ok


9.69 Segment
------------

The Segment domain provides a generalized interval type.

Segments are created using the .. construct by indicating the (included)
end points.


.. spadInput
::

	s := 3..10


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 3..10   |
+---------+




.. spadType

:sub:`Type: Segment PositiveInteger`



The first end point is called the loloSegment and the second is called
hihiSegment.


.. spadInput
::

	lo s


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



These names are used even though the end points might belong to an
unordered set.


.. spadInput
::

	hi s


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



In addition to the end points, each segment has an integer increment. An
increment can be specified using the by construct.


.. spadInput
::

	t := 10..3 by -2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| 10..3by -2   |
+--------------+




.. spadType

:sub:`Type: Segment PositiveInteger`



This part can be obtained using the incrincrSegment function.


.. spadInput
::

	incr s


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Unless otherwise specified, the increment is 1.


.. spadInput
::

	incr t


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -2   |
+------+




.. spadType

:sub:`Type: Integer`



A single value can be converted to a segment with equal end points. This
happens if segments and single values are mixed in a list.


.. spadInput
::

	l := [1..3, 5, 9, 15..11 by -1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [1..3,5..5,9..9,15..11by-1]   |
+-------------------------------+




.. spadType

:sub:`Type: List Segment PositiveInteger`



If the underlying type is an ordered ring, it is possible to perform
additional operations. The expandexpandSegment operation creates a list
of points in a segment.


.. spadInput
::

	expand s


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| [3,4,5,6,7,8,9,10]   |
+----------------------+




.. spadType

:sub:`Type: List Integer`



If k > 0, then expand(l..h by k) creates the list [l, l+k, ..., lN]
where lN <= h < lN+k. If k < 0, then lN >= h > lN+k.


.. spadInput
::

	expand t


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [10,8,6,4]   |
+--------------+




.. spadType

:sub:`Type: List Integer`



It is also possible to expand a list of segments. This is equivalent to
appending lists obtained by expanding each segment individually.


.. spadInput
::

	expand l


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [1,2,3,5,9,15,14,13,12,11]   |
+------------------------------+




.. spadType

:sub:`Type: List Integer`



For more information on related topics, see
`SegmentBindingXmpPage <section-9.70.html#SegmentBindingXmpPage>`__ and
`UniversalSegmentXmpPage <section-9.84.html#UniversalSegmentXmpPage>`__
.



