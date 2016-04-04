.. status: ok


9.80 Table
----------

The Table constructor provides a general structure for associative
storage. This type provides hash tables in which data objects can be
saved according to keys of any type. For a given table, specific types
must be chosen for the keys and entries.

In this example the keys to the table are polynomials with integer
coefficients. The entries in the table are strings.


.. spadInput
::

	t: Table(Polynomial Integer, String) := table()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| table()   |
+-----------+




.. spadType

:sub:`Type: Table(Polynomial Integer,String)`



To save an entry in the table, the seteltseteltTable operation is used.
This can be called directly, giving the table a key and an entry.


.. spadInput
::

	setelt(t, x^2 - 1, "Easy to factor")


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| "Easytofactor"   |
+------------------+




.. spadType

:sub:`Type: String`



Alternatively, you can use assignment syntax.


.. spadInput
::

	t(x^3 + 1) := "Harder to factor"


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| "Hardertofactor"   |
+--------------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	t(x) := "The easiest to factor"


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| "Theeasiesttofactor"   |
+------------------------+




.. spadType

:sub:`Type: String`



Entries are retrieved from the table by calling the elteltTable
operation.


.. spadInput
::

	elt(t, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| "Theeasiesttofactor"   |
+------------------------+




.. spadType

:sub:`Type: String`



This operation is called when a table is applied to a key using this or
the following syntax.


.. spadInput
::

	t.x


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| "Theeasiesttofactor"   |
+------------------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	t x


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| "Theeasiesttofactor"   |
+------------------------+




.. spadType

:sub:`Type: String`



Parentheses are used only for grouping. They are needed if the key is an
infixed expression.


.. spadInput
::

	t.(x^2 - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| "Easytofactor"   |
+------------------+




.. spadType

:sub:`Type: String`



Note that the elteltTable operation is used only when the key is known
to be in the table---otherwise an error is generated.


.. spadInput
::

	t (x^3 + 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| "Hardertofactor"   |
+--------------------+




.. spadType

:sub:`Type: String`



You can get a list of all the keys to a table using the keyskeysTable
operation.


.. spadInput
::

	keys t


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [x,x3+1,x2-1]   |
+-----------------+




.. spadType

:sub:`Type: List Polynomial Integer`



If you wish to test whether a key is in a table, the searchsearchTable
operation is used. This operation returns either an entry or "failed".


.. spadInput
::

	search(x, t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| "Theeasiesttofactor"   |
+------------------------+




.. spadType

:sub:`Type: Union(String,...)`




.. spadInput
::

	search(x^2, t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



The return type is a union so the success of the search can be tested
using case.


.. spadInput
::

	search(x^2, t) case "failed"


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



The removeremoveTable operation is used to delete values from a table.


.. spadInput
::

	remove!(x^2-1, t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| "Easytofactor"   |
+------------------+




.. spadType

:sub:`Type: Union(String,...)`



If an entry exists under the key, then it is returned. Otherwise
removeremoveTable returns "failed".


.. spadInput
::

	remove!(x-1, t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



The number of key-entry pairs can be found using the # #Table operation.


.. spadInput
::

	#t


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Just as keyskeysTable returns a list of keys to the table, a list of all
the entries can be obtained using the membersmembersTable operation.


.. spadInput
::

	members t


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------+
| ["Theeasiesttofactor","Hardertofactor"]   |
+-------------------------------------------+




.. spadType

:sub:`Type: List String`



A number of useful operations take functions and map them on to the
table to compute the result. Here we count the entries which have Hard
as a prefix.


.. spadInput
::

	count(s: String +-> prefix?("Hard", s), t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Other table types are provided to support various needs. \\indent





AssociationList gives a list with a table view. This allows new entries
to be appended onto the front of the list to cover up old entries. This
is useful when table entries need to be stacked or when frequent list
traversals are required. See
`AssociationListXmpPage <section-9.1.html#AssociationListXmpPage>`__
for more information.





EqTable gives tables in which keys are considered equal only when they
are in fact the same instance of a structure. See
`EqTableXmpPage <section-9.18.html#EqTableXmpPage>`__ for more
information.





StringTable should be used when the keys are known to be strings. See
`StringTableXmpPage <section-9.78.html#StringTableXmpPage>`__ for more
information.





SparseTable provides tables with default entries, so lookup never fails.
The GeneralSparseTable constructor can be used to make any table type
behave this way. See
`SparseTableXmpPage <section-9.30.html#GeneralSparseTableXmpPage>`__
for more information.





KeyedAccessFile allows values to be saved in a file, accessed as a
table. See
`KeyedAccessFileXmpPage <section-9.38.html#KeyedAccessFileXmpPage>`__
for more information.







