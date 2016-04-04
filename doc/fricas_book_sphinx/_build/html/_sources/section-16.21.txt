.. status: ok


16.21 )set
----------

ugSysCmdset

set

 User Level Required: interpreter

 Command Syntax:





)set





)set label1 [... labelN]





)set label1 [... labelN] newValue





 Command Description:

The )set command is used to view or set system variables that control
what messages are displayed, the type of output desired, the status of
the history facility, the way FriCAS user functions are cached, and so
on. Since this collection is very large, we will not discuss them here.
Rather, we will show how the facility is used. We urge you to explore
the )set options to familiarize yourself with how you can modify your
FriCAS working environment. There is a HyperDoc version of this same
facility available from the main HyperDoc menu.

The )set command is command-driven with a menu display. It is
tree-structured. To see all top-level nodes, issue )set by itself.


.. spadVerbatim

::

 )set



Variables with values have them displayed near the right margin.
Subtrees of selections have ... displayed in the value field. For
example, there are many kinds of messages, so issue )set message to see
the choices.


.. spadVerbatim

::

 )set message



The current setting for the variable that displays computation
timings:displaying whether computation times timings:displaying are
displayed is visible in the menu displayed by the last command. To see
more information, issue


.. spadVerbatim

::

 )set message time



This shows that time printing is on now. To turn it off, issue


.. spadVerbatim

::

 )set message time off



set message time

As noted above, not all settings have so many qualifiers. For example,
to change the )quit command to being unprotected (that is, you will not
be prompted for verification), you need only issue


.. spadVerbatim

::

 )set quit unprotected



set quit unprotected

 Also See: )quit ugSysCmdquit.



