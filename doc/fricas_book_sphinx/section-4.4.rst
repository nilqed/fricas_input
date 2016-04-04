.. status: ok


4.4 Monospace Two-Dimensional Mathematical Format
-------------------------------------------------

This is the default output format for FriCAS. It is usually on when you
start the system. set output algebra output formats:monospace 2D
monospace 2D output format

If it is not, issue this.


.. spadInput
::

	)set output algebra on


.. spadMathAnswer
Since the printed version of this book (as opposed to the HyperDoc
version) shows output produced by the TeX output formatter, let us
temporarily turn off TeX output.


.. spadInput
::

	)set output tex off


.. spadMathAnswer
Here is an example of what it looks like.


.. spadInput
::

	matrix [ [i*x^i + j*%i*y^j for i in 1..2] for j in 3..4]


.. spadMathAnswer
.. spadVerbatim

::

         +     3           3     2+
         |3%i y  + x  3%i y  + 2x |
    (1)  |                        |
         |     4           4     2|
         +4%i y  + x  4%i y  + 2x +




.. spadType

:sub:`Type: Matrix Polynomial Complex Integer`



Issue this to turn off this kind of formatting.


.. spadInput
::

	)set output algebra off


.. spadMathAnswer
Turn TeX output on again.


.. spadInput
::

	)set output tex on


.. spadMathAnswer
The characters used for the matrix brackets above are rather ugly. You
get this character set when you issue character set )set output
characters plain. set output characters This character set should be
used when you are running on a machine that does not support the IBM
extended ASCII character set. If you are running on an IBM workstation,
for example, issue )set output characters default to get better looking
output.



