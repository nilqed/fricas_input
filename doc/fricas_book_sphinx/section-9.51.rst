.. status: ok


9.51 MappingPackage1
--------------------

Function are objects of type Mapping. In this section we demonstrate
some library operations from the packages MappingPackage1,
MappingPackage2, and MappingPackage3 that manipulate and create
functions. Some terminology: a nullary function takes no arguments, a
unary function takes one argument, and a binary function takes two
arguments.

We begin by creating an example function that raises a rational number
to an integer exponent.


.. spadInput
::

	power(q: FRAC INT, n: INT): FRAC INT == q^n


.. spadMathAnswer
.. spadVerbatim

::

 Function declaration power : (Fraction Integer,Integer) -> 
    Fraction Integer has been added to workspace.




.. spadType

Void




.. spadInput
::

	power(2,3)


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function power with type (Fraction Integer,Integer) -> 
    Fraction Integer 




.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



The twisttwistMappingPackage3 operation transposes the arguments of a
binary function. Here rewop(a, b) is power(b, a).


.. spadInput
::

	rewop := twist power


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: ((Integer,Fraction Integer) -> Fraction Integer)`



This is 23.


.. spadInput
::

	rewop(3, 2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



Now we define square in terms of power.


.. spadInput
::

	square: FRAC INT -> FRAC INT


.. spadMathAnswer
.. spadType

Void



The curryRightcurryRightMappingPackage3 operation creates a unary
function from a binary one by providing a constant argument on the
right.


.. spadInput
::

	square:= curryRight(power, 2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: (Fraction Integer -> Fraction Integer)`



Likewise, the curryLeftcurryLeftMappingPackage3 operation provides a
constant argument on the left.


.. spadInput
::

	square 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 16   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



The constantRightconstantRightMappingPackage3 operation creates (in a
trivial way) a binary function from a unary one: constantRight(f) is the
function g such that g(a,b)= f(a).


.. spadInput
::

	squirrel:= constantRight(square)$MAPPKG3(FRAC INT,FRAC INT,FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: ((Fraction Integer,Fraction Integer) -> Fraction Integer)`



Likewise, constantLeft(f) is the function g such that g(a,b)= f(b).


.. spadInput
::

	squirrel(1/2, 1/3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 14   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



The currycurryMappingPackage2 operation makes a unary function nullary.


.. spadInput
::

	sixteen := curry(square, 4/1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: (() -> Fraction Integer)`




.. spadInput
::

	sixteen()


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 16   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



The * operation constructs composed functions.


.. spadInput
::

	square2:=square*square


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: (Fraction Integer -> Fraction Integer)`




.. spadInput
::

	square2 3


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 81   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



Use the ^ operation to create functions that are n-fold iterations of
other functions.


.. spadInput
::

	sc(x: FRAC INT): FRAC INT == x + 1


.. spadMathAnswer
.. spadVerbatim

::

 Function declaration sc : Fraction Integer -> 
    Fraction Integer has been added to workspace.




.. spadType

Void



This is a list of Mapping objects.


.. spadInput
::

	incfns := [sc^i for i in 0..10]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------+
| [theMap(...),theMap(...),theMap(...),theMap(...),theMap(...),theMap(...),theMap(...),theMap(...),theMap(...),theMap(...),theMap(...)]   |
+-----------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List (Fraction Integer -> Fraction Integer)`



This is a list of applications of those functions.


.. spadInput
::

	[f 4 for f in incfns]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [4,5,6,7,8,9,10,11,12,13,14]   |
+--------------------------------+




.. spadType

:sub:`Type: List Fraction Integer`



Use the recurrecurMappingPackage1 operation for recursion:

g := recur f means g(n,x) == f(n,f(n-1,...f(1,x))).


.. spadInput
::

	times(n:NNI, i:INT):INT == n*i


.. spadMathAnswer
.. spadVerbatim

::

 Function declaration times : (NonNegativeInteger,Integer) -> 
    Integer has been added to workspace.




.. spadType

Void




.. spadInput
::

	r := recur(times)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: ((NonNegativeInteger,Integer) -> Integer)`



This is a factorial function.


.. spadInput
::

	fact := curryRight(r, 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: (NonNegativeInteger -> Integer)`




.. spadInput
::

	fact 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 24   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Constructed functions can be used within other functions.


.. spadVerbatim

::

 mto2ton(m, n) ==
   raiser := square^n
   raiser m




.. spadType

Void



This is 323.


.. spadInput
::

	mto2ton(3, 3)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function mto2ton with type (PositiveInteger,
       PositiveInteger) -> Fraction Integer 




.. spadMathOutput
.. math::

+--------+
| 6561   |
+--------+




.. spadType

:sub:`Type: Fraction Integer`



Here shiftfib is a unary function that modifies its argument.


.. spadVerbatim

::

 shiftfib(r: List INT) : INT ==
   t := r.1
   r.1 := r.2
   r.2 := r.2 + t
   t
 Function declaration shiftfib : List Integer -> Integer 
    has been added to workspace.




.. spadType

Void



By currying over the argument we get a function with private state.


.. spadInput
::

	fibinit: List INT := [0, 1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [0,1]   |
+---------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	fibs := curry(shiftfib, fibinit)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| theMap(...)   |
+---------------+




.. spadType

:sub:`Type: (() -> Integer)`




.. spadInput
::

	[fibs() for i in 0..30]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------+
| [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025,121393,196418,317811,514229,832040]   |
+-------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Integer`





