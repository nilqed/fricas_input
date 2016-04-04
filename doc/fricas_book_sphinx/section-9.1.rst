.. status: ok
Index <book-index.html>`__



9.1 AssociationList
-------------------

The AssociationList constructor provides a general structure for
associative storage. This type provides association lists in which data
objects can be saved according to keys of any type. For a given
association list, specific types must be chosen for the keys and
entries. You can think of the representation of an association list as a
list of records with key and entry fields.

Association lists are a form of table and so most of the operations
available for Table are also available for AssociationList. They can
also be viewed as lists and can be manipulated accordingly.

This is a Record type with age and gender fields.


.. spadInput
::

	Data := Record(monthsOld : Integer, gender : String)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------+
| Record(monthsOld:Integer,gender:String)   |
+-------------------------------------------+




.. spadType

:sub:`Type: Domain`



In this expression, al is declared to be an association list whose keys
are strings and whose entries are the above records.


.. spadInput
::

	al : AssociationList(String,Data)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The tabletableAssociationList operation is used to create an empty
association list.


.. spadInput
::

	al := table()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| table()   |
+-----------+




.. spadType

:sub:`Type: AssociationList(String,Record(monthsOld: Integer,gender: String))`



You can use assignment syntax to add things to the association list.


.. spadInput
::

	al."bob" := [407,"male"]$Data


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [monthsOld=407,gender="male"]   |
+---------------------------------+




.. spadType

:sub:`Type: Record(monthsOld: Integer,gender: String)`




.. spadInput
::

	al."judith" := [366,"female"]$Data


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [monthsOld=366,gender="female"]   |
+-----------------------------------+




.. spadType

:sub:`Type: Record(monthsOld: Integer,gender: String)`




.. spadInput
::

	al."katie" := [24,"female"]$Data


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [monthsOld=24,gender="female"]   |
+----------------------------------+




.. spadType

:sub:`Type: Record(monthsOld: Integer,gender: String)`



Perhaps we should have included a species field.


.. spadInput
::

	al."smokie" := [200,"female"]$Data


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [monthsOld=200,gender="female"]   |
+-----------------------------------+




.. spadType

:sub:`Type: Record(monthsOld: Integer,gender: String)`



Now look at what is in the association list. Note that the last-added
(key, entry) pair is at the beginning of the list.


.. spadInput
::

	al


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| table("smokie"=[monthsOld=200,gender="female"],"katie"=[monthsOld=24,gender="female"],"judith"=[monthsOld=366,gender="female"],"bob"=[monthsOld=407,gender="male"])   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: AssociationList(String,Record(monthsOld: Integer,gender: String))`



You can reset the entry for an existing key.


.. spadInput
::

	al."katie" := [23,"female"]$Data


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [monthsOld=23,gender="female"]   |
+----------------------------------+




.. spadType

:sub:`Type: Record(monthsOld: Integer,gender: String)`



Use deletedeleteAssociationList to destructively remove an element of
the association list. Use deletedeleteAssociationList to return a copy
of the association list with the element deleted. The second argument is
the index of the element to delete.


.. spadInput
::

	delete!(al,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------+
| table("katie"=[monthsOld=23,gender="female"],"judith"=[monthsOld=366,gender="female"],"bob"=[monthsOld=407,gender="male"])   |
+------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: AssociationList(String,Record(monthsOld: Integer,gender: String))`



For more information about tables, see
`TableXmpPage <section-9.18.html#EqTableXmpPage>`__ . For more
information about lists, see
`ListXmpPage <section-9.1.html#AssociationListXmpPage>`__ .



Index <book-index.html>`__
