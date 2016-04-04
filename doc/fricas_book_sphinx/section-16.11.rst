.. status: ok


16.11 )frame
------------

ugSysCmdframe

frame

 User Level Required: interpreter

 Command Syntax:





)frame new frameName





)frame drop [frameName]





)frame next





)frame last





)frame names





)frame import frameName [objectName1 [objectName2 ...]]





)set message frame on | off





)set message prompt frame





 Command Description:

A frame can be thought of as a logical session within the physical
session that you get when you start the system. You can have as many
frames as you want, within the limits of your computer's storage, paging
space, and so on. Each frame has its own step number, environment and
history. You can have a variable named a in one frame and it will have
nothing to do with anything that might be called a in any other frame.

Some frames are created by the HyperDoc program and these can have
pretty strange names, since they are generated automatically. frame
names To find out the names of all frames, issue


.. spadVerbatim

::

 )frame names



It will indicate the name of the current frame.

You create a new frame frame new `` quark`` by issuing


.. spadVerbatim

::

 )frame new quark



The history facility can be turned on by issuing either )set history on
or )history )on. If the history facility is on and you are saving
history information in a file rather than in the FriCAS environment then
a history file with filename quark.axh will be created as you enter
commands. If you wish to go back to what you were doing in the frame
next `` initial`` frame, use frame last


.. spadVerbatim

::

 )frame next



or


.. spadVerbatim

::

 )frame last



to cycle through the ring of available frames to get back to ``
initial``.

If you want to throw away a frame (say `` quark``), issue


.. spadVerbatim

::

 )frame drop quark



If you omit the name, the current frame is dropped. frame drop

If you do use frames with the history facility on and writing to a file,
you may want to delete some of the older history files. file:history
These are directories, so you may want to issue a command like rm -r
quark.axh to the operating system.

You can bring things from another frame by using frame import )frame
import. For example, to bring the f and g from the frame `` quark`` to
the current frame, issue


.. spadVerbatim

::

 )frame import quark f g



If you want everything from the frame `` quark``, issue


.. spadVerbatim

::

 )frame import quark



You will be asked to verify that you really want everything.

There are two )set flags set message frame to make it easier to tell
where you are.


.. spadVerbatim

::

 )set message frame on | off



will print more messages about frames when it is set on. By default, it
is off.


.. spadVerbatim

::

 )set message prompt frame



will give a prompt set message prompt frame that looks like


.. spadVerbatim

::

 initial (1) ->



prompt:with frame name when you start up. In this case, the frame name
and step make up the prompt.

 Also See: )history ugSysCmdhistory and )set ugSysCmdset.



