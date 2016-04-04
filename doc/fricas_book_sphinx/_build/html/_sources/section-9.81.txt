.. status: ok



9.81 TextFile
-------------

The domain TextFile allows FriCAS to read and write character data and
exchange text with other programs. This type behaves in FriCAS much like
a File of strings, with additional operations to cause new lines. We
give an example of how to produce an upper case copy of a file.

This is the file from which we read the text.


.. spadInput
::

	f1: TextFile := open("/etc/group", "input")


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "/etc/group"   |
+----------------+




.. spadType

:sub:`Type: TextFile`



This is the file to which we write the text.


.. spadInput
::

	f2: TextFile := open("/tmp/MOTD", "output")


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| "/tmp/MOTD"   |
+---------------+




.. spadType

:sub:`Type: TextFile`



Entire lines are handled using the readLinereadLineTextFile and
writeLinewriteLineTextFile operations.


.. spadInput
::

	l := readLine! f1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| "root:x:0:root"   |
+-------------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	writeLine!(f2, upperCase l)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| "ROOT:X:0:ROOT"   |
+-------------------+




.. spadType

:sub:`Type: String`



Use the endOfFile?endOfFile?TextFile operation to check if you have
reached the end of the file.


.. spadVerbatim

::

 while not endOfFile? f1 repeat
     s := readLine! f1
     writeLine!(f2, upperCase s)




.. spadType

Void



The file f1 is exhausted and should be closed.


.. spadInput
::

	close! f1


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "/etc/group"   |
+----------------+




.. spadType

:sub:`Type: TextFile`



It is sometimes useful to write lines a bit at a time. The
writewriteTextFile operation allows this.


.. spadInput
::

	write!(f2, "-The-")


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "-The-"   |
+-----------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	write!(f2, "-End-")


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "-End-"   |
+-----------+




.. spadType

:sub:`Type: String`



This ends the line. This is done in a machine-dependent manner.


.. spadInput
::

	writeLine! f2


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| ""   |
+------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	close! f2


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| "/tmp/MOTD"   |
+---------------+




.. spadType

:sub:`Type: TextFile`



Finally, clean up.


.. spadInput
::

	)system rm /tmp/MOTD


.. spadMathAnswer
For more information on related topics, see
`FileXmpPage <section-9.24.html#FileXmpPage>`__ ,
`KeyedAccessFileXmpPage <section-9.38.html#KeyedAccessFileXmpPage>`__ ,
and `LibraryXmpPage <section-9.41.html#LibraryXmpPage>`__ .



