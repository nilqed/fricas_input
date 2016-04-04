.. status: ok



4.1 Input Files
---------------

In this section we explain what an input file is and file:input why you
would want to know about it. We discuss where FriCAS looks for input
files and how you can direct it to look elsewhere. We also show how to
read the contents of an input file into the workspace and how to use the
history facility to generate an input file from the statements you have
entered directly into the workspace.

An input file contains FriCAS expressions and system commands. Anything
that you can enter directly to FriCAS can be put into an input file.
This is how you save input functions and expressions that you wish to
read into FriCAS more than one time.

To read an input file into FriCAS, use the )read system command. read
For example, you can read a file in a particular directory by issuing


.. spadVerbatim

::

 )read /spad/src/input/matrix.input



The ``.input`` is optional; this also works:


.. spadVerbatim

::

 )read /spad/src/input/matrix



What happens if you just enter )read matrix.input or even )read matrix?
FriCAS looks in your current working directory for input files that are
not qualified by a directory name. Typically, this directory is the
directory from which you invoked FriCAS.

To change the current working directory, use the )cd system command. The
command )cd by itself shows the current working directory:default for
searching directory. cd To change it to file:input:where found the
src/input subdirectory for user babar, issue


.. spadVerbatim

::

 )cd /u/babar/src/input



FriCAS looks first in this directory for an input file. If it is not
found, it looks in the system's directories, assuming you meant some
input file that was provided with FriCAS.





If you have the FriCAS history facility turned on (which it is by
default), you can save all the lines you have entered into the workspace
by entering

)history )write

history )write

| FriCAS tells you what input file to edit to see your statements. The
file is in your home directory or in the directory you specified with cd
)cd.





In `ugLangBlocks <section-5.2.html#ugLangBlocks>`__ we discuss using
indentation in input files to group statements into blocks.



