.. status: ok


6.3 Introduction to Functions
-----------------------------

Each name in your workspace can refer to a single object. This may be
any kind of object including a function. You can use interactively any
function from the library or any that you define in the workspace. In
the library the same name can have very many functions, but you can have
only one function with a given name, although it can have any number of
arguments that you choose.

If you define a function in the workspace that has the same name and
number of arguments as one in the library, then your definition takes
precedence. In fact, to get the library function you must package-call
it (see section `ugTypesPkgCall <section-2.9.html#ugTypesPkgCall>`__ ).

To use a function in FriCAS, you apply it to its arguments. Most
functions are applied by entering the name of the function followed by
its argument or arguments.


.. spadInput
::

	factor(12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 223   |
+-------+




.. spadType

:sub:`Type: Factored Integer`



Some functions like ``+`` have infix operators as names.


.. spadInput
::

	3 + 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The function ``+`` has two arguments. When you give it more than two
arguments, FriCAS groups the arguments to the left. This expression is
equivalent to (1+2)+7.


.. spadInput
::

	1 + 2 + 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



All operations, including infix operators, can be written in prefix
form, that is, with the operation name followed by the arguments in
parentheses. For example, 2+3 can alternatively be written as +(2,3).
But +(2,3,4) is an error since + takes only two arguments.

Prefix operations are generally applied before the infix operation. Thus
the form factorial 3+1 means factorial(3)+1 producing 7, and -2+5 means
(-2)+5 producing 3. An example of a prefix operator is prefix -. For
example, -2+5 converts to (-2)+5 producing the value 3. Any prefix
function taking two arguments can be written in an infix manner by
putting an ampersand & before the name. Thus D(2*x,x) can be written as
2*x&Dx returning 2.

Every function in FriCAS is identified by a name and type. (An exception
is an anonymous function discussed in
`ugUserAnon <section-6.17.html#ugUserAnon>`__ .) The type of a function
is always a mapping of the form Source->Target where Source and Target
are types. To enter a type from the keyboard, enter the arrow by using a
hyphen - followed by a greater-than sign >, e.g. Integer -> Integer.

Let's go back to ``+``. There are many ``+`` functions in the FriCAS
library: one for integers, one for floats, another for rational numbers,
and so on. These ``+`` functions have different types and thus are
different functions. You've seen examples of this overloading
before---using the same name for different functions. Overloading is the
rule rather than the exception. You can add two integers, two
polynomials, two matrices or two power series. These are all done with
the same function name but with different functions.



