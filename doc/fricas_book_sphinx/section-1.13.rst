.. status: ok


1.13 Differential Equations
---------------------------

The general approach used in integration also carries over to the
solution of linear differential equations.

Let's solve some differential equations. Let y be the unknown function
in terms of x.


.. spadInput
::

	y := operator 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

  y

.. spadType
:sub:`Type: BasicOperator`



Here we solve a third order equation with polynomial coefficients.


.. spadInput
::

	deq := x^3 * D(y x, x, 3) + x^2 * D(y x, x, 2) - 2 * x * D(y x, x) + _
           2 * y x = 2 * x^4


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{{x} ^ {3}} \  {{y _ {{\ }} ^ {,,,}}\left({x}\right)}}+{{{x}
   ^ {2}} \  {{y _ {{\ }} ^ {,,}}\left({x}\right)}}
   -{2 \  x \  {{y _ {{\ }} ^ {,}}\left({x}\right)}}+{2
   \  {y\left({x}\right)}}}={2\  {{x} ^ {4}}}

.. spadType
:sub:`Type: Equation Expression Integer`


.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {\textrm{particular}={{{{x} ^ {5}} -{{10} \  {{x} ^ {3}}}+{{20} \ 
  {{x} ^
  {2}}}+4} \over {{15} \  x}}}, \:  \\\\
  {\textrm{basis}={\left[ {{{2 \  {{x} ^ {3}}} -{3 \
  {{x} ^ {2}}}+1} \over x}, \: {{{{x} ^ {3}} -1} \over x}, \: {{{{x} ^
  {3}} -{3 \  {{x} ^ {2}}} -1} \over x}
  \right]}}
  \right]

.. spadType
:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression
Integer),...)`



Here we find all the algebraic function solutions of the equation.


.. spadInput
::

	deq := (x^2 + 1) * D(y x, x, 2) + 3 * x * D(y x, x) + y x = 0


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{\left( {{x} ^ {2}}+1\right)}\  {{y _ {{\ }} ^ {,,}}
  \left({x}\right)}}+{3\  x \  {{y _ {{\ }} ^ {,}}
  \left({x}\right)}}+{y\left({x}\right)}}=0


.. spadType
:sub:`Type: Equation Expression Integer`




.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {\textrm{particular}=0}, \: 
  {\textrm{basis}={\left[ {1 \over {\sqrt {{{{x} ^ {2}}+1}}}}, \:
  {{\log\left({{{\sqrt {{{{x} ^ {2}}+1}}} -x}}\right)}
  \over {\sqrt {{{{x} ^ {2}}+1}}}}\right]}}\right]

.. spadType
:sub:`Type: Union(Record(particular: Expression Integer,basis: List Expression
Integer),...)`


Coefficients of differential equations can come from arbitrary constant
fields. For example, coefficients can contain algebraic numbers.

This example has solutions whose logarithmic derivative is an algebraic
function of degree two.


.. spadInput
::

	eq := 2*x^3 * D(y x,x,2) + 3*x^2 * D(y x,x) - 2 * y x


.. spadMathAnswer
.. spadMathOutput
.. math::

  {2 \  {{x} ^ {3}} \  {{y _ {{\ }} ^ {,,}}\left({x}\right)}}+{3
  \  {{x} ^ {2}} \  {{y _ {{\ }} ^ {,}}\left({x}\right)}}
  -{2 \  {y\left({x}\right)}}

.. spadType
:sub:`Type: Expression Integer`


.. spadInput
::

	solve(eq,y,x).basis


.. spadMathAnswer
.. spadMathOutput
.. math::
 
  \left[
  {{e} ^ {-{{2 \  {\sqrt {x}}} \over x}}}, \: {{e} ^ {{{2 \  {\sqrt {x}}}
  \over x}}}
  \right]

.. spadType
:sub:`Type: List Expression Integer`



Here's another differential equation to solve.


.. spadInput
::

	deq := D(y x, x) = y(x) / (x + y(x) * log y x)


.. spadMathAnswer
.. spadMathOutput
.. math::

   {{y _ {{\ }} ^ {,}}\left({x}\right)}={{y\left({x}\right)}
   \over {{{y\left({x}\right)}\  {\log\left({{y\left({x}\right)}}
   \right)}}+x}}

.. spadType
:sub:`Type: Equation Expression Integer`




.. spadInput
::

	solve(deq, y, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

   {{{y\left({x}\right)}\  {{{\log\left({{y\left({x}\right)}}
   \right)}}^ {2}}} -{2 \  x}} \over {2 \  {y\left({x}\right)}}

.. spadType
:sub:`Type: Union(Expression Integer,...)`



Rather than attempting to get a closed form solution of a differential
equation, you instead might want to find an approximate solution in the
form of a series.

Let's solve a system of nonlinear first order equations and get a
solution in power series. Tell FriCAS that x is also an operator.


.. spadInput
::

	x := operator 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

 x

.. spadType
:sub:`Type: BasicOperator`


Here are the two equations forming our system.


.. spadInput
::

	eq1 := D(x(t), t) = 1 + x(t)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{x _ {{\ }} ^ {,}}\left({t}\right)}={{{{x\left({t}\right)}}
   ^ {2}}+1}

.. spadType
:sub:`Type: Equation Expression Integer`




.. spadInput
::

	eq2 := D(y(t), t) = x(t) * y(t)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{y _ {{\ }} ^ {,}}\left({t}\right)}={{x\left({t}\right)}
   \  {y\left({t}\right)}}

.. spadType
:sub:`Type: Equation Expression Integer`



We can solve the system around t=0 with the initial conditions x(0)=0
and y(0)=1. Notice that since we give the unknowns in the order [x,y],
the answer is a list of two series in the order
[series for x(t),series for y(t)].


.. spadInput
::

	seriesSolve([eq2, eq1], [x, y], t = 0, [y(0) = 1, x(0) = 0])


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  \left[
  {t+{{1 \over 3} \  {{t} ^ {3}}}+{{2 \over {15}} \  {{t} ^ {5}}}+{{{17}
  \over {315}} \  {{t} ^ {7}}}+{{{62} \over {2835}} \  {{t} ^ {9}}}+{O
  \left(
  {{{t} ^ {{11}}}}
  \right)}},
  \: {1+{{1 \over 2} \  {{t} ^ {2}}}+{{5 \over {24}} \  {{t} ^ {4}}}+{{{61}
  \over {720}} \  {{t} ^ {6}}}+{{{277} \over {8064}} \  {{t} ^
  {8}}}+{{{50521} \over {3628800}} \  {{t} ^ {{10}}}}+{O
  \left(
  {{{t} ^ {{11}}}}
  \right)}}
  \right]
  }

.. spadType
:sub:`Type: List UnivariateTaylorSeries(Expression Integer,t,0)`

