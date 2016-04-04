.. status: ok


4.2 The .axiom.input File
-------------------------

When FriCAS starts up, it tries to read the input file .axiom.input
(.axiom.input used to be called axiom.input in the NAG version) from
your home start-up profile file directory. file:start-up profile It
there is no .axiom.input in your home directory, it reads the copy
located in its own src/input directory. file:.axiom.input @.axiom.input
The file usually contains system commands to personalize your FriCAS
environment. In the remainder of this section we mention a few things
that users frequently place in their .axiom.input files.

In order to have FORTRAN output always produced from your computations,
place the system command )set output fortran on in .axiom.input. quit If
you do not want to be prompted for confirmation when you issue the )quit
system command, place )set quit unprotected in .axiom.input. set quit
unprotected If you then decide that you do want to be prompted, issue
)set quit protected. set quit protected This is the default setting so
that new users do not leave FriCAS inadvertently.The system command
)pquit always prompts you for confirmation.

To see the other system variables you can set, issue )set or use the
HyperDoc Settings facility to view and change FriCAS system variables.



