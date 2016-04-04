.. status: ok

1.14 Solution of Equations
--------------------------

FriCAS also has state-of-the-art algorithms for the solution of systems
of polynomial equations. When the number of equations and unknowns is
the same, and you have no symbolic coefficients, you can use ``solve`` for
real roots and ``complexSolve`` for complex roots. In each case, you tell
FriCAS how accurate you want your result to be. All operations in the
solve family return answers in the form of a list of solution sets,
where each solution set is a list of equations.

A system of two equations involving a symbolic parameter t.


.. spadInput
::

	S(t) == [x^2-2*y^2 - t,x*y-y-5*x + 5]

.. spadMathAnswer
.. spadType
:sub:`Type: Void`


Find the real roots of S(19) with rational arithmetic, correct to within
1/1020.


.. spadInput
::

	solve(S(19),1/10^20)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  \left[
  {\left[ {y=5}, \: {x=-{{80336736493669365924 189585} \over
  {96714065569170333976 49408}}}
  \right]},
  \: {\left[ {y=5}, \: {x={{80336736493669365924 189585} \over
  {96714065569170333976 49408}}}
  \right]}
  \right]}


   
.. spadType
:sub:`Type: List List Equation Polynomial Fraction Integer`



Find the complex roots of S(19) with floating point coefficients to 20
digits accuracy in the mantissa.


.. spadInput
::

	complexSolve(S(19),10.e-20)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptsize{
  \left[
  {\left[ {y={5.0}}, \:
  {x={8.3066238629\_1807485258\_4262744905\_6951556981\_516914818}}
  \right]}, \\\\
  \: {\left[ {y={5.0}}, \: {x=-{8.3066238629\_180748526}}
  \right]}, \\\\
  \: {\left[ {y=-{{3.0} \  i}}, \: {x={1.0}}
  \right]}, \\\\
  \: {\left[ {y={{3.0} \  i}}, \: {x={1.0}}
  \right]}
  \right]}


.. spadType
:sub:`Type: List List Equation Polynomial Complex Float`


If a system of equations has symbolic coefficients and you want a
solution in radicals, try radicalSolve.


.. spadInput
::

	radicalSolve(S(a),[x,y])


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptsize{
  \left[
  {\left[ {x=-{\sqrt {{a+{50}}}}}, \: {y=5}
  \right]},
  \: {\left[ {x={\sqrt {{a+{50}}}}}, \: {y=5}
  \right]},
  \: {\left[ {x=1}, \: {y={{\sqrt {{-a+1}}} \over {\sqrt {2}}}}
  \right]},
  \: {\left[ {x=1}, \: {y=-{{\sqrt {{-a+1}}} \over {\sqrt {2}}}}
  \right]}
  \right]}

.. spadType
:sub:`Type: List List Equation Expression Integer`



For systems of equations with symbolic coefficients, you can apply
solve, listing the variables that you want FriCAS to solve for. For
polynomial equations, a solution cannot usually be expressed solely in
terms of the other variables. Instead, the solution is presented as a
triangular system of equations, where each polynomial has coefficients
involving only the succeeding variables. This is analogous to converting
a linear system of equations to triangular form.

A system of three equations in five variables.


.. spadInput
::

	eqns := [x^2 - y + z,x^2*z + x^4 - b*y, y^2 *z - a - b*x]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {z -y+{{x} ^ {2}}}, \: {{{{x} ^ {2}} \  z} -{b \  y}+{{x} ^ {4}}}, \:
  {{{{y} ^ {2}} \  z} -{b \  x} -a}
  \right]

.. spadType
:sub:`Type: List Polynomial Integer`



Solve the system for unknowns [x,y,z], reducing the solution to
triangular form.


.. spadInput
::

	solve(eqns,[x,y,z])


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  \left[
  {\left[ {x=-{a \over b}}, \: {y=0}, \: {z=-{{{a} ^ {2}} \over {{b} ^
  {2}}}}
  \right]}, \\\\
  \: {\left[ {x={{{{z} ^ {3}}+{2 \  b \  {{z} ^ {2}}}+{{{b} ^ {2}} \  z}
  -a} \over b}}, \: {y={z+b}}, \: {{{{z} ^ {6}}+{4 \  b \  {{z} ^ {5}}}+{6
  \  {{b} ^ {2}} \  {{z} ^ {4}}}+{{\left( {4 \  {{b} ^ {3}}} -{2 \  a}
  \right)}
  \  {{z} ^ {3}}}+{{\left( {{b} ^ {4}} -{4 \  a \  b}
  \right)}
  \  {{z} ^ {2}}} -{2 \  a \  {{b} ^ {2}} \  z} -{{b} ^ {3}}+{{a} ^
  {2}}}=0}
  \right]}
  \right]}

.. spadType
:sub:`Type: List List Equation Fraction Polynomial Integer`

