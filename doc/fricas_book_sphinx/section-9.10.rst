.. status: ok


9.10 CliffordAlgebra
--------------------

CliffordAlgebra(n,K,Q) defines a vector space of dimension 2n over the
field K with a given quadratic form Q. If {e1,…,en} is a basis for Kn
then


.. spadVerbatim

::

 { 1,
   e(i) 1 <= i <= n,
   e(i1)*e(i2) 1 <= i1 < i2 <=n,
   ...,
   e(1)*e(2)*...*e(n) }



is a basis for the Clifford algebra. The algebra is defined by the
relations


.. spadVerbatim

::

 e(i)*e(i) = Q(e(i))
 e(i)*e(j) = -e(j)*e(i),  i ^= j



Examples of Clifford Algebras are gaussians (complex numbers),
quaternions, exterior algebras and spin algebras.



9.10.1 The Complex Numbers as a Clifford Algebra
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the field over which we will work, rational functions with
integer coefficients.


.. spadInput
::

	K := Fraction Polynomial Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| FractionPolynomialInteger   |
+-----------------------------+




.. spadType

:sub:`Type: Domain`



We use this matrix for the quadratic form.


.. spadInput
::

	m := matrix [ [-1] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| [-1]   |
+--------+




.. spadType

:sub:`Type: Matrix Integer`



We get complex arithmetic by using this domain.


.. spadInput
::

	C := CliffordAlgebra(1, K, m)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| CliffordAlgebra(1,FractionPolynomialInteger,MATRIX)   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Here is i, the usual square root of -1.


.. spadInput
::

	i: C := e(1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| e1   |
+------+




.. spadType

:sub:`Type: CliffordAlgebra(1,Fraction Polynomial Integer,MATRIX)`



Here are some examples of the arithmetic.


.. spadInput
::

	x := a + b * i


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| a+be1   |
+---------+




.. spadType

:sub:`Type: CliffordAlgebra(1,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	y := c + d * i


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| c+de1   |
+---------+




.. spadType

:sub:`Type: CliffordAlgebra(1,Fraction Polynomial Integer,MATRIX)`



See `ComplexXmpPage <section-9.11.html#ComplexXmpPage>`__ for examples
of FriCAS's constructor implementing complex numbers.


.. spadInput
::

	x * y


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| -bd+ac+(ad+bc)e1   |
+--------------------+




.. spadType

:sub:`Type: CliffordAlgebra(1,Fraction Polynomial Integer,MATRIX)`







9.10.2 The Quaternion Numbers as a Clifford Algebra
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the field over which we will work, rational functions with
integer coefficients.


.. spadInput
::

	K := Fraction Polynomial Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| FractionPolynomialInteger   |
+-----------------------------+




.. spadType

:sub:`Type: Domain`



We use this matrix for the quadratic form.


.. spadInput
::

	m := matrix [ [-1,0],[0,-1] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [-100-1]   |
+------------+




.. spadType

:sub:`Type: Matrix Integer`



The resulting domain is the quaternions.


.. spadInput
::

	H := CliffordAlgebra(2, K, m)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| CliffordAlgebra(2,FractionPolynomialInteger,MATRIX)   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



We use Hamilton's notation for i,j,k.


.. spadInput
::

	i: H := e(1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| e1   |
+------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	j: H := e(2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| e2   |
+------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	k: H := i * j


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| e1e2   |
+--------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	x := a + b * i + c * j + d * k


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| a+be1+ce2+de1e2   |
+-------------------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	y := e + f * i + g * j + h * k


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| e+fe1+ge2+he1e2   |
+-------------------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	x + y


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| e+a+(f+b)e1+(g+c)e2+(h+d)e1e2   |
+---------------------------------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	x * y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------+
| -dh-cg-bf+ae+(ch-dg+af+be)e1+(-bh+ag+df+ce)e2+(ah+bg-cf+de)e1e2   |
+-------------------------------------------------------------------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`



See `QuaternionXmpPage <section-9.64.html#QuaternionXmpPage>`__ for
examples of FriCAS's constructor implementing quaternions.


.. spadInput
::

	y * x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------+
| -dh-cg-bf+ae+(-ch+dg+af+be)e1+(bh+ag-df+ce)e2+(ah-bg+cf+de)e1e2   |
+-------------------------------------------------------------------+




.. spadType

:sub:`Type: CliffordAlgebra(2,Fraction Polynomial Integer,MATRIX)`







9.10.3 The Exterior Algebra on a Three Space
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the field over which we will work, rational functions with
integer coefficients.


.. spadInput
::

	K := Fraction Polynomial Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| FractionPolynomialInteger   |
+-----------------------------+




.. spadType

:sub:`Type: Domain`



If we chose the three by three zero quadratic form, we obtain the
exterior algebra on e(1),e(2),e(3).


.. spadInput
::

	Ext := CliffordAlgebra(3, K, 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| CliffordAlgebra(3,FractionPolynomialInteger,MATRIX)   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



This is a three dimensional vector algebra. We define i, j, k as the
unit vectors.


.. spadInput
::

	i: Ext := e(1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| e1   |
+------+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	j: Ext := e(2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| e2   |
+------+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	k: Ext := e(3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| e3   |
+------+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`



Now it is possible to do arithmetic.


.. spadInput
::

	x := x1*i + x2*j + x3*k


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| x1e1+x2e2+x3e3   |
+------------------+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	y := y1*i + y2*j + y3*k


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| y1e1+y2e2+y3e3   |
+------------------+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	x + y


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| (y1+x1)e1+(y2+x2)e2+(y3+x3)e3   |
+---------------------------------+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`




.. spadInput
::

	x * y + y * x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`



On an n space, a grade p form has a dual n-p form. In particular, in
three space the dual of a grade two element identifies e1*e2->e3,
e2*e3->e1, e3*e1->e2.


.. spadInput
::

	dual2 a == coefficient(a,[2,3]) * i + coefficient(a,[3,1]) * j +
coefficient(a,[1,2]) * k


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The vector cross product is then given by this.


.. spadInput
::

	dual2(x*y)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function dual2 with type CliffordAlgebra(3,Fraction 
       Polynomial Integer,MATRIX) -> CliffordAlgebra(3,Fraction 
       Polynomial Integer,MATRIX) 




.. spadMathOutput
.. math::

+----------------------------------------------+
| (x2y3-x3y2)e1+(-x1y3+x3y1)e2+(x1y2-x2y1)e3   |
+----------------------------------------------+




.. spadType

:sub:`Type: CliffordAlgebra(3,Fraction Polynomial Integer,MATRIX)`







9.10.4 The Dirac Spin Algebra
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this section we will work over the field of rational numbers.


.. spadInput
::

	K := Fraction Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| FractionInteger   |
+-------------------+




.. spadType

:sub:`Type: Domain`



We define the quadratic form to be the Minkowski space-time metric.


.. spadInput
::

	g := matrix [ [1,0,0,0], [0,-1,0,0], [0,0,-1,0], [0,0,0,-1] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| [10000-10000-10000-1]   |
+-------------------------+




.. spadType

:sub:`Type: Matrix Integer`



We obtain the Dirac spin algebra used in Relativistic Quantum Field
Theory.


.. spadInput
::

	D := CliffordAlgebra(4,K, g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| CliffordAlgebra(4,FractionInteger,MATRIX)   |
+---------------------------------------------+




.. spadType

:sub:`Type: Domain`



The usual notation for the basis is γ with a superscript. For FriCAS
input we will use gam(i):


.. spadInput
::

	gam := [e(i)$D for i in 1..4]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [e1,e2,e3,e4]   |
+-----------------+




.. spadType

:sub:`Type: List CliffordAlgebra(4,Fraction Integer,MATRIX)`



There are various contraction identities of the form


.. spadVerbatim

::

 g(l,t)*gam(l)*gam(m)*gam(n)*gam(r)*gam(s)*gam(t) =
       2*(gam(s)gam(m)gam(n)gam(r) + gam(r)*gam(n)*gam(m)*gam(s))



where a sum over l and t is implied.

Verify this identity for particular values of m,n,r,s.


.. spadInput
::

	m := 1; n:= 2; r := 3; s := 4;


.. spadMathAnswer
.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	lhs := reduce(+, [reduce(+, [
g(l,t)*gam(l)*gam(m)*gam(n)*gam(r)*gam(s)*gam(t) for l in 1..4])
for t in 1..4])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| -4e1e2e3e4   |
+--------------+




.. spadType

:sub:`Type: CliffordAlgebra(4,Fraction Integer,MATRIX)`




.. spadInput
::

	rhs := 2*(gam s * gam m*gam n*gam r + gam r*gam n*gam m*gam s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| -4e1e2e3e4   |
+--------------+




.. spadType

:sub:`Type: CliffordAlgebra(4,Fraction Integer,MATRIX)`







