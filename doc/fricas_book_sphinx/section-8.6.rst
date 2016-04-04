.. status: ok



8.6 Limits
----------

To compute a limit, you must specify a functional expression, limit a
variable, and a limiting value for that variable. If you do not specify
a direction, FriCAS attempts to compute a two-sided limit.

Issue this to compute the limit


.. spadInput
::

	limit((x^2 - 3*x + 2)/(x^2 - 1),x = 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| -12   |
+-------+




.. spadType

:sub:`Type: Union(OrderedCompletion Fraction Polynomial Integer,...)`



Sometimes the limit when approached from the left is different from the
limit from the right and, in this case, you may wish to ask for a
one-sided limit. Also, if you have a function that is only defined on
one side of a particular value, limit:one-sided vs. two-sided you can
compute a one-sided limit.

The function log(x) is only defined to the right of zero, that is, for
x>0. Thus, when computing limits of functions involving log(x), you
probably want a right-hand limit.


.. spadInput
::

	limit(x * log(x),x = 0,"right")


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



When you do not specify right or left as the optional fourth argument,
limit tries to compute a two-sided limit. Here the limit from the left
does not exist, as FriCAS indicates when you try to take a two-sided
limit.


.. spadInput
::

	limit(x * log(x),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| [leftHandLimit="failed",rightHandLimit=0]   |
+---------------------------------------------+




.. spadType

:sub:`Type: Union(Record(leftHandLimit: Union(OrderedCompletion Expression`
Integer,"failed"), rightHandLimit: Union(OrderedCompletion Expression
Integer,"failed")),...)



A function can be defined on both sides of a particular value, but tend
to different limits as its variable approaches that value from the left
and from the right. We can construct an example of this as follows:
Since y2 is simply the absolute value of y, the function y2/y is simply
the sign ( +1 or -1) of the nonzero real number y. Therefore, y2/y=-1
for y<0 and y2/y=+1 for y>0.

This is what happens when we take the limit at y=0. The answer returned
by FriCAS gives both a left-hand and a right-hand limit.


.. spadInput
::

	limit(sqrt(y^2)/y,y = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| [leftHandLimit=-1,rightHandLimit=1]   |
+---------------------------------------+




.. spadType

:sub:`Type: Union(Record(leftHandLimit: Union(OrderedCompletion Expression`
Integer,"failed"), rightHandLimit: Union(OrderedCompletion Expression
Integer,"failed")),...)



Here is another example, this time using a more complicated function.


.. spadInput
::

	limit(sqrt(1 - cos(t))/t,t = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| [leftHandLimit=-12,rightHandLimit=12]   |
+-----------------------------------------+




.. spadType

:sub:`Type: Union(Record(leftHandLimit: Union(OrderedCompletion Expression`
Integer,"failed"), rightHandLimit: Union(OrderedCompletion Expression
Integer,"failed")),...)



You can compute limits at infinity by passing either limit:at infinity
+∞ or -∞ as the third argument of limit.

To do this, use the constants %plusInfinity and %minusInfinity.


.. spadInput
::

	limit(sqrt(3*x^2 + 1)/(5*x),x = %plusInfinity)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 35   |
+------+




.. spadType

:sub:`Type: Union(OrderedCompletion Expression Integer,...)`




.. spadInput
::

	limit(sqrt(3*x^2 + 1)/(5*x),x = %minusInfinity)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| -35   |
+-------+




.. spadType

:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



You can take limits of functions with parameters. limit:of function with
parameters As you can see, the limit is expressed in terms of the
parameters.


.. spadInput
::

	limit(sinh(a*x)/tan(b*x),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| ab   |
+------+




.. spadType

:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



When you use limit, you are taking the limit of a real function of a
real variable.

When you compute this, FriCAS returns 0 because, as a function of a real
variable, sin(1/z) is always between -1 and 1, so z*sin(1/z) tends to 0
as z tends to 0.


.. spadInput
::

	limit(z * sin(1/z),z = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



However, as a function of a complex variable, sin(1/z) is badly
limit:real vs. complex behaved near 0 (one says that sin(1/z) has an
essential singularity essential singularity at z=0).
singularity:essential

When viewed as a function of a complex variable, z*sin(1/z) does not
approach any limit as z tends to 0 in the complex plane. FriCAS
indicates this when we call complexLimit.


.. spadInput
::

	complexLimit(z * sin(1/z),z = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



Here is another example. As x approaches 0 along the real axis,
exp(-1/x**2) tends to 0.


.. spadInput
::

	limit(exp(-1/x^2),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



However, if x is allowed to approach 0 along any path in the complex
plane, the limiting value of exp(-1/x**2) depends on the path taken
because the function has an essential singularity at x=0. This is
reflected in the error message returned by the function.


.. spadInput
::

	complexLimit(exp(-1/x^2),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



You can also take complex limits at infinity, that is, limits of a
function of z as z approaches infinity on the Riemann sphere. Use the
symbol %infinity to denote complex infinity.

As above, to compute complex limits rather than real limits, use
complexLimit.


.. spadInput
::

	complexLimit((2 + z)/(1 - z),z = %infinity)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: OnePointCompletion Fraction Polynomial Integer`



In many cases, a limit of a real function of a real variable exists when
the corresponding complex limit does not. This limit exists.


.. spadInput
::

	limit(sin(x)/x,x = %plusInfinity)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Union(OrderedCompletion Expression Integer,...)`



But this limit does not.


.. spadInput
::

	complexLimit(sin(x)/x,x = %infinity)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`





