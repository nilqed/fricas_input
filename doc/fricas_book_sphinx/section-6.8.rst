.. status: ok



6.8 Delayed Assignments vs. Functions with No Arguments
-------------------------------------------------------

In `ugLangAssign <section-5.1.html#ugLangAssign>`__ we discussed the
difference between immediate and function:with no arguments delayed
assignments. In this section we show the difference between delayed
assignments and functions of no arguments.

A function of no arguments is sometimes called a nullary function.


.. spadInput
::

	sin24() == sin(24.0)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



You must use the parentheses () to evaluate it. Like a delayed
assignment, the right-hand-side of a function evaluation is not
evaluated until the left-hand-side is used.


.. spadInput
::

	sin24()


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function sin24 with type () -> Float 




.. spadMathOutput
.. math::

+---------------------------+
| -0.90557836200662384514   |
+---------------------------+




.. spadType

:sub:`Type: Float`



If you omit the parentheses, you just get the function definition.


.. spadInput
::

	sin24


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| sin24()==sin(24.0)   |
+----------------------+




.. spadType

:sub:`Type: FunctionCalled sin24`



You do not use the parentheses () in a delayed assignment...


.. spadInput
::

	cos24 == cos(24.0)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



nor in the evaluation.


.. spadInput
::

	cos24


.. spadMathAnswer
.. spadVerbatim

::

    Compiling body of rule cos24 to compute value of type Float 




.. spadMathOutput
.. math::

+--------------------------+
| 0.42417900733699697594   |
+--------------------------+




.. spadType

:sub:`Type: Float`



The only syntactic difference between delayed assignments and nullary
functions is that you use () in the latter case.



