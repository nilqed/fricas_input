.. status: ok


9.18 EqTable
------------

The EqTable domain provides tables where the keys are compared using
eq?eq?EqTable. Keys are considered equal only if they are the same
instance of a structure. This is useful if the keys are themselves
updatable structures. Otherwise, all operations are the same as for type
Table. See `TableXmpPage <section-9.18.html#EqTableXmpPage>`__ for
general information about tables.

The operation tabletableEqTable is here used to create a table where the
keys are lists of integers.


.. spadInput
::

	e: EqTable(List Integer, Integer) := table()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| table()   |
+-----------+




.. spadType

:sub:`Type: EqTable(List Integer,Integer)`



These two lists are equal according to =, but not according to
eq?eq?List.


.. spadInput
::

	l1 := [1,2,3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1,2,3]   |
+-----------+




.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	l2 := [1,2,3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1,2,3]   |
+-----------+




.. spadType

:sub:`Type: List PositiveInteger`



Because the two lists are not eq?eq?List, separate values can be stored
under each.


.. spadInput
::

	e.l1 := 111


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 111   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	e.l2 := 222


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 222   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	e.l1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 111   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`





