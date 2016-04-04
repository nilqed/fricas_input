.. status: ok


16.27 )undo
-----------

ugSysCmdundo

undo

 User Level Required: interpreter

 Command Syntax:





)undo





)undo integer





)undo integer [option]





)undo )redo





where option is one of





)after





)before





 Command Description:

This command is used to restore the state of the user environment to an
earlier point in the interactive session. The argument of an )undo is an
integer which must designate some step number in the interactive
session.


.. spadVerbatim

::

 )undo n
 )undo n )after



These commands return the state of the interactive environment to that
immediately after step n. If n is a positive number, then n refers to
step nummber n. If n is a negative number, it refers to the \\tt n-th
previous command (that is, undoes the effects of the last -n commands).

A )clear all resets the )undo facility. Otherwise, an )undo undoes the
effect of )clear with options properties, value, and mode, and that of a
previous undo. If any such system commands are given between steps n and
n+1 ( n>0), their effect is undone for )undo m for any 0<m≤n..

The command )undo is equivalent to )undo -1 (it undoes the effect of the
previous user expression). The command )undo 0 undoes any of the above
system commands issued since the last user expression.


.. spadVerbatim

::

 )undo n )before



This command returns the state of the interactive environment to that
immediately before step n. Any )undo or )clear system commands given
before step n will not be undone.


.. spadVerbatim

::

 )undo )redo



This command reads the file redo.input. created by the last )undo
command. This file consists of all user input lines, excluding those
backtracked over due to a previous )undo.

 Also See: )history ugSysCmdhistory. The command )history )write will
eliminate the undone command lines of your program.



