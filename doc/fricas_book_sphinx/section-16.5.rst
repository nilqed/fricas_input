.. status: ok


16.5 )close
-----------

ugSysCmdclose

close

 User Level Required: interpreter

 Command Syntax:





)close





)close )quietly





 Command Description:

This command is used to close down interpreter client processes. Such
processes are started by HyperDoc to run FriCAS examples when you click
on their text. When you have finished examining or modifying the example
and you do not want the extra window around anymore, issue


.. spadVerbatim

::

 )close



to the FriCAS prompt in the window.

If you try to close down the last remaining interpreter client process,
FriCAS will offer to close down the entire FriCAS session and return you
to the operating system by displaying something like


.. spadVerbatim

::

    This is the last AXIOM session. Do you want to kill AXIOM?



Type y (followed by the Return key) if this is what you had in mind.
Type n (followed by the Return key) to cancel the command.

You can use the )quietly option to force FriCAS to close down the
interpreter client process without closing down the entire FriCAS
session.

 Also See: )quit ugSysCmdquit and )pquit ugSysCmdpquit.



