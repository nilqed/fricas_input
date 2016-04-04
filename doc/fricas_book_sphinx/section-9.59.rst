.. status: ok



9.59 OrderedVariableList
------------------------

The domain OrderedVariableList provides symbols which are restricted to
a particular list and have a definite ordering. Those two features are
specified by a List Symbol object that is the argument to the domain.

This is a sample ordering of three symbols.


.. spadInput
::

	ls:List Symbol:=['x,'a,'z]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [x,a,z]   |
+-----------+




.. spadType

:sub:`Type: List Symbol`



Let's build the domain


.. spadInput
::

	Z:=OVAR ls


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| OrderedVariableList[x,a,z]   |
+------------------------------+




.. spadType

:sub:`Type: Domain`



How many variables does it have?


.. spadInput
::

	size()$Z


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



They are (in the imposed order)


.. spadInput
::

	lv:=[index(i::PI)$Z for i in 1..size()$Z]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [x,a,z]   |
+-----------+




.. spadType

:sub:`Type: List OrderedVariableList [x,a,z]`



Check that the ordering is right


.. spadInput
::

	sorted?(>,lv)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`





