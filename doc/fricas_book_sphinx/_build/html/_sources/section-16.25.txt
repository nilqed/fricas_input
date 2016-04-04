.. status: ok


16.25 )system
-------------

ugSysCmdsystem

system

 User Level Required: interpreter

 Command Syntax:





)system cmdExpression





 Command Description:

This command may be used to issue commands to the operating system while
remaining in FriCAS. The cmdExpression is passed to the operating system
for execution.

To get an operating system shell, issue, for example, )system sh. When
you enter the key combination, Ctrl-- D (pressing and holding the Ctrl
key and then pressing the D key) the shell will terminate and you will
return to FriCAS. We do not recommend this way of creating a shell
because Common Lisp may field some interrupts instead of the shell. If
possible, use a shell running in another window.

If you execute programs that misbehave you may not be able to return to
FriCAS. If this happens, you may have no other choice than to restart
FriCAS and restore the environment via )history )restore, if possible.

 Also See: )boot ugSysCmdboot, )fin ugSysCmdfin, )lisp ugSysCmdlisp,
)pquit ugSysCmdpquit, and )quit ugSysCmdquit.



