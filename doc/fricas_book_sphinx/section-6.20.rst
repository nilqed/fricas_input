.. status: ok



6.20 Example: Testing for Palindromes
-------------------------------------

In this section we define a function pal? that tests whether its
palindrome argument is a palindrome, that is, something that reads the
same backwards and forwards. For example, the string \`\`Madam I'm
Adam'' is a palindrome (excluding blanks and punctuation) and so is the
number 123454321. The definition works for any datatype that has n
components that are accessed by the indices 1…n.

Here is the definition for pal?. It is simply a call to an auxiliary
function called palAux?. We are following the convention of ending a
function's name with ? if the function returns a Boolean value.


.. spadInput
::

	pal? s == palAux?(s,1,#s)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Here is palAux?. It works by comparing elements that are equidistant
from the start and end of the object.


.. spadVerbatim

::

 palAux?(s,i,j) ==
   j > i =>
     (s.i = s.j) and palAux?(s,i+1,i-1)
   true




.. spadType

:sub:`Type: Void`



Try pal? on some examples. First, a string.


.. spadInput
::

	pal? "Oxford"


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function palAux? with type (String,Integer,Integer) -> 
       Boolean 
    Compiling function pal? with type String -> Boolean 




.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



A list of polynomials.


.. spadInput
::

	pal? [4,a,x-1,0,x-1,a,4]


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function palAux? with type (List Polynomial Integer,
       Integer,Integer) -> Boolean 
    Compiling function pal? with type List Polynomial Integer -> Boolean




.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



A list of integers from the example in the last section.


.. spadInput
::

	pal? [1,6,15,20,15,6,1]


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function palAux? with type (List PositiveInteger,Integer,
       Integer) -> Boolean 
    Compiling function pal? with type List PositiveInteger -> Boolean 




.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



To use pal? on an integer, first convert it to a string.


.. spadInput
::

	pal?(1441::String)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Compute an infinite stream of decimal numbers, each of which is an
obvious palindrome.


.. spadInput
::

	ones := [reduce(+,[10^j for j in 0..i]) for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------+
| [11,111,1111,11111,111111,1111111,..11111111,111111111,1111111111,11111111111,…]   |
+------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream PositiveInteger`




.. spadInput
::

	)set streams calculate 9


.. spadMathAnswer
How about their squares?


.. spadInput
::

	squares := [x^2 for x in ones]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------+
| [121,12321,1234321,123454321,12345654321,1234567654321,.123456787654321,12345678987654321,1234567900987654321,.123456790120987654321,…]   |
+-------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream PositiveInteger`



Well, let's test them all.


.. spadInput
::

	[pal?(x::String) for x in squares]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| [true,true,true,true,true,true,true,true,true,true,…]   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Stream Boolean`




.. spadInput
::

	)set streams calculate 7


.. spadMathAnswer
