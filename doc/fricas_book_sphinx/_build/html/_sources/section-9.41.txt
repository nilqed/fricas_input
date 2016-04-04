.. status: ok



9.41 Library
------------

The Library domain provides a simple way to store FriCAS values in a
file. This domain is similar to KeyedAccessFile but fewer declarations
are needed and items of different types can be saved together in the
same file.

To create a library, you supply a file name.


.. spadInput
::

	stuff := library "/tmp/Neat.stuff"


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| "/tmp/Neat.stuff"   |
+---------------------+




.. spadType

:sub:`Type: Library`



Now values can be saved by key in the file. The keys should be mnemonic,
just as the field names are for records. They can be given either as
strings or symbols.


.. spadInput
::

	stuff.int := 32^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1024   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	stuff."poly" := x^2 + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x2+1   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	stuff.str := "Hello"


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "Hello"   |
+-----------+




.. spadType

:sub:`Type: String`



You obtain the set of available keys using the keyskeysLibrary
operation.


.. spadInput
::

	keys stuff


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| ["str","poly","int"]   |
+------------------------+




.. spadType

:sub:`Type: List String`



You extract values by giving the desired key in this way.


.. spadInput
::

	stuff.poly


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x2+1   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	stuff("poly")


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x2+1   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`



When the file is no longer needed, you should remove it from the file
system.


.. spadInput
::

	)system rm -rf /tmp/Neat.stuff


.. spadMathAnswer
For more information on related topics, see
`FileXmpPage <section-9.24.html#FileXmpPage>`__ ,
`TextFileXmpPage <section-9.81.html#TextFileXmpPage>`__ , and
`KeyedAccessFileXmpPage <section-9.38.html#KeyedAccessFileXmpPage>`__ .



