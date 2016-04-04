.. status: ok


2.8 Subdomains Again
--------------------

A subdomain S of a domain D is a domain consisting of

1. those elements of D that satisfy some predicate (that is, a test that
   returns true or false) and
2. a subset of the operations of D.

Every domain is a subdomain of itself, trivially satisfying the
membership test: true.

Currently, there are only two system-defined subdomains in FriCAS that
receive substantial use. PositiveInteger and NonNegativeInteger are
subdomains of Integer. An element x of NonNegativeInteger is an integer
that is greater than or equal to zero, that is, satisfies x>=0. An
element x of PositiveInteger is a nonnegative integer that is, in fact,
greater than zero, that is, satisfies x>0. Not all operations from
Integer are available for these subdomains. For example, negation and
subtraction are not provided since the subdomains are not closed under
those operations. When you use an integer in an expression, FriCAS
assigns to it the type that is the most specific subdomain whose
predicate is satisfied.

This is a positive integer.


.. spadInput
::

	5


.. spadMathAnswer
.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: PositiveInteger`



This is a nonnegative integer.


.. spadInput
::

	0


.. spadMathAnswer
.. spadMathOutput
.. math::

  0

.. spadType
:sub:`Type: NonNegativeInteger`



This is neither of the above.


.. spadInput
::

	-5


.. spadMathAnswer
.. spadMathOutput
.. math::

  -5

.. spadType
:sub:`Type: Integer`



Furthermore, unless you are assigning an integer to a declared variable
or using a conversion, any integer result has as type the most specific
subdomain.


.. spadInput
::

	(-2) - (-3)


.. spadMathAnswer
.. spadMathOutput
.. math::

   1

.. spadType
:sub:`Type: PositiveInteger`




.. spadInput
::

	0 :: Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

  0

.. spadType
:sub:`Type: Integer`




.. spadInput
::

	x : NonNegativeInteger := 5


.. spadMathAnswer
.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: NonNegativeInteger`



When necessary, FriCAS converts an integer object into one belonging to
a less specific subdomain. For example, in ``3-2``, the arguments to "-" are
both elements of PositiveInteger, but this type does not provide a
subtraction operation. Neither does NonNegativeInteger, so 3 and 2 are
viewed as elements of Integer, where their difference can be calculated.
The result is 1, which FriCAS then automatically assigns the type
PositiveInteger.

Certain operations are very sensitive to the subdomains to which their
arguments belong. This is an element of PositiveInteger.


.. spadInput
::

	2 ^ 2


.. spadMathAnswer
.. spadMathOutput
.. math::

  4

.. spadType
:sub:`Type: PositiveInteger`



This is an element of Fraction Integer.


.. spadInput
::

	2 ^ (-2)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \frac{1}{4}

.. spadType
:sub:`Type: Fraction Integer`



It makes sense then that this is a list of elements of PositiveInteger.


.. spadInput
::

	[10^i for i in 2..5]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {100}, \: {1000}, \: {10000}, \: {100000}
  \right]


.. spadType
:sub:`Type: List PositiveInteger`



What should the type of ``[10^(i-1) for i in 2..5]`` be? On one hand, i-1 is
always an integer greater than zero as i ranges from 2 to 5 and so
``10^i`` is also always a positive integer. On the other, i-1 is a very
simple function of i. FriCAS does not try to analyze every such function
over the index's range of values to determine whether it is always
positive or nowhere negative. For an arbitrary FriCAS function, this
analysis is not possible.

So, to be consistent no such analysis is done and we get this.


.. spadInput
::

	[10^(i-1) for i in 2..5]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {10}, \: {100}, \: {1000}, \: {10000}
  \right]

.. spadType
:sub:`Type: List Fraction Integer`



To get a list of elements of PositiveInteger instead, you have two
choices. You can use a conversion.


.. spadInput
::

	[10^((i-1) :: PI) for i in 2..5]


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function G82696 with type Integer -> Boolean 
 Compiling function G82708 with type NonNegativeInteger -> Boolean 

.. spadMathOutput
.. math::

  \left[
  {10}, \: {100}, \: {1000}, \: {10000}
  \right]

.. spadType
:sub:`Type: List PositiveInteger`



Or you can use **pretend**. 


.. spadInput
::

	[10^((i-1) pretend PI) for i in 2..5]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {10}, \: {100}, \: {1000}, \: {10000}
  \right]

.. spadType
:sub:`Type: List PositiveInteger`



The operation *pretend* is used to **defeat** the FriCAS type system. The
expression object pretend D means make a new object (without copying) of
type D from object. If object were an integer and you told FriCAS to
pretend it was a list, you would probably see a message about a fatal
error being caught and memory possibly being damaged. Lists do not have
the same internal representation as integers!

You use pretend at your peril.

Use pretend **with great care!** FriCAS trusts you that the value is of the
specified type.


.. spadInput
::

	(2/3) pretend Complex Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

  2+{3 \  i}

.. spadType
:sub:`Type: Complex Integer`
