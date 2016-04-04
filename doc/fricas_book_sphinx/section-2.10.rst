.. status: ok



2.10 Resolving Types
--------------------

In this section we briefly describe an internal process by which resolve
FriCAS determines a type to which two objects of possibly different
types can be converted. We do this to give you further insight into how
FriCAS takes your input, analyzes it, and produces a result.

What happens when you enter x+1 to FriCAS? Let's look at what you get
from the two terms of this expression.

This is a symbolic object whose type indicates the name.


.. spadInput
::

	x


.. spadMathAnswer
.. spadMathOutput
.. math::

  x

.. spadType
:sub:`Type: Variable x`



This is a positive integer.


.. spadInput
::

	1


.. spadMathAnswer
.. spadMathOutput
.. math::

  1

.. spadType
:sub:`Type: PositiveInteger`



There are no operations in PositiveInteger that add positive integers to
objects of type ``Variable(x)`` nor are there any in Variable(x). Before it
can add the two parts, FriCAS must come up with a common type to which
both x and 1 can be converted. We say that FriCAS must resolve the two
types into a common type. In this example, the common type is
``Polynomial(Integer)``.

Once this is determined, both parts are converted into polynomials, and
the addition operation from Polynomial(Integer) is used to get the
answer.


.. spadInput
::

	x + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

  x + 1

.. spadType
:sub:`Type: Polynomial Integer`



FriCAS can always resolve two types: if nothing resembling the original
types can be found, then Any is be used. Any This is fine and useful in
some cases.


.. spadInput
::

	["string",3.14159]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \verb#"string"#, \: {3.14159}
  \right]

.. spadType
:sub:`Type: List Any`



In other cases objects of type Any can't be used by the operations you
specified.


.. spadInput
::

	"string" + 3.14159


.. spadMathAnswer
.. spadVerbatim

::

 There are 11 exposed and 5 unexposed library operations named + 
   having 2 argument(s) but none was determined to be applicable. 
   Use HyperDoc Browse, or issue
                             )display op +
   to learn more about the available operations. Perhaps 
   package-calling the operation or using coercions on the 
   arguments will allow you to apply the operation.
  
 Cannot find a definition or applicable library operation named + 
   with argument type(s) 
                                String
                                 Float
       
   Perhaps you should use "@" to indicate the required return type, 
   or "$" to specify which version of the function you need.



Although this example was contrived, your expressions may need to be
qualified slightly to help FriCAS resolve the types involved. You may
need to declare a few variables, do some package calling, provide some
target type information or do some explicit conversions.

We suggest that you just enter the expression you want evaluated and see
what FriCAS does. We think you will be impressed with its ability to do
what I mean. If FriCAS is still being obtuse, give it some hints. As you
work with FriCAS, you will learn where it needs a little help to analyze
quickly and perform your computations.



