.. status: ok



9.30 GeneralSparseTable
-----------------------

Sometimes when working with tables there is a natural value to use as
the entry in all but a few cases. The GeneralSparseTable constructor can
be used to provide any table type with a default value for entries. See
`TableXmpPage <section-9.18.html#EqTableXmpPage>`__ for general
information about tables.

Suppose we launched a fund-raising campaign to raise fifty thousand
dollars. To record the contributions, we want a table with strings as
keys (for the names) and integer entries (for the amount). In a data
base of cash contributions, unless someone has been explicitly entered,
it is reasonable to assume they have made a zero dollar contribution.

This creates a keyed access file with default entry 0.


.. spadInput
::

	patrons: GeneralSparseTable(String, Integer, KeyedAccessFile(Integer),
0) := table() ;


.. spadMathAnswer
.. spadType

:sub:`Type: GeneralSparseTable(String,Integer,KeyedAccessFile Integer,0)`



Now patrons can be used just as any other table. Here we record two
gifts.


.. spadInput
::

	patrons."Smith" := 10500


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 10500   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	patrons."Jones" := 22000


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 22000   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`



Now let us look up the size of the contributions from Jones and Stingy.


.. spadInput
::

	patrons."Jones"


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 22000   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	patrons."Stingy"


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



Have we met our seventy thousand dollar goal?


.. spadInput
::

	reduce(+, entries patrons)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 32500   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`



So the project is cancelled and we can delete the data base:


.. spadInput
::

	)system rm -r kaf*.sdata


.. spadMathAnswer
