.. status: ok


9.26 FlexibleArray
------------------

The FlexibleArray domain constructor creates one-dimensional arrays of
elements of the same type. Flexible arrays are an attempt to provide a
data type that has the best features of both one-dimensional arrays
(fast, random access to elements) and lists (flexibility). They are
implemented by a fixed block of storage. When necessary for expansion, a
new, larger block of storage is allocated and the elements from the old
storage area are copied into the new block.

Flexible arrays have available most of the operations provided by
OneDimensionalArray (see
`OneDimensionalArrayXmpPage <section-9.57.html#OneDimensionalArrayXmpPage>`__
and `VectorXmpPage <section-9.85.html#VectorXmpPage>`__ ). Since
flexible arrays are also of category ExtensibleLinearAggregate, they
have operations concat!, delete!, insert!, merge!, remove!,
removeDuplicates!, and select!. In addition, the operations
physicalLength and physicalLength! provide user-control over expansion
and contraction.

A convenient way to create a flexible array is to apply the operation
flexibleArray to a list of values.


.. spadInput
::

	flexibleArray [i for i in 1..6]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [1,2,3,4,5,6]   |
+-----------------+




.. spadType

:sub:`Type: FlexibleArray PositiveInteger`



Create a flexible array of six zeroes.


.. spadInput
::

	f : FARRAY INT := new(6,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [0,0,0,0,0,0]   |
+-----------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



For i=1…6 set the i-th element to i. Display f.


.. spadInput
::

	for i in 1..6 repeat f.i := i; f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [1,2,3,4,5,6]   |
+-----------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Initially, the physical length is the same as the number of elements.


.. spadInput
::

	physicalLength f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 6   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Add an element to the end of f.


.. spadInput
::

	concat!(f,11)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [1,2,3,4,5,6,11]   |
+--------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



See that its physical length has grown.


.. spadInput
::

	physicalLength f


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Make f grow to have room for 15 elements.


.. spadInput
::

	physicalLength!(f,15)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [1,2,3,4,5,6,11]   |
+--------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Concatenate the elements of f to itself. The physical length allows room
for three more values at the end.


.. spadInput
::

	concat!(f,f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [1,2,3,4,5,6,11,1,2,3,4,5,6,11]   |
+-----------------------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Use insert! to add an element to the front of a flexible array.


.. spadInput
::

	insert!(22,f,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| [22,1,2,3,4,5,6,11,1,2,3,4,5,6,11]   |
+--------------------------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Create a second flexible array from f consisting of the elements from
index 10 forward.


.. spadInput
::

	g := f(10..)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [2,3,4,5,6,11]   |
+------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Insert this array at the front of f.


.. spadInput
::

	insert!(g,f,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| [2,3,4,5,6,11,22,1,2,3,4,5,6,11,1,2,3,4,5,6,11]   |
+---------------------------------------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Merge the flexible array f into g after sorting each in place.


.. spadInput
::

	merge!(sort! f, sort! g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------+
| [1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,11,11,11,11,22]   |
+----------------------------------------------------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Remove duplicates in place.


.. spadInput
::

	removeDuplicates! f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| [1,2,3,4,5,6,11,22]   |
+-----------------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



Remove all odd integers.


.. spadInput
::

	select!(i +-> even? i,f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [2,4,6,22]   |
+--------------+




.. spadType

:sub:`Type: FlexibleArray Integer`



All these operations have shrunk the physical length of f.


.. spadInput
::

	physicalLength f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



To force FriCAS not to shrink flexible arrays call the shrinkable
operation with the argument false. You must package call this operation.
The previous value is returned.


.. spadInput
::

	shrinkable(false)$FlexibleArray(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`





