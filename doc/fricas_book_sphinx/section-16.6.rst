.. status: ok


16.6 )clear
-----------

ugSysCmdclear

clear

 User Level Required: interpreter

 Command Syntax:





)clear all





)clear completely





)clear properties all





)clear properties obj1 [obj2 ...]





)clear value all





)clear value obj1 [obj2 ...]





)clear mode all





)clear mode obj1 [obj2 ...]





 Command Description:

This command is used to remove function and variable declarations,
definitions and values from the workspace. To empty the entire workspace
and reset the step counter to 1, issue


.. spadVerbatim

::

 )clear all



To remove everything in the workspace but not reset the step counter,
issue


.. spadVerbatim

::

 )clear properties all



To remove everything about the object x, issue


.. spadVerbatim

::

 )clear properties x



To remove everything about the objects x, y and f, issue


.. spadVerbatim

::

 )clear properties x y f



The word properties may be abbreviated to the single letter p.


.. spadVerbatim

::

 )clear p all
 )clear p x
 )clear p x y f



All definitions of functions and values of variables may be removed by
either


.. spadVerbatim

::

 )clear value all
 )clear v all



This retains whatever declarations the objects had. To remove
definitions and values for the specific objects x, y and f, issue


.. spadVerbatim

::

 )clear value x y f
 )clear v x y f



To remove the declarations of everything while leaving the definitions
and values, issue


.. spadVerbatim

::

 )clear mode  all
 )clear m all



To remove declarations for the specific objects x, y and f, issue


.. spadVerbatim

::

 )clear mode x y f
 )clear m x y f



The )display names and )display properties commands may be used to see
what is currently in the workspace.

The command


.. spadVerbatim

::

 )clear completely



does everything that )clear all does, and also clears the internal
system function and constructor caches.

 Also See: )display ugSysCmddisplay, )history ugSysCmdhistory, and )undo
ugSysCmdundo.



