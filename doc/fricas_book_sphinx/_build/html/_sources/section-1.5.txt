.. status: ok


1.5 Data Structures
-------------------

FriCAS has a large variety of data structures available. Many data
structures are particularly useful for interactive computation and
others are useful for building applications. The data structures of
FriCAS are organized into category hierarchies.

A *list*, Lists are discussed in Section
`ListXmpPage <section-9.1.html#AssociationListXmpPage>`__, is the most
commonly used data structure in FriCAS for holding objects all of the
same type. The name list is short for *linked-list* of nodes. Each node
consists of a value (**first**) and a link (**rest**) that points to the 
next node, or to a distinguished value denoting the empty list. To get to, 
say, the third element, FriCAS starts at the front of the list, then 
traverses across two links to the third node.

Write a list of elements using square brackets with commas separating
the elements.


.. spadInput
::

	u := [1,-7,11]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 1, \: -7, \: {11} \right]

.. spadType
:sub:`Type: List Integer`



This is the value at the third node. Alternatively, you can say u.3.


.. spadInput
::

	first rest rest u


.. spadMathAnswer
.. spadMathOutput
.. math::

  11

.. spadType
:sub:`Type: PositiveInteger`



Many operations are defined on lists, such as: ``empty?``, to test that a
list has no elements; ``cons(x,l)``, to create a new list with first element
x and ``rest l``; ``reverse``, to create a new list with elements in reverse
order; and ``sort``, to arrange elements in order.

An important point about lists is that they are mutable: their
constituent elements and links can be changed in place. To do this, use
any of the operations whose names end with the character ``!``.

The operation ``concat!(u,v)`` replaces the last link of the list
u to point to some other list v. Since u refers to the original list,
this change is seen by u.


.. spadInput
::

	concat!(u,[9,1,3,-4]); u


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 1, \: -7, \: {11}, \: 9, \: 1, \: 3, \: -4 \right]

.. spadType
:sub:`Type: List Integer`



A *cyclic* list is a list with a cycle: a link pointing back to an earlier 
node of the list. To create a cycle, first get a node somewhere down the list.


.. spadInput
::

	lastnode := rest(u,3)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 9, \: 1, \: 3, \: -4 \right]

.. spadType
:sub:`Type: List Integer`



Use ``setrest!`` to change the link emanating from that node to
point back to an earlier part of the list.


.. spadInput
::

	setrest!(lastnode,rest(u,2)); u


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 1, \: -7, \: {\overline {{11}, \: 9}} \right]

.. spadType
:sub:`Type: List Integer`



A *stream* is a structure that (potentially) has an infinite number of
distinct elements. Think of a stream as an infinite list where elements
are computed successively. Streams are discussed in
Section{StreamXmpPage}.

Create an infinite stream of factored integers. Only a certain number of
initial elements are computed and displayed.


.. spadInput
::

	[factor(i) for i in 2.. by 2]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  2, \: {{2} ^ {2}}, \: {2 \  3}, \: {{2} ^ {3}}, \: {2 \  5}, \: {{{2} ^
  {2}} \  3}, \: {2 \  7}, \: {{2} ^ {4}}, \: {2 \  {{3} ^ {2}}}, \: {{{2}
  ^ {2}} \  5}, \: ...
  \right]

.. spadType
:sub:`Type: Stream Factored Integer`



FriCAS represents streams by a collection of already-computed elements
together with a function to compute the next element on demand. Asking
for the n-th element causes elements 1 through n to be evaluated.


.. spadInput
::

	%.36


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{2} ^ {3}} \  {{3} ^ {2}}

.. spadType
:sub:`Type: Factored Integer`



Streams can also be finite or cyclic. They are implemented by a linked
list structure similar to lists and have many of the same operations.
For example, first and rest are used to access elements and successive
nodes of a stream.

A *one-dimensional array* is another data structure used to hold objects
of the same type OnedimensionalArray is discussed in Section
`OneDimensionalArrayXmpPage <section-9.57.html#OneDimensionalArrayXmpPage>`__.
Unlike lists, one-dimensional arrays are inflexible - they are
implemented using a fixed block of storage. Their advantage is that they 
give quick and equal access time to any element.

A simple way to create a one-dimensional array is to apply the operation
oneDimensionalArray to a list of elements.


.. spadInput
::

	a := oneDimensionalArray [1, -7, 3, 3/2]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 1, \: -7, \: 3, \: {3 \over 2} \right]

.. spadType
:sub:`Type: OneDimensionalArray Fraction Integer`



One-dimensional arrays are also mutable: you can change their
constituent elements in place.


.. spadInput
::

	a.3 := 11; a


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 1, \: -7, \: {11}, \: {3 \over 2} \right]

.. spadType
:sub:`Type: OneDimensionalArray Fraction Integer`



However, one-dimensional arrays are not flexible structures. You cannot
destructively ``concat!`` them together.


.. spadInput
::

	concat!(a,oneDimensionalArray [1,-2])


.. spadMathAnswer
.. spadVerbatim

.. warning::

    There are 5 exposed and 0 unexposed library operations named concat!
       having 2 argument(s) but none was determined to be applicable. 
       Use HyperDoc Browse, or issue
                              )display op concat!
       to learn more about the available operations. Perhaps 
       package-calling the operation or using coercions on the arguments
       will allow you to apply the operation.
  
    Cannot find a definition or applicable library operation named 
       concat! with argument type(s) 
                     OneDimensionalArray Fraction Integer
                          OneDimensionalArray Integer
       
       Perhaps you should use "@" to indicate the required return type, 
       or "$" to specify which version of the function you need.



Examples of datatypes similar to ``OneDimensionalArray`` are: Vector
(vectors are mathematical structures implemented by one-dimensional
arrays), String (arrays of characters, represented by byte vectors), and
Bits (represented by bit vectors).

A vector of 32 bits, each representing the Boolean value true.


.. spadInput
::

	bits(32,true)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \verb#"11111111111111111111111111111111"#

.. spadType
:sub:`Type: Bits`



A *flexible array* (FlexibleArray is discussed in Section
`FlexibleArrayXmpPage <section-9.26.html#FlexibleArrayXmpPage>`__ ) is
a cross between a list and a one-dimensional array. Like
a one-dimensional array, a flexible array occupies a fixed block of
storage. Its block of storage, however, has room to expand. When it gets
full, it grows (a new, larger block of storage is allocated); when it
has too much room, it contracts.

Create a flexible array of three elements.


.. spadInput
::

	f := flexibleArray [2, 7, -5]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 2, \: 7, \: -5 \right]

.. spadType
:sub:`Type: FlexibleArray Integer`



Insert some elements between the second and third elements.


.. spadInput
::

	insert!(flexibleArray [11, -3],f,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 2, \: {11}, \: -3, \: 7, \: -5 \right]

.. spadType
:sub:`Type: FlexibleArray Integer`



Flexible arrays are used to implement heaps. A heap is an example of a
data structure called a priority queue, where elements are ordered with
respect to one another. A heap (Heap is discussed in Section
`HeapXmpPage <section-9.32.html#HeapXmpPage>`__ ) is organized so as to
optimize insertion and extraction of maximum elements. The ``extract!``
operation returns the maximum element of the heap, after destructively
removing that element and reorganizing the heap so that the next maximum
element is ready to be delivered.

An easy way to create a heap is to apply the operation heap to a list of
values.


.. spadInput
::

	h := heap [-4,7,11,3,4,-7]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[{11}, \: 7, \: -4, \: 3, \: 4, \: -7 \right]

.. spadType
:sub:`Type: Heap Integer`



This loop extracts elements one-at-a-time from h until the heap is
exhausted, returning the elements as a list in the order they were
extracted.


.. spadInput
::

	[extract!(h) while not empty?(h)]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ {11}, \: 7, \: 4, \: 3, \: -4, \: -7 \right]

.. spadType
:sub:`Type: List Integer`



A *binary tree* is a tree with at most two branches tree per node: it is
either empty, or else is a node consisting of a value, and a left and
right subtree (again, binary trees). (BinarySearchTrees are discussed in
Section
`BinarySearchTreeXmpPage <section-9.5.html#BinarySearchTreeXmpPage>`__
) Examples of binary tree types are BinarySearchTree, PendantTree,
TournamentTree, and BalancedBinaryTree.

A *binary search tree* is a binary tree such that, tree:binary search for
each node, the value of the node is binary search tree greater than all
values (if any) in the left subtree, and less than or equal all values
(if any) in the right subtree.


.. spadInput
::

	binarySearchTree [5,3,2,9,4,7,11]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ {\left[ 2, \: 3, \: 4 \right]},
    \: 5, \: {\left[ 7, \: 9, \: {11} \right]}
  \right]

.. spadType
:sub:`Type: BinarySearchTree PositiveInteger`



A *balanced binary tree* is useful for doing modular computations.
balanced binary tree Given a list lm of moduli, tree:balanced binary
modTree(a,lm) produces a balanced binary tree with the values at its
leaves.


.. spadInput
::

	modTree(8,[2,3,5,7])


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[ 0, \: 2, \: 3, \: 1 \right]

.. spadType
:sub:`Type: List Integer`



A *set* is a collection of elements where duplication and order is
irrelevant. Sets are discussed in Section
`SetXmpPage <section-9.53.html#MultiSetXmpPage>`__ Sets are always
finite and have no corresponding structure like streams for infinite
collections.

Create sets using braces ``{`` and ``}`` rather than brackets.


.. spadInput
::

	fs := set[1/3,4/5,-1/3,4/5]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left\{-{1 \over 3}, \: {1 \over 3}, \: {4 \over 5} \right\}

.. spadType
:sub:`Type: Set Fraction Integer`



A *multiset* is a set that keeps track of the number of duplicate values.
Multisets are discussed in Section
`MultiSetXmpPage <section-9.53.html#MultiSetXmpPage>`__

For all the primes p between 2 and 1000, find the distribution of pmod5.


.. spadInput
::

	multiset [x rem 5 for x in primes(2,1000)]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left\{
  {{38} \mbox{ : } 4}, \: {{40} \mbox{ : } 1}, \: 0, \: {{42} 
    \mbox{ : } 3}, \: {{47} \mbox{ : } 2}
  \right\}

.. spadType
:sub:`Type: Multiset Integer`



A *table* is conceptually a set of key-value pairs and is a
generalization of a multiset. For examples of tables, see
AssociationList, HashTable, KeyedAccessFile, Library, SparseTable,
StringTable, and Table. The domain Table(Key, Entry) provides a
general-purpose type for tables with values of type Entry indexed by
keys of type Key.

Compute the above distribution of primes using tables. First, let t
denote an empty table of keys and values, each of type Integer.


.. spadInput
::

	t : Table(Integer,Integer) := empty()


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{table()}   


.. spadType

:sub:`Type: Table(Integer,Integer)`



We define a function ``howMany`` to return the number of values of a given
modulus k seen so far. It calls search(k,t) which returns the number of
values stored under the key k in table t, or failed if no such value is
yet stored in t under k.

In English, this says 

  Define howMany(k) as follows. First, let n be
  the value of search(k,t). Then, if n has the value "failed", return the
  value 1; otherwise return n+1.


.. spadInput
::

	howMany(k) == (n:=search(k,t); n case "failed" => 1; n+1)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



Run through the primes to create the table, then print the table. The
expression t.m := howMany(m) updates the value in table t stored under
key m.


.. spadInput
::

	for p in primes(2,1000) repeat (m:= p rem 5; t.m:= howMany(m)); t


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function howMany with type Integer -> Integer 


.. spadMathOutput
.. math::

  table
  \left(
    {{2={47}}, \: {3={42}}, \: {0=1}, \: {1={40}}, \: {4={38}}}
  \right)

.. spadType
:sub:`Type: Table(Integer,Integer)`



A *record* is an example of an inhomogeneous collection of objects. See
`ugTypesRecords <section-2.4.html#ugTypesRecords>`__ for details. A
record consists of a set of named selectors that can be used to access
its components. 

Declare that daniel can only be assigned a record with two prescribed
fields.


.. spadInput
::

	daniel : Record(age : Integer, salary : Float)

.. spadMathAnswer
.. spadType
:sub:`Type: Void`


Give daniel a value, using square brackets to enclose the values of the
fields.


.. spadInput
::

	daniel := [28, 32005.12]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[{age={28}}, \: {salary={32005.12}} \right]

.. spadType
:sub:`Type: Record(age: Integer,salary: Float)`



Give daniel a raise.


.. spadInput
::

	daniel.salary := 35000; daniel


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[{age={28}}, \: {salary={35000.0}} \right]

.. spadType
:sub:`Type: Record(age: Integer,salary: Float)`



A *union* is a data structure used when objects have multiple types.See
`ugTypesUnions <section-2.5.html#ugTypesUnions>`__ for details.

Let dog be either an integer or a string value.


.. spadInput
::

	dog: Union(licenseNumber: Integer, name: String)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`


Give dog a name.

.. spadInput
::

	dog := "Whisper"


.. spadMathAnswer
.. spadMathOutput
.. math::

 \verb#"Whisper"#


.. spadType
:sub:`Type: Union(name: String,...)`



All told, there are over forty different data structures in FriCAS.
Using the domain constructors described in Chapter
`ugDomains <section-13.0.html#ugDomains>`__ you can add your own data
structure or extend an existing one. Choosing the right data structure
for your application may be the key to obtaining good performance.



