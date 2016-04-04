.. status: ok


16.15 )lisp
-----------

ugSysCmdlisp

lisp

 User Level Required: development

 Command Syntax:





)lisp {\\it[lispExpression]}





 Command Description:

This command is used by FriCAS system developers to have single
expressions evaluated by the Common Lisp system on which FriCAS is
built. The lispExpression is read by the Common Lisp reader and
evaluated. If this expression is not complete (unbalanced parentheses,
say), the reader will wait until a complete expression is entered.

Since this command is only useful for evaluating single expressions, the
)fin command may be used to drop out of FriCAS into Common Lisp.

 Also See: )system ugSysCmdsystem, )boot ugSysCmdboot, and )fin
ugSysCmdfin.



