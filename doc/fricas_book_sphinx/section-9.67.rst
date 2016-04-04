.. status: ok


9.67 RegularTriangularSet
-------------------------

The RegularTriangularSet domain constructor implements regular
triangular sets. These particular triangular sets were introduced by M.
Kalkbrener (1991) in his PhD Thesis under the name regular chains.
Regular chains and their related concepts are presented in the paper On
the Theories of Triangular sets By P. Aubry, D. Lazard and M. Moreno
Maza (to appear in the Journal of Symbolic Computation). The
RegularTriangularSet constructor also provides a new method (by the
third author) for solving polynomial system by means of regular chains.
This method has two ways of solving. One has the same specifications as
Kalkbrener's algorithm (1991) and the other is closer to Lazard's method
(Discr. App. Math, 1991). Moreover, this new method removes redundant
component from the decompositions when this is not too expensive. This
is always the case with square-free regular chains. So if you want to
obtain decompositions without redundant components just use the
SquareFreeRegularTriangularSet domain constructor or the
LazardSetSolvingPackage package constructor. See also the
LexTriangularPackage and ZeroDimensionalSolvePackage for the case of
algebraic systems with a finite number of (complex) solutions.

One of the main features of regular triangular sets is that they
naturally define towers of simple extensions of a field. This allows to
perform with multivariate polynomials the same kind of operations as one
can do in an EuclideanDomain.

The RegularTriangularSet constructor takes four arguments. The first
one, R, is the coefficient ring of the polynomials; it must belong to
the category GcdDomain. The second one, E, is the exponent monoid of the
polynomials; it must belong to the category OrderedAbelianMonoidSup. the
third one, V, is the ordered set of variables; it must belong to the
category OrderedSet. The last one is the polynomial ring; it must belong
to the category RecursivePolynomialCategory(R,E,V). The abbreviation for
RegularTriangularSet is REGSET. See also the constructor RegularChain
which only takes two arguments, the coefficient ring and the ordered set
of variables; in that case, polynomials are necessarily built with the
NewSparseMultivariatePolynomial domain constructor.

We shall explain now how to use the constructor REGSET and how to read
the decomposition of a polynomial system by means of regular sets.

Let us give some examples. We start with an easy one (Donati-Traverso)
in order to understand the two ways of solving polynomial systems
provided by the REGSET constructor.

Define the coefficient ring.


.. spadInput
::

	R := Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| Integer   |
+-----------+




.. spadType

:sub:`Type: Domain`



Define the list of variables,


.. spadInput
::

	ls : List Symbol := [x,y,z,t]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [x,y,z,t]   |
+-------------+




.. spadType

:sub:`Type: List Symbol`



and make it an ordered set;


.. spadInput
::

	V := OVAR(ls)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| OrderedVariableList[x,y,z,t]   |
+--------------------------------+




.. spadType

:sub:`Type: Domain`



then define the exponent monoid.


.. spadInput
::

	E := IndexedExponents V


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| IndexedExponentsOrderedVariableList[x,y,z,t]   |
+------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Define the polynomial ring.


.. spadInput
::

	P := NSMP(R, V)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------+
| NewSparseMultivariatePolynomial(Integer,OrderedVariableList[x,y,z,t])   |
+-------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Let the variables be polynomial.


.. spadInput
::

	x: P := 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial( Integer, OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	y: P := 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial( Integer, OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	z: P := 'z


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| z   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial( Integer, OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	t: P := 't


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| t   |
+-----+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial( Integer, OrderedVariableList`
[x,y,z,t])



Now call the RegularTriangularSet domain constructor.


.. spadInput
::

	T := REGSET(R,E,V,P)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RegularTriangularSet(Integer,  IndexedExponentsOrderedVariableList[x,y,z,t],  OrderedVariableList[x,y,z,t],  NewSparseMultivariatePolynomial(Integer,  OrderedVariableList[x,y,z,t]))   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Define a polynomial system.


.. spadInput
::

	p1 := x ^ 31 - x ^ 6 - x - y


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| x31-x6-x-y   |
+--------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	p2 := x ^ 8 - z


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x8-z   |
+--------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	p3 := x ^ 10 - t


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| x10-t   |
+---------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial( Integer, OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	lp := [p1, p2, p3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [x31-x6-x-y,x8-z,x10-t]   |
+---------------------------+




.. spadType

:sub:`Type: List NewSparseMultivariatePolynomial( Integer, OrderedVariableList`
[x,y,z,t])



First of all, let us solve this system in the sense of Kalkbrener.


.. spadInput
::

	zeroSetSplit(lp)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| [{z5-t4,tzy2+2z3y-t8+2t5+t3-t2,(t4-t)x-ty-z2}]   |
+--------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet( Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial( Integer, OrderedVariableList
[x,y,z,t]))



And now in the sense of Lazard (or Wu and other authors).


.. spadInput
::

	lts := zeroSetSplit(lp,false)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------+
| [{z5-t4,tzy2+2z3y-t8+2t5+t3-t2,(t4-t)x-ty-z2},{t3-1,z5-t,tzy2+2z3y+1,zx2-t},{t,z,y,x}]   |
+------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet( Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial( Integer, OrderedVariableList
[x,y,z,t]))



We can see that the first decomposition is a subset of the second. So
how can both be correct ?

Recall first that polynomials from a domain of the category
RecursivePolynomialCategory are regarded as univariate polynomials in
their main variable. For instance the second polynomial in the first set
of each decomposition has main variable y and its initial (i.e. its
leading coefficient w.r.t. its main variable) is t z.

Now let us explain how to read the second decomposition. Note that the
non-constant initials of the first set are t4-t and tz. Then the
solutions described by this first set are the common zeros of its
polynomials that do not cancel the polynomials t4-t and tyz. Now the
solutions of the input system lp satisfying these equations are
described by the second and the third sets of the decomposition. Thus,
in some sense, they can be considered as degenerated solutions. The
solutions given by the first set are called the generic points of the
system; they give the general form of the solutions. The first
decomposition only provides these generic points. This latter
decomposition is useful when they are many degenerated solutions (which
is sometimes hard to compute) and when one is only interested in general
informations, like the dimension of the input system.

We can get the dimensions of each component of a decomposition as
follows.


.. spadInput
::

	[coHeight(ts) for ts in lts]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [1,0,0]   |
+-----------+




.. spadType

:sub:`Type: List NonNegativeInteger`



Thus the first set has dimension one. Indeed t can take any value,
except 0 or any third root of 1, whereas z is completely determined from
t, y is given by z and t, and finally x is given by the other three
variables. In the second and the third sets of the second decomposition
the four variables are completely determined and thus these sets have
dimension zero.

We give now the precise specifications of each decomposition. This
assume some mathematical knowledge. However, for the non-expert user,
the above explanations will be sufficient to understand the other
features of the RSEGSET constructor.

The input system lp is decomposed in the sense of Kalkbrener as finitely
many regular sets T1,...,Ts such that the radical ideal generated by lp
is the intersection of the radicals of the saturated ideals of
T1,...,Ts. In other words, the affine variety associated with lp is the
union of the closures (w.r.t. Zarisky topology) of the regular-zeros
sets of T1,...,Ts.

 N. B. The prime ideals associated with the radical of the saturated
ideal of a regular triangular set have all the same dimension; moreover
these prime ideals can be given by characteristic sets with the same
main variables. Thus a decomposition in the sense of Kalkbrener is
unmixed dimensional. Then it can be viewed as a lazy decomposition into
prime ideals (some of these prime ideals being merged into unmixed
dimensional ideals).

Now we explain the other way of solving by means of regular triangular
sets. The input system lp is decomposed in the sense of Lazard as
finitely many regular triangular sets T1,...,Ts such that the affine
variety associated with lp is the union of the regular-zeros sets of
T1,...,Ts. Thus a decomposition in the sense of Lazard is also a
decomposition in the sense of Kalkbrener; the converse is false as we
have seen before.

When the input system has a finite number of solutions, both ways of
solving provide similar decompositions as we shall see with this second
example (Caprasse).

Define a polynomial system.


.. spadInput
::

	f1 := y^2*z+2*x*y*t-2*x-z


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| (2ty-2)x+zy2-z   |
+------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	f2 := -x^3*z+ 4*x*y^2*z+ 4*x^2*y*t+ 2*y^3*t+ 4*x^2- 10*y^2+
4*x*z- 10*y*t+ 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------+
| -zx3+(4ty+4)x2+(4zy2+4z)x+2ty3-10y2-10ty+2   |
+----------------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	f3 := 2*y*z*t+x*t^2-x-2*z


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| (t2-1)x+2tzy-2z   |
+-------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	f4 := -x*z^3+ 4*y*z^2*t+ 4*x*z*t^2+ 2*y*t^3+ 4*x*z+
4*z^2-10*y*t- 10*t^2+2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------+
| (-z3+(4t2+4)z)x+(4tz2+2t3-10t)y+4z2-10t2+2   |
+----------------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	lf := [f1, f2, f3, f4]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------+
| [(2ty-2)x+zy2-z,-zx3+(4ty+4)x2+(4zy2+4z)x+2ty3-10y2-10ty+2,(t2-1)x+2tzy-2z,(-z3+(4t2+4)z)x+(4tz2+2t3-10t)y+4z2-10t2+2]   |
+--------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])



First of all, let us solve this system in the sense of Kalkbrener.


.. spadInput
::

	zeroSetSplit(lf)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------+
| [{t2-1,z8-16z6+256z2-256,ty-1,(z3-8z)x-8z2+16},{3t2+1,z2-7t2-1,y+t,x+z},{t8-10t6+10t2-1,z,(t3-5t)y-5t2+1,x},{t2+3,z2-4,y+t,x-z}]   |
+------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))



And now in the sense of Lazard (or Wu and other authors).


.. spadInput
::

	lts2 := zeroSetSplit(lf,false)$T


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------+
| [{t8-10t6+10t2-1,z,(t3-5t)y-5t2+1,x},{t2-1,z8-16z6+256z2-256,ty-1,(z3-8z)x-8z2+16},{3t2+1,z2-7t2-1,y+t,x+z},{t2+3,z2-4,y+t,x-z}]   |
+------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List RegularTriangularSet(Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))



Up to the ordering of the components, both decompositions are identical.

Let us check that each component has a finite number of solutions.


.. spadInput
::

	[coHeight(ts) for ts in lts2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0,0,0,0]   |
+-------------+




.. spadType

:sub:`Type: List NonNegativeInteger`



Let us count the degrees of each component,


.. spadInput
::

	degrees := [degree(ts) for ts in lts2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [8,16,4,4]   |
+--------------+




.. spadType

:sub:`Type: List NonNegativeInteger`



and compute their sum.


.. spadInput
::

	reduce(+,degrees)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 32   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



We study now the options of the zeroSetSplit operation. As we have seen
yet, there is an optional second argument which is a boolean value. If
this value is true (this is the default) then the decomposition is
computed in the sense of Kalkbrener, otherwise it is computed in the
sense of Lazard.

There is a second boolean optional argument that can be used (in that
case the first optional argument must be present). This second option
allows you to get some information during the computations.

Therefore, we need to understand a little what is going on during the
computations. An important feature of the algorithm is that the
intermediate computations are managed in some sense like the processes
of a Unix system. Indeed, each intermediate computation may generate
other intermediate computations and the management of all these
computations is a crucial task for the efficiency. Thus any intermediate
computation may be suspended, killed or resumed, depending on algebraic
considerations that determine priorities for these processes. The goal
is of course to go as fast as possible towards the final decomposition
which means to avoid as much as possible unnecessary computations.

To follow the computations, one needs to set to true the second
argument. Then a lot of numbers and letters are displayed. Between a [
and a ] one has the state of the processes at a given time. Just after [
one can see the number of processes. Then each process is represented by
two numbers between < and >. A process consists of a list of polynomial
ps and a triangular set ts; its goal is to compute the common zeros of
ps that belong to the regular-zeros set of ts. After the processes, the
number between pipes gives the total number of polynomials in all the
sets ps. Finally, the number between braces gives the number of
components of a decomposition that are already computed. This number may
decrease.

Let us take a third example (Czapor-Geddes-Wang) to see how this
information is displayed.

Define a polynomial system.


.. spadInput
::

	u : R := 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: Integer`




.. spadInput
::

	q1 := 2*(u-1)^2+ 2*(x-z*x+z^2)+ y^2*(x-1)^2- 2*u*x+
2*y*t*(1-x)*(x-z)+ 2*u*z*t*(t-y)+ u^2*t^2*(1-2*z)+
2*u*t^2*(z-x)+ 2*u*t*y*(z-1)+ 2*u*z*x*(y+1)+
(u^2-2*u)*z^2*t^2+ 2*u^2*z^2+ 4*u*(1-u)*z+ t^2*(z-x)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------+
| (y2-2ty+t2)x2+(-2y2+((2t+4)z+2t)y+(-2t2+2)z-4t2-2)x+y2+(-2tz-4t)y+(t2+10)z2-8z+4t2+2   |
+----------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	q2 := t*(2*z+1)*(x-z)+ y*(z+2)*(1-x)+ u*(u-2)*t+
u*(1-2*u)*z*t+ u*y*(x+u-z*x-1)+ u*(u+1)*z^2*t


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| (-3zy+2tz+t)x+(z+4)y+4tz2-7tz   |
+---------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	q3 := -u^2*(z-1)^2+ 2*z*(z-x)-2*(x-1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| (-2z-2)x-2z2+8z-2   |
+---------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	q4 := u^2+4*(z-x^2)+3*y^2*(x-1)^2- 3*t^2*(z-x)^2
+3*u^2*t^2*(z-1)^2+u^2*z*(z-2)+6*u*t*y*(z+x+z*x-1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------+
| (3y2-3t2-4)x2+(-6y2+(12tz+12t)y+6t2z)x+3y2+(12tz-12t)y+(9t2+4)z2+(-24t2-4)z+12t2+4   |
+--------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])




.. spadInput
::

	lq := [q1, q2, q3, q4]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [(y2-2ty+t2)x2+(-2y2+((2t+4)z+2t)y+(-2t2+2)z-4t2-2)x+y2+(-2tz-4t)y+(t2+10)z2-8z+4t2+2,(-3zy+2tz+t)x+(z+4)y+4tz2-7tz,(-2z-2)x-2z2+8z-2,(3y2-3t2-4)x2+(-6y2+(12tz+12t)y+6t2z)x+3y2+(12tz-12t)y+(9t2+4)z2+(-24t2-4)z+12t2+4]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List NewSparseMultivariatePolynomial(Integer,OrderedVariableList`
[x,y,z,t])



Let us try the information option. N.B. The timing should be between 1
and 10 minutes, depending on your machine.


.. spadInput
::

	zeroSetSplit(lq,true,true)$T


.. spadMathAnswer
.. spadVerbatim

::


[1 <4,0> -> |4|; {0}]W[2 <5,0>,<3,1> -> |8|; {0}][2 <4,1>,<3,1> -> |7|; 

{0}][1 <3,1> -> |3|; {0}]G[2 <4,1>,<4,1> -> |8|; {0}]W[3 <5,1>,<4,1>,
 <3,2> -> |12|; {0}]GI[3 <4,2>,<4,1>,<3,2> -> |11|; {0}]GWw[3 <4,1>,
 <3,2>,<5,2> -> |12|; {0}][3 <3,2>,<3,2>,<5,2> -> |11|; {0}]GIwWWWw

[4 <3,2>,<4,2>,<5,2>,<2,3> -> |14|; {0}][4 <2,2>,<4,2>,<5,2>,<2,3> -> 
 |13|; {0}]Gwww[5 <3,2>,<3,2>,<4,2>,<5,2>,<2,3> -> |17|; {0}]Gwwwwww

[8 <3,2>,<4,2>,<4,2>,<4,2>,<4,2>,<4,2>,<5,2>,<2,3> -> |30|; {0}]Gwwwwww
 [8 <4,2>,<4,2>,<4,2>,<4,2>,<4,2>,<4,2>,<5,2>,<2,3> -> |31|; {0}][8 

<3,3>,<4,2>,<4,2>,<4,2>,<4,2>,<4,2>,<5,2>,<2,3> -> |30|; {0}][8 <2,3>,




.. spadVerbatim

::


<4,2>,<4,2>,<4,2>,<4,2>,<4,2>,<5,2>,<2,3> -> |29|; {0}][8 <1,3>,<4,2>,

<4,2>,<4,2>,<4,2>,<4,2>,<5,2>,<2,3> -> |28|; {0}][7 <4,2>,<4,2>,<4,2>,

<4,2>,<4,2>,<5,2>,<2,3> -> |27|; {0}][6 <4,2>,<4,2>,<4,2>,<4,2>,<5,2>,
 <2,3> -> |23|; {0}][5 <4,2>,<4,2>,<4,2>,<5,2>,<2,3> -> |19|; {0}]
 GIGIWwww[6 <5,2>,<4,2>,<4,2>,<5,2>,<3,3>,<2,3> -> |23|; {0}][6 <4,3>,
 <4,2>,<4,2>,<5,2>,<3,3>,<2,3> -> |22|; {0}]GIGI[6 <3,4>,<4,2>,<4,2>,

<5,2>,<3,3>,<2,3> -> |21|; {0}][6 <2,4>,<4,2>,<4,2>,<5,2>,<3,3>,<2,3> 

-> |20|; {0}]GGG[5 <4,2>,<4,2>,<5,2>,<3,3>,<2,3> -> |18|; {0}]GIGIWwwwW
 [6 <5,2>,<4,2>,<5,2>,<3,3>,<3,3>,<2,3> -> |22|; {0}][6 <4,3>,<4,2>,
 <5,2>,<3,3>,<3,3>,<2,3> -> |21|; {0}]GIwwWwWWWWWWWwWWWWwwwww[8 <4,2>,




.. spadVerbatim

::


<5,2>,<3,3>,<3,3>,<4,3>,<2,3>,<3,4>,<3,4> -> |27|; {0}][8 <3,3>,<5,2>,

<3,3>,<3,3>,<4,3>,<2,3>,<3,4>,<3,4> -> |26|; {0}][8 <2,3>,<5,2>,<3,3>,
 <3,3>,<4,3>,<2,3>,<3,4>,<3,4> -> |25|; {0}]Gwwwwwwwwwwwwwwwwwwww[9 
 <5,2>,<3,3>,<3,3>,<4,3>,<3,3>,<3,3>,<2,3>,<3,4>,<3,4> -> |29|; {0}]
 GI[9 <4,3>,<3,3>,<3,3>,<4,3>,<3,3>,<3,3>,<2,3>,<3,4>,<3,4> -> |28|; 

{0}][9 <3,3>,<3,3>,<3,3>,<4,3>,<3,3>,<3,3>,<2,3>,<3,4>,<3,4> -> |27|; 

{0}][9 <2,3>,<3,3>,<3,3>,<4,3>,<3,3>,<3,3>,<2,3>,<3,4>,<3,4> -> |26|; 
 {0}]GGwwwwwwwwwwwwWWwwwwwwww[11 <3,3>,<3,3>,<3,3>,<3,3>,<4,3>,<2,3>,

<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |33|; {0}][11 <2,3>,<3,3>,<3,3>,<3,3>,

<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |32|; {0}][11 <1,3>,<3,3>,




.. spadVerbatim

::

 <3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |31|; {0}]
 GGGwwwwwwwwwwwww[12 <2,3>,<2,3>,<3,3>,<3,3>,<4,3>,<3,3>,<2,3>,<3,3>,
 <3,3>,<3,3>,<3,4>,<3,4> -> |34|; {0}]GGwwwwwwwwwwwww[13 <3,3>,<2,3>,
 <3,3>,<3,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> 

|38|; {0}]Gwwwwwwwwwwwww[13 <2,3>,<3,3>,<4,3>,<3,3>,<4,3>,<3,3>,<3,3>,
 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |39|; {0}]GGGwwwwwwwwwwwww[15 

<3,3>,<4,3>,<3,3>,<3,3>,<3,3>,<3,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,

<3,3>,<3,4>,<3,4> -> |46|; {0}][14 <4,3>,<3,3>,<3,3>,<3,3>,<3,3>,<3,3>,

<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |43|; {0}]GIGGGGIGGI
 [14 <3,4>,<3,3>,<3,3>,<3,3>,<3,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,




.. spadVerbatim

::

 <3,3>,<3,4>,<3,4> -> |42|; {0}]GGG[14 <2,4>,<3,3>,<3,3>,<3,3>,<3,3>,
 <3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |41|; {0}]
 [14 <1,4>,<3,3>,<3,3>,<3,3>,<3,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,
 <3,3>,<3,4>,<3,4> -> |40|; {0}]GGG[13 <3,3>,<3,3>,<3,3>,<3,3>,<3,3>,
 <3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |39|; {0}]
 Gwwwwwwwwwwwww[15 <3,3>,<3,3>,<4,3>,<4,3>,<4,3>,<3,3>,<3,3>,<4,3>,
 <3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |48|; {0}]Gwwwwwwwwwwwww
 [15 <4,3>,<4,3>,<3,3>,<4,3>,<4,3>,<3,3>,<4,3>,<3,3>,<3,3>,<2,3>,<3,3>,
 <3,3>,<3,3>,<3,4>,<3,4> -> |49|; {0}]GIGI[15 <3,4>,<4,3>,<3,3>,<4,3>,
 <4,3>,<3,3>,<4,3>,<3,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> 




.. spadVerbatim

::

 |48|; {0}]G[14 <4,3>,<3,3>,<4,3>,<4,3>,<3,3>,<4,3>,<3,3>,<3,3>,<2,3>,
 <3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |45|; {0}][13 <3,3>,<4,3>,<4,3>,
 <3,3>,<4,3>,<3,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |41|; 
 {0}]Gwwwwwwwwwwwww[13 <4,3>,<4,3>,<4,3>,<3,3>,<3,3>,<4,3>,<3,3>,<2,3>,
 <3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |42|; {0}]GIGGGGIGGI[13 <3,4>,<4,3>,
 <4,3>,<3,3>,<3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> 

|41|; {0}]GGGGGGGG[13 <2,4>,<4,3>,<4,3>,<3,3>,<3,3>,<4,3>,<3,3>,<2,3>,

<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |40|; {0}][13 <1,4>,<4,3>,<4,3>,<3,3>,
 <3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |39|; {0}]
 [13 <0,4>,<4,3>,<4,3>,<3,3>,<3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,




.. spadVerbatim

::

 <3,4>,<3,4> -> |38|; {0}][12 <4,3>,<4,3>,<3,3>,<3,3>,<4,3>,<3,3>,
 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |38|; {1}][11 <4,3>,<3,3>,
 <3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |34|; {1}]
 [10 <3,3>,<3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> 
 |30|; {1}][10 <2,3>,<3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,
 <3,4> -> |29|; {1}]GGGwwwwwwwwwwwww[11 <3,3>,<3,3>,<4,3>,<3,3>,
 <3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |33|; {1}]
 GGGwwwwwwwwwwwww[12 <4,3>,<3,3>,<4,3>,<3,3>,<3,3>,<4,3>,
 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |38|; {1}]Gwwwwwwwwwwwww
 [12 <3,3>,<4,3>,<5,3>,<3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,




.. spadVerbatim

::

 <3,4>,<3,4> -> |39|; {1}]GGwwwwwwwwwwwww[13 <5,3>,<4,3>,<4,3>,
 <4,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> 
 |44|; {1}]GIGGGGIGGIW[13 <4,4>,<4,3>,<4,3>,<4,3>,<3,3>,<3,3>,
 <4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |43|; {1}]GGW[13 
 <3,4>,<4,3>,<4,3>,<4,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,
 <3,4>,<3,4> -> |42|; {1}]GGG[12 <4,3>,<4,3>,<4,3>,<3,3>,<3,3>,<4,3>,
 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |39|; {1}]Gwwwwwwwwwwwww[12 
 <4,3>,<4,3>,<5,3>,<3,3>,<4,3>,<3,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,
 <3,4> -> |40|; {1}]Gwwwwwwwwwwwww[13 <5,3>,<5,3>,<4,3>,<5,3>,<3,3>,
 <3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |46|; {1}]GIGIW




.. spadVerbatim

::

 [13 <4,4>,<5,3>,<4,3>,<5,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,
 <3,3>,<3,4>,<3,4> -> |45|; {1}][13 <3,4>,<5,3>,<4,3>,<5,3>,<3,3>,
 <3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |44|; {1}][13 
 <2,4>,<5,3>,<4,3>,<5,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,
 <3,4>,<3,4> -> |43|; {1}]GG[12 <5,3>,<4,3>,<5,3>,<3,3>,<3,3>,<4,3>,
 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |41|; {1}]GIGGGGIGGIW[12 
 <4,4>,<4,3>,<5,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,
 <3,4> -> |40|; {1}]GGGGGGW[12 <3,4>,<4,3>,<5,3>,<3,3>,<3,3>,<4,3>,
 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |39|; {1}][12 <2,4>,<4,3>,
 <5,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |38|; 




.. spadVerbatim

::

 {1}][12 <1,4>,<4,3>,<5,3>,<3,3>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,
 <3,4>,<3,4> -> |37|; {1}]GGG[11 <4,3>,<5,3>,<3,3>,<3,3>,<4,3>,<2,3>,
 <3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |36|; {1}][10 <5,3>,<3,3>,<3,3>,
 <4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |32|; {1}][9 <3,3>,
 <3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |27|; {1}]W[9 
 <2,4>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |26|; {1}]
 [9 <1,4>,<3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |25|; 
 {1}][8 <3,3>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |24|; {1}]
 W[8 <2,4>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |23|; {1}][8 

<1,4>,<4,3>,<2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |22|; {1}][7 <4,3>,




.. spadVerbatim

::

 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |21|; {1}]w[7 <3,4>,<2,3>,
 <3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |20|; {1}][7 <2,4>,<2,3>,<3,3>,
 <3,3>,<3,3>,<3,4>,<3,4> -> |19|; {1}][7 <1,4>,<2,3>,<3,3>,<3,3>,
 <3,3>,<3,4>,<3,4> -> |18|; {1}][6 <2,3>,<3,3>,<3,3>,<3,3>,<3,4>,
 <3,4> -> |17|; {1}]GGwwwwww[7 <3,3>,<3,3>,<3,3>,<3,3>,<3,3>,<3,4>,
 <3,4> -> |21|; {1}]GIW[7 <2,4>,<3,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> 
 -> |20|; {1}]GG[6 <3,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |18|; {1}]
 Gwwwwww[7 <4,3>,<4,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |23|; {1}]
 GIW[7 <3,4>,<4,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |22|; {1}][6 
 <4,3>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |19|; {1}]GIW[6 <3,4>,<3,3>,




.. spadVerbatim

::

 <3,3>,<3,3>,<3,4>,<3,4> -> |18|; {1}]GGW[6 <2,4>,<3,3>,<3,3>,<3,3>,
 <3,4>,<3,4> -> |17|; {1}][6 <1,4>,<3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> 
 |16|; {1}]GGG[5 <3,3>,<3,3>,<3,3>,<3,4>,<3,4> -> |15|; {1}]GIW[5 
 <2,4>,<3,3>,<3,3>,<3,4>,<3,4> -> |14|; {1}]GG[4 <3,3>,<3,3>,<3,4>,

<3,4> -> |12|; {1}][3 <3,3>,<3,4>,<3,4> -> |9|; {1}]W[3 <2,4>,<3,4>,
 <3,4> -> |8|; {1}][3 <1,4>,<3,4>,<3,4> -> |7|; {1}]G[2 <3,4>,<3,4> 

-> |6|; {1}]G[1 <3,4> -> |3|; {1}][1 <2,4> -> |2|; {1}][1 <1,4> -> 
 |1|; {1}]




.. spadVerbatim

::

    ^* QCMPACK Statistics ^*
       Table     size:  36
       Entries reused:  255
    ^* REGSETGCD: Gcd Statistics ^*
       Table     size:  125
       Entries reused:  0
    ^* REGSETGCD: Inv Set Statistics ^*
       Table     size:  30
       Entries reused:  0




.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+



(26604210869491302385515265737052082361668474181372891857784t23+443104378424686086067294899528296664238693556855017735265295t22+279078393286701234679141342358988327155321305829547090310242t21+3390276361413232465107617176615543054620626391823613392185226t20+941478179503540575554198645220352803719793196473813837434129t19+11547855194679475242211696749673949352585747674184320988144390t18+1343609566765597789881701656699413216467215660333356417241432t17+23233813868147873503933551617175640859899102987800663566699334t16+869574020537672336950845440508790740850931336484983573386433t15+31561554305876934875419461486969926554241750065103460820476969t14+
1271400990287717487442065952547731879554823889855386072264931t13+31945089913863736044802526964079540198337049550503295825160523t12+3738735704288144509871371560232845884439102270778010470931960t11+25293997512391412026144601435771131587561905532992045692885927t10+5210239009846067123469262799870052773410471135950175008046524t9+15083887986930297166259870568608270427403187606238713491129188t8+3522087234692930126383686270775779553481769125670839075109000t7+6079945200395681013086533792568886491101244247440034969288588t6+1090634852433900888199913756247986023196987723469934933603680t5+1405819430871907102294432537538335402102838994019667487458352t4+
88071527950320450072536671265507748878347828884933605202432t3+135882489433640933229781177155977768016065765482378657129440t2-13957283442882262230559894607400314082516690749975646520320t+334637692973189299277258325709308472592117112855749713920)z+8567175484043952879756725964506833932149637101090521164936t23+149792392864201791845708374032728942498797519251667250945721t22+77258371783645822157410861582159764138123003074190374021550t21+1108862254126854214498918940708612211184560556764334742191654t20+213250494460678865219774480106826053783815789621501732672327t19+
3668929075160666195729177894178343514501987898410131431699882t18+171388906471001872879490124368748236314765459039567820048872t17+7192430746914602166660233477331022483144921771645523139658986t16-128798674689690072812879965633090291959663143108437362453385t15+9553010858341425909306423132921134040856028790803526430270671t14-13296096245675492874538687646300437824658458709144441096603t13+9475806805814145326383085518325333106881690568644274964864413t12+803234687925133458861659855664084927606298794799856265539336t11+7338202759292865165994622349207516400662174302614595173333825t10+1308004628480367351164369613111971668880538855640917200187108t9+
4268059455741255498880229598973705747098216067697754352634748t8+892893526858514095791318775904093300103045601514470613580600t7+1679152575460683956631925852181341501981598137465328797013652t6+269757415767922980378967154143357835544113158280591408043936t5+380951527864657529033580829801282724081345372680202920198224t4+19785545294228495032998826937601341132725035339452913286656t3+36477412057384782942366635303396637763303928174935079178528t2-3722212879279038648713080422224976273210890229485838670848t+89079724853114348361230634484013862024728599906874105856,
(3z3-11z2+8z+4)y+2tz3+4tz2-5tz-t,:(z+1)x+z2-4z+1}]


.. spadType

:sub:`Type: List RegularTriangularSet( Integer, IndexedExponents`
OrderedVariableList [x,y,z,t], OrderedVariableList [x,y,z,t],
NewSparseMultivariatePolynomial(Integer, OrderedVariableList [x,y,z,t]))



Between a sequence of processes, thus between a ] and a [ you can see
capital letters W, G, I and lower case letters i, w. Each time a capital
letter appears a non-trivial computation has be performed and its result
is put in a hash-table. Each time a lower case letter appears a needed
result has been found in an hash-table. The use of these hash-tables
generally speed up the computations. However, on very large systems, it
may happen that these hash-tables become too big to be handle by your
AXIOM configuration. Then in these exceptional cases, you may prefer
getting a result (even if it takes a long time) than getting nothing.
Hence you need to know how to prevent the RSEGSET constructor from using
these hash-tables. In that case you will be using the zeroSetSplit with
five arguments. The first one is the input system lp as above. The
second one is a boolean value hash? which is true iff you want to use
hash-tables. The third one is boolean value clos? which is true iff you
want to solve your system in the sense of Kalkbrener, the other way
remaining that of Lazard. The fourth argument is boolean value info?
which is true iff you want to display information during the
computations. The last one is boolean value prep? which is true iff you
want to use some heuristics that are performed on the input system
before starting the real algorithm. The value of this flag is true when
you are using zeroSetSplit with less than five arguments. Note that
there is no available signature for zeroSetSplit with four arguments.

We finish this section by some remarks about both ways of solving, in
the sense of Kalkbrener or in the sense of Lazard. For problems with a
finite number of solutions, there are theoretically equivalent and the
resulting decompositions are identical, up to the ordering of the
components. However, when solving in the sense of Lazard, the algorithm
behaves differently. In that case, it becomes more incremental than in
the sense of Kalkbrener. That means the polynomials of the input system
are considered one after another whereas in the sense of Kalkbrener the
input system is treated more globally.

This makes an important difference in positive dimension. Indeed when
solving in the sense of Kalkbrener, the Primeidealkettensatz of Krull is
used. That means any regular triangular containing more polynomials than
the input system can be deleted. This is not possible when solving in
the sense of Lazard. This explains why Kalkbrener's decompositions
usually contain less components than those of Lazard. However, it may
happen with some examples that the incremental process (that cannot be
used when solving in the sense of Kalkbrener) provide a more efficient
way of solving than the global one even if the Primeidealkettensatz is
used. Thus just try both, with the various options, before concluding
that you cannot solve your favorite system with zeroSetSplit. There
exist more options at the development level that are not currently
available in this public version.



