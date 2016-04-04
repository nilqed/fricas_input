.. status: ok



9.32 Heap
---------

The domain Heap(S) implements a priority queue of objects of type S such
that the operation extract! removes and returns the maximum element. The
implementation represents heaps as flexible arrays (see
`FlexibleArrayXmpPage <section-9.26.html#FlexibleArrayXmpPage>`__ ).
The representation and algorithms give complexity of O(log(n)) for
insertion and extractions, and O(n) for construction.

Create a heap of six elements.


.. spadInput
::

	h := heap [-4,9,11,2,7,-7]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [11,7,9,-4,2,-7]   |
+--------------------+




.. spadType

:sub:`Type: Heap Integer`



Use insert! to add an element.


.. spadInput
::

	insert!(3,h)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| [11,7,9,-4,2,-7,3]   |
+----------------------+




.. spadType

:sub:`Type: Heap Integer`



The operation extract! removes and returns the maximum element.


.. spadInput
::

	extract! h


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 11   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



The internal structure of h has been appropriately adjusted.


.. spadInput
::

	h


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [9,7,3,-4,2,-7]   |
+-------------------+




.. spadType

:sub:`Type: Heap Integer`



Now extract! elements repeatedly until none are left, collecting the
elements in a list.


.. spadInput
::

	[extract!(h) while not empty?(h)]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [9,7,3,2,-4,-7]   |
+-------------------+




.. spadType

:sub:`Type: List Integer`



Another way to produce the same result is by defining a heapsort
function.


.. spadInput
::

	heapsort(x) == (empty? x => []; cons(extract!(x),heapsort x))


.. spadMathAnswer
.. spadType

Void



Create another sample heap.


.. spadInput
::

	h1 := heap [17,-4,9,-11,2,7,-7]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| [17,2,9,-11,-4,7,-7]   |
+------------------------+




.. spadType

:sub:`Type: Heap Integer`



Apply heapsort to present elements in order.


.. spadInput
::

	heapsort h1


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| [17,9,7,2,-4,-7,-11]   |
+------------------------+




.. spadType

:sub:`Type: List Integer`





