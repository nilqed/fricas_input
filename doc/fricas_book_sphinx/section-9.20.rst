.. status: ok


9.20 Exit
---------

A function that does not return directly to its caller has Exit as its
return type. The operation error is an example of one which does not
return to its caller. Instead, it causes a return to top-level.


.. spadInput
::

	n := 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



The function gasp is given return type Exit since it is guaranteed never
to return a value to its caller.


.. spadVerbatim

::

 gasp(): Exit ==
     free n
     n := n + 1
     error "Oh no!"
  
 Function declaration gasp : () -> Exit has been added to workspace.




.. spadType

:sub:`Type: Void`



The return type of half is determined by resolving the types of the two
branches of the if.


.. spadVerbatim

::

 half(k) ==
   if odd? k then gasp()
   else k quo 2



Because gasp has the return type Exit, the type of if in half is
resolved to be Integer.


.. spadInput
::

	half 4


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function gasp with type () -> Exit 
    Compiling function half with type PositiveInteger -> Integer 




.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	half 3


.. spadMathAnswer
.. spadVerbatim

::

    Error signalled from user code in function gasp: 
       Oh no!




.. spadInput
::

	n


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



For functions which return no value at all, use Void. See
`ugUserPage <ugUserPage>`__ in Section `ugUserNumber <ugUserNumber>`__
and `VoidXmpPage <section-9.86.html#VoidXmpPage>`__ for more
information.



