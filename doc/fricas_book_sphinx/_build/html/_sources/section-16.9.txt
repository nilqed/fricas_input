.. status: ok


16.9 )edit
----------

ugSysCmdedit

edit

 User Level Required: interpreter

 Command Syntax:





)edit [filename]





 Command Description:

This command is used to edit files. It works in conjunction with the
)read and )compile commands to remember the name of the file on which
you are working. By specifying the name fully, you can edit any file you
wish. Thus


.. spadVerbatim

::

 )edit /u/julius/matrix.input



will place you in an editor looking at the file /u/julius/matrix.input.
editing files By default, the editor is vi, vi but if you have an EDITOR
shell environment variable defined, that editor will be used. When
FriCAS is running under the X Window System, it will try to open a
separate xterm running your editor if it thinks one is necessary. Korn
shell For example, under the Korn shell, if you issue


.. spadVerbatim

::

 export EDITOR=emacs



then the emacs emacs editor will be used by )edit.

If you do not specify a file name, the last file you edited, read or
compiled will be used. If there is no last file you will be placed in
the editor editing an empty unnamed file.

It is possible to use the )system command to edit a file directly. For
example,


.. spadVerbatim

::

 )system emacs /etc/rc.tcpip



calls emacs to edit the file. emacs

 Also See: )system ugSysCmdsystem, )compile ugSysCmdcompile, and )read
ugSysCmdread.



