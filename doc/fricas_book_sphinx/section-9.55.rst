.. status: ok


9.55 None
---------

The None domain is not very useful for interactive work but it is
provided nevertheless for completeness of the FriCAS type system.

Probably the only place you will ever see it is if you enter an empty
list with no type information.


.. spadInput
::

	[ ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| []   |
+------+




.. spadType

:sub:`Type: List None`



Such an empty list can be converted into an empty list of any other
type.


.. spadInput
::

	[ ] :: List Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| []   |
+------+




.. spadType

:sub:`Type: List Float`



If you wish to produce an empty list of a particular type directly, such
as List NonNegativeInteger, do it this way.


.. spadInput
::

	[ ]$List(NonNegativeInteger)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| []   |
+------+




.. spadType

:sub:`Type: List NonNegativeInteger`





