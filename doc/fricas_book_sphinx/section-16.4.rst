.. status: ok


16.4 )cd
--------

ugSysCmdcd

cd

 User Level Required: interpreter

 Command Syntax:





)cd directory





 Command Description:

This command sets the FriCAS working current directory. The current
directory is used for looking for input files (for )read), FriCAS
library source files (for )compile), saved history environment files
(for )history )restore), compiled FriCAS library files (for )library),
and files to edit (for )edit). It is also used for writing spool files
(via )spool), writing history input files (via )history )write) and
history environment files (via )history )save),and compiled FriCAS
library files (via )compile). read compile history )restore edit spool
history )write history )save

If issued with no argument, this command sets the FriCAS current
directory to your home directory. If an argument is used, it must be a
valid directory name. Except for the ) at the beginning of the command,
this has the same syntax as the operating system cd command.

 Also See: )compile ugSysCmdcompile, )edit ugSysCmdedit, )history
ugSysCmdhistory, )library ugSysCmdlibrary, )read ugSysCmdread, and
)spool ugSysCmdspool.



