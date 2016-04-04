.. status: ok


16.8 )display
-------------

ugSysCmddisplay

display

 User Level Required: interpreter

 Command Syntax:





)display all





)display properties





)display properties all





)display properties [obj1 [obj2 ...]]





)display value all





)display value [obj1 [obj2 ...]]





)display mode all





)display mode [obj1 [obj2 ...]]





)display names





)display operations opName





 Command Description:

This command is used to display the contents of the workspace and
signatures of functions with a given name.A signature gives the argument
and return types of a function.

The command


.. spadVerbatim

::

 )display names



lists the names of all user-defined objects in the workspace. This is
useful if you do not wish to see everything about the objects and need
only be reminded of their names.

The commands


.. spadVerbatim

::

 )display all
 )display properties
 )display properties all



all do the same thing: show the values and types and declared modes of
all variables in the workspace. If you have defined functions, their
signatures and definitions will also be displayed.

To show all information about a particular variable or user functions,
for example, something named d, issue


.. spadVerbatim

::

 )display properties d



To just show the value (and the type) of d, issue


.. spadVerbatim

::

 )display value d



To just show the declared mode of d, issue


.. spadVerbatim

::

 )display mode d



All modemaps for a given operation may be displayed by using )display
operations. A modemap is a collection of information about a particular
reference to an operation. This includes the types of the arguments and
the return value, the location of the implementation and any conditions
on the types. The modemap may contain patterns. The following displays
the modemaps for the operation complexcomplexComplexCategory:


.. spadVerbatim

::

 )d op complex



 Also See: )clear ugSysCmdclear, )history ugSysCmdhistory, )set
ugSysCmdset, )show ugSysCmdshow, and )what ugSysCmdwhat.



