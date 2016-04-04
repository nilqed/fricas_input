.. status: ok



6.14 Making Functions from Objects
----------------------------------

There are many times when you compute a complicated expression and then
wish to use that expression as the body of a function. FriCAS provides
an operation called function to do function:from an object this.
function:made by function @{made by function} It creates a function
object and places it into the workspace. There are several versions,
depending on how many arguments the function has. The first argument to
function is always the expression to be converted into the function
body, and the second is always the name to be used for the function. For
more information, see section
`MakeFunctionXmpPage <section-9.50.html#MakeFunctionXmpPage>`__ .

Start with a simple example of a polynomial in three variables.


.. spadInput
::

	p := -x + y^2 - z^3


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -z3+y2-x   |
+------------+




.. spadType

:sub:`Type: Polynomial Integer`



To make this into a function of no arguments that simply returns the
polynomial, use the two argument form of function.


.. spadInput
::

	function(p,'f0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| f0   |
+------+




.. spadType

:sub:`Type: Symbol`



To avoid possible conflicts (see below), it is a good idea to quote
always this second argument.


.. spadInput
::

	f0


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| f0()==-z3+y2-x   |
+------------------+




.. spadType

:sub:`Type: FunctionCalled f0`



This is what you get when you evaluate the function.


.. spadInput
::

	f0()


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -z3+y2-x   |
+------------+




.. spadType

:sub:`Type: Polynomial Integer`



To make a function in x, use a version of function that takes three
arguments. The last argument is the name of the variable to use as the
parameter. Typically, this variable occurs in the expression and, like
the function name, you should quote it to avoid possible confusion.


.. spadInput
::

	function(p,'f1,'x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| f1   |
+------+




.. spadType

:sub:`Type: Symbol`



This is what the new function looks like.


.. spadInput
::

	f1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| f1x==-z3+y2-x   |
+-----------------+




.. spadType

:sub:`Type: FunctionCalled f1`



This is the value of f1 at x=3. Notice that the return type of the
function is Polynomial (Integer), the same as p.


.. spadInput
::

	f1(3)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f1 with type PositiveInteger -> Polynomial 
       Integer 




.. spadMathOutput
.. math::

+------------+
| -z3+y2-3   |
+------------+




.. spadType

:sub:`Type: Polynomial Integer`



To use x and y as parameters, use the four argument form of function.


.. spadInput
::

	function(p,'f2,'x,'y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| f2   |
+------+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	f2


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| f2(x,y)==-z3+y2-x   |
+---------------------+




.. spadType

:sub:`Type: FunctionCalled f2`



Evaluate f2 at x=3 and y=0. The return type of f2 is still
Polynomial(Integer) because the variable z is still present and not one
of the parameters.


.. spadInput
::

	f2(3,0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| -z3-3   |
+---------+




.. spadType

:sub:`Type: Polynomial Integer`



Finally, use all three variables as parameters. There is no five
argument form of function, so use the one with three arguments, the
third argument being a list of the parameters.


.. spadInput
::

	function(p,'f3,['x,'y,'z])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| f3   |
+------+




.. spadType

:sub:`Type: Symbol`



Evaluate this using the same values for x and y as above, but let z be
-6. The result type of f3 is Integer.


.. spadInput
::

	f3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| f3(x,y,z)==-z3+y2-x   |
+-----------------------+




.. spadType

:sub:`Type: FunctionCalled f3`




.. spadInput
::

	f3(3,0,-6)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f3 with type (PositiveInteger,NonNegativeInteger,
       Integer) -> Integer 




.. spadMathOutput
.. math::

+-------+
| 213   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



The four functions we have defined via p have been undeclared. To
declare a function whose body is to be generated by function:declaring
function, issue the declaration before the function is created.


.. spadInput
::

	g: (Integer, Integer) -> Float


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	D(sin(x-y)/cos(x+y),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------+
| -sin(y-x)sin(y+x)+cos(y-x)cos(y+x)cos(y+x)2   |
+-----------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	function(%,'g,'x,'y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| g   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	g


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| g(x,y)==-sin(y-x)sin(y+x)+cos(y-x)cos(y+x)cos(y+x)2   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: FunctionCalled g`



It is an error to use g without the quote in the penultimate expression
since g had been declared but did not have a value. Similarly, since it
is common to overuse variable names like x, y, and so on, you avoid
problems if you always quote the variable names for function. In
general, if x has a value and you use x without a quote in a call to
function, then FriCAS does not know what you are trying to do.

What kind of object is allowable as the first argument to function?
Let's use the Browse facility of HyperDoc to find out. Browse@Browse At
the main Browse menu, enter the string function and then click on
Operations. The exposed operations called function all take an object
whose type belongs to category ConvertibleTo InputForm. What domains are
those? Go back to the main Browse menu, erase function, enter
ConvertibleTo in the input area, and click on categories on the
Constructors line. At the bottom of the page, enter InputForm in the
input area following S =. Click on Cross Reference and then on Domains.
The list you see contains over forty domains that belong to the category
ConvertibleTo InputForm. Thus you can use function for Integer, Float,
String, Complex, Expression, and so on.



