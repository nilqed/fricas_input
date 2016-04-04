.. status: ok


9.42 LieExponentials
--------------------


.. spadInput
::

	a: Symbol := 'a


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

	b: Symbol := 'b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| b   |
+-----+




.. spadType

:sub:`Type: Symbol`



Declarations of domains


.. spadInput
::

	coef := Fraction(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| FractionInteger   |
+-------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	group := LieExponentials(Symbol, coef, 3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| LieExponentials(Symbol,FractionInteger,3)   |
+---------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	lpoly := LiePolynomial(Symbol, coef)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| LiePolynomial(Symbol,FractionInteger)   |
+-----------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	poly := XPBWPolynomial(Symbol, coef)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| XPBWPolynomial(Symbol,FractionInteger)   |
+------------------------------------------+




.. spadType

:sub:`Type: Domain`



Calculations


.. spadInput
::

	ea := exp(a::lpoly)$group


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| e[a]   |
+--------+




.. spadType

:sub:`Type: LieExponentials(Symbol,Fraction Integer,3)`




.. spadInput
::

	eb := exp(b::lpoly)$group


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| e[b]   |
+--------+




.. spadType

:sub:`Type: LieExponentials(Symbol,Fraction Integer,3)`




.. spadInput
::

	g: group := ea*eb


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| e[b]e(12[ab2])e[ab]e(12[a2b])e[a]   |
+-------------------------------------+




.. spadType

:sub:`Type: LieExponentials(Symbol,Fraction Integer,3)`




.. spadInput
::

	g :: poly


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------+
| 1+[a]+[b]+12[a][a]+[ab]+[b][a]+12[b][b]+16[a][a][a]+12[a2b]+[ab][a]+12[ab2]+12[b][a][a]+[b][ab]+12[b][b][a]+16[b][b][b]   |
+---------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	log(g)$group


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| [a]+[b]+12[ab]+112[a2b]+112[ab2]   |
+------------------------------------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	g1: group := inv(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| e(-[b])e(-[a])   |
+------------------+




.. spadType

:sub:`Type: LieExponentials(Symbol,Fraction Integer,3)`




.. spadInput
::

	g*g1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: LieExponentials(Symbol,Fraction Integer,3)`





