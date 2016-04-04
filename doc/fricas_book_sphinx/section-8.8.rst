.. status: ok


8.8 Integration
---------------

Integration is the reverse process of differentiation, that is,
integration an integral of a function f with respect to a variable x is
any function g such that D(g,x) is equal to f.

The package FunctionSpaceIntegration provides the top-level integration
operation, integrateintegrateFunctionSpaceIntegration, for integrating
real-valued elementary functions. FunctionSpaceIntegration


.. spadInput
::

	integrate(cosh(a*x)*sinh(a*x), x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| sinh(ax)2+cosh(ax)24a   |
+-------------------------+




.. spadType

:sub:`Type: Union(Expression Integer,...)`



Unfortunately, antiderivatives of most functions cannot be expressed in
terms of elementary functions.


.. spadInput
::

	integrate(log(1 + sqrt(a * x + b)) / x, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| ∫xlog(b+%Ma+1)%Md%M   |
+-----------------------+




.. spadType

:sub:`Type: Union(Expression Integer,...)`



Given an elementary function to integrate, FriCAS returns a formal
integral as above only when it can prove that the integral is not
elementary and not when it cannot determine the integral. In this rare
case it prints a message that it cannot determine if an elementary
integral exists.

Similar functions may have antiderivatives antiderivative that look
quite different because the form of the antiderivative depends on the
sign of a constant that appears in the function.


.. spadInput
::

	integrate(1/(x^2 - 2),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| log((x2+2)2-4xx2-2)22   |
+-------------------------+




.. spadType

:sub:`Type: Union(Expression Integer,...)`




.. spadInput
::

	integrate(1/(x^2 + 2),x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| arctan(x22)2   |
+----------------+




.. spadType

:sub:`Type: Union(Expression Integer,...)`



If the integrand contains parameters, then there may be several possible
antiderivatives, depending on the signs of expressions of the
parameters.

In this case FriCAS returns a list of answers that cover all the
possible cases. Here you use the answer involving the square root of a
when a>0 and integration:result as list of real functions the answer
involving the square root of -a when a<0.


.. spadInput
::

	integrate(x^2 / (x^4 - a^2), x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------+
| [log((x2+a)a-2axx2-a)+2arctan(xaa)4a,log((x2-a)-a+2axx2+a)-2arctan(x-aa)4-a]   |
+--------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(List Expression Integer,...)`



If the parameters and the variables of integration can be complex
numbers rather than real, then the notion of sign is not defined. In
this case all the possible answers can be expressed as one complex
function. To get that function, rather than a list of real functions,
use complexIntegratecomplexIntegrateFunctionSpaceComplexIntegration,
which is provided by the package integration:result as a complex
functions FunctionSpaceComplexIntegration.
FunctionSpaceComplexIntegration

This operation is used for integrating complex-valued elementary
functions.


.. spadInput
::

	complexIntegrate(x^2 / (x^4 - a^2), x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------+
| (4alog(x-4a+2a-4a)--4alog(x4a+2a4a)+-4alog(x4a-2a4a)-4alog(x-4a-2a-4a))2-4a4a   |
+---------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`



As with the real case, antiderivatives for most complex-valued functions
cannot be expressed in terms of elementary functions.


.. spadInput
::

	complexIntegrate(log(1 + sqrt(a * x + b)) / x, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| ∫xlog(b+%Ma+1)%Md%M   |
+-----------------------+




.. spadType

:sub:`Type: Expression Integer`



Sometimes integrate can involve symbolic algebraic numbers such as those
returned by rootOfrootOfExpression. To see how to work with these
strange generated symbols (such as %%a0), see
`ugxProblemSymRootAll <section-8.3.html#ugxProblemSymRootAll>`__ .

Definite integration is the process of computing the area between
integration:definite the x-axis and the curve of a function f(x). The
fundamental theorem of calculus states that if f is continuous on an
interval a..b and if there exists a function g that is differentiable on
a..b and such that D(g,x) is equal to f, then the definite integral of f
for x in the interval a..b is equal to g(b)-g(a).

The package RationalFunctionDefiniteIntegration provides the top-level
definite integration operation,
integrateintegrateRationalFunctionDefiniteIntegration, for integrating
real-valued rational functions.


.. spadInput
::

	integrate((x^4 - 3*x^2 + 6)/(x^6-5*x^4+5*x^2+4), x = 1..2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| 2arctan(8)+2arctan(5)+2arctan(2)+2arctan(12)-π2   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Union(f1: OrderedCompletion Expression Integer,...)`



FriCAS checks beforehand that the function you are integrating is
defined on the interval a..b, and prints an error message if it finds
that this is not case, as in the following example:


.. spadVerbatim

::

 integrate(1/(x^2-2), x = 1..2)
     >> Error detected within library code:
        Pole in path of integration
        You are being returned to the top level
        of the interpreter.



When parameters are present in the function, the function may or may not
be defined on the interval of integration.

If this is the case, FriCAS issues a warning that a pole might lie in
the path of integration, and does not compute the integral.


.. spadInput
::

	integrate(1/(x^2-a), x = 1..2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| potentialPole   |
+-----------------+




.. spadType

:sub:`Type: Union(pole: potentialPole,...)`



If you know that you are using values of the parameter for which the
function has no pole in the interval of integration, use the string
noPole as a third argument to
integrateintegrateRationalFunctionDefiniteIntegration:

The value here is, of course, incorrect if sqrt(a) is between 1 and 2.


.. spadInput
::

	integrate(1/(x^2-a), x = 1..2, "noPole")


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------+
| (-log((-4a2-4a)a+a3+6a2+aa2-2a+1)+log((-8a2-32a)a+a3+24a2+16aa2-8a+16)-arctan(2-aa)+arctan(-aa)-a)4a   |
+--------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(f2: List OrderedCompletion Expression Integer,...)`





