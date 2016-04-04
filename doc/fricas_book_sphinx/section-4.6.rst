.. status: ok


4.6 IBM Script Formula Format
-----------------------------

FriCAS can output formats:IBM Script Formula Format produce IBM Script
Formula Format output for your IBM Script Formula Format expressions.

To turn IBM Script Formula Format on, issue this. set output script


.. spadInput
::

	)set output script on


.. spadMathAnswer
Here is an example of its output.


.. spadVerbatim

::

 matrix [ [i*x^i + j*%i*y^j for i in 1..2] for j in 3..4]
 .eq set blank @
 :df.
 <left lb < < < <3 @@ %i @@ <y sup 3> >+x> here < <3 @@ %i @@
 <y sup 3> >+<2 @@ <x sup 2> > > > habove < < <4 @@ %i @@
 <y sup 4> >+x> here < <4 @@ %i @@ <y sup 4> >+<2 @@
 <x up 2> > > > > right rb>
 :edf.



To turn IBM Script Formula Format output formatting off, issue this.


.. spadInput
::

	)set output script off


.. spadMathAnswer
