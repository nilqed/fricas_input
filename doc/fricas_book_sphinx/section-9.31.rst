.. status: ok


9.31 GroebnerFactorizationPackage
---------------------------------

Solving systems of polynomial equations with the Gröbner basis algorithm
can often be very time consuming because, in general, the algorithm has
exponential run-time. These systems, which often come from concrete
applications, frequently have symmetries which are not taken advantage
of by the algorithm. However, it often happens in this case that the
polynomials which occur during the Gröbner calculations are reducible.
Since FriCAS has an excellent polynomial factorization algorithm, it is
very natural to combine the Gröbner and factorization algorithms.

GroebnerFactorizationPackage exports the
groebnerFactorizegroebnerFactorizeGroebnerFactorizationPackage operation
which implements a modified Gröbner basis algorithm. In this algorithm,
each polynomial that is to be put into the partial list of the basis is
first factored. The remaining calculation is split into as many parts as
there are irreducible factors. Call these factors p1,…,pn. In the
branches corresponding to p2,…,pn, the factor p1 can be divided out, and
so on. This package also contains operations that allow you to specify
the polynomials that are not zero on the common roots of the final
Gröbner basis.

Here is an example from chemistry. In a theoretical model of
cyclohexane, C6H12, the six carbon atoms each sit in the center of
gravity of a tetrahedron that has two hydrogen atoms and two carbon
atoms at its corners. We first normalize and set the length of each edge
to 1. Hence, the distances of one fixed carbon atom to each of its
immediate neighbours is 1. We will denote the distances to the other
three carbon atoms by x, y and z.

A. Dress developed a theory to decide whether a set of points and
distances between them can be realized in an n-dimensional space. Here,
of course, we have n=3.


.. spadInput
::

	mfzn : SQMATRIX(6,DMP([x,y,z],Fraction INT)) := [ [0,1,1,1,1,1],
[1,0,1,8/3,x,8/3], [1,1,0,1,8/3,y], [1,8/3,1,0,1,8/3], [1,x,8/3,1,0,1],
[1,8/3,y,8/3,1,0] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| [01111110183x83110183y183101831x83101183y8310]   |
+--------------------------------------------------+




.. spadType

:sub:`Type: SquareMatrix(6,DistributedMultivariatePolynomial([x,y,z],Fraction`
Integer))



For cyclohexane the distances have to satisfy this equation.


.. spadInput
::

	eq := determinant mfzn


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------+
| -x2y2+223x2y-259x2+223xy2-3889xy-25027x-259y2-25027y+1457581   |
+----------------------------------------------------------------+




.. spadType

:sub:`Type: DistributedMultivariatePolynomial([x,y,z],Fraction Integer)`



They also must satisfy the equations given by cyclic shifts of the
indeterminates.


.. spadInput
::

	groebnerFactorize [eq, eval(eq, [x,y,z], [y,z,x]), eval(eq, [x,y,z],
[z,x,y])]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [[xy+xz-223x+yz-223y-223z+1213,xz2-223xz+259x+yz2-223yz+259y-223z2+3889z+25027,y2z2-223y2z+259y2-223yz2+3889yz+25027y+259z2+25027z-1457581],[x+y-219945625,y2-219945625y+4427675,z-46387],[x2-12xz-112x-56z+26518,y-z,z2-383z+2659],[x-259,y-113,z-113],[x-113,y-113,z-113],[x+53,y+53,z+53],[x-193,y+53,z+53]]   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List DistributedMultivariatePolynomial([x,y,z],Fraction`
Integer)



The union of the solutions of this list is the solution of our original
problem. If we impose positivity conditions, we get two relevant ideals.
One ideal is zero-dimensional, namely x=y=z=11/3, and this determines
the boat form of cyclohexane. The other ideal is one-dimensional, which
means that we have a solution space given by one parameter. This gives
the chair form of cyclohexane. The parameter describes the angle of the
back of the chair.

groebnerFactorizegroebnerFactorizeGroebnerFactorizationPackage has an
optional Boolean-valued second argument. When it is true partial results
are displayed, since it may happen that the calculation does not
terminate in a reasonable time. See the source code for
GroebnerFactorizationPackage in groebf.input for more details about the
algorithms used.



