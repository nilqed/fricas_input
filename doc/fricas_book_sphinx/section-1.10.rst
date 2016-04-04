.. status: ok


1.10 Series
-----------

FriCAS also provides power series. By default, FriCAS tries
to compute and display the first ten elements of a series. Use 
``)set streams calculate`` to change the default value to something else. 
For the purposes of this document, we have used this system command to 
display fewer than ten terms. For more information about working with series,
see `ugProblemSeries <section-8.9.html#ugProblemSeries>`__.

You can convert a functional expression to a power series by using the
operation ``series``. In this example, sin(a*x) is expanded in powers of
(x-0), that is, in powers of x.


.. spadInput
::

	series(sin(a*x),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

   {a \  x} -{{{{a} ^ {3}} \over 6} \  {{x} ^ {3}}}+{{{{a} ^ {5}} \over
   {120}} \  {{x} ^ {5}}} -{{{{a} ^ {7}} \over {5040}} \  {{x} ^
   {7}}}+{{{{a} ^ {9}} \over {362880}} \  {{x} ^ {9}}} -{{{{a} ^ {{11}}}
   \over {39916800}} \  {{x} ^ {{11}}}}+{O
   \left(
   {{{x} ^ {{12}}}}
   \right)}


.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



This expression expands sin(a*x) in powers of (x - %pi/4).


.. spadInput
::

	series(sin(a*x),x = %pi/4)


.. spadMathAnswer
.. spadMathOutput
.. math::

 \scriptstyle{
 {\sin
  \left(
   {{{a \  \pi} \over 4}}
  \right)}+{a
  \  {\cos
   \left(
   {{{a \  \pi} \over 4}}
  \right)}
  \  {\left( x -{\pi \over 4}
  \right)}}
  -{{{{{a} ^ {2}} \  {\sin
   \left(
   {{{a \  \pi} \over 4}}
   \right)}} 
   \over 2}} \ldots
 }


.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,pi/4)`



FriCAS provides Puiseux series with rational number exponents. The first 
argument to series is an in-place function that computes the n-th coefficient.
(Recall that the ``+->`` is an infix operator meaning maps to.)


.. spadInput
::

	series(n +-> (-1)^((3*n - 4)/6)/factorial(n - 1/3),x=0,4/3..,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{x} ^ {{4 \over 3}}} -{{1 \over 6} \  {{x} ^ {{{10} \over 3}}}}+{O
  \left(
  {{{x} ^ {5}}}
  \right)}


.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



Once you have created a power series, you can perform arithmetic
operations on that series. We compute the Taylor expansion of 1/(1-x).
series:Taylor


.. spadInput
::

	f := series(1/(1-x),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  1+x+{{x} ^ {2}}+{{x} ^ {3}}+{{x} ^ {4}}+{{x} ^ {5}}+{{x} ^
  {6}}+{{x} ^ {7}}+{{x} ^ {8}}+{{x} ^ {9}}+{{x} ^ {{10}}}+{O
  \left(
  {{{x} ^ {{11}}}}
  \right)}


.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



Compute the square of the series.


.. spadInput
::

	f ^ 2


.. spadMathAnswer
.. spadMathOutput
.. math::

  1+{2 \  x}+{3 \  {{x} ^ {2}}}+{4 \  {{x} ^ {3}}}+{5 \  {{x} ^ {4}}}+{6
  \  {{x} ^ {5}}}+{7 \  {{x} ^ {6}}}+{8 \  {{x} ^ {7}}}+{9 \  {{x} ^
  {8}}}+{{10} \  {{x} ^ {9}}}+{{11} \  {{x} ^ {{10}}}}+{O
  \left(
  {{{x} ^ {{11}}}}
  \right)}

.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



The usual elementary functions ( log, exp, trigonometric functions, and
so on) are defined for power series.


.. spadInput
::

	f := series(1/(1-x),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  1+x+{{x} ^ {2}}+{{x} ^ {3}}+{{x} ^ {4}}+{{x} ^ {5}}+{{x} ^
  {6}}+{{x} ^ {7}}+{{x} ^ {8}}+{{x} ^ {9}}+{{x} ^ {{10}}}+{O
  \left(
  {{{x} ^ {{11}}}}
  \right)}

.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



.. spadInput
::

	g := log(f)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  x+{{1 \over 2} \  {{x} ^ {2}}}+{{1 \over 3} \  {{x} ^ {3}}}+{{1 \over 4}
 \  {{x} ^ {4}}}+{{1 \over 5} \  {{x} ^ {5}}}+{{1 \over 6} \  {{x} ^
 {6}}}+{{1 \over 7} \  {{x} ^ {7}}}+{{1 \over 8} \  {{x} ^ {8}}}+{{1 \over
 9} \  {{x} ^ {9}}}+{{1 \over {10}} \  {{x} ^ {{10}}}}+{{1 \over {11}} \
 {{x} ^ {{11}}}}+{O
 \left(
 {{{x} ^ {{12}}}}
 \right)}}

.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`




.. spadInput
::

	exp(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

  1+x+{{x} ^ {2}}+{{x} ^ {3}}+{{x} ^ {4}}+{{x} ^ {5}}+{{x} ^
  {6}}+{{x} ^ {7}}+{{x} ^ {8}}+{{x} ^ {9}}+{{x} ^ {{10}}}+{O
  \left(
  {{{x} ^ {{11}}}}
  \right)}

.. spadType
:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`


Here is a way to obtain numerical approximations of e from the Taylor
series expansion of exp(x). First create the desired Taylor expansion.


.. spadInput
::

	f := taylor(exp(x))


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  1+x+{{1 \over 2} \  {{x} ^ {2}}}+{{1 \over 6} \  {{x} ^ {3}}}+{{1 \over
  {24}} \  {{x} ^ {4}}}+{{1 \over {120}} \  {{x} ^ {5}}}+{{1 \over {720}} \
  {{x} ^ {6}}}+{{1 \over {5040}} \  {{x} ^ {7}}}+{{1 \over {40320}} \  {{x}
  ^ {8}}}+{{1 \over {362880}} \  {{x} ^ {9}}}+{{1 \over {3628800}} \  {{x}
  ^ {{10}}}}+{O
  \left(
  {{{x} ^ {{11}}}}
  \right)}}

.. spadType
:sub:`Type: UnivariateTaylorSeries(Expression Integer,x,0)`



Evaluate the series at the value 1.0. As you see, you get a sequence of
partial sums.


.. spadInput
::

	eval(f,1.0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  \left[
    {1.0}, \: {2.0}, \: {2.5}, \: {2.6666666666\_666666667}, \:
    {2.7083333333\_333333333}, \: {2.7166666666\_666666667}, \:
     ...
  \right]}


.. spadType
:sub:`Type: Stream Expression Float`
