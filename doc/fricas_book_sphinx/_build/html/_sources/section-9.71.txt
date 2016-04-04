.. status: ok


9.71 Set
--------

The Set domain allows one to represent explicit finite sets of values.
These are similar to lists, but duplicate elements are not allowed.

Sets can be created by giving a fixed set of values ...


.. spadInput
::

	s := set [x^2-1, y^2-1, z^2-1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| {x2-1,y2-1,z2-1}   |
+--------------------+




.. spadType

:sub:`Type: Set Polynomial Integer`



or by using a collect form, just as for lists. In either case, the set
is formed from a finite collection of values.


.. spadInput
::

	t := set [x^i - i+1 for i in 2..10 | prime? i]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| {x2-1,x3-2,x5-4,x7-6}   |
+-------------------------+




.. spadType

:sub:`Type: Set Polynomial Integer`



The basic operations on sets are intersectintersectSet, unionunionSet,
differencedifferenceSet, and symmetricDifferencesymmetricDifferenceSet.


.. spadInput
::

	i := intersect(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| {x2-1}   |
+----------+




.. spadType

:sub:`Type: Set Polynomial Integer`




.. spadInput
::

	u := union(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| {x2-1,x3-2,x5-4,x7-6,y2-1,z2-1}   |
+-----------------------------------+




.. spadType

:sub:`Type: Set Polynomial Integer`



The set difference(s,t) contains those members of s which are not in t.


.. spadInput
::

	difference(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| {y2-1,z2-1}   |
+---------------+




.. spadType

:sub:`Type: Set Polynomial Integer`



The set symmetricDifference(s,t) contains those elements which are in s
or t but not in both.


.. spadInput
::

	symmetricDifference(s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| {x3-2,x5-4,x7-6,y2-1,z2-1}   |
+------------------------------+




.. spadType

:sub:`Type: Set Polynomial Integer`



Set membership is tested using the member?member?Set operation.


.. spadInput
::

	member?(y, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	member?((y+1)*(y-1), s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



The subset?subset?Set function determines whether one set is a subset of
another.


.. spadInput
::

	subset?(i, s)


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

	subset?(u, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



When the base type is finite, the absolute complement of a set is
defined. This finds the set of all multiplicative generators of
PrimeField 11---the integers mod 11.


.. spadInput
::

	gs := set [g for i in 1..11 | primitive?(g := i::PF 11)]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| {2,6,7,8}   |
+-------------+




.. spadType

:sub:`Type: Set PrimeField 11`



The following values are not generators.


.. spadInput
::

	complement gs


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| {1,3,4,5,9,10,0}   |
+--------------------+




.. spadType

:sub:`Type: Set PrimeField 11`



Often the members of a set are computed individually; in addition,
values can be inserted or removed from a set over the course of a
computation.

There are two ways to do this:


.. spadInput
::

	a := set [i^2 for i in 1..5]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| {1,4,9,16,25}   |
+-----------------+




.. spadType

:sub:`Type: Set PositiveInteger`



One is to view a set as a data structure and to apply updating
operations.


.. spadInput
::

	insert!(32, a)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| {1,4,9,16,25,32}   |
+--------------------+




.. spadType

:sub:`Type: Set PositiveInteger`




.. spadInput
::

	remove!(25, a)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| {1,4,9,16,32}   |
+-----------------+




.. spadType

:sub:`Type: Set PositiveInteger`




.. spadInput
::

	a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| {1,4,9,16,32}   |
+-----------------+




.. spadType

:sub:`Type: Set PositiveInteger`



The other way is to view a set as a mathematical entity and to create
new sets from old.


.. spadInput
::

	b := b0 := set [i^2 for i in 1..5]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| {1,4,9,16,25}   |
+-----------------+




.. spadType

:sub:`Type: Set PositiveInteger`




.. spadInput
::

	b := union(b, {32})


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| {1,4,9,16,25,32}   |
+--------------------+




.. spadType

:sub:`Type: Set PositiveInteger`




.. spadInput
::

	b := difference(b, {25})


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| {1,4,9,16,32}   |
+-----------------+




.. spadType

:sub:`Type: Set PositiveInteger`




.. spadInput
::

	b0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| {1,4,9,16,25}   |
+-----------------+




.. spadType

:sub:`Type: Set PositiveInteger`



For more information about lists, see
`ListXmpPage <section-9.1.html#AssociationListXmpPage>`__ .



