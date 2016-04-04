.. status: ok


1.15 System Commands
--------------------

We conclude our tour of FriCAS with a brief discussion of system
commands. System commands are special statements that start with a
closing parenthesis ``)``. They are used to control or display your FriCAS
environment, start the HyperDoc system, issue operating system commands
and leave FriCAS. For example, ``)system`` is used to issue commands to the
operating system from FriCAS. Here is a brief description of some of
these commands. For more information on specific commands, see Appendix
A .

Perhaps the most important user command is the ``)clear all`` command that
initializes your environment. Every section and subsection in this
document has an invisible ``)clear all`` that is read prior to the examples
given in the section. ``)clear all`` gives you a fresh, empty environment
with no user variables defined and the step number reset to 1. The
``)clear`` command can also be used to selectively clear values and
properties of system variables.

Another useful system command is ``)read``. A preferred way to develop an
application in FriCAS is to put your interactive commands into a file,
say my.input file. To get FriCAS to read this file, you use the system
command ``)read my.input``. If you need to make changes to your approach or
definitions, go into your favorite editor, change my.input, then )read
my.input again.

Other system commands include: ``)history``, to display previous input
and/or output lines; ``)display``, to display properties and values of
workspace variables; and ``)what``.

Issue ``)what`` to get a list of FriCAS objects that contain a given
substring in their name.


.. spadInput
::

	)what operations integrate


.. spadMathAnswer
.. spadVerbatim

::

 Operations whose names satisfy the above pattern(s):
 
 HermiteIntegrate       algintegrate           complexIntegrate       
 expintegrate           extendedIntegrate      fintegrate             
 infieldIntegrate       integrate              internalIntegrate      
 internalIntegrate0     lazyGintegrate         lazyIntegrate          
 lfintegrate            limitedIntegrate       monomialIntegrate      
 nagPolygonIntegrate    palgintegrate          pmComplexintegrate     
 pmintegrate            primintegrate          tanintegrate           
    
 To get more information about an operation such as 
 limitedIntegrate , issue the command )display op limitedIntegrate





1.15.1 Undo
~~~~~~~~~~~

A useful system command is ``)undo``. Sometimes while computing
interactively with FriCAS, you make a mistake and enter an incorrect
definition or assignment. Or perhaps you need to try one of several
alternative approaches, one after another, to find the best way to
approach an application. For this, you will find the undo facility of
FriCAS helpful.

System command ``)undo n`` means undo back to step n; it restores the values
of user variables to those that existed immediately after input
expression n was evaluated. Similarly, ``)undo -n`` undoes changes caused by
the last n input expressions. Once you have done an )undo, you can
continue on from there, or make a change and redo all your input
expressions from the point of the )undo forward. The )undo is completely
general: it changes the environment like any user expression. Thus you
can )undo any previous undo.

Here is a sample dialogue between user and FriCAS.

Let me define two mutually dependent functions f and g piece-wise.


.. spadInput
::

	f(0) == 1; g(0) == 1


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



Here is the general term for f.


.. spadInput
::

	f(n) == e/2*f(n-1) - x*g(n-1)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



And here is the general term for g.


.. spadInput
::

	g(n) == -x*f(n-1) + d/3*g(n-1)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



What is value of f(3)?


.. spadInput
::

	f(3)


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{x} ^ {3}}+{{\left( e+{{1 \over 3} \  d}\right)}
  \  {{x} ^ {2}}}+{{\left( -{{1 \over 4} \ 
     {{e} ^ {2}}} -{{1 \over 6} \  d
   \  e} -{{1 \over 9} \  {{d} ^ {2}}}\right)}
   \  x}+{{1 \over 8} \  {{e} ^ {3}}}


.. spadType
:sub:`Type: Polynomial Fraction Integer`



Hmm, I think I want to define f differently. Undo to the environment
right after I defined f.


.. spadInput
::

	)undo 2


.. spadMathAnswer
Here is how I think I want f to be defined instead.


.. spadInput
::

	f(n) == d/3*f(n-1) - x*g(n-1)


.. spadMathAnswer
.. spadVerbatim

::

    1 old definition(s) deleted for function or rule f 




.. spadType
:sub:`Type: Void`



Redo the computation from expression 3 forward.


.. spadInput
::

	)undo )redo


.. spadMathAnswer
.. spadVerbatim

::

  g(n) == -x*f(n-1) + d/3*g(n-1)
  
  Type: Void
 
  f(3)
  
    Compiling function g with type Integer -> Polynomial Fraction 
       Integer 
    Compiling function g as a recurrence relation.
  +++ |*1;g;1;G82322;AUX| redefined
  +++ |*1;g;1;G82322| redefined
    Compiling function g with type Integer -> Polynomial Fraction 
       Integer 
    Compiling function g as a recurrence relation.
  +++ |*1;g;1;G82322;AUX| redefined
  +++ |*1;g;1;G82322| redefined
    Compiling function f with type Integer -> Polynomial Fraction 
       Integer 
    Compiling function f as a recurrence relation.
  +++ |*1;f;1;G82322;AUX| redefined
  +++ |*1;f;1;G82322| redefined



.. spadMathOutput
.. math::

 -{{x} ^ {3}}+{d \  {{x} ^ {2}}} -{{1 \over 3} \  {{d} ^ {2}} 
  \  x}+{{\over {27}} \  {{d} ^ {3}}}

.. spadType
:sub:`Type: Polynomial Fraction Integer`



I want my old definition of f after all. Undo the undo and restore the
environment to that immediately after (4).


.. spadInput
::

	)undo 4


.. spadMathAnswer
Check that the value of f(3) is restored.


.. spadInput
::

	f(3)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function g with type Integer -> Polynomial Fraction 
       Integer 
    Compiling function g as a recurrence relation.
 +++ |*1;g;1;G82322;AUX| redefined
 +++ |*1;g;1;G82322| redefined
    Compiling function g with type Integer -> Polynomial Fraction 
       Integer 
    Compiling function g as a recurrence relation.
 +++ |*1;g;1;G82322;AUX| redefined
 +++ |*1;g;1;G82322| redefined
    Compiling function f with type Integer -> Polynomial Fraction 
       Integer 
    Compiling function f as a recurrence relation.
 +++ |*1;f;1;G82322;AUX| redefined
 +++ |*1;f;1;G82322| redefined




.. spadMathOutput
.. math::

  -{{x} ^ {3}}+{{\left( e+{{1 \over 3} \  d}\right)}
  \  {{x} ^ {2}}}+{{\left( -{{1 \over 4} 
  \  {{e} ^ {2}}} -{{1 \over 6} \  d
  \  e} -{{1 \over 9} \  {{d} ^ {2}}}\right)}
  \  x}+{{1 \over 8} \  {{e} ^ {3}}}


.. spadType
:sub:`Type: Polynomial Fraction Integer`



After you have gone off on several tangents, then backtracked to
previous points in your conversation using )undo, you might want to save
all the correct input commands you issued, disregarding those undone.
The system command )history )write mynew.input writes a clean
straight-line program onto the file mynew.input on your disk.


