.. status: ok


16.3 )boot
----------

ugSysCmdboot

boot

 User Level Required: development

 Command Syntax:





)boot bootExpression





 Command Description:

This command is used by FriCAS system developers to execute expressions
written in the BOOT language. For example,


.. spadVerbatim

::

 )boot times3(x) == 3*x



creates and compiles the Common Lisp function times3 obtained by
translating the BOOT code.

 Also See: )fin ugSysCmdfin, )lisp ugSysCmdlisp, )set ugSysCmdset, and
)system ugSysCmdsystem.



