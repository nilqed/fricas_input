.. status: ok



15.3 The NAG Library Link
-------------------------

nagLinkIntro

The Nag Library link allows you to call NAG Fortran routines from within
FriCAS, passing FriCAS objects as parameters and getting them back as
results.

The Nag Library and, consequently, the link are divided into chapters,
which cover different areas of numerical analysis. The statistical and
sorting chapters of the Library, however, are not included in the link
and various support and utility routines (mainly the F06 and X chapters)
have been omitted.

Each chapter has a short (at most three-letter) name; for example, the
chapter devoted to the solution of ordinary differential equations is
called D02. When using the link via the HyperDoc interface. you will be
presented with a complete menu of these chapters. The names of
individual routines within each chapter are formed by adding three
letters to the chapter name, so for example the routine for solving ODEs
by Adams method is called
d02cjfd02cjfNagOrdinaryDifferentialEquationsPackage.



15.3.1 Interpreting NAG Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nagDocumentation

Information about using the Nag Library in general, and about using
individual routines in particular, can be accessed via HyperDoc. This
documentation refers to the Fortran routines directly; the purpose of
this subsection is to explain how this corresponds to the FriCAS
routines.

For general information about the Nag Library users should consult
Essential Introduction to the NAG Foundation Library manpageXXintro. The
documentation is in ASCII format, and a description of the conventions
used to represent mathematical symbols is given in Introduction to NAG
On-Line Documentation manpageXXonline. Advice about choosing a routine
from a particular chapter can be found in the Chapter Documents
FoundationLibraryDocPage.



15.3.1.1 Correspondence Between Fortran and FriCAS types
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The NAG documentation refers to the Fortran types of objects; in
general, the correspondence to FriCAS types is as follows.

-  Fortran INTEGER corresponds to FriCAS Integer.
-  Fortran DOUBLE PRECISION corresponds to FriCAS DoubleFloat.
-  Fortran COMPLEX corresponds to FriCAS Complex DoubleFloat.
-  Fortran LOGICAL corresponds to FriCAS Boolean.
-  Fortran CHARACTER*(*) corresponds to FriCAS String.

(Exceptionally, for NAG EXTERNAL parameters -- ASPs in link parlance --
REAL and COMPLEX correspond to MachineFloat and MachineComplex,
respectively; see `aspSection <aspSection>`__ .)

The correspondence for aggregates is as follows.

-  A one-dimensional Fortran array corresponds to an FriCAS Matrix with
   one column.
-  A two-dimensional Fortran ARRAY corresponds to an FriCAS Matrix.
-  A three-dimensional Fortran ARRAY corresponds to an FriCAS
   ThreeDimensionalMatrix.

Higher-dimensional arrays are not currently needed for the Nag Library.

Arguments which are Fortran FUNCTIONs or SUBROUTINEs correspond to
special ASP domains in FriCAS. See `aspSection <aspSection>`__ .





15.3.1.2 Classification of NAG parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NAG parameters are classified as belonging to one (or more) of the
following categories: Input, Output, Workspace or External procedure.
Within External procedures a similar classification is used, and
parameters may also be Dummies, or User Workspace (data structures not
used by the NAG routine but provided for the convenience of the user).

When calling a NAG routine via the link the user only provides values
for Input and External parameters.

The order of the parameters is, in general, different from the order
specified in the Nag Library documentation. The Browser description for
each routine helps in determining the correspondence. As a rule of
thumb, Input parameters come first followed by Input/Output parameters.
The External parameters are always found at the end.





15.3.1.3 IFAIL
~~~~~~~~~~~~~~

NAG routines often return diagnostic information through a parameter
called ifail. With a few exceptions, the principle is that on input
ifail takes one of the values -1,0,1. This determines how the routine
behaves when it encounters an error:

-  a value of 1 causes the NAG routine to return without printing an
   error message;
-  a value of 0 causes the NAG routine to print an error message and
   abort;
-  a value of -1 causes the NAG routine to return and print an error
   message.

The user is STRONGLY ADVISED to set ifail to -1 when using the link. If
ifail has been set to 1 or -1 on input, then its value on output will
determine the possible cause of any error. A value of 0 indicates
successful completion, otherwise it provides an index into a table of
diagnostics provided as part of the routine documentation (accessible
via Browse).







15.3.2 Using the Link
~~~~~~~~~~~~~~~~~~~~~

nagLinkUsage

The easiest way to use the link is via the HyperDoc interface htxl1. You
will be presented with a set of fill-in forms where you can specify the
parameters for each call. Initially, the forms contain example values,
demonstrating the use of each routine (these, in fact, correspond to the
standard NAG example program for the routine in question). For some
parameters, these values can provide reasonable defaults; others, of
course, represent data. When you change a parameter which controls the
size of an array, the data in that array are reset to a neutral value --
usually zero.

When you are satisfied with the values entered, clicking on the Continue
button will display the FriCAS command needed to run the chosen NAG
routine with these values. Clicking on the Do It button will then cause
FriCAS to execute this command and return the result in the parent
FriCAS session, as described below. Note that, for some routines,
multiple HyperDoc pages are required, due to the structure of the data.
For these, returning to an earlier page causes HyperDoc to reset the
later pages (this is a general feature of HyperDoc); in such a case, the
simplest way to repeat a call, varying a parameter on an earlier page,
is probably to modify the call displayed in the parent session.

An alternative approach is to call NAG routines directly in your normal
FriCAS session (that is, using the FriCAS interpreter). Such calls
return an object of type Result. As not all parameters in the underlying
NAG routine are required in the AXIOM call (and the parameter ordering
may be different), before calling a NAG routine you should consult the
description of the FriCAS operation in the Browser. (The quickest route
to this is to type the routine name, in lower case, into the Browser's
input area, then click on Operations.) The parameter names used coincide
with NAG's, although they will appear here in lower case. Of course, it
is also possible to become familiar with the FriCAS form of a routine by
first using it through the HyperDoc interface htxl1.

As an example of this mode of working, we can find a zero of a function,
lying between 3 and 4, as follows:


.. spadInput
::

	answer:=c05adf(3.0,4.0,1.0e-5,0.0,-1,sin(X)::ASP1(F))


.. spadMathAnswer
By default, Result only displays the type of returned values, since the
amount of information returned can be quite large. Individual components
can be examined as follows:


.. spadInput
::

	answer . x


.. spadMathAnswer
.. spadInput
::

	answer . ifail


.. spadMathAnswer
In order to avoid conflict with names defined in the workspace, you can
also get the values by using the String type (the interpreter
automatically coerces them to Symbol)


.. spadInput
::

	answer "x"


.. spadMathAnswer
It is possible to have FriCAS display the values of scalar or array
results automatically. For more details, see the commands
showScalarValuesshowScalarValuesResult and
showArrayValuesshowArrayValuesResult.

There is also a .input file for each NAG routine, containing FriCAS
interpreter commands to set up and run the standard NAG example for that
routine.


.. spadInput
::

	)read c05adf.input


.. spadMathAnswer
15.3.3 Providing values for Argument Subprograms
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

aspSection

There are a number of ways in which users can provide values for
argument subprograms (ASPs). At the top level the user will see that NAG
routines require an object from the Union of a Filename and an ASP.

For example c05adf requires an object of type Union(fn: FileName,fp:
Asp1 F)


.. spadInput
::

	)display operation c05adf


.. spadMathAnswer
The user thus has a choice of providing the name of a file containing
Fortran source code, or of somehow generating the ASP within FriCAS. If
a filename is specified, it is searched for in the local machine, i.e.,
the machine that FriCAS is running on.



15.3.3.1 Providing ASPs via FortranExpression
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The FortranExpression domain is used to represent expressions which can
be translated into Fortran under certain circumstances. It is very
similar to Expression except that only operators which exist in Fortran
can be used, and only certain variables can occur. For example the
instantiation FortranExpression([X],[M],MachineFloat) is the domain of
expressions containing the scalar X and the array M.

This allows us to create expressions like:


.. spadInput
::

	f : FortranExpression([X],[M],MachineFloat) := sin(X)+M[3,1]


.. spadMathAnswer
but not


.. spadInput
::

	f : FortranExpression([X],[M],MachineFloat) := sin(M)+Y


.. spadMathAnswer
Those ASPs which represent expressions usually export a coerce from an
appropriate instantiation of FortranExpression (or perhaps Vector
FortranExpression etc.). For convenience there are also retractions from
appropriate instantiations of Expression, Polynomial and Fraction
Polynomial.





15.3.3.2 Providing ASPs via FortranCode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FortranCode FortranCode allows us to build arbitrarily complex ASPs via
a kind of pseudo-code. It is described fully in
`generalFortran <generalFortran>`__ .

Every ASP exports two coerce functions: one from FortranCode and one
from List FortranCode. There is also a coerce from Record( localSymbols:
SymbolTable, code: List FortranCode) which is used for passing extra
symbol information about the ASP.

So for example, to integrate the function abs(x) we could use the
built-in abs function. But suppose we want to get back to basics and
define it directly, then we could do the following:


.. spadInput
::

	d01ajf(-1.0, 1.0, 0.0, 1.0e-5, 800, 200, -1, cond(LT(X,0), assign(F,-X),
assign(F,X))) result


.. spadMathAnswer
The condcondFortranCode operation creates a conditional clause and the
assignassignFortranCode an assignment statement.





15.3.3.3 Providing ASPs via FileName
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Suppose we have created the file asp.f as follows:


.. spadVerbatim

::

       DOUBLE PRECISION FUNCTION F(X)
       DOUBLE PRECISION X
       F=4.0D0/(X*X+1.0D0)
       RETURN
       END



and wish to pass it to the NAG routine d01ajf which performs
one-dimensional quadrature. We can do this as follows:


.. spadVerbatim

::

 d01ajf(0.0 ,1.0, 0.0, 1.0e-5, 800, 200, -1, "asp.f")









15.3.4 General Fortran-generation utilities in FriCAS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

generalFortran

This section describes more advanced facilities which are available to
users who wish to generate Fortran code from within FriCAS. There are
facilities to manipulate templates, store type information, and generate
code fragments or complete programs.



15.3.4.1 Template Manipulation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A template is a skeletal program which is fleshed out with data when it
is processed. It is a sequence of active and passive parts: active parts
are sequences of FriCAS commands which are processed as if they had been
typed into the interpreter; passive parts are simply echoed verbatim on
the Fortran output stream.

Suppose, for example, that we have the following template, stored in the
file test.tem:


.. spadVerbatim

::

 -- A simple template
 beginVerbatim
       DOUBLE PRECISION FUNCTION F(X)
       DOUBLE PRECISION X
 endVerbatim
 outputAsFortran("F",f)
 beginVerbatim
       RETURN
       END
 endVerbatim



The passive parts lie between the two tokens beginVerbatim and
endVerbatim. There are two active statements: one which is simply an
FriCAS ( \\verb+--+) comment, and one which produces an assignment to
the current value of f. We could use it as follows:


.. spadVerbatim

::

 (4) ->f := 4.0/(1+X^2)
            4
    (4)   ------
           2
          X  + 1
                        
 (5) ->processTemplate "test.tem"
       DOUBLE PRECISION FUNCTION F(X)
       DOUBLE PRECISION X
       F=4.0D0/(X*X+1.0D0)
       RETURN 
       END
    (5)  "CONSOLE"



(A more reliable method of specifying the filename will be introduced
below.) Note that the Fortran assignment F=4.0D0/(X*X+1.0D0)
automatically converted 4.0 and 1 into DOUBLE PRECISION numbers; in
general, the FriCAS Fortran generation facility will convert anything
which should be a floating point object into either a Fortran REAL or
DOUBLE PRECISION object.

Which alternative is used is determined by the command


.. spadInput
::

	)set fortran precision


.. spadMathAnswer
It is sometimes useful to end a template before the file itself ends
(e.g. to allow the template to be tested incrementally or so that a
piece of text describing how the template works can be included). It is
of course possible to comment-out the remainder of the file.
Alternatively, the single token endInput as part of an active portion of
the template will cause processing to be ended prematurely at that
point.

The processTemplate command comes in two flavours. In the first case,
illustrated above, it takes one argument of domain FileName, the name of
the template to be processed, and writes its output on the current
Fortran output stream. In general, a filename can be generated from
directory, name and extension components, using the operation filename,
as in


.. spadVerbatim

::

 processTemplate filename("","test","tem")



There is an alternative version of processTemplate, which takes two
arguments (both of domain FileName). In this case the first argument is
the name of the template to be processed, and the second is the file in
which to write the results. Both versions return the location of the
generated Fortran code as their result (CONSOLE in the above example).

It is sometimes useful to be able to mix active and passive parts of a
line or statement. For example you might want to generate a Fortran
Comment describing your data set. For this kind of application we
provide three functions as follows:

+--------------------------------------+--------------------------------------+
|  fortranLiteral                      | writes a string on the Fortran       |
|                                      | output stream                        |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  fortranCarriageReturn               | writes a carriage return on the      |
|                                      | Fortran output stream                |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  fortranLiteralLine                  | writes a string followed by a return |
|                                      | on the Fortran output stream         |
+--------------------------------------+--------------------------------------+

So we could create our comment as follows:


.. spadInput
::

	m := matrix [ [1,2,3],[4,5,6] ]


.. spadMathAnswer
.. spadInput
::

	fortranLiteralLine concat ["C      The Matrix has ", nrows(m)::String,
" rows and ", ncols(m)::String, " columns"]


.. spadMathAnswer
or, alternatively:


.. spadInput
::

	fortranLiteral "C      The Matrix has "


.. spadMathAnswer
.. spadInput
::

	fortranLiteral(nrows(m)::String)


.. spadMathAnswer
.. spadInput
::

	fortranLiteral " rows and "


.. spadMathAnswer
.. spadInput
::

	fortranLiteral(ncols(m)::String)


.. spadMathAnswer
.. spadInput
::

	fortranLiteral " columns"


.. spadMathAnswer
.. spadInput
::

	fortranCarriageReturn()


.. spadMathAnswer
We should stress that these functions, together with the outputAsFortran
function are the only sure ways of getting output to appear on the
Fortran output stream. Attempts to use FriCAS commands such as output or
writeline may appear to give the required result when displayed on the
console, but will give the wrong result when Fortran and algebraic
output are sent to differing locations. On the other hand, these
functions can be used to send helpful messages to the user, without
interfering with the generated Fortran.





15.3.4.2 Manipulating the Fortran Output Stream
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FortranOutputStackPackage

Sometimes it is useful to manipulate the Fortran output stream in a
program, possibly without being aware of its current value. The main use
of this is for gathering type declarations (see Fortran Types below) but
it can be useful in other contexts as well. Thus we provide a set of
commands to manipulate a stack of (open) output streams. Only one stream
can be written to at any given time. The stack is never empty---its
initial value is the console or the current value of the Fortran output
stream, and can be determined using


.. spadInput
::

	topFortranOutputStack()


.. spadMathAnswer
(see below). The commands available to manipulate the stack are:

+--------------------------------------+--------------------------------------+
|  clearFortranOutputStack             | resets the stack to the console      |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  pushFortranOutputStack              | pushes a FileName onto the stack     |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  popFortranOutputStack               | pops the stack                       |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  showFortranOutputStack              | returns the current stack            |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  topFortranOutputStack               | returns the top element of the stack |
+--------------------------------------+--------------------------------------+

These commands are all part of FortranOutputStackPackage.





15.3.4.3 Fortran Types
~~~~~~~~~~~~~~~~~~~~~~

When generating code it is important to keep track of the Fortran types
of the objects which we are generating. This is useful for a number of
reasons, not least to ensure that we are actually generating legal
Fortran code. The current type system is built up in several layers, and
we shall describe each in turn.





15.3.4.4 FortranScalarType
~~~~~~~~~~~~~~~~~~~~~~~~~~

FortranScalarType

This domain represents the simple Fortran datatypes: REAL, DOUBLE
PRECISION, COMPLEX, LOGICAL, INTEGER, and CHARACTER. It is possible to
coerce a String or Symbol into the domain, test whether two objects are
equal, and also apply the predicate functions
real?real?FortranScalarType etc.





15.3.4.5 FortranType
~~~~~~~~~~~~~~~~~~~~

FortranType

This domain represents full types: i.e., datatype plus array dimensions
(where appropriate) plus whether or not the parameter is an external
subprogram. It is possible to coerce an object of FortranScalarType into
the domain or construct one from an element of FortranScalarType, a list
of Polynomial Integers (which can of course be simple integers or
symbols) representing its dimensions, and a Boolean declaring whether it
is external or not. The list of dimensions must be empty if the Boolean
is true. The functions scalarTypeOf, dimensionsOf and external? return
the appropriate parts, and it is possible to get the various basic
Fortran Types via functions like fortranReal.

For example:


.. spadInput
::

	type:=construct(real,[i,10],false)$FortranType


.. spadMathAnswer
or


.. spadInput
::

	type:=[real,[i,10],false]$FortranType


.. spadMathAnswer
.. spadInput
::

	scalarTypeOf type


.. spadMathAnswer
.. spadInput
::

	dimensionsOf type


.. spadMathAnswer
.. spadInput
::

	external? type


.. spadMathAnswer
.. spadInput
::

	fortranLogical()


.. spadMathAnswer
.. spadInput
::

	construct(integer,[],true)$FortranType


.. spadMathAnswer
15.3.4.6 SymbolTable
~~~~~~~~~~~~~~~~~~~~

SymbolTable

This domain creates and manipulates a symbol table for generated Fortran
code. This is used by FortranProgram to represent the types of objects
in a subprogram. The commands available are:

+--------------------------------------+--------------------------------------+
|  empty                               | creates a new SymbolTable            |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  declare                             | creates a new entry in a table       |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  fortranTypeOf                       | returns the type of an object in a   |
|                                      | table                                |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  parametersOf                        | returns a list of all the symbols in |
|                                      | the table                            |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  typeList                            | returns a list of all objects of a   |
|                                      | given type                           |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  typeLists                           | returns a list of lists of all       |
|                                      | objects sorted by type               |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  externalList                        | returns a list of all EXTERNAL       |
|                                      | objects                              |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  printTypes                          | produces Fortran type declarations   |
|                                      | from a table                         |
+--------------------------------------+--------------------------------------+


.. spadInput
::

	symbols := empty()$SymbolTable


.. spadMathAnswer
.. spadInput
::

	declare!(X,fortranReal(),symbols)


.. spadMathAnswer
.. spadInput
::

	declare!(M,construct(real,[i,j],false)$FortranType,symbols)


.. spadMathAnswer
.. spadInput
::

	declare!([i,j],fortranInteger(),symbols)


.. spadMathAnswer
.. spadInput
::

	symbols


.. spadMathAnswer
.. spadInput
::

	fortranTypeOf(i,symbols)


.. spadMathAnswer
.. spadInput
::

	typeList(real,symbols)


.. spadMathAnswer
.. spadInput
::

	printTypes symbols


.. spadMathAnswer
15.3.4.7 TheSymbolTable
~~~~~~~~~~~~~~~~~~~~~~~

TheSymbolTable

This domain creates and manipulates one global symbol table to be used,
for example, during template processing. It is also used when linking to
external Fortran routines. The information stored for each subprogram
(and the main program segment, where relevant) is:

-  its name;
-  its return type;
-  its argument list;
-  and its argument types.

Initially, any information provided is deemed to be for the main program
segment.

Issuing the following command indicates that from now on all information
refers to the subprogram F.


.. spadInput
::

	newSubProgram F


.. spadMathAnswer
It is possible to return to processing the main program segment by
issuing the command:


.. spadInput
::

	endSubProgram()


.. spadMathAnswer
The following commands exist:

+--------------------------------------+--------------------------------------+
|  returnType                          | declares the return type of the      |
|                                      | current subprogram                   |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  returnTypeOf                        | returns the return type of a         |
|                                      | subprogram                           |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  argumentList                        | declares the argument list of the    |
|                                      | current subprogram                   |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  argumentListOf                      | returns the argument list of a       |
|                                      | subprogram                           |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  declare                             | provides type declarations for       |
|                                      | parameters of the current subprogram |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  symbolTableOf                       | returns the symbol table of a        |
|                                      | subprogram                           |
+--------------------------------------+--------------------------------------+
+--------------------------------------+--------------------------------------+
|  printHeader                         | produces the Fortran header for the  |
|                                      | current subprogram                   |
+--------------------------------------+--------------------------------------+

In addition there are versions of these commands which are parameterised
by the name of a subprogram, and others parameterised by both the name
of a subprogram and by an instance of TheSymbolTable.


.. spadInput
::

	newSubProgram F


.. spadMathAnswer
.. spadInput
::

	argumentList!(F,[X])


.. spadMathAnswer
.. spadInput
::

	returnType!(F,real)


.. spadMathAnswer
.. spadInput
::

	declare!(X,fortranReal(),F)


.. spadMathAnswer
.. spadInput
::

	printHeader F


.. spadMathAnswer
15.3.4.8 Advanced Fortran Code Generation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section describes facilities for representing Fortran statements,
and building up complete subprograms from them.





15.3.4.9 Switch
~~~~~~~~~~~~~~~

Switch

This domain is used to represent statements like x < y. Although these
can be represented directly in FriCAS, it is a little cumbersome, since
FriCAS evaluates the last statement, for example, to true (since x is
lexicographically less than y).

Instead we have a set of operations, such as LT to represent <, to let
us build such statements. The available constructors are:



+--------+-------+
|  LT    | <     |
+--------+-------+
|  GT    | >     |
+--------+-------+
|  LE    | ≤     |
+--------+-------+
|  GE    | ≤     |
+--------+-------+
|  EQ    | =     |
+--------+-------+
|  AND   | and   |
+--------+-------+
|  OR    | or    |
+--------+-------+
|  NOT   | not   |
+--------+-------+



So for example:


.. spadInput
::

	LT(x,y)


.. spadMathAnswer
15.3.4.10 FortranCode
~~~~~~~~~~~~~~~~~~~~~

This domain represents code segments or operations: currently
assignments, conditionals, blocks, comments, gotos, continues, various
kinds of loops, and return statements.

For example we can create quite a complicated conditional statement
using assignments, and then turn it into Fortran code:


.. spadInput
::

	c := cond(LT(X,Y),assign(F,X),cond(GT(Y,Z),assign(F,Y),assign(F,Z)))


.. spadMathAnswer
.. spadInput
::

	printCode c


.. spadMathAnswer
The Fortran code is printed on the current Fortran output stream.





15.3.4.11 FortranProgram
~~~~~~~~~~~~~~~~~~~~~~~~

FortranProgram

This domain is used to construct complete Fortran subprograms out of
elements of FortranCode. It is parameterised by the name of the target
subprogram (a Symbol), its return type (from
Union(FortranScalarType,void)), its arguments (from List Symbol), and
its symbol table (from SymbolTable). One can coerce elements of either
FortranCode or Expression into it.

First of all we create a symbol table:


.. spadInput
::

	symbols := empty()$SymbolTable


.. spadMathAnswer
Now put some type declarations into it:


.. spadInput
::

	declare!([X,Y],fortranReal(),symbols)


.. spadMathAnswer
Then (for convenience) we set up the particular instantiation of
FortranProgram


.. spadInput
::

	FP := FortranProgram(F,real,[X,Y],symbols)


.. spadMathAnswer
Create an object of type Expression(Integer):


.. spadInput
::

	asp := X*sin(Y)


.. spadMathAnswer
Now coerce it into FP, and print its Fortran form:


.. spadInput
::

	outputAsFortran(asp::FP)


.. spadMathAnswer
We can generate a FortranProgram using FortranCode. For example:

Augment our symbol table:


.. spadInput
::

	declare!(Z,fortranReal(),symbols)


.. spadMathAnswer
and transform the conditional expression we prepared earlier:


.. spadInput
::

	outputAsFortran([c,returns()]::FP)


.. spadMathAnswer
15.3.5 Some technical information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nagTechnical

The model adopted for the link is a server-client configuration --
FriCAS acting as a client via a local agent (a process called nagman).
The server side is implemented by the nagd daemon process which may run
on a different host. The nagman local agent is started by default
whenever you start FriCAS. The nagd server must be started separately.
Instructions for installing and running the server are supplied in
`nugNagd <nugNagd>`__ . Use the )set naglink host system command to
point your local agent to a server in your network.

On the FriCAS side, one sees a set of packages (ask Browse for Nag*)
for each chapter, each exporting operations with the same name as a
routine in the Nag Library. The arguments and return value of each
operation belong to standard FriCAS types.

The man pages for the Nag Library are accessible via the description of
each operation in Browse (among other places).

In the implementation of each operation, the set of inputs is passed to
the local agent nagman, which makes a Remote Procedure Call (RPC) to the
remote nagd daemon process. The local agent receives the RPC results and
forwards them to the FriCAS workspace where they are interpreted
appropriately.

How are Fortran subroutines turned into RPC calls? For each Fortran
routine in the Nag Library, a C main() routine is supplied. Its job is
to assemble the RPC input (numeric) data stream into the appropriate
Fortran data structures for the routine, call the Fortran routine from C
and serialize the results into an RPC output data stream.

Many Nag Library routines accept ASPs (Argument Subprogram Parameters).
These specify user-supplied Fortran routines (e.g. a routine to supply
values of a function is required for numerical integration). How are
they handled? There are new facilities in FriCAS to help. A set of
FriCAS domains has been provided to turn values in standard FriCAS types
(such as Expression Integer) into the appropriate piece of Fortran for
each case (a filename pointing to Fortran source for the ASP can always
be supplied instead). Ask Browse for Asp* to see these domains. The
Fortran fragments are included in the outgoing RPC stream, but nagd
intercepts them, compiles them, and links them with the main() C program
before executing the resulting program on the numeric part of the RPC
stream.





