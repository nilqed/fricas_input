.. status: ok


8.10 Solution of Differential Equations
---------------------------------------

In this section we discuss FriCAS's facilities for
equation:differential:solving solving differential equation differential
equations in closed-form and in series.

FriCAS provides facilities for closed-form solution of
equation:differential:solving in closed-form single differential
equations of the following kinds:

-  linear ordinary differential equations, and
-  non-linear first order ordinary differential equations when
   integrating factors can be found just by integration.

For a discussion of the solution of systems of linear and polynomial
equations, see
`ugProblemLinPolEqn <section-8.5.html#ugProblemLinPolEqn>`__ .



8.10.1 Closed-Form Solutions of Linear Differential Equations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A differential equation is an equation involving an unknown function and
one or more of its derivatives. differential equation The equation is
called ordinary if derivatives with respect to equation:differential
only one dependent variable appear in the equation (it is called partial
otherwise). The package ElementaryFunctionODESolver provides the
top-level operation solve for finding closed-form solutions of ordinary
differential equations. ElementaryFunctionODESolver

To solve a differential equation, you must first create an operator for
operator the unknown function.

We let y be the unknown function in terms of x.


.. spadInput
::

	y := operator 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



You then type the equation using D to create the derivatives of the
unknown function y(x) where x is any symbol you choose (the so-called
dependent variable).

This is how you enter the equation y′′+y′+y=0.


.. spadInput
::

	deq := D(y x, x, 2) + D(y x, x) + y x = 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| y′′(x)+y′(x)+y(x)=0   |
+-----------------------+




.. spadType

:sub:`Type: Equation Expression Integer`



The simplest way to invoke the solve command is with three arguments.

-  the differential equation,
-  the operator representing the unknown function,
-  the dependent variable.

So, to solve the above equation, we enter this.


.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| [particular=0,basis=[cos(x32)e(-x2),e(-x2)sin(x32)]]   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression`
Integer),...)



Since linear ordinary differential equations have infinitely many
solutions, solve returns a particular solution fp and a basis for the
solutions of the corresponding homogenuous equation. Any expression of
the form where the ci do not involve the dependent variable is also a
solution. This is similar to what you get when you solve systems of
linear algebraic equations.

A way to select a unique solution is to specify initial conditions:
choose a value a for the dependent variable and specify the values of
the unknown function and its derivatives at a. If the number of initial
conditions is equal to the order of the equation, then the solution is
unique (if it exists in closed form!) and solve tries to find it. To
specify initial conditions to solve, use an Equation of the form x=a for
the third parameter instead of the dependent variable, and add a fourth
parameter consisting of the list of values y(a),y′(a),....

To find the solution of y′′+y=0 satisfying y(0)=y′(0)=1, do this.


.. spadInput
::

	deq := D(y x, x, 2) + y x


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| y′′(x)+y(x)   |
+---------------+




.. spadType

:sub:`Type: Expression Integer`



You can omit the =0 when you enter the equation to be solved.


.. spadInput
::

	solve(deq, y, x = 0, [1, 1])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| sin(x)+cos(x)   |
+-----------------+




.. spadType

:sub:`Type: Union(Expression Integer,...)`



FriCAS is not limited to linear differential equations with constant
coefficients. It can also find solutions when the coefficients are
rational or algebraic functions of the dependent variable. Furthermore,
FriCAS is not limited by the order of the equation.

FriCAS can solve the following third order equations with polynomial
coefficients.


.. spadInput
::

	deq := x^3 * D(y x, x, 3) + x^2 * D(y x, x, 2) - 2 * x * D(y x, x) +
2 * y x = 2 * x^4


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| x3y′′′(x)+x2y′′(x)-2xy′(x)+2y(x)=2x4   |
+----------------------------------------+




.. spadType

:sub:`Type: Equation Expression Integer`




.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------+
| [particular=x5-10x3+20x2+415x,basis=[2x3-3x2+1x,x3-1x,x3-3x2-1x]]   |
+---------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression`
Integer),...)



Here we are solving a homogeneous equation.


.. spadInput
::

	deq := (x^9+x^3) * D(y x, x, 3) + 18 * x^8 * D(y x, x, 2) - 90 * x
* D(y x, x) - 30 * (11 * x^6 - 3) * y x


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| (x9+x3)y′′′(x)+18x8y′′(x)-90xy′(x)+(-330x6+90)y(x)   |
+------------------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------+
| [particular=0,basis=[xx6+1,xe(-91log(x))x6+1,xe(91log(x))x6+1]]   |
+-------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression`
Integer),...)



On the other hand, and in contrast with the operation integrate, it can
happen that FriCAS finds no solution and that some closed-form solution
still exists. While it is mathematically complicated to describe exactly
when the solutions are guaranteed to be found, the following statements
are correct and form good guidelines for linear ordinary differential
equations:

-  If the coefficients are constants, FriCAS finds a complete basis of
   solutions (i,e, all solutions).
-  If the coefficients are rational functions in the dependent variable,
   FriCAS at least finds all solutions that do not involve algebraic
   functions.

Note that this last statement does not mean that FriCAS does not find
the solutions that are algebraic functions. It means that it is not
guaranteed that the algebraic function solutions will be found.

This is an example where all the algebraic solutions are found.


.. spadInput
::

	deq := (x^2 + 1) * D(y x, x, 2) + 3 * x * D(y x, x) + y x = 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| (x2+1)y′′(x)+3xy′(x)+y(x)=0   |
+-------------------------------+




.. spadType

:sub:`Type: Equation Expression Integer`




.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| [particular=0,basis=[1x2+1,log(x2+1-x)x2+1]]   |
+------------------------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression`
Integer),...)







8.10.2 Closed-Form Solutions of Non-Linear Differential Equations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is an example that shows how to solve a non-linear first order
ordinary differential equation manually when an integrating factor can
be found just by integration. At the end, we show you how to solve it
directly.

Let's solve the differential equation y′=y/(x+ylogy).

Using the notation m(x,y)+n(x,y)y′=0, we have m=-y and n=x+ylogy.


.. spadInput
::

	m := -y


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -y   |
+------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	n := x + y * log y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| ylog(y)+x   |
+-------------+




.. spadType

:sub:`Type: Expression Integer`



We first check for exactness, that is, does dm/dy=dn/dx?


.. spadInput
::

	D(m, y) - D(n, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -2   |
+------+




.. spadType

:sub:`Type: Expression Integer`



This is not zero, so the equation is not exact. Therefore we must look
for an integrating factor: a function mu(x,y) such that
d(mum)/dy=d(mun)/dx. Normally, we first search for mu(x,y) depending
only on x or only on y.

Let's search for such a mu(x) first.


.. spadInput
::

	mu := operator 'mu


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| mu   |
+------+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	a := D(mu(x) * m, y) - D(mu(x) * n, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| (-ylog(y)-x)mu′(x)-2mu(x)   |
+-----------------------------+




.. spadType

:sub:`Type: Expression Integer`



If the above is zero for a function mu that does not depend on y, then
mu(x) is an integrating factor.


.. spadInput
::

	solve(a = 0, mu, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| [particular=0,basis=[1y2log(y)2+2xylog(y)+x2]]   |
+--------------------------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression`
Integer),...)



The solution depends on y, so there is no integrating factor that
depends on x only.

Let's look for one that depends on y only.


.. spadInput
::

	b := D(mu(y) * m, y) - D(mu(y) * n, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| -ymu′(y)-2mu(y)   |
+-------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	sb := solve(b = 0, mu, y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [particular=0,basis=[1y2]]   |
+------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression`
Integer),...)



We've found one!

The above mu(y) is an integrating factor. We must multiply our initial
equation (that is, m and n) by the integrating factor.


.. spadInput
::

	intFactor := sb.basis.1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 1y2   |
+-------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	m := intFactor * m


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| -1y   |
+-------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	n := intFactor * n


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| ylog(y)+xy2   |
+---------------+




.. spadType

:sub:`Type: Expression Integer`



Let's check for exactness.


.. spadInput
::

	D(m, y) - D(n, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Expression Integer`



We must solve the exact equation, that is, find a function s(x,y) such
that ds/dx=m and ds/dy=n.

We start by writing s(x,y)=h(y)+integrate(m,x) where h(y) is an unknown
function of y. This guarantees that ds/dx=m.


.. spadInput
::

	h := operator 'h


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| h   |
+-----+




.. spadType

:sub:`Type: BasicOperator`




.. spadInput
::

	sol := h y + integrate(m, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| yh(y)-xy   |
+------------+




.. spadType

:sub:`Type: Expression Integer`



All we want is to find h(y) such that ds/dy=n.


.. spadInput
::

	dsol := D(sol, y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| y2h′(y)+xy2   |
+---------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	nsol := solve(dsol = n, h, y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| [particular=log(y)22,basis=[1]]   |
+-----------------------------------+




.. spadType

:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression`
Integer),...)



The above particular solution is the h(y) we want, so we just replace
h(y) by it in the implicit solution.


.. spadInput
::

	eval(sol, h y = nsol.particular)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| ylog(y)2-2x2y   |
+-----------------+




.. spadType

:sub:`Type: Expression Integer`



A first integral of the initial equation is obtained by setting this
result equal to an arbitrary constant.

Now that we've seen how to solve the equation by hand, we show you how
to do it with the solve operation.

First define y to be an operator.


.. spadInput
::

	y := operator 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



Next we create the differential equation.


.. spadInput
::

	deq := D(y x, x) = y(x) / (x + y(x) * log y x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| y′(x)=y(x)y(x)log(y(x))+x   |
+-----------------------------+




.. spadType

:sub:`Type: Equation Expression Integer`



Finally, we solve it.


.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| y(x)log(y(x))2-2x2y(x)   |
+--------------------------+




.. spadType

:sub:`Type: Union(Expression Integer,...)`







8.10.3 Power Series Solutions of Differential Equations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The command to solve differential equations in power
equation:differential:solving in power series series power series around
series:power a particular initial point with specific initial conditions
is called seriesSolve. It can take a variety of parameters, so we
illustrate its use with some examples.

Since the coefficients of some solutions are quite large, we reset the
default to compute only seven terms.


.. spadInput
::

	)set streams calculate 7


.. spadMathAnswer
You can solve a single nonlinear equation of any order. For example, we
solve y′′′=sin(y′′)*exp(y)+cos(x) subject to y(0)=1,y′(0)=0,y′′(0)=0

We first tell FriCAS that the symbol 'y denotes a new operator.


.. spadInput
::

	y := operator 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



Enter the differential equation using y like any system function.


.. spadInput
::

	eq := D(y(x), x, 3) - sin(D(y(x), x, 2))*exp(y(x)) = cos(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| y′′′(x)-ey(x)sin(y′′(x))=cos(x)   |
+-----------------------------------+




.. spadType

:sub:`Type: Equation Expression Integer`



Solve it around x=0 with the initial conditions y(0)=1,y′(0)=y′′(0)=0.


.. spadInput
::

	seriesSolve(eq, y, x = 0, [1, 0, 0])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------+
| 1+16x3+e24x4+e2-1120x5+e3-2e720x6+e4-8e2+4e+15040x7+O(x8)   |
+-------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,x,0)`



You can also solve a system of nonlinear first order equations. For
example, we solve a system that has tan(t) and sec(t) as solutions.

We tell FriCAS that x is also an operator.


.. spadInput
::

	x := operator 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



Enter the two equations forming our system.


.. spadInput
::

	eq1 := D(x(t), t) = 1 + x(t)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| x′(t)=x(t)2+1   |
+-----------------+




.. spadType

:sub:`Type: Equation Expression Integer`




.. spadInput
::

	eq2 := D(y(t), t) = x(t) * y(t)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| y′(t)=x(t)y(t)   |
+------------------+




.. spadType

:sub:`Type: Equation Expression Integer`



Solve the system around t=0 with the initial conditions x(0)=0 and
y(0)=1. Notice that since we give the unknowns in the order [x,y], the
answer is a list of two series in the order
[series for x(t), series for y(t)]


.. spadInput
::

	seriesSolve([eq2, eq1], [x, y], t = 0, [y(0) = 1, x(0) = 0])


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function %BZ with type List UnivariateTaylorSeries(
       Expression Integer,t,0) -> UnivariateTaylorSeries(Expression 
       Integer,t,0) 
    Compiling function %CA with type List UnivariateTaylorSeries(
       Expression Integer,t,0) -> UnivariateTaylorSeries(Expression 
       Integer,t,0) 




.. spadMathOutput
.. math::

+-----------------------------------------------------------+
| [t+13t3+215t5+17315t7+O(t8),1+12t2+524t4+61720t6+O(t8)]   |
+-----------------------------------------------------------+




.. spadType

:sub:`Type: List UnivariateTaylorSeries(Expression Integer,t,0)`



The order in which we give the equations and the initial conditions has
no effect on the order of the solution.





