.. status: ok


16.2 )abbreviation
------------------

abbreviation

 User Level Required: compiler

 Command Syntax:





)abbreviation query [nameOrAbbrev]





)abbreviation category abbrev fullname [)quiet]





)abbreviation domain abbrev fullname [)quiet]





)abbreviation package abbrev fullname [)quiet]





)abbreviation remove nameOrAbbrev





 Command Description:

This command is used to query, set and remove abbreviations for
category, domain and package constructors. Every constructor must have a
unique abbreviation. This abbreviation is part of the name of the
subdirectory under which the components of the compiled constructor are
stored.

Furthermore, by issuing this command you let the system know what file
to load automatically if you use a new constructor. Abbreviations must
start with a letter and then be followed by up to seven letters or
digits. Any letters appearing in the abbreviation must be in uppercase.

When used with the query argument, abbreviation query this command may
be used to list the name associated with a particular abbreviation or
the abbreviation for a constructor. If no abbreviation or name is given,
the names and corresponding abbreviations for all constructors are
listed.

The following shows the abbreviation for the constructor List:


.. spadVerbatim

::

 )abbreviation query List



The following shows the constructor name corresponding to the
abbreviation NNI:


.. spadVerbatim

::

 )abbreviation query NNI



The following lists all constructor names and their abbreviations.


.. spadVerbatim

::

 )abbreviation query



To add an abbreviation for a constructor, use this command with
category, domain or package. abbreviation package abbreviation domain
abbreviation category The following add abbreviations to the system for
a category, domain and package, respectively:


.. spadVerbatim

::

 )abbreviation domain   SET Set
 )abbreviation category COMPCAT  ComplexCategory
 )abbreviation package  LIST2MAP ListToMap



If the )quiet option is used, no output is displayed from this command.
You would normally only define an abbreviation in a library source file.
If this command is issued for a constructor that has already been
loaded, the constructor will be reloaded next time it is referenced. In
particular, you can use this command to force the automatic reloading of
constructors.

To remove an abbreviation, the remove argument is used. abbreviation
remove This is usually only used to correct a previous command that set
an abbreviation for a constructor name. If, in fact, the abbreviation
does exist, you are prompted for confirmation of the removal request.
Either of the following commands will remove the abbreviation VECTOR2
and the constructor name VectorFunctions2 from the system:


.. spadVerbatim

::

 )abbreviation remove VECTOR2
 )abbreviation remove VectorFunctions2



 Also See: )compile ugSysCmdcompile



