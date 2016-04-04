.. status: ok


1.7 Writing Your Own Functions
------------------------------

FriCAS provides you with a very large library of predefined operations
and objects to compute with. You can use the FriCAS library of
constructors to create new objects dynamically of quite arbitrary
complexity. For example, you can make lists of matrices of fractions of
polynomials with complex floating point numbers as coefficients.
Moreover, the library provides a wealth of operations that allow you to
create and manipulate these objects.

For many applications, you need to interact with the interpreter and
write some FriCAS programs to tackle your application. FriCAS allows you
to write functions interactively, function thereby effectively extending
the system library. Here we give a few simple examples, leaving the
details to Chapter `ugUser <section-6.0.html#ugUser>`__ .

We begin by looking at several ways that you can define the factorial
function in FriCAS. The first way is to give a piece-wise definition of 
the function.
This method is best for a general recurrence relation since
the pieces are gathered together and compiled into an efficient
iterative function. Furthermore, enough previously computed values are
automatically saved so that a subsequent call to the function can pick
up from where it left off.

Define the value of fact at 0.


.. spadInput
::

	fact(0) == 1


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



Define the value of fact(n) for general n.

.. spadInput
::

	fact(n) == n*fact(n-1)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



Ask for the value at 50. The resulting function created by FriCAS
computes the value by iteration.


.. spadInput
::

	fact(50)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function fact with type Integer -> Integer 
    Compiling function fact as a recurrence relation.




.. spadMathOutput
.. math::

  \scriptsize{
  30414093201713378043 61260816606476884437 76415689605120000000 00000
  }
  
.. spadType
:sub:`Type: PositiveInteger`



A second definition uses an if-then-else and recursion.


.. spadInput
::

	fac(n) == if n < 3 then n else n * fac(n - 1)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



This function is less efficient than the previous version since each
iteration involves a recursive function call.


.. spadInput
::

	fac(50)


.. spadMathAnswer
.. spadMathOutput
.. math::
  
  \scriptsize{
  30414093201713378043 61260816606476884437 76415689605120000000 00000
  }
  
.. spadType
:sub:`Type: PositiveInteger`



A third version directly uses iteration.


.. spadInput
::

	fa(n) == (a := 1; for i in 2..n repeat a := a*i; a)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



This is the least space-consumptive version.


.. spadInput
::

	fa(50)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function fac with type Integer -> Integer 


.. spadMathOutput
.. math::

  \scriptsize{
  30414093201713378043 61260816606476884437 76415689605120000000 00000
  }
  
.. spadType
:sub:`Type: PositiveInteger`



A final version appears to construct a large list and then reduces over
it with multiplication.


.. spadInput
::

	f(n) == reduce(*,[i for i in 2..n])


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



In fact, the resulting computation is optimized into an efficient
iteration loop equivalent to that of the third version.


.. spadInput
::

	f(50)


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function f with type 
    PositiveInteger -> PositiveInteger 

.. spadMathOutput
.. math::

  \scriptsize{
  30414093201713378043 61260816606476884437 76415689605120000000 00000
  }
  
.. spadType
:sub:`Type: PositiveInteger`



The library version uses an algorithm that is different from the four
above because it highly optimizes the recurrence relation definition of
factorial.


.. spadInput
::

	factorial(50)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptsize{
  30414093201713378043 61260816606476884437 76415689605120000000 00000
  }
  
.. spadType
:sub:`Type: PositiveInteger`



You are not limited to one-line functions in FriCAS. If you place your
function definitions in **.input** files (see
`ugInOutIn <section-4.1.html#ugInOutIn>`__ ), you can have multi-line
functions that use indentation for grouping.

Given n elements, ``diagonalMatrix`` creates an n by n matrix with those
elements down the diagonal. This function uses a permutation matrix that
interchanges the ith and jth rows of a matrix by which it is
right-multiplied.

This function definition shows a style of definition that can be used in
``.input`` files. Indentation is used to create blocks: sequences of
expressions that are evaluated in sequence except as modified by control
statements such as if-then-else and return.


.. spadVerbatim

::

 permMat(n, i, j) ==
   m := diagonalMatrix
     [(if i = k or j = k then 0 else 1)
       for k in 1..n]
   m(i,j) := 1
   m(j,i) := 1
   m



This creates a four by four matrix that interchanges the second and
third rows.


.. spadInput
::

	p := permMat(4,2,3)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function permMat with type (PositiveInteger,
       PositiveInteger,PositiveInteger) -> Matrix Integer 




.. spadMathOutput
.. math::

  \left[
  \begin{array}{cccc}
    1 & 0 & 0 & 0 \\
    0 & 0 & 1 & 0 \\
    0 & 1 & 0 & 0 \\
    0 & 0 & 0 & 1
  \end{array}
  \right]

.. spadType
:sub:`Type: Matrix Integer`



Create an example matrix to permute.


.. spadInput
::

	m := matrix [ [4*i + j for j in 1..4] for i in 0..3]


.. spadMathAnswer
.. spadMathOutput
.. math::
 
  \left[
  \begin{array}{cccc}
    1 & 2 & 3 & 4 \\
    5 & 6 & 7 & 8 \\
    9 & {10} & {11} & {12} \\
    {13} & {14} & {15} & {16}
  \end{array}
  \right]


.. spadType
:sub:`Type: Matrix Integer`



Interchange the second and third rows of m.


.. spadInput
::

	permMat(4,2,3) * m


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cccc}
   1 & 2 & 3 & 4 \\
   9 & {10} & {11} & {12} \\
   5 & 6 & 7 & 8 \\
   {13} & {14} & {15} & {16}
  \end{array}
  \right]

.. spadType
:sub:`Type: Matrix Integer`



A function can also be passed as an argument to another function, which
then applies the function or passes it off to some other function that
does. You often have to declare the type of a function that has
functional arguments.

This declares t to be a two-argument function that returns a Float. The
first argument is a function that takes one Float argument and returns a
Float.


.. spadInput
::

	t : (Float -> Float, Float) -> Float


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



This is the definition of t.


.. spadInput
::

	t(fun, x) == fun(x)^2 + sin(x)^2


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



We have not defined a cos in the workspace. The one from the FriCAS
library will do.


.. spadInput
::

	t(cos, 5.2058)


.. spadMathAnswer
.. spadMathOutput
.. math::

 1.0

.. spadType
:sub:`Type: Float`



Here we define our own (user-defined) function.


.. spadInput
::

	cosinv(y) == cos(1/y)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`


Pass this function as an argument to t.


.. spadInput
::

	t(cosinv, 5.2058)


.. spadMathAnswer
.. spadMathOutput
.. math::

  1.739223724180051649254147684772932520785   


.. spadType
:sub:`Type: Float`



FriCAS also has *pattern matching* capabilities for simplification
simplification pattern matching of expressions and for defining new
functions by rules. For example, suppose that you want to apply
regularly a transformation that groups together products of radicals:
Note that such a transformation is not generally correct. FriCAS never
uses it automatically.

Give this rule the name groupSqrt.


.. spadInput
::

	groupSqrt := rule(sqrt(a) * sqrt(b) == sqrt(a*b))


.. spadMathAnswer
.. spadMathOutput
.. math::

  { \%C \  {\sqrt {a}} \  {\sqrt {b}}} \mbox{ == } { \%C \  {\sqrt {{a \
     b}}}}

.. spadType
:sub:`Type: RewriteRule(Integer,Integer,Expression Integer)`



Here is a test expression.


.. spadInput
::

	a := (sqrt(x) + sqrt(y) + sqrt(z))^4


.. spadMathAnswer
.. spadMathOutput
.. math::

  {\scriptsize {{\left( {{\left( {4 \  z}+{4 \  y}+{{12} \  x} \right)}
   \  {\sqrt {y}}}+{{\left( {4 \  z}+{{12} \  y}+{4 \  x} \right)}
   \  {\sqrt {x}}} \right)}
   \  {\sqrt {z}}}+{{\left( {{12} \  z}+{4 \  y}+{4 \  x} \right)}
   \  {\sqrt {x}} \  {\sqrt {y}}}+{{z} ^ {2}}+{{\left( {6 \  y}+{6 \  x}
   \right)}
   \  z}+{{y} ^ {2}}+{6 \  x \  y}+{{x} ^ {2}}}


.. spadType
:sub:`Type: Expression Integer`



The rule groupSqrt successfully simplifies the expression.


.. spadInput
::

	groupSqrt a


.. spadMathAnswer
.. spadMathOutput
.. math::

  {\scriptsize {{\left( {4 \  z}+{4 \  y}+{{12} \  x} \right)}
   \  {\sqrt {{y \  z}}}}+{{\left( {4 \  z}+{{12} \  y}+{4 \  x} \right)}
   \  {\sqrt {{x \  z}}}}+{{\left( {{12} \  z}+{4 \  y}+{4 \  x} \right)}
   \  {\sqrt {{x \  y}}}}+{{z} ^ {2}}+{{\left( {6 \  y}+{6 \  x}
   \right)}
   \  z}+{{y} ^ {2}}+{6 \  x \  y}+{{x} ^ {2}}}

.. spadType
:sub:`Type: Expression Integer`
