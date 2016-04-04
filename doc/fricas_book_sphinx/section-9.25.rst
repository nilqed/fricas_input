.. status: ok


9.25 FileName
-------------

The FileName domain provides an interface to the computer's file system.
Functions are provided to manipulate file names and to test properties
of files. The simplest way to use file names in the FriCAS interpreter
is to rely on conversion to and from strings. The syntax of these
strings depends on the operating system.


.. spadInput
::

	fn: FileName


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



On Linux, this is a proper file syntax:


.. spadInput
::

	fn := "/tmp/fname.input"


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| "/tmp/fname.input"   |
+----------------------+




.. spadType

:sub:`Type: FileName`



Although it is very convenient to be able to use string notation for
file names in the interpreter, it is desirable to have a portable way of
creating and manipulating file names from within programs.

A measure of portability is obtained by considering a file name to
consist of three parts: the directory, the name, and the extension.


.. spadInput
::

	directory fn


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| "/tmp"   |
+----------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	name fn


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "fname"   |
+-----------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	extension fn


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| "input"   |
+-----------+




.. spadType

:sub:`Type: String`



The meaning of these three parts depends on the operating system. For
example, on CMS the file SPADPROF INPUT M would have directory M, name
SPADPROF and extension INPUT. It is possible to create a filename from
its parts.


.. spadInput
::

	fn := filename("/u/smwatt/work", "fname", "input")


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| "/u/smwatt/work/fname.input"   |
+--------------------------------+




.. spadType

:sub:`Type: FileName`



When writing programs, it is helpful to refer to directories via
variables.


.. spadInput
::

	objdir := "/tmp"


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| "/tmp"   |
+----------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	fn := filename(objdir, "table", "spad")


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| "/tmp/table.spad"   |
+---------------------+




.. spadType

:sub:`Type: FileName`



If the directory or the extension is given as an empty string, then a
default is used. On AIX, the defaults are the current directory and no
extension.


.. spadInput
::

	fn := filename("", "letter", "")


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "letter"   |
+------------+




.. spadType

:sub:`Type: FileName`



Three tests provide information about names in the file system.

The exists?exists?FileName operation tests whether the named file
exists.


.. spadInput
::

	exists? "/etc/passwd"


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



The operation readable?readable?FileName tells whether the named file
can be read. If the file does not exist, then it cannot be read.


.. spadInput
::

	readable? "/etc/passwd"


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

	readable? "/etc/security/passwd"


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	readable? "/ect/passwd"


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Likewise, the operation writable?writable?FileName tells whether the
named file can be written. If the file does not exist, the test is
determined by the properties of the directory.


.. spadInput
::

	writable? "/etc/passwd"


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	writable? "/dev/null"


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

	writable? "/etc/DoesNotExist"


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	writable? "/tmp/DoesNotExist"


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



The newnewFileName operation constructs the name of a new writable file.
The argument sequence is the same as for filenamefilenameFileName,
except that the name part is actually a prefix for a constructed unique
name.

The resulting file is in the specified directory with the given
extension, and the same defaults are used.


.. spadInput
::

	fn := new(objdir, "xxx", "yy")


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| "/tmp/xxx82404.yy"   |
+----------------------+




.. spadType

:sub:`Type: FileName`





