.. status: ok


1.12 Integration
----------------

FriCAS has extensive library facilities for integration.

The first example is the integration of a fraction with denominator that
factors into a quadratic and a quartic irreducible polynomial. The usual
partial fraction approach used by most other computer algebra systems
either fails or introduces expensive unneeded algebraic numbers.

We use a factorization-free algorithm.

.. math::

  \int \frac{x^2+2\,x+1}{(x+1)^6+1} \,dx

.. spadInput
::

	integrate((x^2+2*x+1)/((x+1)^6+1),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {\arctan\left(
    {{{{x} ^ {3}}+{3 \  {{x} ^ {2}}}+{3 \  x}+1}}
  \right)} \over 3

.. spadType
:sub:`Type: Union(Expression Integer,...)`



When real parameters are present, the form of the integral can depend on
the signs of some expressions.

Rather than query the user or make sign assumptions, FriCAS returns all
possible answers.


.. spadInput
::

	integrate(1/(x^2 + a),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[{{\log\left({{{{{\left( {{x} ^ {2}} -a\right)}
  \  {\sqrt {-a}}}+{2 \  a \  x}} \over {{{x} ^ {2}}+a}}}
  \right)}\over {2 \  {\sqrt {-a}}}}, \: {{\arctan\left(
  {{{x \  {\sqrt {a}}} \over a}}\right)}\over {\sqrt {a}}}
  \right]

.. spadType
:sub:`Type: Union(List Expression Integer,...)`



The integrate operation generally assumes that all parameters are real.
The only exception is when the integrand has complex valued quantities.

If the parameter is complex instead of real, then the notion of sign is
undefined and there is a unique answer. You can request this answer by
prepending the word complex to the command name:


.. spadInput
::

	complexIntegrate(1/(x^2 + a),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{\sqrt {-{1 \over a}}} \  {\log\left({{{a \  {\sqrt {-{1 \over a}}}}+x}}
   \right)}}-{{\sqrt {-{1 \over a}}} \  {\log\left(
   {{-{a \  {\sqrt {-{1 \over a}}}}+x}}\right)}}}\over 2

.. spadType
:sub:`Type: Expression Integer`



The following two examples illustrate the limitations of table-based
approaches. The two integrands are very similar, but the answer to one
of them requires the addition of two new algebraic numbers.

This one is the easy one. The next one looks very similar but the answer
is much more complicated.


.. spadInput
::

	integrate(x^3 / (a+b*x)^(1/3),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{\left( {{120} \  {{b} ^ {3}} \  {{x} ^ {3}}} -{{135} \  a \  {{b} ^
  {2}} \  {{x} ^ {2}}}+{{162} \  {{a} ^ {2}} \  b \  x} -{{243} \  {{a} ^
  {3}}}\right)}
  \  {{{\root {3} \of 
  {{{b \  x}+a}}}} ^ {2}}} \over {{440} \  {{b} ^ {4}}}

.. spadType
:sub:`Type: Union(Expression Integer,...)`



Only an algorithmic approach is guaranteed to find what new constants
must be added in order to find a solution.


.. spadInput
::

	integrate(1 / (x^3 * (a+b*x)^(1/3)),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptscriptstyle{
  {-{2 \  {{b} ^ {2}} \  {{x} ^ {2}} \  {\sqrt {3}} \  {\log
  \left(
  {{{{\root {3} \of {a}} \  {{{\root {3} \of {{{b \  x}+a}}}} ^
  {2}}}+{{{{\root {3} \of {a}}} ^ {2}} \  {\root {3} \of {{{b \  x}+a}}}}+a}}
  \right)}}+{4
  \  {{b} ^ {2}} \  {{x} ^ {2}} \  {\sqrt {3}} \  {\log
  \left(
  {{{{{{\root {3} \of {a}}} ^ {2}} \  {\root {3} \of {{{b \  x}+a}}}} -a}}
  \right)}}+{{12}
  \  {{b} ^ {2}} \  {{x} ^ {2}} \  {\arctan
  \left(
  {{{{2 \  {\sqrt {3}} \  {{{\root {3} \of {a}}} ^ {2}} \  {\root {3} \of
  {{{b \  x}+a}}}}+{a \  {\sqrt {3}}}} \over {3 \  a}}}
  \right)}}+{{\left(
  {{12} \  b \  x} -{9 \  a}
  \right)}
  \  {\sqrt {3}} \  {\root {3} \of {a}} \  {{{\root {3} \of {{{b \  x}+a}}}}
  ^ {2}}}} \over {{18} \  {{a} ^ {2}} \  {{x} ^ {2}} \  {\sqrt {3}} \
  {\root {3} \of {a}}}
  }

.. spadType
:sub:`Type: Union(Expression Integer,...)`



Some computer algebra systems use heuristics or table-driven approaches
to integration. When these systems cannot determine the answer to an
integration problem, they reply ``I`` don't know.'' FriCAS uses an
algorithm which is a decision procedure for integration. If FriCAS
returns the original integral that conclusively proves that an integral
cannot be expressed in terms of elementary functions.

When FriCAS returns an integral sign, it has proved that no answer
exists as an elementary function.


.. spadInput
::

	integrate(log(1 + sqrt(a*x + b)) / x,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

   \int ^{\displaystyle x} {{{\log\left(
   {{{\sqrt {{b+{ \%E \  a}}}}+1}}\right)}
   \over \%E} \  {d \%E}}

.. spadType
:sub:`Type: Union(Expression Integer,...)`


FriCAS can handle complicated mixed functions much beyond what you can
find in tables.

Whenever possible, FriCAS tries to express the answer using the
functions present in the integrand.


.. spadInput
::

	integrate((sinh(1+sqrt(x+b))+2*sqrt(x+b)) / (sqrt(x+b) * (x + _
       cosh(1+sqrt(x + b)))), x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {2 \  {\log \left({{{-{2 \  {\cosh\left({{{\sqrt {{x+b}}}+1}}
   \right)}}-{2 \  x}} \over {{\sinh\left({{{\sqrt {{x+b}}}+1}}
   \right)}-{\cosh\left({{{\sqrt {{x+b}}}+1}}\right)}}}}\right)}}
   -{2 \  {\sqrt {{x+b}}}}

.. spadType
:sub:`Type: Union(Expression Integer,...)`



A strong structure-checking algorithm in FriCAS finds hidden algebraic
relationships between functions.


.. spadInput
::

	integrate(tan(atan(x)/3),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{8 \  {\log\left({{{3 \  {{{\tan\left({{{\arctan\left({x}\right)}
  \over 3}}\right)}}^ {2}}} -1}}\right)}}-{3 \  {{{\tan\left(
   {{{\arctan\left({x}\right)}\over 3}}\right)}}
  ^ {2}}}+{{18} \  x \  {\tan\left({{{\arctan\left({x}\right)}
  \over 3}}\right)}}}\over {18}

.. spadType
:sub:`Type: Union(Expression Integer,...)`



The discovery of this algebraic relationship is necessary for correct
integration of this function. Here are the details:

1. If :math:`x=\tan(t)` and :math:`g=\tan(t/3)` then the following algebraic 
   relation is true:

.. math::  

     g^3-3x g^2-3g+x=0

2. Integrate g using this algebraic relation; this produces:

.. math::

   \frac{(24 g^2-8)\log(3 g^2-1)+(81 x^2+24) g^2+72 x g-27x^2-16}
      {54 g^2-18}

3. Rationalize the denominator, producing:

.. math::

   \frac{8 \log(3 g^2-1)-3 g^2+18 x g+16}{18}
   
Replace g by the initial definition :math:`g=\tan(\arctan(x)/3)` to produce 
the final result.


This is an example of a mixed function where the algebraic layer is over
the transcendental one.


.. spadInput
::

	integrate((x + 1) / (x*(x + log x) ^ (3/2)), x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{2 \  {\sqrt {{{\log\left({x}\right)}+x}}}}\over {{\log\left({x}
    \right)}+x}}

.. spadType
:sub:`Type: Union(Expression Integer,...)`



While incomplete for non-elementary functions, FriCAS can handle some of
them.


.. spadInput
::

	integrate(exp(-x^2) * erf(x) / (erf(x)^3 - erf(x)^2 - erf(x) + 1),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \def\erf{\mathrm{erf}}
  {{{\left( {\erf\left({x}\right)}-1\right)}\  {\sqrt {\pi}} \  {\log
  \left({{{{\erf\left({x}\right)}-1} \over {{\erf\left({x}\right)}+1}}}
  \right)}}-{2 \  {\sqrt {\pi}}}} \over {{8 \  {\erf\left({x}\right)}}
   -8}

.. spadType
:sub:`Type: Union(Expression Integer,...)`


More examples of FriCAS's integration capabilities are discussed in
Section
`ugProblemIntegration <section-8.8.html#ugProblemIntegration>`__ .

