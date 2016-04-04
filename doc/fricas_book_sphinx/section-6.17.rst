.. status: ok


6.17 Anonymous Functions
------------------------





An anonymous function is a function that is function:anonymous defined
anonymous function by giving a list of parameters, the maps-to compound
+-> @+-> symbol ``+->`` (from the mathematical symbol ↦), and by an
expression involving the parameters, the evaluation of which determines
the return value of the function.



( parm1, parm2, ..., parmN ) +-> expression







You can apply an anonymous function in several ways.

#. Place the anonymous function definition in parentheses directly
   followed by a list of arguments.
#. Assign the anonymous function to a variable and then use the variable
   name when you would normally use a function name.
#. Use == to use the anonymous function definition as the arguments and
   body of a regular function definition.
#. Have a named function contain a declared anonymous function and use
   the result returned by the named function.



6.17.1 Some Examples
~~~~~~~~~~~~~~~~~~~~

Anonymous functions are particularly useful for defining functions on
the fly. That is, they are handy for simple functions that are used only
in one place. In the following examples, we show how to write some
simple anonymous functions.

This is a simple absolute value function.


.. spadInput
::

	x +-> if x < 0 then -x else x


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| x↦ifx<0then-xelsex   |
+----------------------+




.. spadType

:sub:`Type: AnonymousFunction`




.. spadInput
::

	abs1 := %


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| x↦ifx<0then-xelsex   |
+----------------------+




.. spadType

:sub:`Type: AnonymousFunction`



This function returns true if the absolute value of the first argument
is greater than the absolute value of the second, false otherwise.


.. spadInput
::

	(x,y) +-> abs1(x) > abs1(y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| (x,y)↦abs1(y)<abs1(x)   |
+-------------------------+




.. spadType

:sub:`Type: AnonymousFunction`



We use the above function to sort a list of integers.


.. spadInput
::

	sort(%,[3,9,-4,10,-3,-1,-9,5])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [10,-9,9,5,-4,-3,3,-1]   |
+--------------------------+




.. spadType

:sub:`Type: List Integer`



This function returns 1 if i+j is even, -1 otherwise.


.. spadInput
::

	ev := ( (i,j) +-> if even?(i+j) then 1 else -1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadType

:sub:`Type: AnonymousFunction`



We create a four-by-four matrix containing 1 or -1 depending on whether
the row plus the column index is even or not.


.. spadInput
::

	matrix([ [ev(row,col) for row in 1..4] for col in 1..4])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [1-11-1-11-111-11-1-11-11]   |
+------------------------------+




.. spadType

:sub:`Type: Matrix Integer`



This function returns true if a polynomial in x has multiple roots,
false otherwise. It is defined and applied in the same expression.


.. spadInput
::

	( p +-> not one?(gcd(p,D(p,x))) )(x^2+4*x+4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



This and the next expression are equivalent.


.. spadInput
::

	g(x,y,z) == cos(x + sin(y + tan(z)))


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The one you use is a matter of taste.


.. spadInput
::

	g == (x,y,z) +-> cos(x + sin(y + tan(z)))


.. spadMathAnswer
.. spadVerbatim

::

    1 old definition(s) deleted for function or rule g 




.. spadType

:sub:`Type: Void`







6.17.2 Declaring Anonymous Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you declare any of the arguments you must declare all of them. Thus,


.. spadVerbatim

::

 (x: INT,y): FRAC INT +-> (x + 2*y)/(y - 1)



is not legal.

This is an example of a fully declared anonymous function.
function:declaring function:anonymous:declaring The output shown just
indicates that the object you created is a particular kind of map, that
is, function.


.. spadInput
::

	(x: INT,y: INT): FRAC INT +-> (x + 2*y)/(y - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: ((Integer,Integer) -> Fraction Integer)`



FriCAS allows you to declare the arguments and not declare the return
type.


.. spadInput
::

	(x: INT,y: INT) +-> (x + 2*y)/(y - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: ((Integer,Integer) -> Fraction Integer)`



The return type is computed from the types of the arguments and the body
of the function. You cannot declare the return type if you do not
declare the arguments. Therefore,


.. spadVerbatim

::

 (x,y): FRAC INT +-> (x + 2*y)/(y - 1)



is not legal. This and the next expression are equivalent.


.. spadInput
::

	h(x: INT,y: INT): FRAC INT == (x + 2*y)/(y - 1)


.. spadMathAnswer
.. spadVerbatim

::

    Function declaration h : (Integer,Integer) -> Fraction Integer
       has been added to workspace.




.. spadType

:sub:`Type: Void`



The one you use is a matter of taste.


.. spadInput
::

	h == (x: INT,y: INT): FRAC INT +-> (x + 2*y)/(y - 1)


.. spadMathAnswer
.. spadVerbatim

::

    Function declaration h : (Integer,Integer) -> Fraction Integer
       has been added to workspace.
    1 old definition(s) deleted for function or rule h 




.. spadType

:sub:`Type: Void`



When should you declare an anonymous function?

#. If you use an anonymous function and FriCAS can't figure out what you
   are trying to do, declare the function.
#. If the function has nontrivial argument types or a nontrivial return
   type that FriCAS may be able to determine eventually, but you are not
   willing to wait that long, declare the function.
#. If the function will only be used for arguments of specific types and
   it is not too much trouble to declare the function, do so.
#. If you are using the anonymous function as an argument to another
   function (such as map or sort), consider declaring the function.
#. If you define an anonymous function inside a named function, you must
   declare the anonymous function.

This is an example of a named function for integers that returns a
function.


.. spadInput
::

	addx x == ((y: Integer): Integer +-> x + y)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



We define g to be a function that adds 10 to its argument.


.. spadInput
::

	g := addx 10


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function addx with type 
      PositiveInteger -> (Integer -> Integer) 




.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: (Integer -> Integer)`



Try it out.


.. spadInput
::

	g 3


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 13   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	g(-4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 6   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



function:anonymous:restrictions An anonymous function cannot be
recursive: since it does not have a name, you cannot even call it within
itself! If you place an anonymous function inside a named function, the
anonymous function must be declared.





