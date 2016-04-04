.. status: ok



9.9 CharacterClass
------------------

The CharacterClass domain allows classes of characters to be defined and
manipulated efficiently. Character classes can be created by giving
either a string or a list of characters.


.. spadInput
::

	cl1 := charClass [char "a", char "e", char "i", char "o", char "u", char
"y"]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "aeiouy"   |
+------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	cl2 := charClass "bcdfghjklmnpqrstvwxyz"


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| "bcdfghjklmnpqrstvwxyz"   |
+---------------------------+




.. spadType

:sub:`Type: CharacterClass`



A number of character classes are predefined for convenience.


.. spadInput
::

	digit()


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "0123456789"   |
+----------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	hexDigit()


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| "0123456789ABCDEFabcdef"   |
+----------------------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	upperCase()


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| "ABCDEFGHIJKLMNOPQRSTUVWXYZ"   |
+--------------------------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	lowerCase()


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| "abcdefghijklmnopqrstuvwxyz"   |
+--------------------------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	alphabetic()


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------+
| "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"   |
+----------------------------------------------------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	alphanumeric()


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------+
| "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"   |
+--------------------------------------------------------------------+




.. spadType

:sub:`Type: CharacterClass`



You can quickly test whether a character belongs to a class.


.. spadInput
::

	member?(char "a", cl1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	member?(char "a", cl2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Classes have the usual set operations because the CharacterClass domain
belongs to the category FiniteSetAggregate(Character).


.. spadInput
::

	intersect(cl1, cl2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| "y"   |
+-------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	union(cl1,cl2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| "abcdefghijklmnopqrstuvwxyz"   |
+--------------------------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	difference(cl1,cl2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "aeiou"   |
+-----------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	intersect(complement(cl1),cl2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| "bcdfghjklmnpqrstvwxz"   |
+--------------------------+




.. spadType

:sub:`Type: CharacterClass`



You can modify character classes by adding or removing characters.


.. spadInput
::

	insert!(char "a", cl2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| "abcdfghjklmnpqrstvwxyz"   |
+----------------------------+




.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	remove!(char "b", cl2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| "acdfghjklmnpqrstvwxyz"   |
+---------------------------+




.. spadType

:sub:`Type: CharacterClass`



For more information on related topics, see
`CharacterXmpPage <section-9.8.html#CharacterXmpPage>`__ and
`StringXmpPage <section-9.77.html#StringXmpPage>`__ .



