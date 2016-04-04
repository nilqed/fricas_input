.. status: ok



9.43 LiePolynomial
------------------

Declaration of domains


.. spadInput
::

	RN := Fraction Integer


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

	Lpoly := LiePolynomial(Symbol,RN)


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

	Dpoly := XDPOLY(Symbol,RN)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| XDistributedPolynomial(Symbol,FractionInteger)   |
+--------------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	Lword := LyndonWord Symbol


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| LyndonWordSymbol   |
+--------------------+




.. spadType

:sub:`Type: Domain`



Initialisation


.. spadInput
::

	a:Symbol := 'a


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

	b:Symbol := 'b


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

	c:Symbol := 'c


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

	aa: Lpoly := a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [a]   |
+-------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	bb: Lpoly := b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [b]   |
+-------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	cc: Lpoly := c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [c]   |
+-------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	p : Lpoly := [aa,bb]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| [ab]   |
+--------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	q : Lpoly := [p,bb]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [ab2]   |
+---------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`



All the Lyndon words of order 4


.. spadInput
::

	liste : List Lword := LyndonWordsList([a,b], 4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------+
| [[a],[b],[ab],[a2b],[ab2],[a3b],[a2b2],[ab3]]   |
+-------------------------------------------------+




.. spadType

:sub:`Type: List LyndonWord Symbol`




.. spadInput
::

	r: Lpoly := p + q + 3*LiePoly(liste.4)$Lpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [ab]+3[a2b]+[ab2]   |
+---------------------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	s:Lpoly := [p,r]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| -3[a2bab]+[abab2]   |
+---------------------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	t:Lpoly := s + 2*LiePoly(liste.3) - 5*LiePoly(liste.5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| 2[ab]-5[ab2]-3[a2bab]+[abab2]   |
+---------------------------------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	degree t


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 5   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	mirror t


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| -2[ab]-5[ab2]-3[a2bab]+[abab2]   |
+----------------------------------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`



Jacobi Relation


.. spadInput
::

	Jacobi(p: Lpoly, q: Lpoly, r: Lpoly): Lpoly == [ [p,q]$Lpoly, r] + [
[q,r]$Lpoly, p] + [ [r,p]$Lpoly, q]


.. spadMathAnswer
.. spadVerbatim

::

 Function declaration Jacobi : (
   LiePolynomial(Symbol,  Fraction Integer),
   LiePolynomial(Symbol,Fraction Integer),
   LiePolynomial(Symbol,Fraction Integer)) -> 
     LiePolynomial(Symbol,Fraction Integer) 
   has been added to workspace.




.. spadType

Void



Tests


.. spadInput
::

	test: Lpoly := Jacobi(a,b,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	test: Lpoly := Jacobi(p,q,r)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	test: Lpoly := Jacobi(r,s,t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`



Evaluation


.. spadInput
::

	eval(p, a, p)$Lpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [ab2]   |
+---------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	eval(p, [a,b], [2*bb, 3*aa])$Lpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| -6[ab]   |
+----------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	r: Lpoly := [p,c]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [abc]+[acb]   |
+---------------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	r1: Lpoly := eval(r, [a,b,c], [bb, cc, aa])$Lpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| -[abc]   |
+----------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	r2: Lpoly := eval(r, [a,b,c], [cc, aa, bb])$Lpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| -[acb]   |
+----------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	r + r1 + r2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`





