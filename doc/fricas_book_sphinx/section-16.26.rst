.. status: ok


16.26 )trace
------------

ugSysCmdtrace

trace

 User Level Required: interpreter

 Command Syntax:





)trace





)trace )off





)trace function [options]





)trace constructor [options]





)trace domainOrPackage [options]





where options can be one or more of





)after S-expression





)before S-expression





)break after





)break before





)cond S-expression





)count





)count n





)depth n





)local op1 [... opN]





)nonquietly





)nt





)off





)only listOfDataToDisplay





)ops





)ops op1 [... opN ]





)restore





)stats





)stats reset





)timer





)varbreak





)varbreak var1 [... varN ]





)vars





)vars var1 [... varN ]





)within executingFunction





 Command Description:

This command is used to trace the execution of functions that make up
the FriCAS system, functions defined by users, and functions from the
system library. Almost all options are available for each type of
function but exceptions will be noted below.

To list all functions, constructors, domains and packages that are
traced, simply issue


.. spadVerbatim

::

 )trace



To untrace everything that is traced, issue


.. spadVerbatim

::

 )trace )off



When a function is traced, the default system action is to display the
arguments to the function and the return value when the function is
exited. Note that if a function is left via an action such as a THROW,
no return value will be displayed. Also, optimization of tail recursion
may decrease the number of times a function is actually invoked and so
may cause less trace information to be displayed. Other information can
be displayed or collected when a function is traced and this is
controlled by the various options. Most options will be of interest only
to FriCAS system developers. If a domain or package is traced, the
default action is to trace all functions exported.

Individual interpreter, lisp or boot functions can be traced by listing
their names after )trace. Any options that are present must follow the
functions to be traced.


.. spadVerbatim

::

 )trace f



traces the function f. To untrace f, issue


.. spadVerbatim

::

 )trace f )off



Note that if a function name contains a special character, it will be
necessary to escape the character with an underscore


.. spadVerbatim

::

 )trace _/D_,1



To trace all domains or packages that are or will be created from a
particular constructor, give the constructor name or abbreviation after
)trace.


.. spadVerbatim

::

 )trace MATRIX
 )trace List Integer



The first command traces all domains currently instantiated with Matrix.
If additional domains are instantiated with this constructor (for
example, if you have used Matrix(Integer) and Matrix(Float)), they will
be automatically traced. The second command traces List(Integer). It is
possible to trace individual functions in a domain or package. See the
)ops option below.

The following are the general options for the )trace command.

)break after
    causes a Common Lisp break loop to be entered after exiting the
    traced function.
)break before
    causes a Common Lisp break loop to be entered before entering the
    traced function.
)break
    is the same as )break before.
)count
    causes the system to keep a count of the number of times the traced
    function is entered. The total can be displayed with )trace )stats
    and cleared with )trace )stats reset.
)count n
    causes information about the traced function to be displayed for the
    first n executions. After the n-th execution, the function is
    untraced.
)depth n
    causes trace information to be shown for only n levels of recursion
    of the traced function. The command


.. spadVerbatim

::

     )trace fib )depth 10



    will cause the display of only 10 levels of trace information for
    the recursive execution of a user function fib.
)math
    causes the function arguments and return value to be displayed in
    the FriCAS monospace two-dimensional math format.
)nonquietly
    causes the display of additional messages when a function is traced.
)nt
    This suppresses all normal trace information. This option is useful
    if the )count or )timer options are used and you are interested in
    the statistics but not the function calling information.
)off
    causes untracing of all or specific functions. Without an argument,
    all functions, constructors, domains and packages are untraced.
    Otherwise, the given functions and other objects are untraced. To
    immediately retrace the untraced functions, issue )trace )restore.
)only listOfDataToDisplay
    causes only specific trace information to be shown. The items are
    listed by using the following abbreviations:

    a
        display all arguments
    v
        display return value
    1
        display first argument
    2
        display second argument
    15
        display the 15th argument, and so on

)restore
    causes the last untraced functions to be retraced. If additional
    options are present, they are added to those previously in effect.
)stats
    causes the display of statistics collected by the use of the )count
    and )timer options.
)stats reset
    resets to 0 the statistics collected by the use of the )count and
    )timer options.
)timer
    causes the system to keep a count of execution times for the traced
    function. The total can be displayed with )trace )stats and cleared
    with )trace )stats reset.
)varbreak var1 [... varN]
    causes a Common Lisp break loop to be entered after the assignment
    to any of the listed variables in the traced function.
)vars
    causes the display of the value of any variable after it is assigned
    in the traced function. Note that library code must have been
    compiled (see `ugSysCmdcompile <ugSysCmdcompile>`__ ) using the
    )vartrace option in order to support this option.
)vars var1 [... varN]
    causes the display of the value of any of the specified variables
    after they are assigned in the traced function. Note that library
    code must have been compiled (see
    `ugSysCmdcompile <ugSysCmdcompile>`__ ) using the )vartrace option
    in order to support this option.
)within executingFunction
    causes the display of trace information only if the traced function
    is called when the given executingFunction is running.

The following are the options for tracing constructors, domains and
packages.

)local [op1 [... opN]]
    causes local functions of the constructor to be traced. Note that to
    untrace an individual local function, you must use the fully
    qualified internal name, using the escape character _ before the
    semicolon.


.. spadVerbatim

::

     )trace FRAC )local
     )trace FRAC_;cancelGcd )off



)ops op1 [... opN]
    By default, all operations from a domain or package are traced when
    the domain or package is traced. This option allows you to specify
    that only particular operations should be traced. The command


.. spadVerbatim

::

     )trace Integer )ops min max _+ _-



    traces four operations from the domain Integer. Since + and - are
    special characters, it is necessary to escape them with an
    underscore.

 Also See: )boot ugSysCmdboot, )lisp ugSysCmdlisp, and )ltrace
ugSysCmdltrace.



