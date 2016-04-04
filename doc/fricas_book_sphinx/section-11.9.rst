.. status: ok


11.9 Testing
------------

Once you have written the package, embed it in a file, for example,
sortpak.spad. testing Be sure to include an )abbrev command at the top
of the file:


.. spadVerbatim

::

 )abbrev package SORTPAK SortPackage



Now compile the file (using )compile sortpak.spad).

Expose the constructor. You are then ready to begin testing.


.. spadInput
::

	)expose SORTPAK


.. spadMathAnswer
Define a list.


.. spadInput
::

	l := [1,7,4,2,11,-7,3,2]


.. spadMathAnswer
Since the integers are an ordered set, a one-argument operation will do.


.. spadInput
::

	bubbleSort!(l)


.. spadMathAnswer
Re-sort it using greater than.


.. spadInput
::

	bubbleSort!(l,(x,y) +-> x > y)


.. spadMathAnswer
Now sort it again using < on integers.


.. spadInput
::

	bubbleSort!(l, < $Integer)


.. spadMathAnswer
A string is an aggregate of characters so we can sort them as well.


.. spadInput
::

	bubbleSort! "Mathematical Sciences"


.. spadMathAnswer
Is < defined on booleans?


.. spadInput
::

	false < true


.. spadMathAnswer
Good! Create a bit string representing ten consecutive boolean values
true.


.. spadInput
::

	u : Bits := new(10,true)


.. spadMathAnswer
Set bits 3 through 5 to false, then display the result.


.. spadInput
::

	u(3..5) := false; u


.. spadMathAnswer
Now sort these booleans.


.. spadInput
::

	bubbleSort! u


.. spadMathAnswer
Create an eq-table, a table having integers as keys and strings as
values.


.. spadInput
::

	t : EqTable(Integer,String) := table()


.. spadMathAnswer
Give the table a first entry.


.. spadInput
::

	t.1 := "robert"


.. spadMathAnswer
And a second.


.. spadInput
::

	t.2 := "richard"


.. spadMathAnswer
What does the table look like?


.. spadInput
::

	t


.. spadMathAnswer
Now sort it.


.. spadInput
::

	bubbleSort! t


.. spadMathAnswer
