.. status: ok



9.44 LinearOrdinaryDifferentialOperator
---------------------------------------

LinearOrdinaryDifferentialOperator(A, diff) is the domain of linear
ordinary differential operators with coefficients in a ring A with a
given derivation.



9.44.1 Differential Operators with Series Coefficients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 Problem: Find the first few coefficients of exp(x)/x^i of Dop phi where


.. spadVerbatim

::

 Dop := D^3 + G/x^2 * D + H/x^3 - 1
 phi := sum(s[i]*exp(x)/x^i, i = 0..)



 Solution:

Define the differential.


.. spadInput
::

	Dx: LODO(EXPR INT, f +-> D(f, x))


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	Dx := D()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| D   |
+-----+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator(Expression Integer,theMap NIL)`



Now define the differential operator Dop.


.. spadInput
::

	Dop:= Dx^3 + G/x^2*Dx + H/x^3 - 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| D3+Gx2D+-x3+Hx3   |
+-------------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator(Expression Integer,theMap NIL)`




.. spadInput
::

	n == 3


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	phi == reduce(+,[subscript(s,[i])*exp(x)/x^i for i in 0..n])


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	phi1 == Dop(phi) / exp x


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	phi2 == phi1 *x^(n+3)


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	phi3 == retract(phi2)@(POLY INT)


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	pans == phi3 ::UP(x,POLY INT)


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	pans1 == [coefficient(pans, (n+3-i) :: NNI) for i in 2..n+1]


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	leq == solve(pans1,[subscript(s,[i]) for i in 1..n])


.. spadMathAnswer
.. spadType

Void



Evaluate this for several values of n.


.. spadInput
::

	leq


.. spadMathAnswer
.. spadVerbatim

::

    Compiling body of rule n to compute value of type PositiveInteger 
    Compiling body of rule phi to compute value of type Expression 
       Integer 
    Compiling body of rule phi1 to compute value of type Expression 
       Integer 
    Compiling body of rule phi2 to compute value of type Expression 
       Integer 
    Compiling body of rule phi3 to compute value of type Polynomial 
       Integer 
    Compiling body of rule pans to compute value of type 
       UnivariatePolynomial(x,Polynomial Integer) 
    Compiling body of rule pans1 to compute value of type List 
       Polynomial Integer 
    Compiling body of rule leq to compute value of type List List 
       Equation Fraction Polynomial Integer 
    Compiling function G83347 with type Integer -> Boolean 




.. spadInput
::

	n==4


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------+
| [[s1=s0G3,s2=3s0H+s0G2+6s0G18,s3=(9s0G+54s0)H+s0G3+18s0G2+72s0G162]]   |
+------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`




.. spadInput
::

	leq


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------+
| [[s1=s0G3,s2=3s0H+s0G2+6s0G18,s3=(9s0G+54s0)H+s0G3+18s0G2+72s0G162]]   |
+------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`




.. spadInput
::

	n==7


.. spadMathAnswer
.. spadVerbatim

::

    Compiled code for n has been cleared.
    Compiled code for leq has been cleared.
    Compiled code for pans1 has been cleared.
    Compiled code for phi2 has been cleared.
    Compiled code for phi has been cleared.
    Compiled code for phi3 has been cleared.
    Compiled code for phi1 has been cleared.
    Compiled code for pans has been cleared.
    1 old definition(s) deleted for function or rule n 




.. spadType

Void




.. spadInput
::

	leq


.. spadMathAnswer
.. spadVerbatim

::

 Compiling body of rule n to compute value of type PositiveInteger 
 +++ |*0;n;1;G82322| redefined
 Compiling body of rule phi to compute value of type Expression 
   Integer 
 +++ |*0;phi;1;G82322| redefined
 Compiling body of rule phi1 to compute value of type Expression 
   Integer 
 +++ |*0;phi1;1;G82322| redefined
 Compiling body of rule phi2 to compute value of type Expression 
   Integer 
 +++ |*0;phi2;1;G82322| redefined
 Compiling body of rule phi3 to compute value of type Polynomial 
   Integer 
 +++ |*0;phi3;1;G82322| redefined
 Compiling body of rule pans to compute value of type 
   UnivariatePolynomial(x,Polynomial Integer) 
 +++ |*0;pans;1;G82322| redefined
 Compiling body of rule pans1 to compute value of type List 
   Polynomial Integer 
 +++ |*0;pans1;1;G82322| redefined
 Compiling body of rule leq to compute value of type List List 
   Equation Fraction Polynomial Integer 
 +++ |*0;leq;1;G82322| redefined




.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+



s7=((2835s0G+91854s0)H3+(945s0G3+81648s0G2+2082996s0G+14171760s0)H2+(63s0G5+7560s0G4+317520s0G3+5554008s0G2+34058880s0G)H+s0G7+126s0G6+4788s0G5+25272s0G4-1744416s0G3-26827200s0G2-97977600s0G)11022480]]


.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`







