.. status: ok


9.2 BalancedBinaryTree
----------------------

BalancedBinaryTrees(S) is the domain of balanced binary trees with
elements of type S at the nodes. A binary tree is either empty or else
consists of a node having a value and two branches, each branch a binary
tree. A balanced binary tree is one that is balanced with respect its
leaves. One with 2k leaves is perfectly balanced: the tree has minimum
depth, and the left and right branch of every interior node is identical
in shape.

Balanced binary trees are useful in algebraic computation for so-called
divide-and-conquer algorithms. Conceptually, the data for a problem is
initially placed at the root of the tree. The original data is then
split into two subproblems, one for each subtree. And so on. Eventually,
the problem is solved at the leaves of the tree. A solution to the
original problem is obtained by some mechanism that can reassemble the
pieces. In fact, an implementation of the Chinese Remainder Algorithm
using balanced binary trees was first proposed by David Y. Y. Yun at the
IBM T. J. Watson Research Center in Yorktown Heights, New York, in 1978.
It served as the prototype for polymorphic algorithms in FriCAS.

In what follows, rather than perform a series of computations with a
single expression, the expression is reduced modulo a number of integer
primes, a computation is done with modular arithmetic for each prime,
and the Chinese Remainder Algorithm is used to obtain the answer to the
original problem. We illustrate this principle with the computation of
122=144.

A list of moduli.


.. spadInput
::

	lm := [3,5,7,11]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [3,5,7,11]   |
+--------------+




.. spadType

:sub:`Type: List PositiveInteger`



The expression modTree(n, lm) creates a balanced binary tree with leaf
values n mod m for each modulus m in lm.


.. spadInput
::

	modTree(12,lm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0,2,5,1]   |
+-------------+




.. spadType

:sub:`Type: List Integer`



Operation modTree does this using operations on balanced binary trees.
We trace its steps. Create a balanced binary tree t of zeros with four
leaves.


.. spadInput
::

	t := balancedBinaryTree( #lm, 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| [[0,0,0],0,[0,0,0]]   |
+-----------------------+




.. spadType

:sub:`Type: BalancedBinaryTree NonNegativeInteger`



The leaves of the tree are set to the individual moduli.


.. spadInput
::

	setleaves!(t,lm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| [[3,0,5],0,[7,0,11]]   |
+------------------------+




.. spadType

:sub:`Type: BalancedBinaryTree NonNegativeInteger`



Use mapUp! to do a bottom-up traversal of t, setting each interior node
to the product of the values at the nodes of its children.


.. spadInput
::

	mapUp!(t,_*)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1155   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`



The value at the node of every subtree is the product of the moduli of
the leaves of the subtree.


.. spadInput
::

	t


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| [[3,15,5],1155,[7,77,11]]   |
+-----------------------------+




.. spadType

:sub:`Type: BalancedBinaryTree NonNegativeInteger`



Operation mapDown!(t,a,fn) replaces the value v at each node of t by
fn(a,v).


.. spadInput
::

	mapDown!(t,12,_rem)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [[0,12,2],12,[5,12,1]]   |
+--------------------------+




.. spadType

:sub:`Type: BalancedBinaryTree NonNegativeInteger`



The operation leaves returns the leaves of the resulting tree. In this
case, it returns the list of 12 mod m for each modulus m.


.. spadInput
::

	leaves %


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0,2,5,1]   |
+-------------+




.. spadType

:sub:`Type: List NonNegativeInteger`



Compute the square of the images of 12 modulo each m.


.. spadInput
::

	squares := [x^2 rem m for x in % for m in lm]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0,4,4,1]   |
+-------------+




.. spadType

:sub:`Type: List NonNegativeInteger`



Call the Chinese Remainder Algorithm to get the answer for 122.


.. spadInput
::

	chineseRemainder(%,lm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 144   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`





