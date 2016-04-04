.. status: ok



6.13 Recurrence Relations
-------------------------

One of the most useful classes of function are those defined via a
recurrence relation. A recurrence relation makes each successive
recurrence relation value depend on some or all of the previous values.
A simple example is the ordinary factorial function:


.. spadVerbatim

::

 fact(0) == 1
 fact(n | n > 0) == n * fact(n-1)



The value of fact(10) depends on the value of fact(9), fact(9) on
fact(8), and so on. Because it depends on only one previous value, it is
usually called a first order recurrence relation. You can easily imagine
a function based on two, three or more previous values. The Fibonacci
numbers are probably the most famous function defined by a Fibonacci
numbers second order recurrence relation.

The library function fibonacci computes Fibonacci numbers. It is
obviously optimized for speed.


.. spadInput
::

	[fibonacci(i) for i in 0..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [0,1,1,2,3,5,8,13,21,34,…]   |
+------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Define the Fibonacci numbers ourselves using a piece-wise definition.


.. spadInput
::

	fib(1) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	fib(2) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	fib(n) == fib(n-1) + fib(n-2)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



As defined, this recurrence relation is obviously doubly-recursive. To
compute fib(10), we need to compute fib(9) and fib(8). And to fib(9), we
need to compute fib(8) and fib(7). And so on. It seems that to compute
fib(10) we need to compute fib(9) once, fib(8) twice, fib(7) three
times. Look familiar? The number of function calls needed to compute any
second order recurrence relation in the obvious way is exactly fib(n).
These numbers grow! For example, if FriCAS actually did this, then
fib(500) requires more than 10104 function calls. And, given all this,
our definition of fib obviously could not be used to calculate the
five-hundredth Fibonacci number.

Let's try it anyway.


.. spadInput
::

	fib(500)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function fib with type Integer -> PositiveInteger 
    Compiling function fib as a recurrence relation.
 13942322456169788013972438287040728395007025658769730726410_
 8962948325571622863290691557658876222521294125




.. spadType

:sub:`Type: PositiveInteger`



Since this takes a short time to compute, it obviously didn't do as many
as 10104 operations! By default, FriCAS transforms any recurrence
relation it recognizes into an iteration. Iterations are efficient. To
compute the value of the n-th term of a recurrence relation using an
iteration requires only n function calls. Note that if you compare the
speed of our fib function to the library function, our version is still
slower. This is because the library
fibonaccifibonacciIntegerNumberTheoryFunctions uses a powering algorithm
with a computing time proportional to log3(n) to compute fibonacci(n).

To turn off this special recurrence relation compilation, issue set
function recurrence


.. spadVerbatim

::

 )set functions recurrence off



To turn it back on, substitute on for off.

The transformations that FriCAS uses for fib caches the last two values.
For a more general k-th order recurrence relation, FriCAS caches the
last k values. If, after computing a value for fib, you ask for some
larger value, FriCAS picks up the cached values and continues computing
from there. See `ugUserFreeLocal <section-6.16.html#ugUserFreeLocal>`__
for an example of a function definition that has this same behavior.
Also see `ugUserCache <section-6.12.html#ugUserCache>`__ for a more
general discussion of how you can cache function values.

Recurrence relations can be used for defining recurrence relations
involving polynomials, rational functions, or anything you like. Here we
compute the infinite stream of Legendre polynomials.

The Legendre polynomial of degree 0.


.. spadInput
::

	p(0) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The Legendre polynomial of degree 1.


.. spadInput
::

	p(1) == x


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The Legendre polynomial of degree n.


.. spadInput
::

	p(n) == ((2*n-1)*x*p(n-1) - (n-1)*p(n-2))/n


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Compute the Legendre polynomial of degree 6.


.. spadInput
::

	p(6)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function p with type Integer -> Polynomial Fraction 
       Integer 
    Compiling function p as a recurrence relation.




.. spadMathOutput
.. math::

+-------------------------------+
| 23116x6-31516x4+10516x2-516   |
+-------------------------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`





