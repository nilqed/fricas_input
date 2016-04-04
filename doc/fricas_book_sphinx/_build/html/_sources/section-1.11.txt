.. status: ok


1.11 Derivatives
----------------

Use the FriCAS function **D** to differentiate an expression.


To find the derivative of an expression f with respect to a variable x,

.. math::

  \frac{d\,f(x)}{d\,x}
  
enter ``D(f, x)``.


.. spadInput
::

	f := exp exp x


.. spadMathAnswer
.. spadMathOutput
.. math::

  {e} ^ {{{e} ^ {x}}}

.. spadType
:sub:`Type: Expression Integer`




.. spadInput
::

	D(f, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{e} ^ {x}} \  {{e} ^ {{{e} ^ {x}}}}


.. spadType
:sub:`Type: Expression Integer`



An optional third argument n in D asks FriCAS for the n-th derivative of
f. This finds the fourth derivative of f with respect to x.


.. spadInput
::

	D(f, x, 4)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {\left( {{{{e} ^ {x}}} ^ {4}}+{6 \  {{{{e} ^ {x}}} ^ {3}}}+{7 \
  {{{{e} ^ {x}}} ^ {2}}}+{{e} ^ {x}}
  \right)}
  \  {{e} ^ {{{e} ^ {x}}}}

  
.. spadType
:sub:`Type: Expression Integer`



You can also compute partial derivatives by specifying the order of
differentiation.


.. spadInput
::

	g := sin(x^2 + y)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \sin
  \left(
    {{y+{{x} ^ {2}}}}
  \right)


.. spadType
:sub:`Type: Expression Integer`




.. spadInput
::

	D(g, y)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \cos
   \left(
    {{y+{{x} ^ {2}}}}
   \right)

.. spadType
:sub:`Type: Expression Integer`




.. spadInput
::

	D(g, [y, y, x, x])


.. spadMathAnswer
.. spadMathOutput
.. math::

  {4 \  {{x} ^ {2}} \  {\sin
   \left(
   {{y+{{x} ^ {2}}}}
   \right)}}
    -{2 \  {\cos
   \left(
   {{y+{{x} ^ {2}}}}
   \right)}}

.. spadType
:sub:`Type: Expression Integer`



FriCAS can manipulate the derivatives (partial and iterated) of
expressions involving formal operators. All the dependencies must be 
explicit.

This returns 0 since F (so far) does not explicitly depend on x.


.. spadInput
::

	D(F,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  0

.. spadType
:sub:`Type: Polynomial Integer`



Suppose that we have F a function of x, y, and z, where x and y are
themselves functions of z.

Start by declaring that F, x, and y are operators. operator


.. spadInput
::

	F := operator 'F; x := operator 'x; y := operator 'y


.. spadMathAnswer
.. spadMathOutput
.. math::

  y

.. spadType
:sub:`Type: BasicOperator`



You can use F, x, and y in expressions.


.. spadInput
::

	a := F(x z, y z, z^2) + x y(z+1)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {x\left({{y\left({{z+1}}\right)}}\right)}+{F
    \left({{x\left({z}\right)},\: {y
    \left({z}\right)},\: {{z} ^ {2}}}\right)}

.. spadType
:sub:`Type: Expression Integer`



Differentiate formally with respect to z. The formal derivatives
appearing in dadz are not just formal symbols, but do represent the
derivatives of x, y, and F.


.. spadInput
::

	dadz := D(a, z)


.. spadMathAnswer
.. spadMathOutput
.. math::

   \scriptstyle{
   {2 \  z \  {{F _ {{,3}}}
    \left({{x\left({z}\right)},\: {y\left({z}\right)},\: {{z} ^ {2}}}
    \right)}}+{{{y_ {{\ }} ^ {,}}\left({z}\right)}\  {{F _ {{,2}}}
    \left({{x\left({z}\right)},\: {y\left({z}\right)},\: {{z} ^ {2}}}
    \right)}}+{{{x_ {{\ }} ^ {,}}\left({z}\right)}\  {{F _ {{,1}}}
    \left({{x\left({z}\right)},\: {y\left({z}\right)},\: {{z} ^ {2}}}
    \right)}}+{{{x_ {{\ }} ^ {,}}\left({{y\left({{z+1}}\right)}}
    \right)}\  {{y _ {{\ }} ^ {,}}\left({{z+1}}\right)}}}

.. spadType
:sub:`Type: Expression Integer`



You can evaluate the above for particular functional values of F, x, and
y. If x(z) is exp(z) and y(z) is log(z+1), then evaluates dadz.


.. spadInput
::

	eval(eval(dadz, 'x, z +-> exp z), 'y, z +-> log(z+1))


.. spadMathAnswer
.. spadMathOutput
.. math::

   \scriptstyle{
   {{{\left( {2 \  {{z} ^ {2}}}+{2 \  z} \right)}
    \  {{F _ {{,3}}}\left({{{e} ^ {z}}, \: {\log\left({{z+1}}\right)},
    \: {{z} ^ {2}}}\right)}}+{{F_ {{,2}}}\left({{{e} ^ {z}}, \: {\log
    \left({{z+1}}\right)},\: {{z} ^ {2}}}\right)}+{{\left(z+1\right)}
    \  {{e} ^ {z}} \  {{F _ {{,1}}}\left({{{e} ^ {z}}, \: {\log
    \left({{z+1}}\right)},\: {{z} ^ {2}}}\right)}}+z+1}\over {z+1}}

.. spadType
:sub:`Type: Expression Integer`



You obtain the same result by first evaluating a and then
differentiating.


.. spadInput
::

	eval(eval(a, 'x, z +-> exp z), 'y, z +-> log(z+1))


.. spadMathAnswer
.. spadMathOutput
.. math::

  {F\left({{{e} ^ {z}}, \: {\log\left({{z+1}}\right)},\: {{z} ^ {2}}}
     \right)}+z+2

.. spadType
:sub:`Type: Expression Integer`




.. spadInput
::

	D(%, z)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  {{{\left( {2 \  {{z} ^ {2}}}+{2 \  z}\right)}\  {{F _ {{,3}}}
   \left({{{e} ^ {z}}, \: {\log\left({{z+1}}\right)},\: {{z} ^ {2}}}
   \right)}}+{{F_ {{,2}}}\left({{{e} ^ {z}}, \: {\log\left({{z+1}}
   \right)},\: {{z} ^ {2}}}\right)}+{{\left(z+1\right)}
   \  {{e} ^ {z}} \  {{F _ {{,1}}}\left({{{e} ^ {z}}, \: {\log
   \left({{z+1}}\right)},\: {{z} ^ {2}}}\right)}}+z+1}\over {z+1}}


.. spadType
:sub:`Type: Expression Integer`

