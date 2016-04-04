.. status: ok

1.1 Starting Up and Winding Down
--------------------------------

You need to know how to start the FriCAS system and how to stop it. We
assume that FriCAS has been correctly installed on your machine (as
described in another FriCAS document).

To begin using FriCAS, issue the command axiom to the FriCAS operating
system shell. axiom @ axiom There is a brief pause, some start-up
messages, and then one or more windows appear.

If you are not running FriCAS under the X Window System, there is only
one window (the console). At the lower left of the screen there is a
prompt that prompt looks like


.. spadVerbatim

::

 (1) ->



When you want to enter input to FriCAS, you do so on the same line after
the prompt. The 1 in (1), also called the equation number, is the
computation step number and is incremented step number after you enter
FriCAS statements. Note, however, that a system command such as ``)clear``
all may change the step number in other ways. We talk about step numbers
more when we discuss system commands and the workspace history facility.

If you are running FriCAS under the X Window System, there may be two X
Window System windows: the console window (as just described) and the
HyperDoc main menu. Hyper@{HyperDoc} HyperDoc is a multiple-window
hypertext system that lets you window view FriCAS documentation and
examples on-line, execute FriCAS expressions, and generate graphics. If
you are in a graphical windowing environment, it is usually started
automatically when FriCAS begins. If it is not running, issue ``)hd`` to
start it. We discuss the basics of HyperDoc in Chapter 3.


To interrupt an FriCAS computation, hold down the interrupt Ctrl
(control) key and press c. This brings you back to the FriCAS prompt.



To exit from FriCAS, move to the console window, type ``)quit`` at the 
input prompt and press the Enter key. You will probably be prompted with 
the following message:

  Please enter y or yes if you really want to leave the
  interactive environment and return to the operating system

  You should respond yes, for example, to exit FriCAS.


We are purposely vague in describing exactly what your screen looks like
or what messages FriCAS displays. FriCAS runs on a number of different
machines, operating systems and window environments, and these
differences all affect the physical look of the system. You can also
change the way that FriCAS behaves via system commands described later
in this chapter and in Appendix A. System commands are special commands,
like )set, that begin with a closing parenthesis and are used to change
your environment. For example, you can set a system variable so that you
are not prompted for confirmation when you want to leave FriCAS.



1.1.1 Clef
~~~~~~~~~~

If you are using FriCAS under the X Window System, the Clef command line
editor Clef command line editor is probably available and installed.
With this editor you can recall previous lines with the up and down
arrow keys. To move forward and backward on a line, use the right and
left arrows. You can use the Insert key to toggle insert mode on or off.
When you are in insert mode, the cursor appears as a large block and if
you type anything, the characters are inserted into the line without
deleting the previous ones.

If you press the ``Home`` key, the cursor moves to the beginning of the line
and if you press the ``End`` key, the cursor moves to the end of the line.
Pressing ``Ctrl-End`` deletes all the text from the cursor to the end of the
line.

Clef also provides FriCAS operation name completion for operation name
completion a limited set of operations. If you enter a few letters and
then press the ``Tab`` key, Clef tries to use those letters as the prefix of
an FriCAS operation name. If a name appears and it is not what you want,
press Tab again to see another name.

You are ready to begin your journey into the world of FriCAS.
