.. status: ok


11.5 Input Files vs. Packages
-----------------------------

A good question at this point would be Is writing a package more
difficult than writing an input file?

The programs in input files are designed for flexibility and
ease-of-use. FriCAS can usually work out all of your types as it reads
your program and does the computations you request. Let's say that you
define a one-argument function without giving its type. When you first
apply the function to a value, this value is understood by FriCAS as
identifying the type for the argument parameter. Most of the time FriCAS
goes through the body of your function and figures out the target type
that you have in mind. FriCAS sometimes fails to get it right.
Then---and only then---do you need a declaration to tell FriCAS what
type you want.

Input files are usually written to be read by FriCAS---and by you.
file:input:vs. package Without suitable documentation and declarations,
your input files package:vs. input file are likely incomprehensible to a
colleague---and to you some months later!

Packages are designed for legibility, as well as run-time efficiency.
There are few new concepts you need to learn to write packages. Rather,
you just have to be explicit about types and type conversions. The types
of all functions are pre-declared so that FriCAS---and the reader---
knows precisely what types of arguments can be passed to and from the
functions (certainly you don't want a colleague to guess or to have to
work this out from context!). The types of local variables are also
declared. Type conversions are explicit, never automatic.There is one
exception to this rule: conversions from a subdomain to a domain are
automatic. After all, the objects both have the domain as a common type.

In summary, packages are more tedious to write than input files. When
writing input files, you can casually go ahead, giving some facts now,
leaving others for later. Writing packages requires forethought, care
and discipline.



