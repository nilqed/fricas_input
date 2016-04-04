.. status: ok


9.76 Stream
-----------

A Stream object is represented as a list whose last element contains the
wherewithal to create the next element, should it ever be required.

Let ints be the infinite stream of non-negative integers.


.. spadInput
::

	ints := [i for i in 0..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [0,1,2,3,4,5,6,7,8,9,…]   |
+---------------------------+




.. spadType

:sub:`Type: Stream NonNegativeInteger`



By default, ten stream elements are calculated. This number may be
changed to something else by the system command )set streams calculate.
For the display purposes of this book, we have chosen a smaller value.

More generally, you can construct a stream by specifying its initial
value and a function which, when given an element, creates the next
element.


.. spadInput
::

	f : List INT -> List INT


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	f x == [x.1 + x.2, x.1]


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	fibs := [i.2 for i in [generate(f,[1,1])]]


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f with type List Integer -> List Integer 




.. spadMathOutput
.. math::

+-------------------------------+
| [1,1,2,3,5,8,13,21,34,55,…]   |
+-------------------------------+




.. spadType

:sub:`Type: Stream Integer`



You can create the stream of odd non-negative integers by either
filtering them from the integers, or by evaluating an expression for
each integer.


.. spadInput
::

	[i for i in ints | odd? i]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [1,3,5,7,9,11,13,15,17,19,…]   |
+--------------------------------+




.. spadType

:sub:`Type: Stream NonNegativeInteger`




.. spadInput
::

	odds := [2*i+1 for i in ints]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [1,3,5,7,9,11,13,15,17,19,…]   |
+--------------------------------+




.. spadType

:sub:`Type: Stream NonNegativeInteger`



You can accumulate the initial segments of a stream using the
scanscanStreamFunctions2 operation.


.. spadInput
::

	scan(0,+,odds)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [1,4,9,16,25,36,49,64,81,100,…]   |
+-----------------------------------+




.. spadType

:sub:`Type: Stream NonNegativeInteger`



The corresponding elements of two or more streams can be combined in
this way.


.. spadInput
::

	[i*j for i in ints for j in odds]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| [0,3,10,21,36,55,78,105,136,171,…]   |
+--------------------------------------+




.. spadType

:sub:`Type: Stream NonNegativeInteger`




.. spadInput
::

	map(*,ints,odds)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| [0,3,10,21,36,55,78,105,136,171,…]   |
+--------------------------------------+




.. spadType

:sub:`Type: Stream NonNegativeInteger`



Many operations similar to those applicable to lists are available for
streams.


.. spadInput
::

	first ints


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`




.. spadInput
::

	rest ints


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [1,2,3,4,5,6,7,8,9,10,…]   |
+----------------------------+




.. spadType

:sub:`Type: Stream NonNegativeInteger`




.. spadInput
::

	fibs 20


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 6765   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`



The packages StreamFunctions1, StreamFunctions2 and StreamFunctions3
export some useful stream manipulation operations. For more information,
see `ugLangItsPage <ugLangItsPage>`__ in Section
`ugLangItsNumber <ugLangItsNumber>`__ ,
`ugProblemSeriesPage <ugProblemSeriesPage>`__ in Section
`ugProblemSeriesNumber <ugProblemSeriesNumber>`__ ,
`ContinuedFractionXmpPage <chapter-9.1-12.html#ContinuedFractionXmpPage>`__
, and `ListXmpPage <section-9.1.html#AssociationListXmpPage>`__ .



