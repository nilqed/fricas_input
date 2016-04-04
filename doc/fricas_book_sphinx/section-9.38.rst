.. status: ok



9.38 KeyedAccessFile
--------------------

The domain KeyedAccessFile(S) provides files which can be used as
associative tables. Data values are stored in these files and can be
retrieved according to their keys. The keys must be strings so this type
behaves very much like the StringTable(S) domain. The difference is that
keyed access files reside in secondary storage while string tables are
kept in memory. For more information on table-oriented operations, see
the description of Table.

Before a keyed access file can be used, it must first be opened. A new
file can be created by opening it for output.


.. spadInput
::

	ey: KeyedAccessFile(Integer) := open("/tmp/editor.year", "output")


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| "/tmp/editor.year"   |
+----------------------+




.. spadType

:sub:`Type: KeyedAccessFile Integer`



Just as for vectors, tables or lists, values are saved in a keyed access
file by setting elements.


.. spadInput
::

	ey."Char" := 1986


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1986   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	ey."Caviness" := 1985


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1985   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	ey."Fitch" := 1984


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1984   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`



Values are retrieved using application, in any of its syntactic forms.


.. spadInput
::

	ey."Char"


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1986   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	ey("Char")


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1986   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	ey "Char"


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1986   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`



Attempting to retrieve a non-existent element in this way causes an
error. If it is not known whether a key exists, you should use the
searchsearchKeyedAccessFile operation.


.. spadInput
::

	search("Char", ey)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1986   |
+--------+




.. spadType

:sub:`Type: Union(Integer,...)`




.. spadInput
::

	search("Smith", ey)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



When an entry is no longer needed, it can be removed from the file.


.. spadInput
::

	remove!("Char", ey)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1986   |
+--------+




.. spadType

:sub:`Type: Union(Integer,...)`



The keyskeysKeyedAccessFile operation returns a list of all the keys for
a given file.


.. spadInput
::

	keys ey


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| ["Fitch","Caviness"]   |
+------------------------+




.. spadType

:sub:`Type: List String`



The # #KeyedAccessFile operation gives the number of entries.


.. spadInput
::

	#ey


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The table view of keyed access files provides safe operations. That is,
if the FriCAS program is terminated between file operations, the file is
left in a consistent, current state. This means, however, that the
operations are somewhat costly. For example, after each update the file
is closed.

Here we add several more items to the file, then check its contents.


.. spadInput
::

	KE := Record(key: String, entry: Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| Record(key:String,entry:Integer)   |
+------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	reopen!(ey, "output")


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| "/tmp/editor.year"   |
+----------------------+




.. spadType

:sub:`Type: KeyedAccessFile Integer`



If many items are to be added to a file at the same time, then it is
more efficient to use the writewriteKeyedAccessFile operation.


.. spadInput
::

	write!(ey, ["van Hulzen", 1983]$KE)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [key="vanHulzen",entry=1983]   |
+--------------------------------+




.. spadType

:sub:`Type: Record(key: String,entry: Integer)`




.. spadInput
::

	write!(ey, ["Calmet", 1982]$KE)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| [key="Calmet",entry=1982]   |
+-----------------------------+




.. spadType

:sub:`Type: Record(key: String,entry: Integer)`




.. spadInput
::

	write!(ey, ["Wang", 1981]$KE)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [key="Wang",entry=1981]   |
+---------------------------+




.. spadType

:sub:`Type: Record(key: String,entry: Integer)`




.. spadInput
::

	close! ey


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| "/tmp/editor.year"   |
+----------------------+




.. spadType

:sub:`Type: KeyedAccessFile Integer`



The readreadKeyedAccessFile operation is also available from the file
view, but it returns elements in a random order. It is generally clearer
and more efficient to use the keyskeysKeyedAccessFile operation and to
extract elements by key.


.. spadInput
::

	keys ey


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------+
| ["Wang","Calmet","vanHulzen","Fitch","Caviness"]   |
+----------------------------------------------------+




.. spadType

:sub:`Type: List String`




.. spadInput
::

	members ey


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [1981,1982,1983,1984,1985]   |
+------------------------------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	)system rm -r /tmp/editor.year


.. spadMathAnswer
For more information on related topics, see
`FileXmpPage <section-9.24.html#FileXmpPage>`__ ,
`TextFileXmpPage <section-9.81.html#TextFileXmpPage>`__ , and
`LibraryXmpPage <section-9.41.html#LibraryXmpPage>`__ .



