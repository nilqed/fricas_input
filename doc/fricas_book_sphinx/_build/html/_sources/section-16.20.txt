.. status: ok


16.20 )read
-----------

ugSysCmdread

read

 User Level Required: interpreter

 Command Syntax:





)read [fileName]





)read [fileName] [)quiet] [)ifthere]





 Command Description:

This command is used to read .input files into FriCAS. file:input The
command


.. spadVerbatim

::

 )read matrix.input



will read the contents of the file matrix.input into FriCAS. The .input
file extension is optional. See
`ugInOutIn <section-4.1.html#ugInOutIn>`__ for more information about
.input files.

This command remembers the previous file you edited, read or compiled.
If you do not specify a file name, the previous file will be read.

The )ifthere option checks to see whether the .input file exists. If it
does not, the )read command does nothing. If you do not use this option
and the file does not exist, you are asked to give the name of an
existing .input file.

The )quiet option suppresses output while the file is being read.

 Also See: )compile ugSysCmdcompile, )edit ugSysCmdedit, and )history
ugSysCmdhistory.



