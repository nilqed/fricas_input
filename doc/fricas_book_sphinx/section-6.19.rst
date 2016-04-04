.. status: ok



6.19 Example: A Famous Triangle
-------------------------------

In this example we write some functions that display Pascal's triangle.
Pascal's triangle It demonstrates the use of piece-wise definitions and
some output operations you probably haven't seen before.

To make these output operations available, we have to expose the domain
OutputForm. OutputForm See
`ugTypesExpose <section-2.11.html#ugTypesExpose>`__ for more
information about exposing domains and packages.


.. spadInput
::

	)set expose add constructor OutputForm


.. spadMathAnswer
.. spadVerbatim

::

    OutputForm is now explicitly exposed in frame G82322 



Define the values along the first row and any column i.


.. spadInput
::

	pascal(1,i) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Define the values for when the row and column index i are equal.
Repeating the argument name indicates that the two index values are
equal.


.. spadInput
::

	pascal(n,n) == 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadVerbatim

::

 pascal(i,j | 1 < i and i < j) ==
    pascal(i-1,j-1)+pascal(i,j-1)




.. spadType

:sub:`Type: Void`



Now that we have defined the coefficients in Pascal's triangle, let's
write a couple of one-liners to display it.

First, define a function that gives the n-th row.


.. spadInput
::

	pascalRow(n) == [pascal(i,n) for i in 1..n]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Next, we write the function displayRow to display the row, separating
entries by blanks and centering.


.. spadInput
::

	displayRow(n) == output center blankSeparate pascalRow(n)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Here we have used three output operations. Operation
outputoutputOutputForm displays the printable form of objects on the
screen, centercenterOutputForm centers a printable form in the width of
the screen, and blankSeparateblankSeparateOutputForm takes a list of
nprintable forms and inserts a blank between successive elements.

Look at the result.


.. spadInput
::

	for i in 1..7 repeat displayRow i


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function pascal with type (Integer,Integer) -> 
       PositiveInteger 
    Compiling function pascalRow with type PositiveInteger -> List 
       PositiveInteger 
    Compiling function displayRow with type PositiveInteger -> Void 
                                    1
                                   1 1
                                  1 2 1
                                 1 3 3 1
                                1 4 6 4 1
                              1 5 10 10 5 1
                             1 6 15 20 15 6 1




.. spadType

:sub:`Type: Void`



Being purists, we find this less than satisfactory. Traditionally,
elements of Pascal's triangle are centered between the left and right
elements on the line above.

To fix this misalignment, we go back and redefine pascalRow to right
adjust the entries within the triangle within a width of four
characters.


.. spadInput
::

	pascalRow(n) == [right(pascal(i,n),4) for i in 1..n]


.. spadMathAnswer
.. spadVerbatim

::

    Compiled code for pascalRow has been cleared.
    Compiled code for displayRow has been cleared.
    1 old definition(s) deleted for function or rule pascalRow 




.. spadType

:sub:`Type: Void`



Finally let's look at our purely reformatted triangle.


.. spadInput
::

	for i in 1..7 repeat displayRow i


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function pascalRow with type PositiveInteger -> List 
       OutputForm 
 +++ |*1;pascalRow;1;G82322| redefined
    Compiling function displayRow with type PositiveInteger -> Void 
 +++ |*1;displayRow;1;G82322| redefined
                                      1
                                   1    1
                                 1    2    1
                              1    3    3    1
                            1    4    6    4    1
                         1    5   10   10    5    1
                       1    6   15   20   15    6    1




.. spadType

:sub:`Type: Void`



Unexpose OutputForm so we don't get unexpected results later.


.. spadInput
::

	)set expose drop constructor OutputForm


.. spadMathAnswer
.. spadVerbatim

::

    OutputForm is now explicitly hidden in frame G82322 





