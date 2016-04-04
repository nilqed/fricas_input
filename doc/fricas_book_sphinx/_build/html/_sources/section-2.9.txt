.. status: ok


2.9 Package Calling and Target Types
------------------------------------

FriCAS works hard to figure out what you mean by an expression without
your having to qualify it with type information. Nevertheless, there are
times when you need to help it along by providing hints (or even
orders!) to get FriCAS to do what you want.

We saw in `ugTypesDeclare <section-2.3.html#ugTypesDeclare>`__ that
declarations using types and modes control the type of the results
produced. For example, we can either produce a complex object with
polynomial real and imaginary parts or a polynomial with complex integer
coefficients, depending on the declaration.

Package calling is how you tell FriCAS to use a particular function from
a particular part of the library.

Use the ``/`` from Fraction Integer to create a fraction of two integers.


.. spadInput
::

	2/3


.. spadMathAnswer
.. spadMathOutput
.. math::

  2 \over 3  

.. spadType
:sub:`Type: Fraction Integer`



If we wanted a floating point number, we can say use the / in Float.


.. spadInput
::

	(2/3) $Float


.. spadMathAnswer
.. spadMathOutput
.. math::

  0.66666666666666666667

.. spadType
:sub:`Type: Float`



Perhaps we actually wanted a fraction of complex integers.


.. spadInput
::

	(2/3) $Fraction(Complex Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

   2 \over 3

.. spadType
:sub:`Type: Float`



In each case, FriCAS used the indicated operations, sometimes first
needing to convert the two integers into objects of the appropriate
type. In these examples, ``/`` is written as an infix operator.


To use package calling with an infix operator, use the following syntax:

::
    
   (arg1 op arg2) $type

 
We used, for example, ``(2/3) $Float``. The expression 2+3+4 is equivalent
to (2+3)+4. Therefore in the expression ``(2+3+4) $Float`` the second
``+`` comes from the Float domain. The first ``+`` comes from Float
because the package call causes FriCAS to convert (2+3) and 4 to type
Float. Before the sum is converted, it is given a target type of Float
by FriCAS and then evaluated. The target type causes the ``+`` from
Float to be used.


For an operator written before its arguments, you must use parentheses
around the arguments (even if there is only one), and follow the closing
parenthesis by a `` $`` and then the type. 

::
    
    fun(arg1,arg2,…,argN) $type


For example, to call the minimum function from SmallFloat on two
integers, you could write ``min(4,89) $SmallFloat``. Another use of package
calling is to tell FriCAS to use a library function rather than a
function you defined. We discuss this in Section
`ugUserUse <section-6.9.html#ugUserUse>`__ .

Sometimes rather than specifying where an operation comes from, you just
want to say what type the result should be. We say that you provide a
target type for the expression. Instead of using a `` $``, use a
``@`` to specify the requested target type. Otherwise, the syntax is
the same. Note that giving a target type is not the same as explicitly
doing a conversion. The first says try to pick operations so that the
result has such-and-such a type. The second says compute the result and
then convert to an object of such-and-such a type.

Sometimes it makes sense, as in this expression, to say: choose the
operations in this expression so that the final result is Float.


.. spadInput
::

	(2/3)@Float


.. spadMathAnswer
.. spadMathOutput
.. math::

  0.66666666666666666667

.. spadType
:sub:`Type: Float`

Here we used ``@`` to say that the target type of the left-hand side
was Float. In this simple case, there was no real difference between
using `` $`` and ``@``. You can see the difference if you try the
following.

This says to try to choose ``+`` so that the result is a string.
FriCAS cannot do this.


.. spadInput
::

	(2 + 3)@String


.. spadMathAnswer
.. spadVerbatim

::

 
 An expression involving @ String actually evaluated to one of 
    type PositiveInteger . Perhaps you should use :: String .



This says to get the + from String and apply it to the two integers.
FriCAS also cannot do this because there is no + exported by String.


.. spadInput
::

	(2 + 3) $String


.. spadMathAnswer
.. spadVerbatim

.. error::

    The function + is not implemented in String .


(By the way, the operation concatString or juxtaposition is used
to concatenate two strings.)

When we have more than one operation in an expression, the difference is
even more evident. The following two expressions show that FriCAS uses
the target type to create different objects. The ``+``, ``*`` and ``^``
operations are all chosen so that an object of the correct final type is
created.

This says that the operations should be chosen so that the result is a
Complex object.


.. spadInput
::

	((x + y * %i)^2)@(Complex Polynomial Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{y} ^ {2}}+{{x} ^ {2}}+{2 \  x \  y \  i}

.. spadType
:sub:`Type: Complex Polynomial Integer`



This says that the operations should be chosen so that the result is a
Polynomial object.


.. spadInput
::

	((x + y * %i)^2)@(Polynomial Complex Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{y} ^ {2}}+{2 \  i \  x \  y}+{{x} ^ {2}}


.. spadType
:sub:`Type: Polynomial Complex Integer`



What do you think might happen if we left off all target type and
package call information in this last example?


.. spadInput
::

	(x + y * %i)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{y} ^ {2}}+{2 \  i \  x \  y}+{{x} ^ {2}}

.. spadType
:sub:`Type: Polynomial Complex Integer`



We can convert it to Complex as an afterthought. But this is more work
than just saying making what we want in the first place.


.. spadInput
::

	% :: Complex ?


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{y} \sp {2}}+{{x} \sp {2}}+{2 \  x \  y \  i}

.. spadType
:sub:`Type: Complex Polynomial Integer`


Finally, another use of package calling is to qualify fully an operation
that is passed as an argument to a function.

Start with a small matrix of integers.


.. spadInput
::

	h := matrix [ [8,6],[-4,9] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
   8 & 6 \\
  -4 & 9
  \end{array}
  \right]

.. spadType
:sub:`Type: Matrix Integer`



We want to produce a new matrix that has for entries the multiplicative
inverses of the entries of h. One way to do this is by calling
mapmapMatrixCategoryFunctions2 with the invinvFraction function from
Fraction (Integer).


.. spadInput
::

	map(inv $Fraction(Integer),h)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {1 \over 8} & {1 \over 6} \\
  -{1 \over 4} & {1 \over 9}
  \end{array}
  \right]

.. spadType
:sub:`Type: Matrix Fraction Integer`



We could have been a bit less verbose and used abbreviations.


.. spadInput
::

	map(inv $FRAC(INT),h)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {1 \over 8} & {1 \over 6} \\
  -{1 \over 4} & {1 \over 9}
  \end{array}
  \right]

.. spadType
:sub:`Type: Matrix Fraction Integer`



As it turns out, FriCAS is smart enough to know what we mean anyway. We
can just say this.


.. spadInput
::

	map(inv,h)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {1 \over 8} & {1 \over 6} \\
  -{1 \over 4} & {1 \over 9}
  \end{array}
  \right]

.. spadType
:sub:`Type: Matrix Fraction Integer`
