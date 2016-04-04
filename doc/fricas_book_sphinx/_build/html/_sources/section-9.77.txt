.. status: ok


9.77 String
-----------

The type String provides character strings. Character strings provide
all the operations for a one-dimensional array of characters, plus
additional operations for manipulating text. For more information on
related topics, see
`CharacterXmpPage <section-9.8.html#CharacterXmpPage>`__ and
`CharacterClassXmpPage <section-9.9.html#CharacterClassXmpPage>`__ .
You can also issue the system command )show String to display the full
list of operations defined by String.

String values can be created using double quotes.


.. spadInput
::

	hello := "Hello AXIOM!"


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| "HelloAXIOM!"   |
+-----------------+




.. spadType

:sub:`Type: String`



Note, however, that double quotes and underscores must be preceded by an
extra underscore.


.. spadInput
::

	said := "Jane said, _"Look!_""


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| "Janesaid,"Look!""   |
+----------------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	saw := "She saw exactly one underscore: __."


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| "Shesawexactlyoneunderscore:_."   |
+------------------------------------+




.. spadType

:sub:`Type: String`



It is also possible to use newnewString to create a string of any size
filled with a given character. Since there are many new functions it is
necessary to indicate the desired type.


.. spadInput
::

	gasp: String := new(32, char "x")


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"   |
+--------------------------------------+




.. spadType

:sub:`Type: String`



The length of a string is given by #.


.. spadInput
::

	#gasp


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 32   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Indexing operations allow characters to be extracted or replaced in
strings. For any string s, indices lie in the range 1.. #s.


.. spadInput
::

	hello.2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| e   |
+-----+




.. spadType

:sub:`Type: Character`



Indexing is really just the application of a string to a subscript, so
any application syntax works.


.. spadInput
::

	hello 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| e   |
+-----+




.. spadType

:sub:`Type: Character`




.. spadInput
::

	hello(2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| e   |
+-----+




.. spadType

:sub:`Type: Character`



If it is important not to modify a given string, it should be copied
before any updating operations are used.


.. spadInput
::

	hullo := copy hello


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| "Hello,I'mAXIOM!"   |
+---------------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	hullo.2 := char "u"; [hello, hullo]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| ["Hello,I'mAXIOM!","Hullo,I'mAXIOM!"]   |
+-----------------------------------------+




.. spadType

:sub:`Type: List String`



Operations are provided to split and join strings. The
concatconcatString operation allows several strings to be joined
together.


.. spadInput
::

	saidsaw := concat ["alpha","---","omega"]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| "alpha---omega"   |
+-------------------+




.. spadType

:sub:`Type: String`



There is a version of concatconcatString that works with two strings.


.. spadInput
::

	concat("hello ","goodbye")


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| "hellogoodbye"   |
+------------------+




.. spadType

:sub:`Type: String`



Juxtaposition can also be used to concatenate strings.


.. spadInput
::

	"This " "is " "several " "strings " "concatenated."


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| "Thisisseveralstringsconcatenated."   |
+---------------------------------------+




.. spadType

:sub:`Type: String`



Substrings are obtained by giving an index range.


.. spadInput
::

	hello(1..5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "Hello"   |
+-----------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	hello(8..)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| "I'mAXIOM!"   |
+---------------+




.. spadType

:sub:`Type: String`



A string can be split into several substrings by giving a separation
character or character class.


.. spadInput
::

	split(hello, char " ")


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| ["Hello,","I'm","AXIOM!"]   |
+-----------------------------+




.. spadType

:sub:`Type: List String`




.. spadInput
::

	other := complement alphanumeric();


.. spadMathAnswer
.. spadType

:sub:`Type: CharacterClass`




.. spadInput
::

	split(saidsaw, other)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| ["alpha","omega"]   |
+---------------------+




.. spadType

:sub:`Type: List String`



Unwanted characters can be trimmed from the beginning or end of a string
using the operations trimtrimString, leftTrimleftTrimString and
rightTrimrightTrimString.


.. spadInput
::

	trim(" # # ++ relax ++ # #", char " #")


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| "++relax++"   |
+---------------+




.. spadType

:sub:`Type: String`



Each of these functions takes a string and a second argument to specify
the characters to be discarded.


.. spadInput
::

	trim(" # # ++ relax ++ # #", other)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "relax"   |
+-----------+




.. spadType

:sub:`Type: String`



The second argument can be given either as a single character or as a
character class.


.. spadInput
::

	leftTrim (" # # ++ relax ++ # #", other)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| "relax++ # #"   |
+-----------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	rightTrim(" # # ++ relax ++ # #", other)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| " # #++relax"   |
+-----------------+




.. spadType

:sub:`Type: String`



Strings can be changed to upper case or lower case using the operations
upperCaseupperCaseString, upperCase!upperCase!String,
lowerCaselowerCaseString and lowerCase!lowerCase!String.


.. spadInput
::

	upperCase hello


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| "HELLO,I'MAXIOM!"   |
+---------------------+




.. spadType

:sub:`Type: String`



The versions with the exclamation mark change the original string, while
the others produce a copy.


.. spadInput
::

	lowerCase hello


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| "hello,i'maxiom!"   |
+---------------------+




.. spadType

:sub:`Type: String`



Some basic string matching is provided. The function
prefix?prefix?String tests whether one string is an initial prefix of
another.


.. spadInput
::

	prefix?("He", "Hello")


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

	prefix?("Her", "Hello")


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



A similar function, suffix?suffix?String, tests for suffixes.


.. spadInput
::

	suffix?("", "Hello")


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

	suffix?("LO", "Hello")


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



The function substring?substring?String tests for a substring given a
starting position.


.. spadInput
::

	substring?("ll", "Hello", 3)


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

	substring?("ll", "Hello", 4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



A number of positionpositionString functions locate things in strings.
If the first argument to position is a string, then position(s,t,i)
finds the location of s as a substring of t starting the search at
position i.


.. spadInput
::

	n := position("nd", "underground", 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	n := position("nd", "underground", n+1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



If s is not found, then 0 is returned (minIndex(s)-1 in IndexedString).


.. spadInput
::

	n := position("nd", "underground", n+1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



To search for a specific character or a member of a character class, a
different first argument is used.


.. spadInput
::

	position(char "d", "underground", 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	position(hexDigit(), "underground", 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`





