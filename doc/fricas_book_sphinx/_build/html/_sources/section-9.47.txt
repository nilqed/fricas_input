.. status: ok



9.47 List
---------

A list is a finite collection of elements in a specified order that can
contain duplicates. A list is a convenient structure to work with
because it is easy to add or remove elements and the length need not be
constant. There are many different kinds of lists in FriCAS, but the
default types (and those used most often) are created by the List
constructor. For example, there are objects of type List Integer, List
Float and List Polynomial Fraction Integer. Indeed, you can even have
List List List Boolean (that is, lists of lists of lists of Boolean
values). You can have lists of any type of FriCAS object.



9.47.1 Creating Lists
~~~~~~~~~~~~~~~~~~~~~

The easiest way to create a list with, for example, the elements 2, 4,
5, 6 is to enclose the elements with square brackets and separate the
elements with commas.

The spaces after the commas are optional, but they do improve the
readability.


.. spadInput
::

	[2, 4, 5, 6]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [2,4,5,6]   |
+-------------+




.. spadType

:sub:`Type: List PositiveInteger`



To create a list with the single element 1, you can use either [1] or
the operation listlistList.


.. spadInput
::

	[1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [1]   |
+-------+




.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	list(1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [1]   |
+-------+




.. spadType

:sub:`Type: List PositiveInteger`



Once created, two lists k and m can be concatenated by issuing
append(k,m). appendappendList does not physically join the lists, but
rather produces a new list with the elements coming from the two
arguments.


.. spadInput
::

	append([1,2,3],[5,6,7])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [1,2,3,5,6,7]   |
+-----------------+




.. spadType

:sub:`Type: List PositiveInteger`



Use consconsList to append an element onto the front of a list.


.. spadInput
::

	cons(10,[9,8,7])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [10,9,8,7]   |
+--------------+




.. spadType

:sub:`Type: List PositiveInteger`







9.47.2 Accessing List Elements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To determine whether a list has any elements, use the operation
empty?empty?List.


.. spadInput
::

	empty? [x+1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Alternatively, equality with the list constant nilnilList can be tested.


.. spadInput
::

	([] = nil)@Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



We'll use this in some of the following examples.


.. spadInput
::

	k := [4,3,7,3,8,5,9,2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [4,3,7,3,8,5,9,2]   |
+---------------------+




.. spadType

:sub:`Type: List PositiveInteger`



Each of the next four expressions extracts the firstfirstList element of
k.


.. spadInput
::

	first k


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	k.first


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	k.1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	k(1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The last two forms generalize to k.i and k(i), respectively, where 1≤i≤n
and n equals the length of k.

This length is calculated by #.


.. spadInput
::

	n := #k


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Performing an operation such as k.i is sometimes referred to as indexing
into k or elting into k. The latter phrase comes about because the name
of the operation that extracts elements is called elteltList. That is,
k.3 is just alternative syntax for elt(k,3). It is important to remember
that list indices begin with 1. If we issue k := [1,3,2,9,5] then k.4
returns 9. It is an error to use an index that is not in the range from
1 to the length of the list.

The last element of a list is extracted by any of the following three
expressions.


.. spadInput
::

	last k


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	k.last


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



This form computes the index of the last element and then extracts the
element from the list.


.. spadInput
::

	k.( #k)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`







9.47.3 Changing List Elements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We'll use this in some of the following examples.


.. spadInput
::

	k := [4,3,7,3,8,5,9,2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [4,3,7,3,8,5,9,2]   |
+---------------------+




.. spadType

:sub:`Type: List PositiveInteger`



List elements are reset by using the k.i form on the left-hand side of
an assignment. This expression resets the first element of k to 999.


.. spadInput
::

	k.1 := 999


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 999   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



As with indexing into a list, it is an error to use an index that is not
within the proper bounds. Here you see that k was modified.


.. spadInput
::

	k


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| [999,3,7,3,8,5,9,2]   |
+-----------------------+




.. spadType

:sub:`Type: List PositiveInteger`



The operation that performs the assignment of an element to a particular
position in a list is called seteltseteltList. This operation is
destructive in that it changes the list. In the above example, the
assignment returned the value 999 and k was modified. For this reason,
lists are called mutable objects: it is possible to change part of a
list (mutate it) rather than always returning a new list reflecting the
intended modifications.

Moreover, since lists can share structure, changes to one list can
sometimes affect others.


.. spadInput
::

	k := [1,2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [1,2]   |
+---------+




.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	m := cons(0,k)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [0,1,2]   |
+-----------+




.. spadType

:sub:`Type: List Integer`



Change the second element of m.


.. spadInput
::

	m.2 := 99


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 99   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



See, m was altered.


.. spadInput
::

	m


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [0,99,2]   |
+------------+




.. spadType

:sub:`Type: List Integer`



But what about k? It changed too!


.. spadInput
::

	k


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [99,2]   |
+----------+




.. spadType

:sub:`Type: List PositiveInteger`







9.47.4 Other Functions
~~~~~~~~~~~~~~~~~~~~~~

An operation that is used frequently in list processing is that which
returns all elements in a list after the first element.


.. spadInput
::

	k := [1,2,3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1,2,3]   |
+-----------+




.. spadType

:sub:`Type: List PositiveInteger`



Use the restrestList operation to do this.


.. spadInput
::

	rest k


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [2,3]   |
+---------+




.. spadType

:sub:`Type: List PositiveInteger`



To remove duplicate elements in a list k, use
removeDuplicatesremoveDuplicatesList.


.. spadInput
::

	removeDuplicates [4,3,4,3,5,3,4]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [4,3,5]   |
+-----------+




.. spadType

:sub:`Type: List PositiveInteger`



To get a list with elements in the order opposite to those in a list k,
use reversereverseList.


.. spadInput
::

	reverse [1,2,3,4,5,6]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [6,5,4,3,2,1]   |
+-----------------+




.. spadType

:sub:`Type: List PositiveInteger`



To test whether an element is in a list, use member?member?List:
member?(a,k) returns true or false depending on whether a is in k or
not.


.. spadInput
::

	member?(1/2,[3/4,5/6,1/2])


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

	member?(1/12,[3/4,5/6,1/2])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



As an exercise, the reader should determine how to get a list containing
all but the last of the elements in a given non-empty list
k.reverse(rest(reverse(k))) works.





9.47.5 Dot, Dot
~~~~~~~~~~~~~~~

Certain lists are used so often that FriCAS provides an easy way of
constructing them. If n and m are integers, then expand [n..m] creates a
list containing n, n+1, ... m. If n > m then the list is empty. It is
actually permissible to leave off the m in the dot-dot construction (see
below).

The dot-dot notation can be used more than once in a list construction
and with specific elements being given. Items separated by dots are
called segments.


.. spadInput
::

	[1..3,10,20..23]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| [1..3,10..10,20..23]   |
+------------------------+




.. spadType

:sub:`Type: List Segment PositiveInteger`



Segments can be expanded into the range of items between the endpoints
by using expandexpandSegment.


.. spadInput
::

	expand [1..3,10,20..23]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [1,2,3,10,20,21,22,23]   |
+--------------------------+




.. spadType

:sub:`Type: List Integer`



What happens if we leave off a number on the right-hand side of ..?


.. spadInput
::

	expand [1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [1,2,3,4,5,6,7,8,9,10,…]   |
+----------------------------+




.. spadType

:sub:`Type: Stream Integer`



What is created in this case is a Stream which is a generalization of a
list. See `StreamXmpPage <section-9.76.html#StreamXmpPage>`__ for more
information.





