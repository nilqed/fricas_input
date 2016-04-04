.. status: ok


16.19 )quit
-----------

ugSysCmdquit

quit

 User Level Required: interpreter

 Command Syntax:





)quit





)set quit protected | unprotected





 Command Description:

This command is used to terminate FriCAS and return to the operating
system. Other than by redoing all your computations or by using the
)history )restore command to try to restore your working environment,
you cannot return to FriCAS in the same state.

)quit differs from the )pquit in that it asks for pquit confirmation
only if the command


.. spadVerbatim

::

 )set quit protected



has been issued. set quit protected Otherwise, )quit will make FriCAS
terminate and return you to the operating system (or the environment
from which you invoked the system).

The default setting is )set quit protected so that )quit and )pquit
behave in the same way. If you do issue


.. spadVerbatim

::

 )set quit unprotected



we set quit unprotected suggest that you do not (somehow) assign )quit
to be executed when you press, say, a function key.

 Also See: )fin ugSysCmdfin, )history ugSysCmdhistory, )close
ugSysCmdclose, )pquit ugSysCmdpquit, and )system ugSysCmdsystem.



