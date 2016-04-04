.. status: ok


9.36 IntegerNumberTheoryFunctions
---------------------------------

The IntegerNumberTheoryFunctions package contains a variety of
operations of interest to number theorists. Many of these operations
deal with divisibility properties of integers. (Recall that an integer a
divides an integer b if there is an integer c such that b = a * c.)

The operation divisorsdivisorsIntegerNumberTheoryFunctions returns a
list of the divisors of an integer.


.. spadInput
::

	div144 := divisors(144)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------+
| [1,2,3,4,6,8,9,12,16,18,24,36,48,72,144]   |
+--------------------------------------------+




.. spadType

:sub:`Type: List Integer`



You can now compute the number of divisors of 144 and the sum of the
divisors of 144 by counting and summing the elements of the list we just
created.


.. spadInput
::

	#(div144)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 15   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	reduce(+,div144)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 403   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



Of course, you can compute the number of divisors of an integer n,
usually denoted d(n), and the sum of the divisors of an integer n,
usually denoted (n), without ever listing the divisors of n.

In FriCAS, you can simply call the operations
numberOfDivisorsnumberOfDivisorsIntegerNumberTheoryFunctions and
sumOfDivisorssumOfDivisorsIntegerNumberTheoryFunctions.


.. spadInput
::

	numberOfDivisors(144)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 15   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	sumOfDivisors(144)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 403   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



The key is that d(n) and (n) are multiplicative functions. This means
that when n and m are relatively prime, that is, when n and m have no
prime factor in common, then d(nm) = d(n) d(m) and (nm) = (n) (m). Note
that these functions are trivial to compute when n is a prime power and
are computed for general n from the prime factorization of n. Other
examples of multiplicative functions are (n), the sum of the k-th powers
of the divisors of n and , the number of integers between 1 and n which
are prime to n. The corresponding FriCAS operations are called
sumOfKthPowerDivisorssumOfKthPowerDivisorsIntegerNumberTheoryFunctions
and eulerPhieulerPhiIntegerNumberTheoryFunctions.

An interesting function is λ(n), the Möbius λ function, defined as
follows: λ(1) = 1, λ(n) = 0, when n is divisible by a square, and
λ=(-1)k, when n is the product of k distinct primes. The corresponding
FriCAS operation is moebiusMumoebiusMuIntegerNumberTheoryFunctions. This
function occurs in the following theorem:

|  Theorem (Möbius Inversion Formula):
|  Let f(n) be a function on the positive integers and let F(n) be
defined by F(n)=∑d|nf(n) sum of f(n) over d | n where the sum is taken
over the positive divisors of n. Then the values of f(n) can be
recovered from the values of F(n): f(n)=∑d|nλ(n)F(nd) where again the
sum is taken over the positive divisors of n.

When f(n) = 1, then F(n) = d(n). Thus, if you sum over the positive
divisors d of n, you should always get 1.


.. spadInput
::

	f1(n) == reduce(+,[moebiusMu(d) * numberOfDivisors(quo(n,d)) for d in
divisors(n)])


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	f1(200)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	f1(846)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Similarly, when f(n) = n, then F(n) = (n). Thus, if you sum λ(d) (n/d)
over the positive divisors d of n, you should always get n.


.. spadInput
::

	f2(n) == reduce(+,[moebiusMu(d) * sumOfDivisors(quo(n,d)) for d in
divisors(n)])


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	f2(200)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 200   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	f2(846)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 846   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



The Fibonacci numbers are defined by F(1)=F(2)=1 and F(n)=F(n-1)+F(n-2)
for n=3,4,….

The operation fibonaccifibonacciIntegerNumberTheoryFunctions computes
the n-th Fibonacci number.


.. spadInput
::

	fibonacci(25)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 75025   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	[fibonacci(n) for n in 1..15]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610]   |
+------------------------------------------------+




.. spadType

:sub:`Type: List Integer`



Fibonacci numbers can also be expressed as sums of binomial
coefficients.


.. spadInput
::

	fib(n) == reduce(+,[binomial(n-1-k,k) for k in 0..quo(n-1,2)])


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	fib(25)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 75025   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	[fib(n) for n in 1..15]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610]   |
+------------------------------------------------+




.. spadType

:sub:`Type: List Integer`



Quadratic symbols can be computed with the operations
legendrelegendreIntegerNumberTheoryFunctions and
jacobijacobiIntegerNumberTheoryFunctions. The Legendre symbol (ap) is
defined for integers a and p with p an odd prime number. By definition,
(ap) = +1, when a is a square (mod p), (ap) = -1, when a is not a square
(mod p), and (ap) = 0, when a is divisible by p.

You compute (ap) via the command legendre(a,p).


.. spadInput
::

	legendre(3,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: Integer`




.. spadInput
::

	legendre(23,691)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: Integer`



The Jacobi symbol (an) is the usual extension of the Legendre symbol,
where n is an arbitrary integer. The most important property of the
Jacobi symbol is the following: if K is a quadratic field with
discriminant d and quadratic character χ, then χ(n)=(d/n). Thus, you can
use the Jacobi symbol to compute, say, the class numbers of imaginary
quadratic fields from a standard class number formula.

This function computes the class number of the imaginary quadratic field
with discriminant d.


.. spadInput
::

	h(d) == quo(reduce(+, [jacobi(d,k) for k in 1..quo(-d, 2)]), 2 -
jacobi(d,2))


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	h(-163)


.. spadMathAnswer
1


.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	h(-499)


.. spadMathAnswer
3


.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	h(-1832)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 26   |
+------+




.. spadType

:sub:`Type: PositiveInteger`





