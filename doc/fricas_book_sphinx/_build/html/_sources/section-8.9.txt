.. status: ok



8.9 Working with Power Series
-----------------------------

FriCAS has very sophisticated facilities for working with power series
series. power series

Infinite series are represented by a list of the coefficients that have
already been determined, together with a function for computing the
additional coefficients if needed.

The system command that determines how many terms of a series is
displayed is )set streams calculate. For the purposes of this book, we
have used this system command to display fewer than ten terms. set
streams calculate Series can be created from expressions, from functions
for the series coefficients, and from applications of operations on
existing series. The most general function for creating a series is
called series, although you can also use taylor, laurent and puiseux in
situations where you know what kind of exponents are involved.

For information about solving differential equations in terms of power
series, see
`ugxProblemDEQSeries <section-8.10.html#ugxProblemDEQSeries>`__ .



8.9.1 Creation of Power Series
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the easiest way to create a power series. This tells FriCAS that
x is to be treated as a power series, series:creating so functions of x
are again power series.


.. spadInput
::

	x := series 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



We didn't say anything about the coefficients of the power series, so
the coefficients are general expressions over the integers. This allows
us to introduce denominators, symbolic constants, and other variables as
needed.

Here the coefficients are integers (note that the coefficients are the
Fibonacci Fibonacci numbers numbers).


.. spadInput
::

	1/(1 - x - x^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| 1+x+2x2+3x3+5x4+8x5+13x6+21x7+34x8+55x9+89x10+O(x11)   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



This series has coefficients that are rational numbers.


.. spadInput
::

	sin(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| x-16x3+1120x5-15040x7+1362880x9-139916800x11+O(x12)   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



When you enter this expression you introduce the symbolic constants
sin(1) and cos(1).


.. spadInput
::

	sin(1 + x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------+
| sin(1)+cos(1)x-sin(1)2x2-cos(1)6x3+sin(1)24x4+cos(1)120x5-sin(1)720x6-cos(1)5040x7+sin(1)40320x8+cos(1)362880x9-sin(1)3628800x10+O(x11)   |
+-------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



When you enter the expression the variable a appears in the resulting
series expansion.


.. spadInput
::

	sin(a * x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------+
| ax-a36x3+a5120x5-a75040x7+a9362880x9-a1139916800x11+O(x12)   |
+--------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



You can also convert an expression into a series expansion. This
expression creates the series expansion of 1/log(y) about y=1. For
details and more examples, see
`ugxProblemSeriesConversions <section-8.9.html#ugxProblemSeriesConversions>`__
.


.. spadInput
::

	series(1/log(y),y = 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| (y-1)(-1)+12-112(y-1)+124(y-1)2-19720(y-1)3+3160(y-1)4-86360480(y-1)5+27524192(y-1)6-339533628800(y-1)7+81831036800(y-1)8-3250433479001600(y-1)9+O((y-1)10)   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,y,1)`



You can create power series with more general coefficients. You normally
accomplish this via a type declaration (see
`ugTypesDeclare <section-2.3.html#ugTypesDeclare>`__ ). See
`ugxProblemSeriesFunctions <section-8.9.html#ugxProblemSeriesFunctions>`__
for some warnings about working with declared series.

We declare that y is a one-variable Taylor series series:Taylor (UTS is
the abbreviation for UnivariateTaylorSeries) in the variable z with
FLOAT (that is, floating-point) coefficients, centered about 0. Then, by
assignment, we obtain the Taylor expansion of exp(z) with floating-point
coefficients. UnivariateTaylorSeries


.. spadInput
::

	y : UTS(FLOAT,'z,0) := exp(z)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1.0+z+0.5z2+0.16666666666666666667z3+0.041666666666666666667z4+0.0083333333333333333334z5+0.0013888888888888888889z6+0.0001984126984126984127z7+0.000024801587301587301587z8+0.0000027557319223985890653z9+0.27557319223985890653E-6z10+O(z11)   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Float,z,0.0)`



You can also create a power series by giving an explicit formula for its
n-th coefficient. For details and more examples, see
`ugxProblemSeriesFormula <section-8.9.html#ugxProblemSeriesFormula>`__
.

To create a series about w=0 whose n-th Taylor coefficient is 1/n!, you
can evaluate this expression. This is the Taylor expansion of exp(w) at
w=0.


.. spadInput
::

	series(1/factorial(n),n,w = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------+
| 1+w+12w2+16w3+124w4+1120w5+1720w6+15040w7+140320w8+1362880w9+13628800w10+O(w11)   |
+-----------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,w,0)`







8.9.2 Coefficients of Power Series
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can extract any coefficient from a power series---even one that
hasn't been computed yet. This is possible because in FriCAS, infinite
series are represented by a list of the coefficients that have already
been determined, together with a function for computing the additional
coefficients. (This is known as lazy evaluation.) When you ask for a
series:lazy evaluation coefficient that hasn't yet been computed, FriCAS
computes lazy evaluation whatever additional coefficients it needs and
then stores them in the representation of the power series.

Here's an example of how to extract the coefficients of a power series.
series:extracting coefficients


.. spadInput
::

	x := series(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`




.. spadInput
::

	y := exp(x) * sin(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------+
| x+x2+13x3-130x5-190x6-1630x7+122680x9+1113400x10+11247400x11+O(x12)   |
+-----------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



This coefficient is readily available.


.. spadInput
::

	coefficient(y,6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| -190   |
+--------+




.. spadType

:sub:`Type: Expression Integer`



But let's get the fifteenth coefficient of y.


.. spadInput
::

	coefficient(y,15)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| -110216206000   |
+-----------------+




.. spadType

:sub:`Type: Expression Integer`



If you look at y then you see that the coefficients up to order 15 have
all been computed.


.. spadInput
::

	y


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------+
| x+x2+13x3-130x5-190x6-1630x7+122680x9+1113400x10+11247400x11-197297200x13-1681080400x14-110216206000x15+O(x16)   |
+------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`







8.9.3 Power Series Arithmetic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can manipulate power series using the usual arithmetic operations
series:arithmetic +, -, *, and / (from UnivariatePuiseuxSeries)

The results of these operations are also power series.


.. spadInput
::

	x := series x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`




.. spadInput
::

	(3 + x) / (1 + 7*x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------+
| 3-20x+140x2-980x3+6860x4-48020x5+336140x6-2352980x7+16470860x8-115296020x9+807072140x10+O(x11)   |
+--------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



You can also compute f(x)**g(x), where f(x) and g(x) are two power
series.


.. spadInput
::

	base := 1 / (1 - x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| 1+x+x2+x3+x4+x5+x6+x7+x8+x9+x10+O(x11)   |
+------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`




.. spadInput
::

	expon := x * base


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------+
| x+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+O(x12)   |
+--------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`




.. spadInput
::

	base ^ expon


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------+
| 1+x2+32x3+73x4+4312x5+649120x6+24130x7+3706315x8+857635040x9+24533910080x10+O(x11)   |
+--------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`







8.9.4 Functions on Power Series
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once you have created a power series, you can apply transcendental
functions (for example, exp, log, sin, tan, cosh, etc.) to it.

To demonstrate this, we first create the power series expansion of the
rational function


.. spadMathOutput
.. math::

+-------------+
| x21-6x+x2   |
+-------------+



about x=0.


.. spadInput
::

	x := series 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`




.. spadInput
::

	rat := x^2 / (1 - 6*x + x^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------+
| x2+6x3+35x4+204x5+1189x6+6930x7+40391x8+235416x9+1372105x10+7997214x11+46611179x12+O(x13)   |
+---------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



If you want to compute the series expansion of


.. spadMathOutput
.. math::

+------------------+
| sin(x21-6x+x2)   |
+------------------+



you simply compute the sine of rat.


.. spadInput
::

	sin(rat)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------+
| x2+6x3+35x4+204x5+71336x6+6927x7+807112x8+235068x9+164285281120x10+318885134x11+3713247778x12+O(x13)   |
+--------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`







|  Warning: the type of the coefficients of a power series may affect
the kind of computations that you can do with that series. This can only
happen when you have made a declaration to specify a series domain with
a certain type of coefficient.





If you evaluate then you have declared that y is a one variable Taylor
series series:Taylor (UTS is the abbreviation for
UnivariateTaylorSeries) in the variable y with FRAC INT (that is,
fractions of integer) coefficients, centered about 0.


.. spadInput
::

	y : UTS(FRAC INT,y,0) := y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| y   |
+-----+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Fraction Integer,y,0)`



You can now compute certain power series in y, provided that these
series have rational coefficients.


.. spadInput
::

	exp(y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------+
| 1+y+12y2+16y3+124y4+1120y5+1720y6+15040y7+140320y8+1362880y9+13628800y10+O(y11)   |
+-----------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Fraction Integer,y,0)`



You can get examples of such series by applying transcendental functions
to series in y that have no constant terms.


.. spadInput
::

	tan(y^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| y2+13y6+215y10+O(y11)   |
+-------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Fraction Integer,y,0)`




.. spadInput
::

	cos(y + y^5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------+
| 1-12y2+124y4-721720y6+672140320y8-18446413628800y10+O(y11)   |
+--------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Fraction Integer,y,0)`



Similarly, you can compute the logarithm of a power series with rational
coefficients if the constant coefficient is 1.


.. spadInput
::

	log(1 + sin(y))


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------+
| y-12y2+16y3-112y4+124y5-145y6+615040y7-172520y8+27772576y9-3114175y10+O(y11)   |
+--------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Fraction Integer,y,0)`



If you wanted to apply, say, the operation exp to a power series with a
nonzero constant coefficient a0, then the constant coefficient of the
result would be ea0, which is not a rational number. Therefore,
evaluating exp(2+tan(y)) would generate an error message.

If you want to compute the Taylor expansion of exp(2+tan(y)), you must
ensure that the coefficient domain has an operation exp defined for it.
An example of such a domain is Expression Integer, the type of formal
functional expressions over the integers.

When working with coefficients of this type,


.. spadInput
::

	z : UTS(EXPR INT,z,0) := z


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| z   |
+-----+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,z,0)`



this presents no problems.


.. spadInput
::

	exp(2 + tan(z))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------+
| e2+e2z+e22z2+e22z3+3e28z4+37e2120z5+59e2240z6+137e2720z7+871e25760z8+41641e2362880z9+325249e23628800z10+O(z11)   |
+------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,z,0)`



Another way to create Taylor series whose coefficients are expressions
over the integers is to use taylor which works similarly to
series:Taylor series.

This is equivalent to the previous computation, except that now we are
using the variable w instead of z.


.. spadInput
::

	w := taylor 'w


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| w   |
+-----+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,w,0)`




.. spadInput
::

	exp(2 + tan(w))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------+
| e2+e2w+e22w2+e22w3+3e28w4+37e2120w5+59e2240w6+137e2720w7+871e25760w8+41641e2362880w9+325249e23628800w10+O(w11)   |
+------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,w,0)`







8.9.5 Converting to Power Series
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ExpressionToUnivariatePowerSeries package provides operations for
computing series expansions of functions.
ExpressionToUnivariatePowerSeries

Evaluate this to compute the Taylor expansion of sinx about
series:Taylor x=0. The first argument, sin(x), specifies the function
whose series expansion is to be computed and the second argument, x=0,
specifies that the series is to be expanded in power of (x-0), that is,
in power of x.


.. spadInput
::

	taylor(sin(x),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| x-16x3+1120x5-15040x7+1362880x9+O(x11)   |
+------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,x,0)`



Here is the Taylor expansion of sinx about x=π6:


.. spadInput
::

	taylor(sin(x),x = %pi/6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------+
| 12+32(x-π6)-14(x-π6)2-312(x-π6)3+148(x-π6)4+3240(x-π6)5-11440(x-π6)6-310080(x-π6)7+180640(x-π6)8+3725760(x-π6)9-17257600(x-π6)10+O((x-π6)11)   |
+------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,x,pi/6)`



The function to be expanded into a series may have variables other than
series:multiple variables the series variable.

For example, we may expand tan(x*y) as a Taylor series in x


.. spadInput
::

	taylor(tan(x*y),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| yx+y33x3+2y515x5+17y7315x7+62y92835x9+O(x11)   |
+------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,x,0)`



or as a Taylor series in y.


.. spadInput
::

	taylor(tan(x*y),y = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| xy+x33y3+2x515y5+17x7315y7+62x92835y9+O(y11)   |
+------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,y,0)`



A more interesting function is textet-1 When we expand this function as
a Taylor series in t the n-th order coefficient is the n-th Bernoulli
Bernoulli:polynomial polynomial polynomial:Bernoulli divided by n!.


.. spadInput
::

	bern := taylor(t*exp(x*t)/(exp(t) - 1),t = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1+2x-12t+6x2-6x+112t2+2x3-3x2+x12t3+30x4-60x3+30x2-1720t4+6x5-15x4+10x3-x720t5+42x6-126x5+105x4-21x2+130240t6+6x7-21x6+21x5-7x3+x30240t7+30x8-120x7+140x6-70x4+20x2-11209600t8+10x9-45x8+60x7-42x5+20x3-3x3628800t9+66x10-330x9+495x8-462x6+330x4-99x2+5239500800t10+O(t11)   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,t,0)`



Therefore, this and the next expression produce the same result.


.. spadInput
::

	factorial(6) * coefficient(bern,6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| 42x6-126x5+105x4-21x2+142   |
+-----------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	bernoulliB(6,x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| x6-3x5+52x4-12x2+142   |
+------------------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`



Technically, a series with terms of negative degree is not considered to
be a Taylor series, but, rather, a series:Laurent Laurent series.
Laurent series If you try to compute a Taylor series expansion of xlogx
at x=1 via taylor(x/log(x),x=1) you get an error message. The reason is
that the function has a pole at x=1, meaning that its series expansion
about this point has terms of negative degree. A series with finitely
many terms of negative degree is called a Laurent series.

You get the desired series expansion by issuing this.


.. spadInput
::

	laurent(x/log(x),x = 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------+
| (x-1)(-1)+32+512(x-1)-124(x-1)2+11720(x-1)3-111440(x-1)4+27160480(x-1)5-134480(x-1)6+72973628800(x-1)7-425290304(x-1)8+530113479001600(x-1)9+O((x-1)10)   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Expression Integer,x,1)`



Similarly, a series with terms of fractional degree is neither a Taylor
series nor a Laurent series. Such a series is called a series:Puiseux
Puiseux series. Puiseux series The expression
laurent(sqrt(sec(x)),x=3*%pi/2) results in an error message because the
series expansion about this point has terms of fractional degree.

However, this command produces what you want.


.. spadInput
::

	puiseux(sqrt(sec(x)),x = 3 * %pi/2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| (x-3π2)(-12)+112(x-3π2)32+1160(x-3π2)72+O((x-3π2)5)   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,(3*pi)/2)`



Finally, consider the case of functions that do not have Puiseux
expansions about certain points. An example of this is xx about x=0.
puiseux(x**x,x=0) produces an error message because of the type of
singularity of the function at x=0.

The general function series can be used in this case. Notice that the
series returned is not, strictly speaking, a power series because of the
log(x) in the expansion.


.. spadInput
::

	series(x^x,x=0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------+
| 1+log(x)x+log(x)22x2+log(x)36x3+log(x)424x4+log(x)5120x5+log(x)6720x6+log(x)75040x7+log(x)840320x8+log(x)9362880x9+log(x)103628800x10+O(x11)   |
+------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: GeneralUnivariatePowerSeries(Expression Integer,x,0)`







| The operation series returns the most general type of infinite series.
The user who is not interested in distinguishing between various types
of infinite series may wish to use this operation exclusively.









8.9.6 Power Series from Formulas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The GenerateUnivariatePowerSeries package enables you to series:giving
formula for coefficients create power series from explicit formulas for
their n-th coefficients. In what follows, we construct series expansions
for certain transcendental functions by giving formulas for their
coefficients. You can also compute such series expansions directly
simply by specifying the function and the point about which the series
is to be expanded. GenerateUnivariatePowerSeries See
`ugxProblemSeriesConversions <section-8.9.html#ugxProblemSeriesConversions>`__
for more information.

Consider the Taylor expansion of ex series:Taylor about x=0:


.. spadMathOutput
.. math::

+--------------------------------+
| ex=1+x+x22+x36+···=∑n=0∞xnn!   |
+--------------------------------+



The n-th Taylor coefficient is 1/n!.

This is how you create this series in FriCAS.


.. spadInput
::

	series(n +-> 1/factorial(n),x = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------+
| 1+x+12x2+16x3+124x4+1120x5+1720x6+15040x7+140320x8+1362880x9+13628800x10+O(x11)   |
+-----------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



The first argument specifies a formula for the n-th coefficient by
giving a function that maps n to 1/n!. The second argument specifies
that the series is to be expanded in powers of (x-0), that is, in powers
of x. Since we did not specify an initial degree, the first term in the
series was the term of degree 0 (the constant term). Note that the
formula was given as an anonymous function. These are discussed in
`ugUserAnon <section-6.17.html#ugUserAnon>`__ .

Consider the Taylor expansion of logx about x=1:


.. spadMathOutput
.. math::

+--------------------------------------------------------+
| log(x)=(x-1)-(x-1)22+(x-1)33-···=∑n=1∞(-1)n-1(x-1)nn   |
+--------------------------------------------------------+



If you were to evaluate the expression series(n+->(-1)**(n-1)/n,x=1)
you would get an error message because FriCAS would try to calculate a
term of degree 0 and therefore divide by 0.

Instead, evaluate this. The third argument, 1.., indicates that only
terms of degree n=1,... are to be computed.


.. spadInput
::

	series(n +-> (-1)^(n-1)/n,x = 1,1..)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------+
| (x-1)-12(x-1)2+13(x-1)3-14(x-1)4+15(x-1)5-16(x-1)6+17(x-1)7-18(x-1)8+19(x-1)9-110(x-1)10+111(x-1)11+O((x-1)12)   |
+------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,1)`



Next consider the Taylor expansion of an odd function, say, sin(x):


.. spadMathOutput
.. math::

+--------------------------+
| sin(x)=x-x33!+x55!-···   |
+--------------------------+



Here every other coefficient is zero and we would like to give an
explicit formula only for the odd Taylor coefficients.

This is one way to do it. The third argument, 1.., specifies that the
first term to be computed is the term of degree 1. The fourth argument,
2, specifies that we increment by 2 to find the degrees of subsequent
terms, that is, the next term is of degree 1+2, the next of degree
1+2+2, etc.


.. spadInput
::

	series(n +-> (-1)^((n-1)/2)/factorial(n),x = 0,1..,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| x-16x3+1120x5-15040x7+1362880x9-139916800x11+O(x12)   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



The initial degree and the increment do not have to be integers. For
example, this expression produces a series expansion of sin(x13).


.. spadInput
::

	series(n +-> (-1)^((3*n-1)/2)/factorial(3*n),x = 0,1/3..,2/3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------+
| x13-16x+1120x53-15040x73+1362880x3-139916800x113+O(x4)   |
+----------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



While the increment must be positive, the initial degree may be
negative. This yields the Laurent expansion of csc(x) at x=0.
(bernoulli(numer(n+1)) is necessary because bernoulli takes integer
arguments.)


.. spadInput
::

	cscx := series(n +-> (-1)^((n-1)/2) * 2 * (2^n-1) *
bernoulli(numer(n+1)) / factorial(n+1), x=0, -1..,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------+
| x(-1)+16x+7360x3+3115120x5+127604800x7+733421440x9+O(x10)   |
+-------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



Of course, the reciprocal of this power series is the Taylor expansion
of sin(x).


.. spadInput
::

	1/cscx


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| x-16x3+1120x5-15040x7+1362880x9-139916800x11+O(x12)   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



As a final example,here is the Taylor expansion of asin(x) about x=0.


.. spadInput
::

	asinx := series(n +-> binomial(n-1,(n-1)/2)/(n*2^(n-1)),x=0,1..,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------+
| x+16x3+340x5+5112x7+351152x9+632816x11+O(x12)   |
+-------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`



When we compute the sin of this series, we get x (in the sense that all
higher terms computed so far are zero).


.. spadInput
::

	sin(asinx)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| x+O(x12)   |
+------------+




.. spadType

:sub:`Type: UnivariatePuiseuxSeries(Expression Integer,x,0)`







FriCAS isn't sufficiently symbolic in the sense we might wish. It is an
open problem to decide that x is the only surviving term. Two attacks on
the problem might be:

(1) Notice that all of the higher terms are identically zero but FriCAS
can't decide that from the information it knows. Presumably we could
attack this problem by looking at the sin function as a taylor series
around x=0 and seeing the term cancellation occur. This uses a
term-difference mechanism.

(2) Notice that there is no way to decide that the stream for asinx is
actually the definition of asin(x). But we could recognize that the
stream for asin(x) has a generator term and so will a taylor series
expansion of sin(x). From these two generators it may be possible in
certain cases to decide that the application of one generator to the
other will yield only x. This trick involves finding the correct inverse
for the stream functions. If we can find an inverse for the remaining
tail of the stream we could conclude cancellation and thus turn an
infinite stream into a finite object.

| In general this is the zero-equivalence problem and is undecidable.





As we discussed in
`ugxProblemSeriesConversions <section-8.9.html#ugxProblemSeriesConversions>`__
, you can also use the operations taylor, laurent and puiseux instead of
series if you know ahead of time what kind of exponents a series has.
You can't go wrong using series, though.





8.9.7 Substituting Numerical Values in Power Series
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use evalevalUnivariatePowerSeriesCategory approximation to substitute a
numerical value for a variable in series:numerical approximation a power
series. For example, here's a way to obtain numerical approximations of
%e from the Taylor series expansion of exp(x).

First you create the desired Taylor expansion.


.. spadInput
::

	f := taylor(exp(x))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------+
| 1+x+12x2+16x3+124x4+1120x5+1720x6+15040x7+140320x8+1362880x9+13628800x10+O(x11)   |
+-----------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,x,0)`



Then you evaluate the series at the value 1.0. The result is a sequence
of the partial sums.


.. spadInput
::

	eval(f,1.0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [1.0,2.0,2.5,2.6666666666666666667,2.7083333333333333333,.2.7166666666666666667,2.7180555555555555556,2.718253968253968254,.2.7182787698412698413,2.7182815255731922399,…]   |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream Expression Float`







8.9.8 Example: Bernoulli Polynomials and Sums of Powers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS provides operations for computing definite and summation:definite
indefinite sums. summation:indefinite

You can compute the sum of the first ten fourth powers by evaluating
this. This creates a list whose entries are m4 as m ranges from 1 to 10,
and then computes the sum of the entries of that list.


.. spadInput
::

	reduce(+,[m^4 for m in 1..10])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 25333   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`



You can also compute a formula for the sum of the first k fourth powers,
where k is an unspecified positive integer.


.. spadInput
::

	sum4 := sum(m^4, m = 1..k)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| 6k5+15k4+10k3-k30   |
+---------------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`



This formula is valid for any positive integer k. For instance, if we
replace k by 10, summation:definite we obtain the number we computed
earlier.


.. spadInput
::

	eval(sum4, k = 10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 25333   |
+---------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`



You can compute a formula for the sum of the first k n-th powers in a
similar fashion. Just replace the 4 in the definition of sum4 by any
expression not involving k. FriCAS computes these formulas using
Bernoulli polynomials; Bernoulli:polynomial we polynomial:Bernoulli use
the rest of this section to describe this method.

First consider this function of t and x.


.. spadInput
::

	f := t*exp(x*t) / (exp(t) - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| te(tx)et-1   |
+--------------+




.. spadType

:sub:`Type: Expression Integer`



Since the expressions involved get quite large, we tell FriCAS to show
us only terms of degree up to 5.


.. spadInput
::

	)set streams calculate 5


.. spadMathAnswer
set streams calculate

If we look at the Taylor expansion of f(x,t) about t=0, we see that the
coefficients of the powers of t are polynomials in x.


.. spadInput
::

	ff := taylor(f,t = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------+
| 1+2x-12t+6x2-6x+112t2+2x3-3x2+x12t3+30x4-60x3+30x2-1720t4+6x5-15x4+10x3-x720t5+O(t6)   |
+----------------------------------------------------------------------------------------+



:sub:`Type: UnivariateTaylorSeries(Expression Integer,t,0)`

In fact, the n-th coefficient in this series is essentially the n-th
Bernoulli polynomial: the n-th coefficient of the series is 1n!Bn(x),
where Bn(x) is the n-th Bernoulli polynomial. Thus, to obtain the n-th
Bernoulli polynomial, we multiply the n-th coefficient of the series ff
by n!.

For example, the sixth Bernoulli polynomial is this.


.. spadInput
::

	factorial(6) * coefficient(ff,6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| 42x6-126x5+105x4-21x2+142   |
+-----------------------------+




.. spadType

:sub:`Type: Expression Integer`



We derive some properties of the function f(x,t). First we compute
f(x+1,t)-f(x,t).


.. spadInput
::

	g := eval(f, x = x + 1) - f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| te(tx+t)-te(tx)et-1   |
+-----------------------+




.. spadType

:sub:`Type: Expression Integer`



If we normalize g, we see that it has a particularly simple form.


.. spadInput
::

	normalize(g)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| te(tx)   |
+----------+




.. spadType

:sub:`Type: Expression Integer`



From this it follows that the n-th coefficient in the Taylor expansion
of g(x,t) at t=0 is 1(n-1)!xn-1.

If you want to check this, evaluate the next expression.


.. spadInput
::

	taylor(g,t = 0)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| t+xt2+x22t3+x36t4+x424t5+O(t6)   |
+----------------------------------+




.. spadType

:sub:`Type: UnivariateTaylorSeries(Expression Integer,t,0)`



However, since g(x,t)=f(x+1,t)-f(x,t) it follows that the n-th
coefficient is 1n!(Bn(x+1)-Bn(x)) Equating coefficients, we see that
1(n-1)!xn-1=1n!(Bn(x+1)-Bn(x)) and, therefore, xn-1=1n(Bn(x+1)-Bn(x))

Let's apply this formula repeatedly, letting x vary between two integers
a and b, with a<b:


.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------+
| an-1=1n(Bn(a+1)-Bn(a))(a+1)n-1=1n(Bn(a+2)-Bn(a+1))(a+2)n-1=1n(Bn(a+3)-Bn(a+2))⋮(b-1)n-1=1n(Bn(b)-Bn(b-1))bn-1=1n(Bn(b+1)-Bn(b))   |
+-----------------------------------------------------------------------------------------------------------------------------------+



When we add these equations we find that the sum of the left-hand sides
is the sum of the (n-1)st powers from a to b. The sum of the right-hand
sides is a telescoping series. After cancellation, the sum is simply
1n(Bn(b+1)-Bn(a))

Replacing n by n+1, we have shown that ∑m=abmn=1n+1(Bn+1(b+1)-Bn+1(a))

Let's use this to obtain the formula for the sum of fourth powers.

First we obtain the Bernoulli polynomial B5.


.. spadInput
::

	B5 := factorial(5) * coefficient(ff,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| 6x5-15x4+10x3-x6   |
+--------------------+




.. spadType

:sub:`Type: Expression Integer`



To find the sum of the first k 4th powers, we multiply 1/5 by
B5(k+1)-B5(1).


.. spadInput
::

	1/5 * (eval(B5, x = k + 1) - eval(B5, x = 1))


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| 6k5+15k4+10k3-k30   |
+---------------------+




.. spadType

:sub:`Type: Expression Integer`



This is the same formula that we obtained via sum(m**4,m=1..k).


.. spadInput
::

	sum4


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| 6k5+15k4+10k3-k30   |
+---------------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`



At this point you may want to do the same computation, but with an
exponent other than 4. For example, you might try to find a formula for
the sum of the first k 20th powers.





