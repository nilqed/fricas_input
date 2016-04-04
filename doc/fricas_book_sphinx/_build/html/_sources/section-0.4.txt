.. status: ok

0.4 Using FriCAS as a Symbolic Calculator
-----------------------------------------

In the previous section all the examples involved numbers and simple
functions. Also none of the expressions entered were assigned to
anything. In this section we will move on to simple algebra (i.e.
expressions involving symbols and other features available on more
sophisticated calculators).



0.4.1 Expressions Involving Symbols
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Expressions involving symbols are entered just as they are written down,
for example:


.. spadInput

::

    xSquared := x^2


.. spadMathAnswer
.. spadMathOutput

.. math::

  x^2


.. spadType

:sub:`Type: Polynomial Integer`



where the assignment operator ``:=`` represents immediate assignment.
Later it will be seen that this form of assignment is not always
desirable and the use of the delayed assignment operator == will be
introduced. The type of the result is Polynomial Integer which is used
to represent polynomials with integer coefficients. Some other examples
along similar lines are:


.. spadInput

::

    xDummy := 3.21*x^2


.. spadMathAnswer






.. spadMathOutput

.. math::

  3.21 x^2   

.. spadType

:sub:`Type: Polynomial Float`


.. spadInput

::

    xDummy := x^2.5


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{x} ^ {2}} \  {\sqrt {x}}


.. spadType

:sub:`Type: Expression Float`




.. spadInput
::

    xDummy := x^3.3


.. spadMathAnswer
.. spadMathOutput
.. math::

 {{x} ^ {3}} \  {{{\root {{10}} \of {x}}} ^ {3}}

.. spadType

:sub:`Type: Expression Float`

.. spadInput
::

    xyDummy := x^2 - y^2

.. spadMathAnswer
.. spadMathOutput
.. math::

  x^2-y^2

.. spadType
:sub:`Type: Polynomial Integer`



Given that we can define expressions involving symbols, how do we
actually compute the result when the symbols are assigned values? The
answer is to use the eval function which takes an expression as its
first argument followed by a list of assignments. For example, to
evaluate the expressions XDummy and {xyDummy} resulting from their
respective assignments above we type:


.. spadInput
::

    eval(xDummy,x=3)


.. spadMathAnswer
.. spadMathOutput
.. math::

  37.540507598529552193   

.. spadType
:sub:`Type: Expression Float`




.. spadInput
::
    
    eval(xyDummy, [x=3, y=2.1])

.. spadMathAnswer
.. spadMathOutput
.. math::

 4.59   

.. spadType
:sub:`Type: Polynomial Float`



0.4.2 Complex Numbers
~~~~~~~~~~~~~~~~~~~~~

For many scientific calculations real numbers aren't sufficient and
support for complex numbers is also required. Complex numbers are
handled in an intuitive manner and FriCAS, which uses the %i macro to
represent the square root of -1. Thus expressions involving complex
numbers are entered just like other expressions.


.. spadInput
::

 (2/3 + %i)^3


.. spadMathAnswer
.. spadMathOutput
.. math::

  -4627+13\,i   

.. spadType
:sub:`Type: Complex Fraction Integer`


The real and imaginary parts of a complex number can be extracted using
the real and imag functions and the complex conjugate of a number can be
obtained using conjugate:


.. spadInput
::

    real(3 + 2*%i)

.. spadMathAnswer
.. spadMathOutput
.. math::

 3

.. spadType
:sub:`Type: PositiveInteger`




.. spadInput
::

    imag(3+ 2*%i)


.. spadMathAnswer
.. spadMathOutput
.. math::

 2

.. spadType
:sub:`Type: PositiveInteger`




.. spadInput
::

    conjugate(3 + 2*%i)


.. spadMathAnswer
.. spadMathOutput
.. math::

 3-2\,i   

.. spadType
:sub:`Type: Complex Integer`


The function factor can also be applied to complex numbers but the
results aren't quite so obvious as for factoring integer:


.. spadInput
::

    144 + 24*%i

.. spadMathAnswer
.. spadMathOutput
.. math::

 144+24\,i   

.. spadType
:sub:`Type: Complex Integer`



0.4.3 Number Representations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default all numerical results are displayed in decimal with real
numbers shown to 20 significant figures. If the integer part of a number
is longer than 20 digits then nothing after the decimal point is shown
and the integer part is given in full. To alter the number of digits
shown the function digits can be called. The result returned by this
function is the previous setting. For example, to find the value of π to
40 digits we type:


.. spadInput
::

    digits(40)


.. spadMathAnswer
.. spadMathOutput
.. math::

 20

.. spadType
:sub:`Type: PositiveInteger`




.. spadInput
::

    %pi::Float

.. spadMathAnswer
.. spadMathOutput
.. math::

  3.141592653589793238462643383279502884197   



.. spadType
:sub:`Type: Float`


As can be seen in the example above, there is a gap after every ten
digits. This can be changed using the outputSpacing function where the
argument is the number of digits to be displayed before a space is
inserted. If no spaces are desired then use the value 0. Two other
functions controlling the appearance of real numbers are outputFloating
and outputFixed. The former causes FriCAS to display floating-point
values in exponent notation and the latter causes it to use fixed-point
notation. For example:


.. spadInput
::

    outputFloating(); %


.. spadMathAnswer
.. spadMathOutput
.. math::


  0.3141592653589793238462643383279502884197E1   

.. spadType
:sub:`Type: Float`




.. spadInput
::

    outputFloating(3); 0.00345

.. spadMathAnswer
.. spadMathOutput
.. math::

  0.345E-2   

.. spadType
:sub:`Type: Float`



.. spadInput
::

    outputFixed(); %

.. spadMathAnswer
.. spadMathOutput
.. math::

  0.00345   

.. spadType
:sub:`Type: Float`



.. spadInput
::
    
    outputFixed(3); %

.. spadMathAnswer
.. spadMathOutput
.. math::
    
  0.003   

.. spadType
:sub:`Type: Float`


.. spadInput
::

    outputGeneral(); %

.. spadMathAnswer
.. spadMathOutput
.. math::

  0.00345   

.. spadType
:sub:`Type: Float`


Note that the semicolon ; in the examples above allows several
expressions to be entered on one line. The result of the last expression
is displayed. remember also that the percent symbol ``%`` is used to
represent the result of a previous calculation.

To display rational numbers in a base other than 10 the function radix
is used. The first argument of this function is the expression to be
displayed and the second is the base to be used.


.. spadInput
::

    radix(10^10,32)

.. spadMathAnswer
.. spadMathOutput
.. math::

  9A0NP00

.. spadType
:sub:`Type: RadixExpansion 32`



.. spadInput
::

    radix(3/21,5)

.. spadMathAnswer
.. spadMathOutput
.. math:: 

  0.\overline{032412}   
                            
.. spadType
:sub:`Type: RadixExpansion 5`



Rational numbers can be represented as a repeated decimal expansion
using the decimal function or as a continued fraction using
continuedFraction. Any attempt to call these functions with irrational
values will fail.


.. spadInput
::

    decimal(22/7)

.. spadMathAnswer
.. spadMathOutput
.. math::

  3.{\overline {142857}} 

.. spadType
:sub:`Type: DecimalExpansion`




.. spadInput
::

    continuedFraction(6543/210)

.. spadMathAnswer
.. spadMathOutput
.. math:: 

  31 + \frac{1}{+ \frac{1}{+ \frac{1}{+ \frac{1}{3}}}}   
                                                                 

.. spadType
:sub:`Type: ContinuedFraction Integer`


Finally, partial fractions in compact and expanded form are available
via the functions partialFraction and padicFraction respectively. The
former takes two arguments, the first being the numerator of the
fraction and the second being the denominator. The latter function takes
a fraction and expands it further while the function compactFraction
does the reverse:


.. spadInput
::

    partialFraction(234,40)

.. spadMathAnswer
.. spadMathOutput
.. math::

  6 -{3 \over {{2} ^ {2}}}+{3 \over 5}   

.. spadType
:sub:`Type: PartialFraction Integer`



.. spadInput
::

    padicFraction(%)


.. spadMathAnswer
.. spadMathOutput
.. math::

  6 -{1 \over 2} -{1 \over {{2} ^ {2}}}+{3 \over 5}

.. spadType
:sub:`Type: PartialFraction Integer`



.. spadInput
::

    compactFraction(%)
    
.. spadMathAnswer
.. spadMathOutput
.. math::

  6 -{3 \over {{2} ^ {2}}}+{3 \over 5}  

.. spadType
:sub:`Type: PartialFraction Integer`



.. spadInput
::

    padicFraction(234/40)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {117} \over {20}

.. spadType
:sub:`Type: PartialFraction Fraction Integer`



To extract parts of a partial fraction the function nthFractionalTerm is
available and returns a partial fraction of one term. To decompose this
further the numerator can be obtained using firstNumer and the
denominator with firstDenom. The whole part of a partial fraction can be
retrieved using wholePart and the number of fractional parts can be
found using the function numberOf FractionalTerms:


.. spadInput
::

    t := partialFraction(234,40)

.. spadMathAnswer
.. spadMathOutput
.. math::

  6 -{3 \over {{2} ^ {2}}}+{3 \over 5}

.. spadType
:sub:`Type: PartialFraction Integer`



.. spadInput
::

    wholePart(t)

.. spadMathAnswer
.. spadMathOutput
.. math::

  6

.. spadType
:sub:`Type: PositiveInteger`




.. spadInput
::

    numberOfFractionalTerms(t)

.. spadMathAnswer
.. spadMathOutput
.. math::

  2

.. spadType
:sub:`Type: PositiveInteger`




.. spadInput
::

    p := nthFractionalTerm(t,1)

.. spadMathAnswer
.. spadMathOutput
.. math::

  -322

.. spadType
:sub:`Type: PartialFraction Integer`




.. spadInput
::

    firstNumer(p)

.. spadMathAnswer
.. spadMathOutput
.. math::

  -3

.. spadType
:sub:`Type: Integer`




.. spadInput
::

    firstDenom(p)

.. spadMathAnswer
.. spadMathOutput
.. math::
 
  22   

.. spadType
:sub:`Type: Factored Integer`



0.4.4 Modular Arithmetic
~~~~~~~~~~~~~~~~~~~~~~~~

By using the type constructor PrimeField it is possible to do arithmetic
modulo some prime number. For example, arithmetic module 7 can be
performed as follows:


.. spadInput
::

    x : PrimeField 7 := 5

.. spadMathAnswer
.. spadMathOutput
.. math::

  5   

.. spadType
:sub:`Type: PrimeField 7`




.. spadInput
::

    x^5 + 6

.. spadMathAnswer
.. spadMathOutput
.. math::

  2

.. spadType
:sub:`Type: PrimeField 7`




.. spadInput
::

    1/x

.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: PrimeField 7`



The first example should be read as:

  Let x be of type PrimeField(7) and assign to it the value 5


Note that it is only possible to invert non-zero values if the
arithmetic is performed modulo a prime number. Thus arithmetic modulo a
non-prime integer is possible but the reciprocal operation is undefined
and will generate an error. Attempting to use the PrimeField type
constructor with a non-prime argument will generate an error. An example
of non-prime modulo arithmetic is:


.. spadInput
::

    y : IntegerMod 8 := 11

.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: IntegerMod 8`




.. spadInput
::

    y*4 + 27

.. spadMathAnswer
.. spadMathOutput
.. math::

  7

.. spadType
:sub:`Type: IntegerMod 8`



Note that polynomials can be constructed in a similar way:


.. spadInput
::

    (3*a^4 + 27*a - 36)::Polynomial PrimeField 7

.. spadMathAnswer
.. spadMathOutput
.. math::

  {3 \  {{a} ^ {4}}}+{6 \  a}+6

.. spadType
:sub:`Type: Polynomial PrimeField 7`
