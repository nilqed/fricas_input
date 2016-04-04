.. status: ok



9.14 DeRhamComplex
------------------

The domain constructor DeRhamComplex creates the class of differential
forms of arbitrary degree over a coefficient ring. The De Rham complex
constructor takes two arguments: a ring, coefRing, and a list of
coordinate variables.

This is the ring of coefficients.


.. spadInput
::

	coefRing := Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| Integer   |
+-----------+




.. spadType

:sub:`Type: Domain`



These are the coordinate variables.


.. spadInput
::

	lv : List Symbol := [x,y,z]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [x,y,z]   |
+-----------+




.. spadType

:sub:`Type: List Symbol`



This is the De Rham complex of Euclidean three-space using coordinates
x, y and z.


.. spadInput
::

	der := DERHAM(coefRing,lv)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| DeRhamComplex(Integer,[x,y,z])   |
+----------------------------------+




.. spadType

:sub:`Type: Domain`



This complex allows us to describe differential forms having expressions
of integers as coefficients. These coefficients can involve any number
of variables, for example, f(x,t,r,y,u,z). As we've chosen to work with
ordinary Euclidean three-space, expressions involving these forms are
treated as functions of x, y and z with the additional arguments t, r
and u regarded as symbolic constants.

Here are some examples of coefficients.


.. spadInput
::

	R := Expression coefRing


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| ExpressionInteger   |
+---------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	f : R := x^2*y*z-5*x^3*y^2*z^5


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| -5x3y2z5+x2yz   |
+-----------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	g : R := z^2*y*cos(z)-7*sin(x^3*y^2)*z^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| -7z2sin(x3y2)+yz2cos(z)   |
+---------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	h : R :=x*y*z-2*x^3*y*z^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| -2x3yz2+xyz   |
+---------------+




.. spadType

:sub:`Type: Expression Integer`



We now define the multiplicative basis elements for the exterior algebra
over R.


.. spadInput
::

	dx : der := generator(1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| dx   |
+------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`




.. spadInput
::

	dy : der := generator(2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| dy   |
+------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`




.. spadInput
::

	dz : der := generator(3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| dz   |
+------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



This is an alternative way to give the above assignments.


.. spadInput
::

	[dx,dy,dz] := [generator(i)$der for i in 1..3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [dx,dy,dz]   |
+--------------+




.. spadType

:sub:`Type: List DeRhamComplex(Integer,[x,y,z])`



Now we define some one-forms.


.. spadInput
::

	alpha : der := f*dx + g*dy + h*dz


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------+
| (-2x3yz2+xyz)dz+(-7z2sin(x3y2)+yz2cos(z))dy+(-5x3y2z5+x2yz)dx   |
+-----------------------------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`




.. spadInput
::

	beta : der := cos(tan(x*y*z)+x*y*z)*dx + x*dy


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| xdy+cos(tan(xyz)+xyz)dx   |
+---------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



A well-known theorem states that the composition of
exteriorDifferentialexteriorDifferentialDeRhamComplex with itself is the
zero map for continuous forms. Let's verify this theorem for alpha.


.. spadInput
::

	exteriorDifferential alpha


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------+
| (yz2sin(z)+14zsin(x3y2)-2yzcos(z)-2x3z2+xz)dydz+(25x3y2z4-6x2yz2+yz-x2y)dxdz+(-21x2y2z2cos(x3y2)+10x3yz5-x2z)dxdy   |
+---------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



We see a lengthy output of the last expression, but nevertheless, the
composition is zero.


.. spadInput
::

	exteriorDifferential %


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



Now we check that exteriorDifferentialexteriorDifferentialDeRhamComplex
is a graded derivation D, that is, D satisfies:


.. spadVerbatim

::

 D(a*b) = D(a)*b + (-1)^degree(a)*a*D(b)




.. spadInput
::

	gamma := alpha * beta


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------+
| (2x4yz2-x2yz)dydz+(2x3yz2-xyz)cos(tan(xyz)+xyz)dxdz+((7z2sin(x3y2)-yz2cos(z))cos(tan(xyz)+xyz)-5x4y2z5+x3yz)dxdy   |
+--------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



We try this for the one-forms alpha and beta.


.. spadInput
::

	exteriorDifferential(gamma) - (exteriorDifferential(alpha)*beta - alpha
* exteriorDifferential(beta))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



Now we define some basic operators (see
`OperatorXmpPage <section-9.3.html#BasicOperatorXmpPage>`__ ).


.. spadInput
::

	a : BOP := operator('a)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| a   |
+-----+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	b : BOP := operator('b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| b   |
+-----+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	c : BOP := operator('c)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| c   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



We also define some indeterminate one- and two-forms using these
operators.


.. spadInput
::

	sigma := a(x,y,z) * dx + b(x,y,z) * dy + c(x,y,z) * dz


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| c(x,y,z)dz+b(x,y,z)dy+a(x,y,z)dx   |
+------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`




.. spadInput
::

	theta := a(x,y,z) * dx * dy + b(x,y,z) * dx * dz + c(x,y,z) * dy *
dz


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| c(x,y,z)dydz+b(x,y,z)dxdz+a(x,y,z)dxdy   |
+------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



This allows us to get formal definitions for the gradient ...


.. spadInput
::

	totalDifferential(a(x,y,z))$der


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| a,3(x,y,z)dz+a,2(x,y,z)dy+a,1(x,y,z)dx   |
+------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



the curl ...


.. spadInput
::

	exteriorDifferential sigma


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------+
| (c,2(x,y,z)-b,3(x,y,z))dydz+(c,1(x,y,z)-a,3(x,y,z))dxdz+(b,1(x,y,z)-a,2(x,y,z))dxdy   |
+---------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



and the divergence.


.. spadInput
::

	exteriorDifferential theta


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------+
| (c,1(x,y,z)-b,2(x,y,z)+a,3(x,y,z))dxdydz   |
+--------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



Note that the De Rham complex is an algebra with unity. This element 1
is the basis for elements for zero-forms, that is, functions in our
space.


.. spadInput
::

	one : der := 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



To convert a function to a function lying in the De Rham complex,
multiply the function by one.


.. spadInput
::

	g1 : der := a([x,t,y,u,v,z,e]) * one


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| a(x,t,y,u,v,z,e)   |
+--------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



A current limitation of FriCAS forces you to write functions with more
than four arguments using square brackets in this way.


.. spadInput
::

	h1 : der := a([x,y,x,t,x,z,y,r,u,x]) * one


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| a(x,y,x,t,x,z,y,r,u,x)   |
+--------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



Now note how the system keeps track of where your coordinate functions
are located in expressions.


.. spadInput
::

	exteriorDifferential g1


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------+
| a,6(x,t,y,u,v,z,e)dz+a,3(x,t,y,u,v,z,e)dy+a,1(x,t,y,u,v,z,e)dx   |
+------------------------------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`




.. spadInput
::

	exteriorDifferential h1


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| a,6(x,y,x,t,x,z,y,r,u,x)dz+(a,7(x,y,x,t,x,z,y,r,u,x)+a,2(x,y,x,t,x,z,y,r,u,x))dy+(a,10(x,y,x,t,x,z,y,r,u,x)+a,5(x,y,x,t,x,z,y,r,u,x)+a,3(x,y,x,t,x,z,y,r,u,x)+a,1(x,y,x,t,x,z,y,r,u,x))dx   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



In this example of Euclidean three-space, the basis for the De Rham
complex consists of the eight forms: 1, dx, dy, dz, dx*dy, dx*dz,
dy*dz, and dx*dy*dz.


.. spadInput
::

	coefficient(gamma, dx*dy)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------+
| (7z2sin(x3y2)-yz2cos(z))cos(tan(xyz)+xyz)-5x4y2z5+x3yz   |
+----------------------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	coefficient(gamma, one)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	coefficient(g1,one)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| a(x,t,y,u,v,z,e)   |
+--------------------+




.. spadType

:sub:`Type: Expression Integer`





