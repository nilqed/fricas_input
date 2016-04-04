.. status: ok


6.1 Functions vs. Macros
------------------------

A function is a program to perform some function:vs. macro computation.
macro:vs. function Most functions have names so that it is easy to refer
to them. A simple example of a function is one named absabsInteger which
computes the absolute value of an integer.

This is a use of the absolute value library function for integers.


.. spadInput
::

	abs(-8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



This is an unnamed function that does the same thing, using the maps-to
syntax +-> that we discuss in section
`ugUserAnon <section-6.17.html#ugUserAnon>`__ .


.. spadInput
::

	(x +-> if x < 0 then -x else x)(-8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Functions can be used alone or serve as the building blocks for larger
programs. Usually they return a value that you might want to use in the
next stage of a computation, but not always (for example, see
`ExitXmpPage <chapter-9.13-26.html#ExitXmpPage>`__ and
`VoidXmpPage <section-9.86.html#VoidXmpPage>`__ ). They may also read
data from your keyboard, move information from one place to another, or
format and display results on your screen.

In FriCAS, as in mathematics, functions function:parameters are usually
parameterized. Each time you call (some people say apply or invoke) a
function, you give parameters to a function values to the parameters
(variables). Such a value is called an argument of function:arguments
the function. FriCAS uses the arguments for the computation. In this way
you get different results depending on what you feed the function.

Functions can have local variables or refer to global variables in the
workspace. FriCAS can often compile functions so that they execute very
efficiently. Functions can be passed as arguments to other functions.

Macros are textual substitutions. They are used to clarify the meaning
of constants or expressions and to be templates for frequently used
expressions. Macros can be parameterized but they are not objects that
can be passed as arguments to functions. In effect, macros are
extensions to the FriCAS expression parser.



