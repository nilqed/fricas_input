.. status: ok


9.49 Magma
----------

Initialisations


.. spadInput
::

	x:Symbol :='x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	y:Symbol :='y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	z:Symbol :='z


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| z   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	word := OrderedFreeMonoid(Symbol)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| OrderedFreeMonoidSymbol   |
+---------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	tree := Magma(Symbol)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| MagmaSymbol   |
+---------------+




.. spadType

:sub:`Type: Domain`



Let's make some trees


.. spadInput
::

	a:tree := x*x


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [x,x]   |
+---------+




.. spadType

:sub:`Type: Magma Symbol`




.. spadInput
::

	b:tree := y*y


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [y,y]   |
+---------+




.. spadType

:sub:`Type: Magma Symbol`




.. spadInput
::

	c:tree := a*b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [[x,x],[y,y]]   |
+-----------------+




.. spadType

:sub:`Type: Magma Symbol`



Query the trees


.. spadInput
::

	left c


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [x,x]   |
+---------+




.. spadType

:sub:`Type: Magma Symbol`




.. spadInput
::

	right c


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [y,y]   |
+---------+




.. spadType

:sub:`Type: Magma Symbol`




.. spadInput
::

	length c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Coerce to the monoid


.. spadInput
::

	c::word


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x2y2   |
+--------+




.. spadType

:sub:`Type: OrderedFreeMonoid Symbol`



Check ordering


.. spadInput
::

	a < b


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	a < c


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	b < c


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Navigate the tree


.. spadInput
::

	first c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	rest c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [x,[y,y]]   |
+-------------+




.. spadType

:sub:`Type: Magma Symbol`




.. spadInput
::

	rest rest c


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [y,y]   |
+---------+




.. spadType

:sub:`Type: Magma Symbol`



Check ordering


.. spadInput
::

	ax:tree := a*x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [[x,x],x]   |
+-------------+




.. spadType

:sub:`Type: Magma Symbol`




.. spadInput
::

	xa:tree := x*a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [x,[x,x]]   |
+-------------+




.. spadType

:sub:`Type: Magma Symbol`




.. spadInput
::

	xa < ax


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	lexico(xa,ax)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`





