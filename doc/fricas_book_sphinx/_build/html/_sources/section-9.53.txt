.. status: ok



9.53 MultiSet
-------------

The domain Multiset(R) is similar to Set(R) except that multiplicities
(counts of duplications) are maintained and displayed. Use the operation
multisetmultisetMultiset to create multisets from lists. All the
standard operations from sets are available for multisets. An element
with multiplicity greater than one has the multiplicity displayed first,
then a colon, and then the element.

Create a multiset of integers.


.. spadInput
::

	s := multiset [1,2,3,4,5,4,3,2,3,4,5,6,7,4,10]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| {7,2:5,3:3,1,10,6,4:4,2:2}   |
+------------------------------+




.. spadType

:sub:`Type: Multiset PositiveInteger`



The operation insert! adds an element to a multiset.


.. spadInput
::

	insert!(3,s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| {7,2:5,4:3,1,10,6,4:4,2:2}   |
+------------------------------+




.. spadType

:sub:`Type: Multiset PositiveInteger`



Use remove! to remove an element. If a third argument is present, it
specifies how many instances to remove. Otherwise all instances of the
element are removed. Display the resulting multiset.


.. spadInput
::

	remove!(3,s,1); s


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| {7,2:5,3:3,1,10,6,4:4,2:2}   |
+------------------------------+




.. spadType

:sub:`Type: Multiset PositiveInteger`




.. spadInput
::

	remove!(5,s); s


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| {7,3:3,1,10,6,4:4,2:2}   |
+--------------------------+




.. spadType

:sub:`Type: Multiset PositiveInteger`



The operation count returns the number of copies of a given value.


.. spadInput
::

	count(5,s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



A second multiset.


.. spadInput
::

	t := multiset [2,2,2,-9]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| {-9,3:2}   |
+------------+




.. spadType

:sub:`Type: Multiset Integer`



The union of two multisets is additive.


.. spadInput
::

	U := union(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| {7,3:3,1,-9,10,6,4:4,5:2}   |
+-----------------------------+




.. spadType

:sub:`Type: Multiset Integer`



The intersect operation gives the elements that are in common, with
additive multiplicity.


.. spadInput
::

	I := intersect(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| {5:2}   |
+---------+




.. spadType

:sub:`Type: Multiset Integer`



The difference of s and t consists of the elements that s has but t does
not. Elements are regarded as indistinguishable, so that if s and t have
any element in common, the difference does not contain that element.


.. spadInput
::

	difference(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| {7,3:3,1,10,6,4:4}   |
+----------------------+




.. spadType

:sub:`Type: Multiset Integer`



The symmetricDifference is the union of difference(s, t) and
difference(t, s).


.. spadInput
::

	S := symmetricDifference(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| {7,3:3,1,-9,10,6,4:4}   |
+-------------------------+




.. spadType

:sub:`Type: Multiset Integer`



Check that the union of the symmetricDifference and the intersect equals
the union of the elements.


.. spadInput
::

	(U = union(S,I))@Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Check some inclusion relations.


.. spadInput
::

	t1 := multiset [1,2,2,3]; [t1 < t, t1 < s, t < s, t1 <= s]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [false,true,false,true]   |
+---------------------------+




.. spadType

:sub:`Type: List Boolean`





