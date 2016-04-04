.. status: ok



15.2 The New FriCAS Library Compiler
------------------------------------

ugWhatsNewAsharp

A new compiler is now available for FriCAS. The programming language is
referred to as the Aldor, and improves upon the old FriCAS language in
many ways. The )compile command has been upgraded to be able to invoke
the new or old compilers. The language and the compiler are described in
the hard-copy documentation which came with your FriCAS system.

To ease the chore of upgrading your .spad files (old compiler) to .as
files (new compiler), the )compile command has been given a )translate
option. This invokes a special version of the old compiler which parses
and analyzes your old code and produces augmented code using the new
syntax. Please be aware that the translation is not necessarily one
hundred percent complete or correct. You should attempt to compile the
output with the Aldor compiler and make any necessary corrections.



