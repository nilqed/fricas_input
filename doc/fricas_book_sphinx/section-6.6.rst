.. status: ok


6.6 Declared vs. Undeclared Functions
-------------------------------------

If you declare the type of a function, you can apply it to any data that
can be converted to the source type of the function.

Define f with type {\\sf Integer → Integer}.


.. spadInput
::

	f(x: Integer): Integer == x + 1


.. spadMathAnswer
.. spadVerbatim

::

    Function declaration f : Integer -> Integer has been added to 
       workspace.




.. spadType

:sub:`Type: Void`



The function f can be applied to integers, ...


.. spadInput
::

	f 9


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f with type Integer -> Integer 




.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



and to values that convert to integers, ...


.. spadInput
::

	f(-2.0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: Integer`



but not to values that cannot be converted to integers.


.. spadInput
::

	f(2/3)


.. spadMathAnswer
.. spadVerbatim

::

    Conversion failed in the compiled user function f .
  
    Cannot convert from type Fraction Integer to Integer for value
    2
    -
    3



To make the function over a wide range of types, do not declare its
type. Give the same definition with no declaration.


.. spadInput
::

	g x == x + 1


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



If x+1 makes sense, you can apply g to x.


.. spadInput
::

	g 9


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function g with type PositiveInteger -> PositiveInteger 




.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



A version of g with different argument types get compiled for each new
kind of argument used.


.. spadInput
::

	g(2/3)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function g with type Fraction Integer -> Fraction Integer 




.. spadMathOutput
.. math::

+------+
| 53   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



Here x+1 for x="axiom" makes no sense.


.. spadInput
::

	g("axiom")


.. spadMathAnswer
.. spadVerbatim

::

    There are 11 exposed and 5 unexposed library operations named + 
       having 2 argument(s) but none was determined to be applicable. 
       Use HyperDoc Browse, or issue
                                 )display op +
       to learn more about the available operations. Perhaps 
       package-calling the operation or using coercions on the arguments
       will allow you to apply the operation.
    Cannot find a definition or applicable library operation named + 
       with argument type(s) 
                                    String
                                PositiveInteger
       
       Perhaps you should use "@" to indicate the required return type, 
       or "$" to specify which version of the function you need.
    AXIOM will attempt to step through and interpret the code.
    There are 11 exposed and 5 unexposed library operations named + 
       having 2 argument(s) but none was determined to be applicable. 
       Use HyperDoc Browse, or issue
                                 )display op +
       to learn more about the available operations. Perhaps 
       package-calling the operation or using coercions on the arguments
       will allow you to apply the operation.
  
    Cannot find a definition or applicable library operation named + 
       with argument type(s) 
                                    String
                                PositiveInteger
       
       Perhaps you should use "@" to indicate the required return type, 
       or "$" to specify which version of the function you need.



As you will see in Chapter
`ugCategories <section-12.0.html#ugCategories>`__ FriCAS has a formal
idea of categories for what makes sense.



