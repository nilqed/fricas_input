.. status: ok


1.9 Limits
----------

FriCAS's limit function is usually used to evaluate limits of quotients
where the numerator and denominator limit both tend to zero or both tend
to infinity. To find the limit of an expression f as a real variable x
tends to a limit value ``a``, 

.. math::

  \lim_{x\rightarrow a} f(x)


enter ``limit(f, x=a)``. Use *complexLimit* if the
variable is complex. Additional information and examples of limits are
in Section `ugProblemLimits <section-8.6.html#ugProblemLimits>`__ .

You can take limits of functions with parameters.


.. spadInput
::

	g := csc(a*x) / csch(b*x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {\csc
  \left(
  {{a \  x}}
  \right)}
  \over {\textrm{csch}
  \left(
  {{b \  x}}
  \right)}


.. spadType
:sub:`Type: Expression Integer`



As you can see, the limit is expressed in terms of the parameters.


.. spadInput
::

	limit(g,x=0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  b \over a

.. spadType
:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



A variable may also approach plus or minus infinity:


.. spadInput
::

	h := (1 + k/x)^x


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{x+k} \over x}} ^ {x}

.. spadType
:sub:`Type: Expression Integer`



Use ``%plusInfinity`` and ``%minusInfinity`` to denote ∞ and -∞.


.. spadInput
::

	limit(h,x=%plusInfinity)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {e} ^ {k}

.. spadType
:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



A function can be defined on both sides of a particular value, but may
tend to different limits as its variable approaches that value from the
left and from the right.


.. spadInput
::

	limit(sqrt(y^2)/y,y = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  {\textrm{leftHandLimit}=-1}, \: {\textrm{rightHandLimit}=1}
  \right]

.. spadType

:sub:`Type: Union(Record(leftHandLimit: Union(OrderedCompletion Expression ...`


As x approaches 0 along the real axis, exp(-1/x^2) tends to 0.


.. spadInput
::

	limit(exp(-1/x^2),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  0

.. spadType
:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



However, if x is allowed to approach 0 along any path in the complex
plane, the limiting value of exp(-1/x^2) depends on the path taken
because the function has an essential singularity at x=0. This is
reflected in the error message returned by the function.


.. spadInput
::

	complexLimit(exp(-1/x^2),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \verb#"failed"#

.. spadType
:sub:`Type: Union("failed",...)`
