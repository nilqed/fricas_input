.. status: ok


9.88 XPBWPolynomial
-------------------

Initialisations


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

	RN := Fraction(Integer)


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

	word := OrderedFreeMonoid Symbol


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

	lword := LyndonWord(Symbol)


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

	base := PoincareBirkhoffWittLyndonBasis Symbol


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| PoincareBirkhoffWittLyndonBasisSymbol   |
+-----------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	dpoly := XDistributedPolynomial(Symbol, RN)


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

	rpoly := XRecursivePolynomial(Symbol, RN)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| XRecursivePolynomial(Symbol,FractionInteger)   |
+------------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	lpoly := LiePolynomial(Symbol, RN)


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

	poly := XPBWPolynomial(Symbol, RN)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| XPBWPolynomial(Symbol,FractionInteger)   |
+------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	liste : List lword := LyndonWordsList([a,b], 6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [[a],[b],[ab],[a2b],[ab2],[a3b],[a2b2],[ab3],[a4b],[a3b2],[a2bab],[a2b3],[abab2],[ab4],[a5b],[a4b2],[a3bab],[a3b3],[a2bab2],[a2b2ab],[a2b4],[abab3],[ab5]]   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List LyndonWord Symbol`



Let's make some polynomials


.. spadInput
::

	0$poly


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	1$poly


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	p : poly := a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [a]   |
+-------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	q : poly := b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| [b]   |
+-------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	pq: poly := p*q


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [ab]+[b][a]   |
+---------------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`



Coerce to distributed polynomial


.. spadInput
::

	pq :: dpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| ab   |
+------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Fraction Integer)`



Check some polynomial operations


.. spadInput
::

	mirror pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [b][a]   |
+----------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	ListOfTerms pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [[k=[b][a],c=1],[k=[ab],c=1]]   |
+---------------------------------+




.. spadType

:sub:`Type: List Record(k: PoincareBirkhoffWittLyndonBasis Symbol,c: Fraction`
Integer)




.. spadInput
::

	reductum pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| [ab]   |
+--------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	leadingMonomial pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [b][a]   |
+----------+




.. spadType

:sub:`Type: PoincareBirkhoffWittLyndonBasis Symbol`




.. spadInput
::

	coefficients pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [1,1]   |
+---------+




.. spadType

:sub:`Type: List Fraction Integer`




.. spadInput
::

	leadingTerm pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| [k=[b][a],c=1]   |
+------------------+




.. spadType

:sub:`Type: Record(k: PoincareBirkhoffWittLyndonBasis Symbol,c: Fraction`
Integer)




.. spadInput
::

	degree pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	pq4:=exp(pq,4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------+
| 1+[ab]+[b][a]+12[ab][ab]+12[ab2][a]+12[b][a2b]+32[b][ab][a]+12[b][b][a][a]   |
+------------------------------------------------------------------------------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	log(pq4,4) - pq


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`



Calculations with verification in XDistributedPolynomial.


.. spadInput
::

	lp1 :lpoly := LiePoly liste.10


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [a3b2]   |
+----------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	lp2 :lpoly := LiePoly liste.11


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [a2bab]   |
+-----------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	lp :lpoly := [lp1, lp2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [a3b2a2bab]   |
+---------------+




.. spadType

:sub:`Type: LiePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	lpd1: dpoly := lp1


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------+
| a3b2-2a2bab-a2b2a+4ababa-ab2a2-2baba2+b2a3   |
+----------------------------------------------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	lpd2: dpoly := lp2


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| a2bab-a2b2a-3aba2b+4ababa-ab2a2+2ba3b-3ba2ba+baba2   |
+------------------------------------------------------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	lpd : dpoly := lpd1 * lpd2 - lpd2 * lpd1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| a3b2a2bab-a3b2a2b2a-3a3b2aba2b+4a3b2ababa-a3b2ab2a2+2a3b3a3b-3a3b3a2ba+a3b3aba2-a2baba3b2+3a2baba2b2a+6a2bababa2b-12a2babababa+3a2babab2a2-4a2bab2a3b+6a2bab2a2ba-a2bab3a3+a2b2a4b2-3a2b2a3bab+3a2b2a2ba2b-2a2b2aba3b+3a2b2aba2ba-3a2b2ababa2+a2b2ab2a3+3aba2ba3b2-6aba2ba2bab-3aba2ba2b2a+12aba2bababa-3aba2bab2a2-6aba2b2aba2+3aba2b3a3-4ababa4b2+12ababa3bab-12ababa2ba2b+8abababa3b-12abababa2ba+12ababababa2-4ababab2a3+ab2a5b2-3ab2a4bab+3ab2a3ba2b-2ab2a2ba3b+3ab2a2ba2ba-3ab2a2baba2+ab2a2b2a3-2ba3ba3b2+4ba3ba2bab+2ba3ba2b2a-8ba3bababa+2ba3bab2a2+4ba3b2aba2-2ba3b3a3+3ba2ba4b2-6ba2ba3bab-3ba2ba3b2a+12ba2ba2baba-3ba2ba2b2a2-6ba2bababa2+3ba2bab2a3-baba5b2+3baba4b2a+6baba3ba2b-12baba3baba+3baba3b2a2-4baba2ba3b+6baba2ba2ba-baba2b2a3+b2a5bab-b2a5b2a-3b2a4ba2b+4b2a4baba-b2a4b2a2+2b2a3ba3b-3b2a3ba2ba+b2a3baba2   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	lp :: dpoly - lpd


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: XDistributedPolynomial(Symbol,Fraction Integer)`



Calculations with verification in XRecursivePolynomial.


.. spadInput
::

	p := 3 * lp


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 3[a3b2a2bab]   |
+----------------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	q := lp1


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [a3b2]   |
+----------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	pq:= p * q


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| 3[a3b2a2bab][a3b2]   |
+----------------------+




.. spadType

:sub:`Type: XPBWPolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	pr:rpoly := p :: rpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| a(a(abb(a(ab(ab3+ba(-3))+b(a(ab(-9)+ba12)+baa(-3)))+ba(a(ab6+ba(-9))+baa3))+b(ab(a(a(abb(-3)+bba9)+b(a(ab18+ba(-36))+baa9))+b(aa(ab(-12)+ba18)+baaa(-3)))+ba(a(a(abb3+bab(-9))+baab9)+b(a(a(ab(-6)+ba9)+baa(-9))+baaa3))))+b(a(ab(a(a(abb9+b(ab(-18)+ba(-9)))+b(aba36+baa(-9)))+b(abaa(-18)+baaa9))+ba(a(a(abb(-12)+bab36)+baab(-36))+b(a(a(ab24+ba(-36))+baa36)+baaa(-12))))+baa(a(a(abb3+bab(-9))+baab9)+b(a(a(ab(-6)+ba9)+baa(-9))+baaa3))))+b(a(a(ab(a(a(abb(-6)+b(ab12+ba6))+b(aba(-24)+baa6))+b(abaa12+baaa(-6)))+ba(a(a(abb9+b(ab(-18)+ba(-9)))+b(aba36+baa(-9)))+b(abaa(-18)+baaa9)))+baa(a(a(abb(-3)+bba9)+b(a(ab18+ba(-36))+baa9))+b(aa(ab(-12)+ba18)+baaa(-3))))+baaa(a(ab(ab3+ba(-3))+b(a(ab(-9)+ba12)+baa(-3)))+ba(a(ab6+ba(-9))+baa3)))   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: XRecursivePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	qr:rpoly := q :: rpoly


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------+
| a(a(abb1+b(ab(-2)+ba(-1)))+b(aba4+baa(-1)))+b(abaa(-2)+baaa1)   |
+-----------------------------------------------------------------+




.. spadType

:sub:`Type: XRecursivePolynomial(Symbol,Fraction Integer)`




.. spadInput
::

	pq :: rpoly - pr*qr


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: XRecursivePolynomial(Symbol,Fraction Integer)`





