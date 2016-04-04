.. status: ok


9.78 StringTable
----------------

This domain provides a table type in which the keys are known to be
strings so special techniques can be used. Other than performance, the
type StringTable(S) should behave exactly the same way as
Table(String,S). See
`TableXmpPage <section-9.18.html#EqTableXmpPage>`__ for general
information about tables.

This creates a new table whose keys are strings.


.. spadInput
::

	t: StringTable(Integer) := table()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| table()   |
+-----------+




.. spadType

:sub:`Type: StringTable Integer`



The value associated with each string key is the number of characters in
the string.


.. spadVerbatim

::

 for s in split("My name is Ian Watt.",char " ")
   repeat
     t.s := #s




.. spadType

Void




.. spadInput
::

	for key in keys t repeat output [key, t.key]


.. spadMathAnswer
.. spadVerbatim

::

    ["Ian",3]
    ["My",2]
    ["Watt.",5]
    ["name",4]
    ["is",2]




.. spadType

Void





