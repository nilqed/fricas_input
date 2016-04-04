.. status: ok


11.4 Capsules
-------------

The part to the right of add in the Implementation add part of the
definition is called a capsule. The purpose of a capsule is:

-  to define a function for each exported operation, and
-  to define a local environment for these functions to run.

What is a local environment? First, what is an environment? environment
Think of the capsule as an input file that FriCAS reads from top to
bottom. Think of the input file as having a )clear all at the top so
that initially no variables or functions are defined. When this file is
read, variables such as realSteps and arrowSize in DrawComplex are set
to initial values. Also, all the functions defined in the capsule are
compiled. These include those that are exported (like drawComplex), and
those that are not (like makeArrow). At the end, you get a set of
name-value pairs: variable names (like realSteps and arrowSize) are
paired with assigned values, while operation names (like drawComplex and
makeArrow) are paired with function values.

This set of name-value pairs is called an environment. Actually, we call
this environment the initial environment of a package: it is the
environment that exists immediately after the package is first built.
Afterwards, functions of this capsule can access or reset a variable in
the environment. The environment is called local since any changes to
the value of a variable in this environment can be seen only by these
functions.

Only the functions from the package can change the variables in the
local environment. When two functions are called successively from a
package, any changes caused by the first function called are seen by the
second.

Since the environment is local to the package, its names don't get mixed
up with others in the system or your workspace. If you happen to have a
variable called realSteps in your workspace, it does not affect what the
DrawComplex functions do in any way.

The functions in a package are compiled into machine code. Unlike
function definitions in input files that may be compiled repeatedly as
you use them with varying argument types, functions in packages have a
unique type (generally parameterized by the argument parameters of a
package) and a unique compilation residing on disk.

The capsule itself is turned into a compiled function. This so-called
capsule function is what builds the initial environment spoken of above.
If the package has arguments (see below), then each call to the package
constructor with a distinct pair of arguments builds a distinct package,
each with its own local environment.



