.. status: ok


5.5 Creating Lists and Streams with Iterators
---------------------------------------------

All of what we did for loops in
`ugLangLoops <section-5.4.html#ugLangLoops>`__ iteration can be
transformed into expressions that create lists list:created by iterator
and streams. stream:created by iterator The repeat, break or iterate
words are not used but all the other ideas carry over. Before we give
you the general rule, here are some examples which give you the idea.

This creates a simple list of the integers from 1 to 10.


.. spadInput
::

	list := [i for i in 1..10]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [1,2,3,4,5,6,7,8,9,10]   |
+--------------------------+




.. spadType

:sub:`Type: List PositiveInteger`



Create a stream of the integers greater than or equal to 1.


.. spadInput
::

	stream := [i for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [1,2,3,4,5,6,7,8,9,10,…]   |
+----------------------------+




.. spadType

:sub:`Type: Stream PositiveInteger`



This is a list of the prime integers between 1 and 10, inclusive.


.. spadInput
::

	[i for i in 1..10 | prime? i]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [2,3,5,7]   |
+-------------+




.. spadType

:sub:`Type: List PositiveInteger`



This is a stream of the prime integers greater than or equal to 1.


.. spadInput
::

	[i for i in 1.. | prime? i]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [2,3,5,7,11,13,17,19,23,29,…]   |
+---------------------------------+




.. spadType

:sub:`Type: Stream PositiveInteger`



This is a list of the integers between 1 and 10, inclusive, whose
squares are less than 700.


.. spadInput
::

	[i for i in 1..10 while i*i < 700]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [1,2,3,4,5,6,7,8,9,10]   |
+--------------------------+




.. spadType

:sub:`Type: List PositiveInteger`



This is a stream of the integers greater than or equal to 1 whose
squares are less than 700.


.. spadInput
::

	[i for i in 1.. while i*i < 700]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [1,2,3,4,5,6,7,8,9,10,…]   |
+----------------------------+




.. spadType

:sub:`Type: Stream PositiveInteger`



Here is the general rule. collection





The general syntax of a collection is



[ collectExpression iterator1 iterator2 ... iteratorN ]



| where each iteratori is either a for or a while clause. The loop
terminates immediately when the end test of any iteratori succeeds or
when a return expression is evaluated in collectExpression. The value
returned by the collection is either a list or a stream of elements, one
for each iteration of the collectExpression.





Be careful when you use while stream:using while @{using while} to
create a stream. By default, FriCAS tries to compute and display the
first ten elements of a stream. If the while condition is not satisfied
quickly, FriCAS can spend a long (possibly infinite) time trying to
compute stream:number of elements computed the elements. Use )set
streams calculate to change the default to something else. set streams
calculate This also affects the number of terms computed and displayed
for power series. For the purposes of this book, we have used this
system command to display fewer than ten terms.

Use nested iterators to create lists of iteration:nested lists which can
then be given as an argument to matrix.


.. spadInput
::

	matrix [ [x^i+j for i in 1..3] for j in 10..12]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| [x+10x2+10x3+10x+11x2+11x3+11x+12x2+12x3+12]   |
+------------------------------------------------+




.. spadType

:sub:`Type: Matrix Polynomial Integer`



You can also create lists of streams, streams of lists and streams of
streams. Here is a stream of streams.


.. spadInput
::

	[ [i/j for i in j+1..] for j in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [[2,3,4,5,6,7,8,9,10,11,…],[32,2,52,3,72,4,92,5,112,6,…],.[43,53,2,73,83,3,103,113,4,133,…],[54,32,74,2,94,52,114,3,134,72,…],[65,75,85,95,2,115,125,135,145,3,…],[76,43,32,53,116,2,136,73,52,83,…],[87,97,107,117,127,137,2,157,167,177,…],[98,54,118,32,138,74,158,2,178,94,…],[109,119,43,139,149,53,169,179,2,199,…],.[1110,65,1310,75,32,85,1710,95,1910,2,…],…]   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream Stream Fraction Integer`



You can use parallel iteration across lists and streams to create
iteration:parallel new lists.


.. spadInput
::

	[i/j for i in 3.. by 10 for j in 2..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| [32,133,234,335,436,537,638,739,8310,9311,…]   |
+------------------------------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



Iteration stops if the end of a list or stream is reached.


.. spadInput
::

	[i^j for i in 1..7 for j in 2.. ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| [1,8,81,1024,15625,279936,5764801]   |
+--------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



As with loops, you can combine these modifiers to make very complicated
conditions.


.. spadInput
::

	[ [ [i,j] for i in 10..15 | prime? i] for j in 17..22 | j =
squareFreePart j]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------+
| [[[11,17],[13,17]],[[11,19],[13,19]],[[11,21],[13,21]],[[11,22],[13,22]]]   |
+-----------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List List PositiveInteger`



See List (section
`ListXmpPage <section-9.1.html#AssociationListXmpPage>`__ ) and Stream
(section `StreamXmpPage <section-9.76.html#StreamXmpPage>`__ ) for more
information on creating and manipulating lists and streams,
respectively.



