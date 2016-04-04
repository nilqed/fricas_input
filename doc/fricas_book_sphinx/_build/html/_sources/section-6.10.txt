.. status: ok



6.10 Compiling vs. Interpreting
-------------------------------

When possible, FriCAS completely determines the type of every object in
a function, then translates the function definition to Common Lisp or to
machine code (see the next section). This translation, function:compiler
called compilation, happens the first time you call the function and
results in a computational delay. Subsequent function calls with the
same argument types use the compiled version of the code without delay.

If FriCAS cannot determine the type of everything, the function may
still be executed function:interpretation but interpret-code mode in
interpret-code mode: each statement in the function is analyzed and
executed as the control flow indicates. This process is slower than
executing a compiled function, but it allows the execution of code that
may involve objects whose types change.





If FriCAS decides that it cannot compile the code, it issues a message
stating the problem and then the following message:



 We will attempt to step through and interpret the code.



| This is not a time to panic. panic:avoiding Rather, it just means that
what you gave to FriCAS is somehow ambiguous: either it is not specific
enough to be analyzed completely, or it is beyond FriCAS's present
interactive compilation abilities.





This function runs in interpret-code mode, but it does not compile.


.. spadVerbatim

::

 varPolys(vars) ==
   for var in vars repeat
     output(1 :: UnivariatePolynomial(var,Integer))




.. spadType

:sub:`Type: Void`



For vars equal to ['x,'y,'z], this function displays 1 three times.


.. spadInput
::

	varPolys ['x,'y,'z]


.. spadMathAnswer
.. spadVerbatim

::

 Cannot compile conversion for types involving local variables. 
    In particular, could not compile the expression involving :: 
    UnivariatePolynomial(var,Integer) 
  AXIOM will attempt to step through and interpret the code.
  1
  1
  1




.. spadType

:sub:`Type: Void`



The type of the argument to output changes in each iteration, so FriCAS
cannot compile the function. In this case, even the inner loop by itself
would have a problem:


.. spadVerbatim

::

 for var in ['x,'y,'z] repeat
   output(1 :: UnivariatePolynomial(var,Integer))




.. spadVerbatim

::

 Cannot compile conversion for types involving local variables. 
    In particular, could not compile the expression involving :: 
    UnivariatePolynomial(var,Integer) 
  AXIOM will attempt to step through and interpret the code.
  1
  1
  1




.. spadType

:sub:`Type: Void`



Sometimes you can help a function to compile by using an extra
conversion or by using pretend. pretend See
`ugTypesSubdomains <section-2.8.html#ugTypesSubdomains>`__ for details.

When a function is compilable, you have the choice of whether it is
compiled to Common Lisp and then interpreted by the Common Lisp
interpreter or then further compiled from Common Lisp to machine code.
machine code The option is controlled via )set functions compile. set
function compile Issue )set functions compile on to compile all the way
to machine code. With the default setting )set functions compile off,
FriCAS has its Common Lisp code interpreted because the overhead of
further compilation is larger than the run-time of most of the functions
our users have defined. You may find that selectively turning this
option on and off will performance give you the best performance in your
particular application. For example, if you are writing functions for
graphics applications where hundreds of points are being computed, it is
almost certainly true that you will get the best performance by issuing
)set functions compile on.



