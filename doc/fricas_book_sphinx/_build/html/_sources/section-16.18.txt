.. status: ok


16.18 )pquit
------------

ugSysCmdpquit

pquit

 User Level Required: interpreter

 Command Syntax:





)pquit





 Command Description:

This command is used to terminate FriCAS and return to the operating
system. Other than by redoing all your computations or by using the
)history )restore command to try to restore your working environment,
you cannot return to FriCAS in the same state.

)pquit differs from the )quit in that it always asks for confirmation
that you want to terminate FriCAS (the p is for protected). quit When
you enter the )pquit command, FriCAS responds



| Please enter y or yes if you really want to leave the interactive
|  environment and return to the operating system:



If you respond with y or yes, you will see the message



| You are now leaving the FriCAS interactive environment.
|  Issue the command axiom to the operating system to start a new
session.



and FriCAS will terminate and return you to the operating system (or the
environment from which you invoked the system). If you responded with
something other than y or yes, then the message



You have chosen to remain in the FriCAS interactive environment.



will be displayed and, indeed, FriCAS would still be running.

 Also See: )fin ugSysCmdfin, )history ugSysCmdhistory, )close
ugSysCmdclose, )quit ugSysCmdquit, and )system ugSysCmdsystem.



