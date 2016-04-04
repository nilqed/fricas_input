.. status: ok


9.5 BinarySearchTree
--------------------

BinarySearchTree(R) is the domain of binary trees with elements of type
R, ordered across the nodes of the tree. A non-empty binary search tree
has a value of type R, and right and left binary search subtrees. If a
subtree is empty, it is displayed as a period (.).

Define a list of values to be placed across the tree. The resulting tree
has 8 at the root; all other elements are in the left subtree.


.. spadInput
::

	lv := [8,3,5,4,6,2,1,5,7]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| [8,3,5,4,6,2,1,5,7]   |
+-----------------------+




.. spadType

:sub:`Type: List PositiveInteger`



A convenient way to create a binary search tree is to apply the
operation binarySearchTree to a list of elements.


.. spadInput
::

	t := binarySearchTree lv


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [[[1,2,.],3,[4,5,[5,6,7]]],8,.]   |
+-----------------------------------+




.. spadType

:sub:`Type: BinarySearchTree PositiveInteger`



Another approach is to first create an empty binary search tree of
integers.


.. spadInput
::

	emptybst := empty()$BSTREE(INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| []   |
+------+




.. spadType

:sub:`Type: BinarySearchTree Integer`



Insert the value 8. This establishes 8 as the root of the binary search
tree. Values inserted later that are less than 8 get stored in the left
subtree, others in the right subtree.


.. spadInput
::

	t1 := insert!(8,emptybst)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: BinarySearchTree Integer`



Insert the value 3. This number becomes the root of the left subtree of
t1. For optimal retrieval, it is thus important to insert the middle
elements first.


.. spadInput
::

	insert!(3,t1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [3,8,.]   |
+-----------+




.. spadType

:sub:`Type: BinarySearchTree Integer`



We go back to the original tree t. The leaves of the binary search tree
are those which have empty left and right subtrees.


.. spadInput
::

	leaves t


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [1,4,5,7]   |
+-------------+




.. spadType

:sub:`Type: List PositiveInteger`



The operation split(k,t) returns a record containing the two subtrees:
one with all elements less than k, another with elements greater than k.


.. spadInput
::

	split(3,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------+
| [less=[1,2,.],greater=[[.,3,[4,5,[5,6,7]]],8,.]]   |
+----------------------------------------------------+




.. spadType

:sub:`Type: Record(less: BinarySearchTree PositiveInteger,greater:`
BinarySearchTree PositiveInteger)



Define insertRoot to insert new elements by creating a new node.


.. spadInput
::

	insertRoot: (INT,BSTREE INT) -> BSTREE INT


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The new node puts the inserted value between its less tree and greater
tree.


.. spadVerbatim

::

 insertRoot(x, t) ==
     a := split(x, t)
     node(a.less, x, a.greater)



Function buildFromRoot builds a binary search tree from a list of
elements ls and the empty tree emptybst.


.. spadInput
::

	buildFromRoot ls == reduce(insertRoot,ls,emptybst)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Apply this to the reverse of the list lv.


.. spadInput
::

	rt := buildFromRoot reverse lv


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [[[1,2,.],3,[4,5,[5,6,7]]],8,.]   |
+-----------------------------------+




.. spadType

:sub:`Type: BinarySearchTree Integer`



Have FriCAS check that these are equal.


.. spadInput
::

	(t = rt)@Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`





