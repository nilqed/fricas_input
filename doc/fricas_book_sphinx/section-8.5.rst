.. status: ok



8.5 Solution of Linear and Polynomial Equations
-----------------------------------------------

In this section we discuss the FriCAS facilities for solving systems of
linear equations, finding the roots of polynomials and linear equation
solving systems of polynomial equations. For a discussion of the
solution of differential equations, see
`ugProblemDEQ <section-8.10.html#ugProblemDEQ>`__ .



8.5.1 Solution of Systems of Linear Equations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can use the operation solve to solve systems of linear equations.
equation:linear:solving

The operation solve takes two arguments, the list of equations and the
list of the unknowns to be solved for. A system of linear equations need
not have a unique solution.

To solve the linear system: x+y+z=83x-2y+z=0x+2y+2z=17 evaluate this
expression.


.. spadInput
::

	solve([x+y+z=8,3*x-2*y+z=0,x+2*y+2*z=17],[x,y,z])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| [[x=-1,y=2,z=7]]   |
+--------------------+




.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`



Parameters are given as new variables starting with a percent sign and %
and the variables are expressed in terms of the parameters. If the
system has no solutions then the empty list is returned.

When you solve the linear system x+2y+3z=22x+3y+4z=23x+4y+5z=2 with this
expression you get a solution involving a parameter.


.. spadInput
::

	solve([x+2*y+3*z=2,2*x+3*y+4*z=2,3*x+4*y+5*z=2],[x,y,z])


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [[x=%Q-2,y=-2%Q+2,z=%Q]]   |
+----------------------------+




.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`



The system can also be presented as a matrix and a vector. The matrix
contains the coefficients of the linear equations and the vector
contains the numbers appearing on the right-hand sides of the equations.
You may input the matrix as a list of rows and the vector as a list of
its elements.

To solve the system: x+y+z=83x-2y+z=0x+2y+2z=17 in matrix form you would
evaluate this expression.


.. spadInput
::

	solve([ [1,1,1],[3,-2,1],[1,2,2] ],[8,0,17])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| [particular=[-1,2,7],basis=[[0,0,0]]]   |
+-----------------------------------------+




.. spadType

:sub:`Type: Record(particular: Union(Vector Fraction Integer,"failed"), basis:`
List Vector Fraction Integer)



The solutions are presented as a Record with two components: the
component particular contains a particular solution of the given system
or the item "failed" if there are no solutions, the component basis
contains a list of vectors that are a basis for the space of solutions
of the corresponding homogeneous system. If the system of linear
equations does not have a unique solution, then the basis component
contains non-trivial vectors.

This happens when you solve the linear system
x+2y+3z=22x+3y+4z=23x+4y+5z=2 with this command.


.. spadInput
::

	solve([ [1,2,3],[2,3,4],[3,4,5] ],[2,2,2])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| [particular=[-2,2,0],basis=[[1,-2,1]]]   |
+------------------------------------------+




.. spadType

:sub:`Type: Record(particular: Union(Vector Fraction Integer,"failed"), basis:`
List Vector Fraction Integer)



All solutions of this system are obtained by adding the particular
solution with a linear combination of the basis vectors.

When no solution exists then "failed" is returned as the particular
component, as follows:


.. spadInput
::

	solve([ [1,2,3],[2,3,4],[3,4,5] ],[2,3,2])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| [particular="failed",basis=[[1,-2,1]]]   |
+------------------------------------------+




.. spadType

:sub:`Type: Record(particular: Union(Vector Fraction Integer,"failed"), basis:`
List Vector Fraction Integer)



When you want to solve a system of homogeneous equations (that is, a
system where the numbers on the right-hand sides of the nullspace
equations are all zero) in the matrix form you can omit the second
argument and use the nullSpace operation.

This computes the solutions of the following system of equations:
x+2y+3z=02x+3y+4z=03x+4y+5z=0 The result is given as a list of vectors
and these vectors form a basis for the solution space.


.. spadInput
::

	nullSpace([ [1,2,3],[2,3,4],[3,4,5] ])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [[1,-2,1]]   |
+--------------+




.. spadType

:sub:`Type: List Vector Integer`







8.5.2 Solution of a Single Polynomial Equation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS can solve polynomial equations producing either approximate
polynomial:root finding or exact solutions. equation:polynomial:solving
Exact solutions are either members of the ground field or can be
presented symbolically as roots of irreducible polynomials.

This returns the one rational root along with an irreducible polynomial
describing the other solutions.


.. spadInput
::

	solve(x^3 = 8,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [x=2,x2+2x+4=0]   |
+-------------------+




.. spadType

:sub:`Type: List Equation Fraction Polynomial Integer`



If you want solutions expressed in terms of radicals you would use this
instead. radical


.. spadInput
::

	radicalSolve(x^3 = 8,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| [x=--3-1,x=-3-1,x=2]   |
+------------------------+




.. spadType

:sub:`Type: List Equation Expression Integer`



The solve command always returns a value but radicalSolve returns only
the solutions that it is able to express in terms of radicals. radical

If the polynomial equation has rational coefficients you can ask for
approximations to its real roots by calling solve with a second argument
that specifies the precision precision . This means that each
approximation will be within of the actual result.

Notice that the type of second argument controls the type of the result.


.. spadInput
::

	solve(x^4 - 10*x^3 + 35*x^2 - 50*x + 25,.0001)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| [x=3.618011474609375,x=1.381988525390625]   |
+---------------------------------------------+




.. spadType

:sub:`Type: List Equation Polynomial Float`



If you give a floating-point precision you get a floating-point result;
if you give the precision as a rational number you get a rational
result.


.. spadInput
::

	solve(x^3-2,1/1000)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| [x=25812048]   |
+----------------+




.. spadType

:sub:`Type: List Equation Polynomial Fraction Integer`



If you want approximate complex results you should use the approximation
command complexSolve that takes the same precision argument .


.. spadInput
::

	complexSolve(x^3-2,.0001)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------+
| [x=1.259918212890625,x=-0.62989432795395613131-1.091094970703125i,x=-0.62989432795395613131+1.091094970703125i]   |
+-------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Equation Polynomial Complex Float`



Each approximation will be within of the actual result in each of the
real and imaginary parts.


.. spadInput
::

	complexSolve(x^2-2*%i+1,1/100)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------+
| [x=-1302892516777216-325256i,x=1302892516777216+325256i]   |
+------------------------------------------------------------+




.. spadType

:sub:`Type: List Equation Polynomial Complex Fraction Integer`



Note that if you omit the = from the first argument FriCAS generates an
equation by equating the first argument to zero. Also, when only one
variable is present in the equation, you do not need to specify the
variable to be solved for, that is, you can omit the second argument.

FriCAS can also solve equations involving rational functions. Solutions
where the denominator vanishes are discarded.


.. spadInput
::

	radicalSolve(1/x^3 + 1/x^2 + 1/x = 0,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| [x=--3-12,x=-3-12]   |
+----------------------+




.. spadType

:sub:`Type: List Equation Expression Integer`







8.5.3 Solution of Systems of Polynomial Equations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Given a system of equations of rational functions with exact
coefficients: equation:polynomial:solving


.. spadMathOutput
.. math::

+---------------------------+
| p1(x1,…,xn)⋮pm(x1,…,xn)   |
+---------------------------+



FriCAS can find numeric or symbolic solutions. The system is first split
into irreducible components, then for each component, a triangular
system of equations is found that reduces the problem to sequential
solution of univariate polynomials resulting from substitution of
partial solutions from the previous stage. q1(x1,…,xn)⋮qm(xn)

Symbolic solutions can be presented using implicit algebraic numbers
defined as roots of irreducible polynomials or in terms of radicals.
FriCAS can also find approximations to the real or complex roots of a
system of polynomial equations to any user-specified accuracy.

The operation solve for systems is used in a way similar to solve for
single equations. Instead of a polynomial equation, one has to give a
list of equations and instead of a single variable to solve for, a list
of variables. For solutions of single equations see
`ugxProblemOnePol <section-8.5.html#ugxProblemOnePol>`__ .

Use the operation solve if you want implicitly presented solutions.


.. spadInput
::

	solve([3*x^3 + y + 1,y^2 -4],[x,y])


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------+
| [[x=-1,y=2],[x2-x+1=0,y=2],[3x3-1=0,y=-2]]   |
+----------------------------------------------+




.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`




.. spadInput
::

	solve([x = y^2-19,y = z^2+x+3,z = 3*x],[x,y,z])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| [[x=z3,y=3z2+z+93,9z4+6z3+55z2+15z-90=0]]   |
+---------------------------------------------+




.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`



Use radicalSolve if you want your solutions expressed in terms of
radicals.


.. spadInput
::

	radicalSolve([3*x^3 + y + 1,y^2 -4],[x,y])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------+
| [[x=-3+12,y=2],[x=--3+12,y=2],[x=--13-1233,y=-2],[x=-13-1233,y=-2],[x=133,y=-2],[x=-1,y=2]]   |
+-----------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List Equation Expression Integer`



To get numeric solutions you only need to give the list of equations and
the precision desired. The list of variables would be redundant
information since there can be no parameters for the numerical solver.

If the precision is expressed as a floating-point number you get results
expressed as floats.


.. spadInput
::

	solve([x^2*y - 1,x*y^2 - 2],.01)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [[y=1.5859375,x=0.79296875]]   |
+--------------------------------+




.. spadType

:sub:`Type: List List Equation Polynomial Float`



To get complex numeric solutions, use the operation complexSolve, which
takes the same arguments as in the real case.


.. spadInput
::

	complexSolve([x^2*y - 1,x*y^2 - 2],1/1000)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [[y=16251024,x=16252048],[y=-435445573689549755813888-14071024i,x=-4354455736891099511627776-14072048i],[y=-435445573689549755813888+14071024i,x=-4354455736891099511627776+14072048i]]   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List Equation Polynomial Complex Fraction Integer`



It is also possible to solve systems of equations in rational functions
over the rational numbers. Note that [x=0.0,a=0.0] is not returned as a
solution since the denominator vanishes there.


.. spadInput
::

	solve([x^2/a = a,a = a*x],.001)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| [[x=1.0,a=-1.0],[x=1.0,a=1.0]]   |
+----------------------------------+




.. spadType

:sub:`Type: List List Equation Polynomial Float`



When solving equations with denominators, all solutions where the
denominator vanishes are discarded.


.. spadInput
::

	radicalSolve([x^2/a + a + y^3 - 1,a*y + a + 1],[x,y])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------+
| [[x=--a4+2a3+3a2+3a+1a2,y=-a-1a],[x=-a4+2a3+3a2+3a+1a2,y=-a-1a]]   |
+--------------------------------------------------------------------+




.. spadType

:sub:`Type: List List Equation Expression Integer`







