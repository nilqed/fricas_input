.. status: ok


9.57 OneDimensionalArray
------------------------

The OneDimensionalArray domain is used for storing data in a
one-dimensional indexed data structure. Such an array is a homogeneous
data structure in that all the entries of the array must belong to the
same FriCAS domain. Each array has a fixed length specified by the user
and arrays are not extensible. The indexing of one-dimensional arrays is
one-based. This means that the first element of an array is given the
index 1. See also `VectorXmpPage <section-9.85.html#VectorXmpPage>`__
and `FlexibleArrayXmpPage <section-9.26.html#FlexibleArrayXmpPage>`__ .

To create a one-dimensional array, apply the operation
oneDimensionalArray to a list.


.. spadInput
::

	oneDimensionalArray [i^2 for i in 1..10]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [1,4,9,16,25,36,49,64,81,100]   |
+---------------------------------+




.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`



Another approach is to first create a, a one-dimensional array of 10
0's. OneDimensionalArray has the convenient abbreviation ARRAY1.


.. spadInput
::

	a : ARRAY1 INT := new(10,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| [0,0,0,0,0,0,0,0,0,0]   |
+-------------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



Set each ith element to i, then display the result.


.. spadInput
::

	for i in 1..10 repeat a.i := i; a


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [1,2,3,4,5,6,7,8,9,10]   |
+--------------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



Square each element by mapping the function i↦i2 onto each element.


.. spadInput
::

	map!(i +-> i ^ 2,a); a


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [1,4,9,16,25,36,49,64,81,100]   |
+---------------------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



Reverse the elements in place.


.. spadInput
::

	reverse! a


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [100,81,64,49,36,25,16,9,4,1]   |
+---------------------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



Swap the 4th and 5th element.


.. spadInput
::

	swap!(a,4,5); a


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [100,81,64,36,49,25,16,9,4,1]   |
+---------------------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



Sort the elements in place.


.. spadInput
::

	sort! a


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [1,4,9,16,25,36,49,64,81,100]   |
+---------------------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



Create a new one-dimensional array b containing the last 5 elements of
a.


.. spadInput
::

	b := a(6..10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [36,49,64,81,100]   |
+---------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`



Replace the first 5 elements of a with those of b.


.. spadInput
::

	copyInto!(a,b,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [36,49,64,81,100,36,49,64,81,100]   |
+-------------------------------------+




.. spadType

:sub:`Type: OneDimensionalArray Integer`





