.. status: ok



5.4 Loops
---------

A loop is an expression that contains another expression, loop called
the loop body, which is to be evaluated zero or more loop:body times.
All loops contain the repeat keyword and return the unique value of
Void. Loops can contain inner loops to any depth.





The most basic loop is of the form



repeat loopBody



| Unless loopBody contains a break or return expression, the loop
repeats forever. The value returned by the loop is the unique value of
Void.







5.4.1 Compiling vs. Interpreting Loops
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS tries to determine completely the type of every object in a loop
and then to translate the loop body to LISP or even to machine code.
This translation is called compilation.

If FriCAS decides that it cannot compile the loop, it issues a
loop:compilation message stating the problem and then the following
message:



We will attempt to step through and interpret the code.



It is still possible that FriCAS can evaluate the loop but in
interpret-code mode. See section
`ugUserCompInt <section-6.10.html#ugUserCompInt>`__ where this is
discussed in terms panic:avoiding of compiling versus interpreting
functions.





5.4.2 return in Loops
~~~~~~~~~~~~~~~~~~~~~

A return expression is used to exit a function with loop:leaving via
return a particular value. In particular, if a return is in a loop
within the return function, the loop is terminated whenever the return
is evaluated.

Suppose we start with this.


.. spadVerbatim

::

 f() ==
   i := 1
   repeat
     if factorial(i) > 1000 then return i
     i := i + 1




.. spadType

:sub:`Type: Void`



When factorial(i) is big enough, control passes from inside the loop all
the way outside the function, returning the value of i (or so we think).


.. spadInput
::

	f()


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



What went wrong? Isn't it obvious that this function should return an
integer? Well, FriCAS makes no attempt to analyze the structure of a
loop to determine if it always returns a value because, in general, this
is impossible. So FriCAS has this simple rule: the type of the function
is determined by the type of its body, in this case a block. The normal
value of a block is the value of its last expression, in this case, a
loop. And the value of every loop is the unique value of Void.! So the
return type of f is Void.

There are two ways to fix this. The best way is for you to tell FriCAS
what the return type of f is. You do this by giving f a declaration
f:()->Integer prior to calling for its value. This tells FriCAS: trust
me---an integer is returned. We'll explain more about this in the next
chapter. Another clumsy way is to add a dummy expression as follows.

Since we want an integer, let's stick in a dummy final expression that
is an integer and will never be evaluated.


.. spadVerbatim

::

 f() ==
   i := 1
   repeat
     if factorial(i) > 1000 then return i
     i := i + 1
   0




.. spadType

:sub:`Type: Void`



When we try f again we get what we wanted. See
`ugUserBlocks <section-6.15.html#ugUserBlocks>`__ for more information.


.. spadInput
::

	f()


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f with type () -> NonNegativeInteger 




.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`







5.4.3 break in Loops
~~~~~~~~~~~~~~~~~~~~

The break keyword is often more useful break in terminating loop:leaving
via break a loop. A break causes control to transfer to the expression
immediately following the loop. As loops always return the unique value
of Void., you cannot return a value with break. That is, break takes no
argument.

This example is a modification of the last example in the previous
section `ugLangLoopsReturn <section-5.4.html#ugLangLoopsReturn>`__ .
Instead of using return, we'll use break.


.. spadVerbatim

::

 f() ==
   i := 1
   repeat
     if factorial(i) > 1000 then break
     i := i + 1
   i




.. spadVerbatim

::

    Compiled code for f has been cleared.
    1 old definition(s) deleted for function or rule f 




.. spadType

:sub:`Type: Void`



The loop terminates when factorial(i) gets big enough, the last line of
the function evaluates to the corresponding good value of i, and the
function terminates, returning that value.


.. spadInput
::

	f()


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f with type () -> PositiveInteger 
 +++ |*0;f;1;G82322| redefined




.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



You can only use break to terminate the evaluation of one loop. Let's
consider a loop within a loop, that is, a loop with a nested loop.
First, we initialize two counter variables.


.. spadInput
::

	(i,j) := (1, 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Nested loops must have multiple break loop:nested expressions at the
appropriate nesting level. How would you rewrite this so (i + j) > 10 is
only evaluated once?


.. spadVerbatim

::

 repeat
   repeat
     if (i + j) > 10 then break
     j := j + 1
   if (i + j) > 10 then break
   i := i + 1




.. spadType

:sub:`Type: Void`







5.4.4 break vs. => in Loop Bodies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Compare the following two loops:


.. spadVerbatim

::

 i := 1                            i := 1
 repeat                            repeat
   i := i + 1                        i := i + 1
   i > 3 => i                        if i > 3 then break
   output(i)                         output(i)



In the example on the left, the values 2 and 3 for i are displayed but
then the => does not allow control to reach the call to
outputoutputOutputForm again. The loop will not terminate until you run
out of space or interrupt the execution. The variable i will continue to
be incremented because the => only means to leave the block, not the
loop.

In the example on the right, upon reaching 4, the break will be
executed, and both the block and the loop will terminate. This is one of
the reasons why both => and break are provided. Using a while clause
(see below) with the => while lets you simulate the action of break.





5.4.5 More Examples of break
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here we give four examples of repeat loops that terminate when a value
exceeds a given bound.

First, initialize i as the loop counter.


.. spadInput
::

	i := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



Here is the first loop. When the square of i exceeds 100, the loop
terminates.


.. spadVerbatim

::

 repeat
   i := i + 1
   if i^2 > 100 then break




.. spadType

:sub:`Type: Void`



Upon completion, i should have the value 11.


.. spadInput
::

	i


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 11   |
+------+




.. spadType

:sub:`Type: NonNegativeInteger`



Do the same thing except use => instead an if-then expression.


.. spadInput
::

	i := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`




.. spadVerbatim

::

 repeat
   i := i + 1
   i^2 > 100 => break




.. spadType

:sub:`Type: Void`




.. spadInput
::

	i


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 11   |
+------+




.. spadType

:sub:`Type: NonNegativeInteger`



As a third example, we use a simple loop to compute n!.


.. spadInput
::

	(n, i, f) := (100, 1, 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Use i as the iteration variable and f to compute the factorial.


.. spadVerbatim

::

 repeat
   if i > n then break
   f := f * i
   i := i + 1




.. spadType

:sub:`Type: Void`



Look at the value of f.


.. spadInput
::

	f


.. spadMathAnswer
.. spadVerbatim

::

  93326215443944152681699238856266700490715968264381621468_
  59296389521759999322991560894146397615651828625369792082_
  7223758251185210916864000000000000000000000000




.. spadType

:sub:`Type: PositiveInteger`



Finally, we show an example of nested loops. First define a four by four
matrix.


.. spadInput
::

	m := matrix [ [21,37,53,14], [8,-24,22,-16], [2,10,15,14],
[26,33,55,-13] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| [213753148-2422-162101514263355-13]   |
+---------------------------------------+




.. spadType

:sub:`Type: Matrix Integer`



Next, set row counter r and column counter c to 1. Note: if we were
writing a function, these would all be local variables rather than
global workspace variables.


.. spadInput
::

	(r, c) := (1, 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Also, let lastrow and lastcol be the final row and column index.


.. spadInput
::

	(lastrow, lastcol) := (nrows(m), ncols(m))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Scan the rows looking for the first negative element. We remark that you
can reformulate this example in a better, more concise form by using a
for clause with repeat. See
`ugLangLoopsForIn <section-5.4.html#ugLangLoopsForIn>`__ for more
information.


.. spadVerbatim

::

 repeat
   if r > lastrow then break
   c := 1
   repeat
     if c > lastcol then break
     if elt(m,r,c) < 0 then
       output [r, c, elt(m,r,c)]
       r := lastrow
       break     -- don't look any further
     c := c + 1
   r := r + 1
  
    [2,2,- 24]




.. spadType

:sub:`Type: Void`







5.4.6 iterate in Loops
~~~~~~~~~~~~~~~~~~~~~~

FriCAS provides an iterate expression that iterate skips over the
remainder of a loop body and starts the next loop iteration.

We first initialize a counter.


.. spadInput
::

	i := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



Display the even integers from 2 to 5.


.. spadVerbatim

::

 repeat
   i := i + 1
   if i > 5 then break
   if odd?(i) then iterate
   output(i)
  
    2
    4




.. spadType

:sub:`Type: Void`







5.4.7 while Loops
~~~~~~~~~~~~~~~~~

The repeat in a loop can be modified by adding one or more while
clauses. while Each clause contains a predicate immediately following
the while keyword. The predicate is tested before the evaluation of the
body of the loop. The loop body is evaluated whenever the predicates in
a while clause are all true.





The syntax for a simple loop using while is



while predicate repeat loopBody



| The predicate is evaluated before loopBody is evaluated. A while loop
terminates immediately when predicate evaluates to false or when a break
or return expression is evaluated in loopBody. The value returned by the
loop is the unique value of Void.





Here is a simple example of using while in a loop. We first initialize
the counter.


.. spadInput
::

	i := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



| The steps involved in computing this example are
|  (1) set i to 1,
|  (2) test the condition i<1 and determine that it is not true, and
|  (3) do not evaluate the loop body and therefore do not display
"hello".


.. spadVerbatim

::

 while i < 1 repeat
   output "hello"
   i := i + 1




.. spadType

:sub:`Type: Void`



If you have multiple predicates to be tested use the logical and
operation to separate them. FriCAS evaluates these predicates from left
to right.


.. spadInput
::

	(x, y) := (1, 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadVerbatim

::

 while x < 4 and y < 10 repeat
   output [x,y]
   x := x + 1
   y := y + 2
  
    [1,1]
    [2,3]
    [3,5]




.. spadType

:sub:`Type: Void`



A break expression can be included in a loop body to terminate a loop
even if the predicate in any while clauses are not false.


.. spadInput
::

	(x, y) := (1, 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



This loop has multiple while clauses and the loop terminates before any
one of their conditions evaluates to false.


.. spadVerbatim

::

 while x < 4 while y < 10 repeat
   if x + y > 7 then break
   output [x,y]
   x := x + 1
   y := y + 2
  
    [1,1]
    [2,3]




.. spadType

:sub:`Type: Void`



Here's a different version of the nested loops that looked for the first
negative element in a matrix.


.. spadInput
::

	m := matrix [ [21,37,53,14], [8,-24,22,-16], [2,10,15,14],
[26,33,55,-13] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| [213753148-2422-162101514263355-13]   |
+---------------------------------------+




.. spadType

:sub:`Type: Matrix Integer`



Initialized the row index to 1 and get the number of rows and columns.
If we were writing a function, these would all be local variables.


.. spadInput
::

	r := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	(lastrow, lastcol) := (nrows(m), ncols(m))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Scan the rows looking for the first negative element.


.. spadVerbatim

::

 while r <= lastrow repeat
   c := 1  -- index of first column
   while c <= lastcol repeat
     if elt(m,r,c) < 0 then
       output [r, c, elt(m,r,c)]
       r := lastrow
       break     -- don't look any further
     c := c + 1
   r := r + 1
  
    [2,2,- 24]




.. spadType

:sub:`Type: Void`







5.4.8 for Loops
~~~~~~~~~~~~~~~

FriCAS provides the for for and in  in keywords in repeat loops,
allowing you to iterate across all iteration elements of a list, or to
have a variable take on integral values from a lower bound to an upper
bound. We shall refer to these modifying clauses of repeat loops as for
clauses. These clauses can be present in addition to while clauses. As
with all other types of repeat loops, break can break be used to
prematurely terminate the evaluation of the loop.





The syntax for a simple loop using for is



for iterator repeat loopBody



The iterator has several forms. Each form has an end test which is
evaluated before loopBody is evaluated. A for loop terminates
immediately when the end test succeeds (evaluates to true) or when a
break or return expression is evaluated in loopBody. The value returned
by the loop is the unique value of Void.\\ 









5.4.9 for i in n..m repeat
~~~~~~~~~~~~~~~~~~~~~~~~~~

If for for is followed by a variable name, the in  in keyword and then
an integer segment of the form n..m, segment the end test for this loop
is the predicate i>m. The body of the loop is evaluated m-n+1 times if
this number is greater than 0. If this number is less than or equal to
0, the loop body is not evaluated at all.

The variable i has the value n,n+1,...,m for successive iterations of
the loop body.The loop variable is a local variable within the loop
body: its value is not available outside the loop body and its value and
type within the loop body completely mask any outer definition of a
variable with the same name.

This loop prints the values of 103, 113, and 123:


.. spadInput
::

	for i in 10..12 repeat output(i^3)


.. spadMathAnswer
.. spadVerbatim

::

    1000
    1331
    1728




.. spadType

:sub:`Type: Void`



Here is a sample list.


.. spadInput
::

	a := [1,2,3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1,2,3]   |
+-----------+




.. spadType

:sub:`Type: List PositiveInteger`



Iterate across this list, using . to access the elements of a list and
the ``#`` operation to count its elements.


.. spadInput
::

	for i in 1.. #a repeat output(a.i)


.. spadMathAnswer
.. spadVerbatim

::

    1
    2
    3




.. spadType

:sub:`Type: Void`



This type of iteration is applicable to anything that uses .. You can
also use it with functions that use indices to extract elements.

Define m to be a matrix.


.. spadInput
::

	m := matrix [ [1,2],[4,3],[9,0] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [124390]   |
+------------+




.. spadType

:sub:`Type: Matrix Integer`



Display the rows of m.


.. spadInput
::

	for i in 1..nrows(m) repeat output row(m,i)


.. spadMathAnswer
.. spadVerbatim

::

    [1,2]
    [4,3]
    [9,0]




.. spadType

:sub:`Type: Void`



You can use iterate with for-loops.iterate

Display the even integers in a segment.


.. spadVerbatim

::

 for i in 1..5 repeat
   if odd?(i) then iterate
   output(i)
  
    2
    4




.. spadType

:sub:`Type: Void`



See section `SegmentXmpPage <section-9.69.html#SegmentXmpPage>`__ for
more information about segments.





5.4.10 for i in n..m by s repeat
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, the difference between values taken on by a variable in
loops such as for i in n..m repeat ... is 1. It is possible to supply
another, possibly negative, step value by using the by by keyword along
with for and in . Like the upper and lower bounds, the step value
following the by keyword must be an integer. Note that the loop for i in
1..2 by 0 repeat output(i) will not terminate by itself, as the step
value does not change the index from its initial value of 1.

This expression displays the odd integers between two bounds.


.. spadInput
::

	for i in 1..5 by 2 repeat output(i)


.. spadMathAnswer
.. spadVerbatim

::

    1
    3
    5




.. spadType

:sub:`Type: Void`



Use this to display the numbers in reverse order.


.. spadInput
::

	for i in 5..1 by -2 repeat output(i)


.. spadMathAnswer
.. spadVerbatim

::

    5
    3
    1




.. spadType

:sub:`Type: Void`







5.4.11 for i in n.. repeat
~~~~~~~~~~~~~~~~~~~~~~~~~~

If the value after the .. is omitted, the loop has no end test. A
potentially infinite loop is thus created. The variable is given the
successive values n,n+1,n+2,... and the loop is terminated only if a
break or return expression is evaluated in the loop body. However you
may also add some other modifying clause on the repeat (for example, a
while clause) to stop the loop.

This loop displays the integers greater than or equal to 15 and less
than the first prime greater than 15.


.. spadInput
::

	for i in 15.. while not prime?(i) repeat output(i)


.. spadMathAnswer
.. spadVerbatim

::

    15
    16




.. spadType

:sub:`Type: Void`







5.4.12 for x in l repeat
~~~~~~~~~~~~~~~~~~~~~~~~

Another variant of the for loop has the form:



for x in  list repeat loopBody



This form is used when you want to iterate directly over the elements of
a list. In this form of the for loop, the variable x takes on the value
of each successive element in l. The end test is most simply stated in
English: are there no more x in l?

If l is this list,


.. spadInput
::

	l := [0,-5,3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [0,-5,3]   |
+------------+




.. spadType

:sub:`Type: List Integer`



display all elements of l, one per line.


.. spadInput
::

	for x in l repeat output(x)


.. spadMathAnswer
.. spadVerbatim

::

    0
    - 5
    3




.. spadType

:sub:`Type: Void`



Since the list constructing expression expand[n..m] creates the list
[n,n+1,...,m]. Note that this list is empty if n>m. You might be tempted
to think that the loops


.. spadVerbatim

::

 for i in n..m repeat output(i)



and


.. spadVerbatim

::

 for x in expand [n..m] repeat output(x)



are equivalent. The second form first creates the list expand[n..m] (no
matter how large it might be) and then does the iteration. The first
form potentially runs in much less space, as the index variable i is
simply incremented once per loop and the list is not actually created.
Using the first form is much more efficient.

Of course, sometimes you really want to iterate across a specific list.
This displays each of the factors of 2400000.


.. spadInput
::

	for f in factors(factor(2400000)) repeat output(f)


.. spadMathAnswer
.. spadVerbatim

::

    [factor= 2,exponent= 8]
    [factor= 3,exponent= 1]
    [factor= 5,exponent= 5]




.. spadType

:sub:`Type: Void`







5.4.13 Such that Predicates
~~~~~~~~~~~~~~~~~~~~~~~~~~~

A for loop can be followed by a ``|`` and then a predicate. The
predicate qualifies the use of the values from the iterator following
the for. Think of the vertical bar ``|`` as the phrase such that.

This loop expression prints out the integers n in the given segment such
that n is odd.


.. spadInput
::

	for n in 0..4 | odd? n repeat output n


.. spadMathAnswer
.. spadVerbatim

::

    1
    3




.. spadType

:sub:`Type: Void`







A for loop can also be written foriterator|predicaterepeatloopBody

which is equivalent to:
for iterator repeat if predicate then loopBody else iterate





The predicate need not refer only to the variable in the for clause: any
variable in an outer scope can be part of the predicate.

In this example, the predicate on the inner for loop uses i from the
outer loop and the j from the for iteration:nested clause that it
directly modifies.


.. spadVerbatim

::

 for i in 1..50 repeat
   for j in 1..50 | factorial(i+j) < 25 repeat
     output [i,j]
  
    [1,1]
    [1,2]
    [1,3]
    [2,1]
    [2,2]
    [3,1]




.. spadType

:sub:`Type: Void`







5.4.14 Parallel Iteration
~~~~~~~~~~~~~~~~~~~~~~~~~

The last example of the previous section
`ugLangLoopsForInPred <section-5.4.html#ugLangLoopsForInPred>`__ gives
an example of nested iteration: a loop is contained iteration:nested in
another loop. iteration:parallel Sometimes you want to iterate across
two lists in parallel, or perhaps you want to traverse a list while
incrementing a variable.





| The general syntax of a repeat loop is
iterator1iterator2…iteratorN repeat loopBody where each iterator is
either a for or a while clause. The loop terminates immediately when the
end test of any iterator succeeds or when a break or return expression
is evaluated in loopBody. The value returned by the loop is the unique
value of Void.





Here we write a loop to iterate across two lists, computing the sum of
the pairwise product of elements. Here is the first list.


.. spadInput
::

	l := [1,3,5,7]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [1,3,5,7]   |
+-------------+




.. spadType

:sub:`Type: List PositiveInteger`



And the second.


.. spadInput
::

	m := [100,200]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [100,200]   |
+-------------+




.. spadType

:sub:`Type: List PositiveInteger`



The initial value of the sum counter.


.. spadInput
::

	sum := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



The last two elements of l are not used in the calculation because m has
two fewer elements than l.


.. spadVerbatim

::

 for x in l for y in m repeat
     sum := sum + x*y




.. spadType

:sub:`Type: Void`



Display the dot product.


.. spadInput
::

	sum


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 700   |
+-------+




.. spadType

:sub:`Type: NonNegativeInteger`



Next, we write a loop to compute the sum of the products of the loop
elements with their positions in the loop.


.. spadInput
::

	l := [2,3,5,7,11,13,17,19,23,29,31,37]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [2,3,5,7,11,13,17,19,23,29,31,37]   |
+-------------------------------------+




.. spadType

:sub:`Type: List PositiveInteger`



The initial sum.


.. spadInput
::

	sum := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



Here looping stops when the list l is exhausted, even though the
foriin0.. specifies no terminating condition.


.. spadInput
::

	for i in 0.. for x in l repeat sum := i * x


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Display this weighted sum.


.. spadInput
::

	sum


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 407   |
+-------+




.. spadType

:sub:`Type: NonNegativeInteger`



When ``|`` is used to qualify any of the for clauses in a parallel
iteration, the variables in the predicates can be from an outer scope or
from a for clause in or to the left of a modified clause.

This is correct:


.. spadVerbatim

::

 for i in 1..10 repeat
   for j in 200..300 | odd? (i+j) repeat
     output [i,j]



This is not correct since the variable j has not been defined outside
the inner loop.


.. spadVerbatim

::

 for i in 1..10 | odd? (i+j) repeat  -- wrong, j not defined
   for j in 200..300 repeat
     output [i,j]







5.4.15 Mixing Loop Modifiers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example shows that it is possible to mix several of the loop:mixing
modifiers forms of repeat modifying clauses on a loop.


.. spadVerbatim

::

 for i in 1..10
     for j in 151..160 | odd? j
       while i + j < 160 repeat
         output [i,j]
  
    [1,151]
    [3,153]




.. spadType

:sub:`Type: Void`



Here are useful rules for composing loop expressions:

#. while predicates can only refer to variables that are global (or in
   an outer scope) or that are defined in for clauses to the left of the
   predicate.
#. A such that predicate (something following ``|``) must directly
   follow a for clause and can only refer to variables that are global
   (or in an outer scope) or defined in the modified for clause or any
   for clause to the left.





