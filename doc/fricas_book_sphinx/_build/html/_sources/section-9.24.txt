.. status: ok


9.24 File
---------

The File(S) domain provides a basic interface to read and write values
of type S in files.

Before working with a file, it must be made accessible to FriCAS with
the openopenFile operation.


.. spadInput
::

	ifile:File List Integer:=open("/tmp/jazz1","output")


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "/tmp/jazz1"   |
+----------------+




.. spadType

:sub:`Type: File List Integer`



The openopenFile function arguments are a FileName and a String
specifying the mode. If a full pathname is not specified, the current
default directory is assumed. The mode must be one of input or output.
If it is not specified, input is assumed. Once the file has been opened,
you can read or write data.

The operations readreadFile and writewriteFile are provided.


.. spadInput
::

	write!(ifile, [-1,2,3])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [-1,2,3]   |
+------------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	write!(ifile, [10,-10,0,111])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [10,-10,0,111]   |
+------------------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	write!(ifile, [7])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [7]   |
+-------+




.. spadType

:sub:`Type: List Integer`



You can change from writing to reading (or vice versa) by reopening a
file.


.. spadInput
::

	reopen!(ifile, "input")


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "/tmp/jazz1"   |
+----------------+




.. spadType

:sub:`Type: File List Integer`




.. spadInput
::

	read! ifile


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [-1,2,3]   |
+------------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	read! ifile


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [10,-10,0,111]   |
+------------------+




.. spadType

:sub:`Type: List Integer`



The readreadFile operation can cause an error if one tries to read more
data than is in the file. To guard against this possibility the
readIfCanreadIfCanFile operation should be used.


.. spadInput
::

	readIfCan! ifile


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [7]   |
+-------+




.. spadType

:sub:`Type: Union(List Integer,...)`




.. spadInput
::

	readIfCan! ifile


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



You can find the current mode of the file, and the file's name.


.. spadInput
::

	iomode ifile


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "input"   |
+-----------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	name ifile


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "/tmp/jazz1"   |
+----------------+




.. spadType

:sub:`Type: FileName`



When you are finished with a file, you should close it.


.. spadInput
::

	close! ifile


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| "/tmp/jazz1"   |
+----------------+




.. spadType

:sub:`Type: File List Integer`




.. spadInput
::

	)system rm /tmp/jazz1


.. spadMathAnswer
A limitation of the underlying LISP system is that not all values can be
represented in a file. In particular, delayed values containing compiled
functions cannot be saved.

For more information on related topics, see
`TextFileXmpPage <section-9.81.html#TextFileXmpPage>`__ ,
`KeyedAccessFileXmpPage <section-9.38.html#KeyedAccessFileXmpPage>`__ ,
`LibraryXmpPage <section-9.41.html#LibraryXmpPage>`__ , and
`FileNameXmpPage <section-9.25.html#FileNameXmpPage>`__ .



