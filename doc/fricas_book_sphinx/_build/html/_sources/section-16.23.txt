.. status: ok


16.23 )spool
------------

ugSysCmdspool

spool

 User Level Required: interpreter

 Command Syntax:





)spool [fileName]





)spool





 Command Description:

This command is used to save (spool) all FriCAS input and output
file:spool into a file, called a spool file. You can only have one spool
file active at a time. To start spool, issue this command with a
filename. For example,


.. spadVerbatim

::

 )spool integrate.out



To stop spooling, issue )spool with no filename.

If the filename is qualified with a directory, then the output will be
placed in that directory. If no directory information is given, the
spool file will be placed in the directory:for spool files current
directory. The current directory is the directory from which you started
FriCAS or is the directory you specified using the )cd command. cd

 Also See: )cd ugSysCmdcd.



