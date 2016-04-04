.. status: ok


16.28 )what
-----------

ugSysCmdwhat

what

 User Level Required: interpreter

 Command Syntax:





)what categories pattern1 [pattern2 ...]





)what commands pattern1 [pattern2 ...]





)what domains pattern1 [pattern2 ...]





)what operations pattern1 [pattern2 ...]





)what packages pattern1 [pattern2 ...]





)what synonym pattern1 [pattern2 ...]





)what things pattern1 [pattern2 ...]





)apropos pattern1 [pattern2 ...]





 Command Description:

This command is used to display lists of things in the system. The
patterns are all strings and, if present, restrict the contents of the
lists. Only those items that contain one or more of the strings as
substrings are displayed. For example,


.. spadVerbatim

::

 )what synonym



displays all command synonyms,


.. spadVerbatim

::

 )what synonym ver



displays all command synonyms containing the substring ver,


.. spadVerbatim

::

 )what synonym ver pr



displays all command synonyms containing the substring ver or the
substring pr. Output similar to the following will be displayed


.. spadVerbatim

::

 ---------------- System Command Synonyms -----------------
 user-defined synonyms satisfying patterns:
       ver pr
   )apr ........................... )what things
   )apropos ....................... )what things
   )prompt ........................ )set message prompt
   )version ....................... )lisp *yearweek*



Several other things can be listed with the )what command:

categories
    displays a list of category constructors. what categories
commands
    displays a list of system commands available at your user-level.
    what commands Your user-level user-level is set via the )set
    userlevel command. set userlevel To get a description of a
    particular command, such as )what, issue )help what.
domains
    displays a list of domain constructors. what domains
operations
    displays a list of operations in the system library. what operations
    It is recommended that you qualify this command with one or more
    patterns, as there are thousands of operations available. For
    example, say you are looking for functions that involve computation
    of eigenvalues. To find their names, try )what operations eig. A
    rather large list of operations is loaded into the workspace when
    this command is first issued. This list will be deleted when you
    clear the workspace via )clear all or )clear completely. It will be
    re-created if it is needed again.
packages
    displays a list of package constructors. what packages
synonym
    lists system command synonyms. what synonym
things
    displays all of the above types for items containing what things the
    pattern strings as substrings. The command synonym )apropos is
    equivalent to apropos )what things.

 Also See: )display ugSysCmddisplay, )set ugSysCmdset, and )show
ugSysCmdshow.



