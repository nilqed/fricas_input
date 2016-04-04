.. status: ok



6.16 Free and Local Variables
-----------------------------

When you want to refer to a variable that is not local to your function,
use a free declaration. free Variables declared to be free free variable
are assumed to be defined globally variable:free in the variable:global
workspace. global variable

This is a global workspace variable.


.. spadInput
::

	counter := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



This function refers to the global counter.


.. spadVerbatim

::

 f() ==
   free counter
   counter := counter + 1




.. spadType

:sub:`Type: Void`



The global counter is incremented by 1.


.. spadInput
::

	f()


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f with type () -> NonNegativeInteger 
 +++ |*0;f;1;G82322| redefined




.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	counter


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



Usually FriCAS can tell that you mean to refer to a global variable and
so free isn't always necessary. However, for clarity and the sake of
self-documentation, we encourage you to use it.

Declare a variable to be local when you do not want to refer to
variable:local a global variable by the same name. local variable

This function uses counter as a local variable.


.. spadVerbatim

::

 g() ==
   local counter
   counter := 7




.. spadType

:sub:`Type: Void`



Apply the function.


.. spadInput
::

	g()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Check that the global value of counter is unchanged.


.. spadInput
::

	counter


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



Parameters to a function are local variables in the function. Even if
you issue a free declaration for a parameter, it is still local.

What happens if you do not declare that a variable x in the body of your
function is local or free? Well, FriCAS decides on this basis:

#. FriCAS scans your function line-by-line, from top-to-bottom. The
   right-hand side of an assignment is looked at before the left-hand
   side.
#. If x is referenced before it is assigned a value, it is a free
   (global) variable.
#. If x is assigned a value before it is referenced, it is a local
   variable.

Set two global variables to 1.


.. spadInput
::

	a := b := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Refer to a before it is assigned a value, but assign a value to b before
it is referenced.


.. spadVerbatim

::

 h() ==
   b := a + 1
   a := b + a




.. spadType

:sub:`Type: Void`



Can you predict this result?


.. spadInput
::

	h()


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function h with type () -> PositiveInteger 
 +++ |*0;h;1;G82322| redefined




.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



How about this one?


.. spadInput
::

	[a, b]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [3,1]   |
+---------+




.. spadType

:sub:`Type: List PositiveInteger`



What happened? In the first line of the function body for h, a is
referenced on the right-hand side of the assignment. Thus a is a free
variable. The variable b is not referenced in that line, but it is
assigned a value. Thus b is a local variable and is given the value
a+1=2. In the second line, the free variable a is assigned the value b+a
which equals 2+1=3. This is the value returned by the function. Since a
was free in h, the global variable a has value 3. Since b was local in
h, the global variable b is unchanged---it still has the value 1.

It is good programming practice always to declare global variables.
However, by far the most common situation is to have local variables in
your functions. No declaration is needed for this situation, but be sure
to initialize their values.

Be careful if you use free variables and you cache the value of your
function (see `ugUserCache <section-6.12.html#ugUserCache>`__ ).
Caching only checks if the values of the function arguments are the same
as in a function call previously seen. It does not check if any of the
free variables on which the function depends have changed between
function calls.

Turn on caching for p.


.. spadInput
::

	)set fun cache all p


.. spadMathAnswer
.. spadVerbatim

::

    function p will cache all values.



Define p to depend on the free variable N.


.. spadInput
::

	p(i,x) == ( free N; reduce( + , [ (x-i)^n for n in 1..N ] ) )


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Set the value of N.


.. spadInput
::

	N := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Evaluate p the first time.


.. spadInput
::

	p(0, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Polynomial Integer`



Change the value of N.


.. spadInput
::

	N := 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Evaluate p the second time.


.. spadInput
::

	p(0, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Polynomial Integer`



If caching had been turned off, the second evaluation would have
reflected the changed value of N.

Turn off caching for p.


.. spadInput
::

	)set fun cache 0 p


.. spadMathAnswer
.. spadVerbatim

::

    Caching for function p is turned off



FriCAS does not allow fluid variables, that is, variables variable:fluid
bound by a function f that can be referenced by functions called by f.
fluid variable

Values are passed to functions by reference: a pointer to the value is
passed rather than a copy of the value or a pointer to a copy.

This is a global variable that is bound to a record object.


.. spadInput
::

	r : Record(i : Integer) := [1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [i=1]   |
+---------+




.. spadType

:sub:`Type: Record(i: Integer)`



This function first modifies the one component of its record argument
and then rebinds the parameter to another record.


.. spadVerbatim

::

 resetRecord rr ==
   rr.i := 2
   rr := [10]




.. spadType

:sub:`Type: Void`



Pass r as an argument to resetRecord.


.. spadInput
::

	resetRecord r


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [i=10]   |
+----------+




.. spadType

:sub:`Type: Record(i: Integer)`



The value of r was changed by the expression rr.i:=2 but not by
rr:=[10].


.. spadInput
::

	r


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [i=2]   |
+---------+




.. spadType

:sub:`Type: Record(i: Integer)`



To conclude this section, we give an iterative definition of Fibonacci
numbers a function that computes Fibonacci numbers. This definition
approximates the definition into which FriCAS transforms the recurrence
relation definition of fib in
`ugUserRecur <section-6.13.html#ugUserRecur>`__ .

Global variables past and present are used to hold the last computed
Fibonacci numbers.


.. spadInput
::

	past := present := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Global variable index gives the current index of present.


.. spadInput
::

	index := 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Here is a recurrence relation defined in terms of these three global
variables.


.. spadVerbatim

::

 fib(n) ==
   free past, present, index
   n < 3 => 1
   n = index - 1 => past
   if n < index-1 then
     (past,present) := (1,1)
     index := 2
   while (index < n) repeat
     (past,present) := (present, past+present)
     index := index + 1
   present




.. spadType

:sub:`Type: Void`



Compute the infinite stream of Fibonacci numbers.


.. spadInput
::

	fibs := [fib(n) for n in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [1,1,2,3,5,8,13,21,34,55,…]   |
+-------------------------------+




.. spadType

:sub:`Type: Stream PositiveInteger`



What is the 1000th Fibonacci number?


.. spadInput
::

	fibs 1000


.. spadMathAnswer
.. spadVerbatim

::

   434665576869374564356885276750406258025646605173717804024_
     8172908953655541794905189040387984007925516929592259308_
     0322634775209689623239873322471161642996440906533187938_
     298969649928516003704476137795166849228875




.. spadType

:sub:`Type: PositiveInteger`



As an exercise, we suggest you write a function in an iterative style
that computes the value of the recurrence relation having the initial
values . How would you write the function using an element
OneDimensionalArray or Vector to hold the previously computed values?



