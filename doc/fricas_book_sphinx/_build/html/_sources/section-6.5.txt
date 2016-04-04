.. status: ok



6.5 One-Line Functions
----------------------

As you use FriCAS, you will find that you will write many short
functions function:one-line definition to codify sequences of operations
that you often perform. In this section we write some simple one-line
functions.

This is a simple recursive factorial function for positive integers.


.. spadInput
::

	fac n == if n < 3 then n else n * fac(n-1)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	fac 10


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 3628800   |
+-----------+




.. spadType

:sub:`Type: PositiveInteger`



This function computes 1+1/2+1/3+...+1/n.


.. spadInput
::

	s n == reduce(+,[1/i for i in 1..n])


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	s 50


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------+
| 139432375772240549607593099044504245996706400   |
+-------------------------------------------------+




.. spadType

:sub:`Type: Fraction Integer`



This function computes a Mersenne number, several of which are prime.
Mersenne number


.. spadInput
::

	mersenne i == 2^i - 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



If you type mersenne, FriCAS shows you the function definition.


.. spadInput
::

	mersenne


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| mersennei==2i-1   |
+-------------------+




.. spadType

:sub:`Type: FunctionCalled mersenne`



Generate a stream of Mersenne numbers.


.. spadInput
::

	[mersenne i for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| [1,3,7,15,31,63,127,255,511,1023,…]   |
+---------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Create a stream of those values of i such that mersenne(i) is prime.


.. spadInput
::

	mersenneIndex := [n for n in 1.. | prime?(mersenne(n))]


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function mersenne with type PositiveInteger -> Integer 




.. spadMathOutput
.. math::

+---------------------------------+
| [2,3,5,7,13,17,19,31,61,89,…]   |
+---------------------------------+




.. spadType

:sub:`Type: Stream PositiveInteger`



Finally, write a function that returns the n-th Mersenne prime.


.. spadInput
::

	mersennePrime n == mersenne mersenneIndex(n)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	mersennePrime 5


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 8191   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`





