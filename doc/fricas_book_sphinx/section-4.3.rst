.. status: ok



4.3 Common Features of Using Output Formats
-------------------------------------------

In this section we discuss how to start and stop the display output
formats:common features of the different output formats and how to send
the output to the screen or to a file. file:sending output to To fix
ideas, we use FORTRAN output format for most of the examples.

You can use the )set output system output formats:starting command to
output formats:stopping toggle or redirect the different kinds of
output. set output The name of the kind of output follows output in the
command. The names are

+-----------+------------------------------------------------------+
| fortran   | for FORTRAN output.                                  |
+-----------+------------------------------------------------------+
| algebra   | for monospace two-dimensional mathematical output.   |
+-----------+------------------------------------------------------+
| tex       | for TeX output.                                      |
+-----------+------------------------------------------------------+
| script    | for IBM Script Formula Format output.                |
+-----------+------------------------------------------------------+

For example, issue )set output fortran on to turn on FORTRAN format and
issue )set output fortran off to turn it off. By default, algebra is on
and all others are off. set output fortran When output is started, it is
sent to the screen. To send the output to a file, give the file name
without output formats:sending to file directory or extension. FriCAS
appends a file extension depending on the kind of output being produced.

Issue this to redirect FORTRAN output to, for example, the file
linalg.sfort.


.. spadInput
::

	)set output fortran linalg


.. spadMathAnswer
.. spadVerbatim

::

    FORTRAN output will be written to file linalg.sfort .



You must also turn on the creation of FORTRAN output. The above just
says where it goes if it is created.


.. spadInput
::

	)set output fortran on


.. spadMathAnswer
In what directory is this output placed? It goes into the directory from
which you started FriCAS, or if you have used the )cd system command,
the one that you specified with )cd. cd You should use )cd before you
send the output to the file.

You can always direct output back to the screen by issuing this. output
formats:sending to screen


.. spadInput
::

	)set output fortran console


.. spadMathAnswer
Let's make sure FORTRAN formatting is off so that nothing we do from now
on produces FORTRAN output.


.. spadInput
::

	)set output fortran off


.. spadMathAnswer
We also delete the demonstrated output file we created.


.. spadInput
::

	)system rm linalg.sfort


.. spadMathAnswer
You can abbreviate the words on, off, and console to the minimal number
of characters needed to distinguish them. Because of this, you cannot
send output to files called on.sfort, off.sfort, of.sfort,
console.sfort, consol.sfort and so on.

The width of the output on the page is set by output formats:line length
)set output length for all formats except FORTRAN. set output length Use
)set fortran fortlength to change the FORTRAN line length from its
default value of 72.



