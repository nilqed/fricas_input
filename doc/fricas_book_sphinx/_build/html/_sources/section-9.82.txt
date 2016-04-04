.. status: ok



9.82 TwoDimensionalArray
------------------------

The TwoDimensionalArray domain is used for storing data in a two
dimensional data structure indexed by row and by column. Such an array
is a homogeneous data structure in that all the entries of the array
must belong to the same FriCAS domain (although see
`ugTypesAnyNonePage <ugTypesAnyNonePage>`__ in Section
`ugTypesAnyNoneNumber <ugTypesAnyNoneNumber>`__ ). Each array has a
fixed number of rows and columns specified by the user and arrays are
not extensible. In FriCAS, the indexing of two-dimensional arrays is
one-based. This means that both the first row of an array and the first
column of an array are given the index 1. Thus, the entry in the upper
left corner of an array is in position (1,1).

The operation newnewTwoDimensionalArray creates an array with a
specified number of rows and columns and fills the components of that
array with a specified entry. The arguments of this operation specify
the number of rows, the number of columns, and the entry.

This creates a five-by-four array of integers, all of whose entries are
zero.


.. spadInput
::

	arr : ARRAY2 INT := new(5,4,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [00000000000000000000]   |
+--------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`



The entries of this array can be set to other integers using the
operation seteltseteltTwoDimensionalArray.

Issue this to set the element in the upper left corner of this array to
17.


.. spadInput
::

	setelt(arr,1,1,17)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 17   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Now the first element of the array is 17.


.. spadInput
::

	arr


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [170000000000000000000]   |
+---------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`



Likewise, elements of an array are extracted using the operation
elteltTwoDimensionalArray.


.. spadInput
::

	elt(arr,1,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 17   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Another way to use these two operations is as follows. This sets the
element in position (3,2) of the array to 15.


.. spadInput
::

	arr(3,2) := 15


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 15   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



This extracts the element in position (3,2) of the array.


.. spadInput
::

	arr(3,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 15   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



The operations elteltTwoDimensionalArray and
seteltseteltTwoDimensionalArray come equipped with an error check which
verifies that the indices are in the proper ranges. For example, the
above array has five rows and four columns, so if you ask for the entry
in position (6,2) with arr(6,2) FriCAS displays an error message. If
there is no need for an error check, you can call the operations
qeltqeltTwoDimensionalArray and qseteltqseteltTwoDimensionalArray which
provide the same functionality but without the error check. Typically,
these operations are called in well-tested programs.

The operations rowrowTwoDimensionalArray and
columncolumnTwoDimensionalArray extract rows and columns, respectively,
and return objects of OneDimensionalArray with the same underlying
element type.


.. spadInput
::

	row(arr,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [17,0,0,0]   |
+--------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`




.. spadInput
::

	column(arr,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| [17,0,0,0,0]   |
+----------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



You can determine the dimensions of an array by calling the operations
nrowsnrowsTwoDimensionalArray and ncolsncolsTwoDimensionalArray, which
return the number of rows and columns, respectively.


.. spadInput
::

	nrows(arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 5   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	ncols(arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



To apply an operation to every element of an array, use
mapmapTwoDimensionalArray. This creates a new array. This expression
negates every element.


.. spadInput
::

	map(-,arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [-1700000000-150000000000]   |
+------------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`



This creates an array where all the elements are doubled.


.. spadInput
::

	map((x +-> x + x),arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [3400000000300000000000]   |
+----------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`



To change the array destructively, use mapmapTwoDimensionalArray instead
of mapmapTwoDimensionalArray. If you need to make a copy of any array,
use copycopyTwoDimensionalArray.


.. spadInput
::

	arrc := copy(arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [1700000000150000000000]   |
+----------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`




.. spadInput
::

	map!(-,arrc)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [-1700000000-150000000000]   |
+------------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`




.. spadInput
::

	arrc


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [-1700000000-150000000000]   |
+------------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`




.. spadInput
::

	arr


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [1700000000150000000000]   |
+----------------------------+




.. spadType

:sub:`Type: TwoDimensionalArray Integer`



Use member?member?TwoDimensionalArray to see if a given element is in an
array.


.. spadInput
::

	member?(17,arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	member?(10317,arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



To see how many times an element appears in an array, use
countcountTwoDimensionalArray.


.. spadInput
::

	count(17,arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	count(0,arr)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 18   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



For more information about the operations available for
TwoDimensionalArray, issue )show TwoDimensionalArray. For information on
related topics, see `MatrixXmpPage <section-9.52.html#MatrixXmpPage>`__
and
`OneDimensionalArrayXmpPage <section-9.57.html#OneDimensionalArrayXmpPage>`__
.



