.. status: ok


9.85 Vector
-----------

The Vector domain is used for storing data in a one-dimensional indexed
data structure. A vector is a homogeneous data structure in that all the
components of the vector must belong to the same FriCAS domain. Each
vector has a fixed length specified by the user; vectors are not
extensible. This domain is similar to the OneDimensionalArray domain,
except that when the components of a Vector belong to a Ring, arithmetic
operations are provided. For more examples of operations that are
defined for both Vector and OneDimensionalArray, see
`OneDimensionalArrayXmpPage <section-9.57.html#OneDimensionalArrayXmpPage>`__
.

As with the OneDimensionalArray domain, a Vector can be created by
calling the operation newnewVector, its components can be accessed by
calling the operations elteltVector and qeltqeltVector, and its
components can be reset by calling the operations seteltseteltVector and
qseteltqseteltVector.

This creates a vector of integers of length 5 all of whose components
are 12.


.. spadInput
::

	u : VECTOR INT := new(5,12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [12,12,12,12,12]   |
+--------------------+




.. spadType

:sub:`Type: Vector Integer`



This is how you create a vector from a list of its components.


.. spadInput
::

	v : VECTOR INT := vector([1,2,3,4,5])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [1,2,3,4,5]   |
+---------------+




.. spadType

:sub:`Type: Vector Integer`



Indexing for vectors begins at 1. The last element has index equal to
the length of the vector, which is computed by #.


.. spadInput
::

	#(v)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 5   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



This is the standard way to use elteltVector to extract an element.
Functionally, it is the same as if you had typed elt(v,2).


.. spadInput
::

	v.2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



This is the standard way to use seteltseteltVector to change an element.
It is the same as if you had typed setelt(v,3,99).


.. spadInput
::

	v.3 := 99


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 99   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Now look at v to see the change. You can use qeltqeltVector and
qseteltqseteltVector (instead of elteltVector and seteltseteltVector,
respectively) but only when you know that the index is within the valid
range.


.. spadInput
::

	v


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| [1,2,99,4,5]   |
+----------------+




.. spadType

:sub:`Type: Vector Integer`



When the components belong to a Ring, FriCAS provides arithmetic
operations for Vector. These include left and right scalar
multiplication.


.. spadInput
::

	5 * v


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [5,10,495,20,25]   |
+--------------------+




.. spadType

:sub:`Type: Vector Integer`




.. spadInput
::

	v * 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [7,14,693,28,35]   |
+--------------------+




.. spadType

:sub:`Type: Vector Integer`




.. spadInput
::

	w : VECTOR INT := vector([2,3,4,5,6])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [2,3,4,5,6]   |
+---------------+




.. spadType

:sub:`Type: Vector Integer`



Addition and subtraction are also available.


.. spadInput
::

	v + w


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [3,5,103,9,11]   |
+------------------+




.. spadType

:sub:`Type: Vector Integer`



Of course, when adding or subtracting, the two vectors must have the
same length or an error message is displayed.


.. spadInput
::

	v - w


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [-1,-1,95,-1,-1]   |
+--------------------+




.. spadType

:sub:`Type: Vector Integer`



For more information about other aggregate domains, see the following:
`ListXmpPage <section-9.1.html#AssociationListXmpPage>`__ ,
`MatrixXmpPage <section-9.52.html#MatrixXmpPage>`__ ,
`OneDimensionalArrayXmpPage <section-9.57.html#OneDimensionalArrayXmpPage>`__
, `SetXmpPage <section-9.53.html#MultiSetXmpPage>`__ ,
`TableXmpPage <section-9.18.html#EqTableXmpPage>`__ , and
`TwoDimensionalArrayXmpPage <section-9.82.html#TwoDimensionalArrayXmpPage>`__
. Issue the system command )show Vector to display the full list of
operations defined by Vector.



