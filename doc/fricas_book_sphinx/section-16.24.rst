.. status: ok


16.24 )synonym
--------------

ugSysCmdsynonym

synonym

 User Level Required: interpreter

 Command Syntax:





)synonym





)synonym synonym fullCommand





)what synonyms





 Command Description:

This command is used to create short synonyms for system command
expressions. For example, the following synonyms might simplify commands
you often use.


.. spadVerbatim

::

 )synonym save         history )save
 )synonym restore      history )restore
 )synonym mail         system mail
 )synonym ls           system ls
 )synonym fortran      set output fortran



Once defined, synonyms can be used in place of the longer command
expressions. Thus


.. spadVerbatim

::

 )fortran on



is the same as the longer


.. spadVerbatim

::

 )set fortran output on



To list all defined synonyms, issue either of


.. spadVerbatim

::

 )synonyms
 )what synonyms



To list, say, all synonyms that contain the substring ap, issue


.. spadVerbatim

::

 )what synonyms ap



 Also See: )set ugSysCmdset and )what ugSysCmdwhat.



