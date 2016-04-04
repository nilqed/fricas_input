.. status: ok



6.9 How FriCAS Determines What Function to Use
----------------------------------------------

What happens if you define a function that has the same name as a
library function? Well, if your function has the same name and number of
arguments (we sometimes say arity) as another function in the library,
then your function covers up the library function. If you want then to
call the library function, you will have to package-call it. FriCAS can
use both the functions you write and those that come from the library.
Let's do a simple example to illustrate this.

Suppose you (wrongly!) define sin in this way.


.. spadInput
::

	sin x == 1.0


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The value 1.0 is returned for any argument.


.. spadInput
::

	sin 4.3


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function sin with type Float -> Float 




.. spadMathOutput
.. math::

+-------+
| 1.0   |
+-------+




.. spadType

:sub:`Type: Float`



If you want the library operation, we have to package-call it (see
`ugTypesPkgCall <section-2.9.html#ugTypesPkgCall>`__ for more
information).


.. spadInput
::

	sin(4.3) $Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| -0.91616593674945498404   |
+---------------------------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	sin(34.6) $Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| -0.042468034716950101543   |
+----------------------------+




.. spadType

:sub:`Type: Float`



Even worse, say we accidentally used the same name as a library function
in the function.


.. spadInput
::

	sin x == sin x


.. spadMathAnswer
.. spadVerbatim

::

    Compiled code for sin has been cleared.
    1 old definition(s) deleted for function or rule sin 




.. spadType

:sub:`Type: Void`



Then FriCAS definitely does not understand us.


.. spadInput
::

	sin 4.3


.. spadMathAnswer
.. spadVerbatim

::

 AXIOM cannot determine the type of sin because it cannot analyze 
    the non-recursive part, if that exists. This may be remedied 
    by declaring the function.



Again, we could package-call the inside function.


.. spadInput
::

	sin x == sin(x) $Float


.. spadMathAnswer
.. spadVerbatim

::

    1 old definition(s) deleted for function or rule sin 




.. spadType

:sub:`Type: Void`




.. spadInput
::

	sin 4.3


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function sin with type Float -> Float 
 +++ |*1;sin;1;G82322| redefined




.. spadMathOutput
.. math::

+---------------------------+
| -0.91616593674945498404   |
+---------------------------+




.. spadType

:sub:`Type: Float`



Of course, you are unlikely to make such obvious errors. It is more
probable that you would write a function and in the body use a function
that you think is a library function. If you had also written a function
by that same name, the library function would be invisible.

How does FriCAS determine what library function to call? It very much
depends on the particular example, but the simple case of creating the
polynomial x+2/3 will give you an idea.

#. The x is analyzed and its default type is Variable(x).
#. The 2 is analyzed and its default type is PositiveInteger.
#. The 3 is analyzed and its default type is PositiveInteger.
#. Because the arguments to / are integers, FriCAS gives the expression
   2/3 a default target type of Fraction(Integer).
#. FriCAS looks in PositiveInteger for /. It is not found.
#. FriCAS looks in Fraction(Integer) for /. It is found for arguments of
   type Integer.
#. The 2 and 3 are converted to objects of type Integer (this is
   trivial) and / is applied, creating an object of type
   Fraction(Integer).
#. No ``+`` for arguments of types Variable(x) and Fraction(Integer)
   are found in either domain.
#. FriCAS resolves resolve (see
   `ugTypesResolve <section-2.10.html#ugTypesResolve>`__ ) the types
   and gets Polynomial (Fraction (Integer)).
#. The x and the 2/3 are converted to objects of this type and + is
   applied, yielding the answer, an object of type Polynomial (Fraction
   (Integer)).



