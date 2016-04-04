.. status: ok


9.8 Character
-------------

The members of the domain Character are values representing letters,
numerals and other text elements. For more information on related
topics, see
`CharacterClassXmpPage <section-9.9.html#CharacterClassXmpPage>`__ and
`StringXmpPage <section-9.77.html#StringXmpPage>`__ .

Characters can be obtained using String notation.


.. spadInput
::

	chars := [char "a", char "A", char "X", char "8", char "+"]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [a,A,X,8,+]   |
+---------------+




.. spadType

:sub:`Type: List Character`



Certain characters are available by name. This is the blank character.


.. spadInput
::

	space()


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadType

:sub:`Type: Character`



This is the quote that is used in strings.


.. spadInput
::

	quote()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| "   |
+-----+




.. spadType

:sub:`Type: Character`



This is the escape character that allows quotes and other characters
within strings.


.. spadInput
::

	escape()


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| _   |
+------+




.. spadType

:sub:`Type: Character`



Characters are represented as integers in a machine-dependent way. The
integer value can be obtained using the ordordCharacter operation. It is
always true that char(ord c) = c and ord(char i) = i, provided that i is
in the range 0..size()$Character-1.


.. spadInput
::

	[ord c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [97,65,88,56,43]   |
+--------------------+




.. spadType

:sub:`Type: List Integer`



The lowerCaselowerCaseCharacter operation converts an upper case letter
to the corresponding lower case letter. If the argument is not an upper
case letter, then it is returned unchanged.


.. spadInput
::

	[upperCase c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [A,A,X,8,+]   |
+---------------+




.. spadType

:sub:`Type: List Character`



Likewise, the upperCaseupperCaseCharacter operation converts lower case
letters to upper case.


.. spadInput
::

	[lowerCase c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [a,a,x,8,+]   |
+---------------+




.. spadType

:sub:`Type: List Character`



A number of tests are available to determine whether characters belong
to certain families.


.. spadInput
::

	[alphabetic? c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [true,true,true,false,false]   |
+--------------------------------+




.. spadType

:sub:`Type: List Boolean`




.. spadInput
::

	[upperCase? c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [false,true,true,false,false]   |
+---------------------------------+




.. spadType

:sub:`Type: List Boolean`




.. spadInput
::

	[lowerCase? c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [true,false,false,false,false]   |
+----------------------------------+




.. spadType

:sub:`Type: List Boolean`




.. spadInput
::

	[digit? c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [false,false,false,true,false]   |
+----------------------------------+




.. spadType

:sub:`Type: List Boolean`




.. spadInput
::

	[hexDigit? c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [true,true,false,true,false]   |
+--------------------------------+




.. spadType

:sub:`Type: List Boolean`




.. spadInput
::

	[alphanumeric? c for c in chars]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [true,true,true,true,false]   |
+-------------------------------+




.. spadType

:sub:`Type: List Boolean`





