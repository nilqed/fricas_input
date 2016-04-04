.. status: ok


16.7 )compile
-------------

ugSysCmdcompile

compile

 User Level Required: compiler

 Command Syntax:





)compile





)compile fileName





)compile fileName.as





)compile directory/fileName.as





)compile fileName.ao





)compile directory/fileName.ao





)compile fileName.al





)compile directory/fileName.al





)compile fileName.lsp





)compile directory/fileName.lsp





)compile fileName.spad





)compile directory/fileName.spad





)compile fileName )new





)compile fileName )old





)compile fileName )translate





)compile fileName )quiet





)compile fileName )noquiet





)compile fileName )moreargs





)compile fileName )onlyargs





)compile fileName )break





)compile fileName )nobreak





)compile fileName )library





)compile fileName )nolibrary





)compile fileName )vartrace





)compile fileName )constructor nameOrAbbrev





 Command Description:

You use this command to invoke the new FriCAS library compiler or the
old FriCAS system compiler. The )compile system command is actually a
combination of FriCAS processing and a call to the Aldor compiler. It is
performing double-duty, acting as a front-end to both the Aldor compiler
and the old FriCAS system compiler. (The old FriCAS system compiler was
written in Lisp and was an integral part of the FriCAS environment. The
Aldor compiler is written in C and executed by the operating system when
called from within FriCAS.)

The command compiles files with file extensions .as, .ao and .al with
the Aldor compiler and files with file extension .spad with the old
FriCAS system compiler. It also can compile files with file extension
.lsp. These are assumed to be Lisp files genererated by the Aldor
compiler. If you omit the file extension, the command looks to see if
you have specified the )new or )old option. If you have given one of
these options, the corresponding compiler is used. Otherwise, the
command first looks in the standard system directories for files with
extension .as, .ao and .al and then files with extension .spad. The
first file found has the appropriate compiler invoked on it. If the
command cannot find a matching file, an error message is displayed and
the command terminates.

The )translate option is used to invoke a special version of the old
system compiler that will translate a .spad file to a .as file. That is,
the .spad file will be parsed and analyzed and a file using the new
syntax will be created. By default, the .as file is created in the same
directory as the .spad file. If that directory is not writable, the
current directory is used. If the current directory is not writable, an
error message is given and the command terminates. Note that )translate
implies the )old option so the file extension can safely be omitted. If
)translate is given, all other options are ignored. Please be aware that
the translation is not necessarily one hundred percent complete or
correct. You should attempt to compile the output with the Aldor
compiler and make any necessary corrections.

We now describe the options for the new Aldor compiler.

The first thing )compile does is look for a source code filename among
its arguments. Thus


.. spadVerbatim

::

 )compile mycode.as
 )compile /u/jones/as/mycode.as
 )compile mycode



all invoke )compiler on the file /u/jones/as/mycode.as if the current
FriCAS working directory is /u/jones/as. (Recall that you can set the
working directory via the )cd command. If you don't set it explicitly,
it is the directory from which you started FriCAS.)

This is frequently all you need to compile your file. This simple
command:

#. Invokes the Aldor compiler and produces Lisp output.
#. Calls the Lisp compiler if the Aldor compilation was successful.
#. Uses the )library command to tell FriCAS about the contents of your
   compiled file and arrange to have those contents loaded on demand.

Should you not want the )library command automatically invoked, call
)compile with the )nolibrary option. For example,


.. spadVerbatim

::

 )compile mycode.as )nolibrary



The general description of Aldor command line arguments is in the Aldor
documentation. The default options used by the )compile command can be
viewed and set using the )set compiler args FriCAS system command. The
current defaults are


.. spadVerbatim

::

 -O -Fasy -Fao -Flsp -laxiom -Mno-AXL_W_WillObsolete -DFriCAS



These options mean:

-  -O: perform all optimizations,
-  -Fasy: generate a .asy file,
-  -Fao: generate a .ao file,
-  -Flsp: generate a .lsp (Lisp) file, Lisp:code generation
-  -laxiom: use the axiom library libaxiom.al,
-  -Mno-AXL_W_WillObsolete: do not display messages about older
   generated files becoming obsolete, and
-  -DFriCAS: define the global assertion FriCAS so that the Aldor
   libraries for generating stand-alone code are not accidentally used
   with FriCAS.

To supplement these default arguments, use the )moreargs option on
)compile. For example,


.. spadVerbatim

::

 )compile mycode.as )moreargs "-v"



uses the default arguments and appends the -v (verbose) argument flag.
The additional argument specification must be enclosed in double quotes.

To completely replace these default arguments for a particular use of
)compile, use the )onlyargs option. For example,


.. spadVerbatim

::

 )compile mycode.as )onlyargs "-v -O"



only uses the -v (verbose) and -O (optimize) arguments. The argument
specification must be enclosed in double quotes. In this example, Lisp
code is not produced and so the compilation output will not be available
to FriCAS.

To completely replace the default arguments for all calls to )compile
within your FriCAS session, use )set compiler args. For example, to use
the above arguments for all compilations, issue


.. spadVerbatim

::

 )set compiler args "-v -O"



Make sure you include the necessary -l and -Y arguments along with those
needed for Lisp file creation. As above, the argument specification must
be enclosed in double quotes.

By default, the )library system command exposes all domains and
categories it processes. This means that the FriCAS intepreter will
consider those domains and categories when it is trying to resolve a
reference to a function. Sometimes domains and categories should not be
exposed. For example, a domain may just be used privately by another
domain and may not be meant for top-level use. The )library command
should still be used, though, so that the code will be loaded on demand.
In this case, you should use the )nolibrary option on )compile and the
)noexpose option in the )library command. For example,


.. spadVerbatim

::

 )compile mycode.as )nolibrary
 )library mycode )noexpose



Once you have established your own collection of compiled code, you may
find it handy to use the )dir option on the )library command. This
causes )library to process all compiled code in the specified directory.
For example,


.. spadVerbatim

::

 )library )dir /u/jones/as/quantum



You must give an explicit directory after )dir, even if you want all
compiled code in the current working directory processed, e.g.


.. spadVerbatim

::

 )library )dir .



The )compile command works with several file extensions. We saw above
what happens when it is invoked on a file with extension .as. A .ao file
is a portable binary compiled version of a .as file, and )compile simply
passes the .ao file onto Aldor. The generated Lisp file is compiled and
)library is automatically called, just as if you had specified a .as
file.

A .al file is an archive file containing .ao files. The archive is
created (on Unix systems) with the ar program. When )compile is given a
.al file, it creates a directory whose name is based on that of the
archive. For example, if you issue


.. spadVerbatim

::

 )compile mylib.al



the directory mylib.axldir is created. All members of the archive are
unarchived into the directory and )compile is called on each .ao file
found. It is your responsibility to remove the directory and its
contents, if you choose to do so.

A .lsp file is a Lisp source file, presumably, in our context, generated
by Aldor when called with the -Flsp option. When )compile is used with a
.lsp file, the Lisp file is compiled and )library is called. You must
also have present a .asy generated from the same source file.

The following are descriptions of options for the old system compiler.

You can compile category, domain, and package constructors contained in
files with file extension .spad. You can compile individual constructors
or every constructor in a file.

The full filename is remembered between invocations of this command and
)edit commands. The sequence of commands


.. spadVerbatim

::

 )compile matrix.spad
 )edit
 )compile



will call the compiler, edit, and then call the compiler again on the
file matrix.spad. If you do not specify a directory, the working current
directory (see `ugSysCmdcd <ugSysCmdcd>`__ ) is searched for the file.
If the file is not found, the standard system directories are searched.

If you do not give any options, all constructors within a file are
compiled. Each constructor should have an )abbreviation command in the
file in which it is defined. We suggest that you place the )abbreviation
commands at the top of the file in the order in which the constructors
are defined. The list of commands serves as a table of contents for the
file. abbreviation

The )library option causes directories containing the compiled code for
each constructor to be created in the working current directory. The
name of such a directory consists of the constructor abbreviation and
the .NRLIB file extension. For example, the directory containing the
compiled code for the MATRIX constructor is called MATRIX.NRLIB. The
)nolibrary option says that such files should not be created. The
default is )library. Note that the semantics of )library and )nolibrary
for the new Aldor compiler and for the old system compiler are
completely different.

The )vartrace option causes the compiler to generate extra code for the
constructor to support conditional tracing of variable assignments. (see
`ugSysCmdtrace <ugSysCmdtrace>`__ ). Without this option, this code is
suppressed and one cannot use the )vars option for the trace command.

The )constructor option is used to specify a particular constructor to
compile. All other constructors in the file are ignored. The constructor
name or abbreviation follows )constructor. Thus either


.. spadVerbatim

::

 )compile matrix.spad )constructor RectangularMatrix



or


.. spadVerbatim

::

 )compile matrix.spad )constructor RMATRIX



compiles the RectangularMatrix constructor defined in matrix.spad.

The )break and )nobreak options determine what the old system compiler
does when it encounters an error. )break is the default and it indicates
that processing should stop at the first error. The value of the )set
break variable then controls what happens.

 Also See: )abbreviation ugSysCmdabbreviation, )edit ugSysCmdedit, and
)library ugSysCmdlibrary.



