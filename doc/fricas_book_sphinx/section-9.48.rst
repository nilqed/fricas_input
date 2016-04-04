.. status: ok


9.48 LyndonWord
---------------

Initialisations


.. spadInput
::

	a:Symbol :='a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| a   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	b:Symbol :='b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| b   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	c:Symbol :='c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| c   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	lword:= LyndonWord(Symbol)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| LyndonWordSymbol   |
+--------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	magma := Magma(Symbol)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| MagmaSymbol   |
+---------------+




.. spadType

:sub:`Type: Domain`




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



All Lyndon words with a, b, c to order 3


.. spadInput
::

	LyndonWordsList1([a,b,c],3)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------+
| [[[a],[b],[c]],[[ab],[ac],[bc]],[[a2b],[a2c],[ab2],[abc],[acb],[ac2],[b2c],[bc2]]]   |
+--------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: OneDimensionalArray List LyndonWord Symbol`



All Lyndon words of with a, b, c to order 3 in flat list


.. spadInput
::

	LyndonWordsList([a,b,c],3)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------+
| [[a],[b],[c],[ab],[ac],[bc],[a2b],[a2c],[ab2],[abc],[acb],[ac2],[b2c],[bc2]]   |
+--------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List LyndonWord Symbol`



All Lyndon words of with a, b to order 5


.. spadInput
::

	lw := LyndonWordsList([a,b],5)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------+
| [[a],[b],[ab],[a2b],[ab2],[a3b],[a2b2],[ab3],[a4b],[a3b2],[a2bab],[a2b3],[abab2],[ab4]]   |
+-------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List LyndonWord Symbol`




.. spadInput
::

	w1 : word := lw.4 :: word


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| a2b   |
+-------+




.. spadType

:sub:`Type: OrderedFreeMonoid Symbol`




.. spadInput
::

	w2 : word := lw.5 :: word


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| ab2   |
+-------+




.. spadType

:sub:`Type: OrderedFreeMonoid Symbol`



Let's try factoring


.. spadInput
::

	factor(a::word)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [[a]]   |
+---------+




.. spadType

:sub:`Type: List LyndonWord Symbol`




.. spadInput
::

	factor(w1*w2)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [[a2bab2]]   |
+--------------+




.. spadType

:sub:`Type: List LyndonWord Symbol`




.. spadInput
::

	factor(w2*w2)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [[ab2],[ab2]]   |
+-----------------+




.. spadType

:sub:`Type: List LyndonWord Symbol`




.. spadInput
::

	factor(w2*w1)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [[ab2],[a2b]]   |
+-----------------+




.. spadType

:sub:`Type: List LyndonWord Symbol`



Checks and coercions


.. spadInput
::

	lyndon?(w1)$lword


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

	lyndon?(w1*w2)$lword


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

	lyndon?(w2*w1)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	lyndonIfCan(w1)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [a2b]   |
+---------+




.. spadType

:sub:`Type: Union(LyndonWord Symbol,...)`




.. spadInput
::

	lyndonIfCan(w2*w1)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`




.. spadInput
::

	lyndon(w1)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [a2b]   |
+---------+




.. spadType

:sub:`Type: LyndonWord Symbol`




.. spadInput
::

	lyndon(w1*w2)$lword


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [a2bab2]   |
+------------+




.. spadType

:sub:`Type: LyndonWord Symbol`





