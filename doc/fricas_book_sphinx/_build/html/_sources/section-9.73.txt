.. status: ok


9.73 SparseTable
----------------

The SparseTable domain provides a general purpose table type with
default entries.

Here we create a table to save strings under integer keys. The value
"Try again!" is returned if no other value has been stored for a key.


.. spadInput
::

	t: SparseTable(Integer, String, "Try again!") := table()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| table()   |
+-----------+




.. spadType

:sub:`Type: SparseTable(Integer,String,Try again!)`



Entries can be stored in the table.


.. spadInput
::

	t.3 := "Number three"


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| "Numberthree"   |
+-----------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	t.4 := "Number four"


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "Numberfour"   |
+----------------+




.. spadType

:sub:`Type: String`



These values can be retrieved as usual, but if a look up fails the
default entry will be returned.


.. spadInput
::

	t.3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| "Numberthree"   |
+-----------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	t.2


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| "Tryagain!"   |
+---------------+




.. spadType

:sub:`Type: String`



To see which values are explicitly stored, the keyskeysSparseTable and
entriesentriesSparseTable functions can be used.


.. spadInput
::

	keys t


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [4,3]   |
+---------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	entries t


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| ["Numberfour","Numberthree"]   |
+--------------------------------+




.. spadType

:sub:`Type: List String`



If a specific table representation is required, the GeneralSparseTable
constructor should be used. The domain SparseTable(K, E, dflt) is
equivalent to GeneralSparseTable(K,E,Table(K,E), dflt). For more
information, see `TableXmpPage <section-9.18.html#EqTableXmpPage>`__
and
`GeneralSparseTableXmpPage <section-9.30.html#GeneralSparseTableXmpPage>`__
.



