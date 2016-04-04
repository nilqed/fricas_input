0.3 Using FriCAS as a Pocket Calculator
---------------------------------------

At the simplest level FriCAS can be used as a pocket calculator where
expressions involving numbers and operators are entered directly in
infix notation. In this sense the more advanced features of the
calculator can be regarded as operators (e.g sin, cos, etc).

0.3.1 Basic Arithmetic
~~~~~~~~~~~~~~~~~~~~~~

An example of this might be to calculate the cosine of 2.45 (in
radians). To do this one would type:

::
    
    cos 2.45


.. math:: - {0.7702312540473073417}  

:sub:`Type: Float`


Before proceeding any further it would be best to explain the previous
three lines. Firstly the text (1) -> is part of the prompt that the
FriCAS system provides when in interactive mode. The full prompt has
other text preceding this but it is not relevant here. The number in
parenthesis is the step number of the input which may be used to refer
to the results of previous calculations. The step number appears at the
start of the second line to tell you which step the result belongs to.
Since the interpreter probably loaded numberous libraries to calculate
the result given above and listed each one in the prcess, there could
easily be several pages of text between your input and the answer.

The last line contains the type of the result. The type Float is used to
represent real numbers of arbitrary size and precision (where the user
is able to define how big arbitrary is -- the default is 20 digits but
can be as large as your computer system can handle). The type of the
result can help track down mistakes in your input if you don't get the
answer you expected.

Other arithmetic operations such as addition, subtraction, and
multiplication behave as expected:


::
    
    6.93 * 4.1328


.. math:: 28.640304   
 

:sub:`Type: Float`


::
    
    6.93 / 4.1328


.. math:: 1.6768292682926829268   


:sub:`Type: Float`


but integer division isn't quite so obvious. For example, if one types:


::
    
    4/6

.. math:: \frac{2}{3}   
 

:sub:`Type: Fraction Integer`

a fractional result is obtained. The function used to display fractions
attempts to produce the most readable answer. In the example:

::
    
    4/2

.. math:: 2   

:sub:`Type: Fraction Integer`

the result is stored as the fraction 2/1 but is displayed as the integer
2. This fraction could be converted to type Integer with no loss of
informatin but FriCAS will not do so automatically.


0.3.2 Type Conversion
~~~~~~~~~~~~~~~~~~~~~

To obtain the floating point value of a fraction one must convert (
conversions are applied by the user and coercions are applied
automatically by the interpreter) the result to type Float using the
``::`` operator as follows:



::
    
    (4.6)::Float

.. math:: 4.6   

:sub:`Type: Float`

Although FriCAS can convert this back to a fraction it might not be the
same fraction you started with as due to rounding errors. For example,
the following conversion appears to be without error but others might
not:


::
    
    %::Fraction Integer

.. math:: \frac{23}{5}   
                          

:sub:`Type: Fraction Integer`


where ``%`` represents the previous result (not the calculation).

Although FriCAS has the ability to work with floating-point numbers to a
very high precision it must be remembered that calculations with these
numbers are not exact. Since FriCAS is a computer algebra package and
not a numerical solutions package this should not create too many
problems. The idea is that the user should use FriCAS to do all the
necessary symbolic manipulation and only at the end should actual
numerical results be extracted.

If you bear in mind that FriCAS appears to store expressions just as you
have typed them and does not perform any evalutation of them unless
forced to then programming in the system will be much easier. It means
that anything you ask FriCAS to do (within reason) will be carried with
complete accuracy.

In the previous examples the ``::`` operator was used to convert
values from one type to another. This type conversion is not possible
for all values. For instance, it is not possible to convert the number
3.4 to an integer type since it can't be represented as an integer. The
number 4.0 can be converted to an integer type since it has no
fractional part.

Conversion from floating point values to integers is performed using the
functions round and truncate. The first of these rounds a floating point
number to the nearest integer while the other truncates (i.e. removes
the fractional part). Both functions return the result as a floating
point number. To extract the fractional part of a floating point number
use the function fractionPart but note that the sign of the result
depends on the sign of the argument. FriCAS obtains the fractional
partof :math:`x` using :math:`x - {truncate}\left( x \right)`:


::
    
    round(3.77623)

.. math:: 4.0   |
                 
:sub:`Type: Float`


::
    
    round(-3.77623)

.. math:: - {4.0}   
                     
:sub:`Type: Float`


::
    
    truncate(9.235)

.. math:: 9.0   
                 
:sub:`Type: Float`


::
    
    truncate(-9.654)

.. math:: - {9.0}   

:sub:`Type: Float`


::
    
    fractionPart(-3.77623)

.. math:: - {0.77623}   

:sub:`Type: Float`


0.3.3 Useful Functions
~~~~~~~~~~~~~~~~~~~~~~

To obtain the absolute value of a number the abs function can be used.
This takes a single argument which is usually an integer or a floating
point value but doesn't necessarily have to be. The sign of a value can
be obtained via the sign function which rturns :math:`- 1`, :math:`0`,
or :math:`1` depending on the sign of the argument.


::
    
    abs(4)

.. math:: 4   
               
:sub:`Type: PositiveInteger`


::
    
    abs(-3)

.. math:: 3   
               
:sub:`Type: PositiveInteger`


::
    
    abs(-34254.12314)

.. math:: 34254.12314   
 
:sub:`Type: Float`


::
    
    sign(-49543.2345346)

.. math:: - 1   

:sub:`Type: Integer`


::
    
    sign(0)

.. math:: 0   
 
:sub:`Type: NonNegativeInteger`


::
    
    sign(234235.42354)

.. math:: 1   

:sub:`Type: PositiveInteger`


Tests on values can be done using various functions which are generally
more efficient than using relational operators such as :math:`=`
particularly if the value is a matrix. Examples of some of these
functions are:

::
    
    positive?(-234)

.. math:: \texttt{false}   
 
:sub:`Type: Boolean`


::
    
    negative?(-234)

.. math:: \texttt{true}   

:sub:`Type: Boolean`


::
    
    zero?(42)

.. math:: \texttt{false}   

:sub:`Type: Boolean`


::
    
    one?(1)

.. math:: \texttt{true}  


:sub:`Type: Boolean`


::
    
    odd?(23)

.. math:: \texttt{true}   
                           
:sub:`Type: Boolean`


::
    
    odd?(9.435)

.. math:: \texttt{false}   

:sub:`Type: Boolean`


::
    
    even?(-42)

.. math:: \texttt{true}   
 
:sub:`Type: Boolean`


::
    
    prime?(37)

.. math:: \texttt{true}   

:sub:`Type: Boolean`


::
    
    prime?(-37)

.. math:: \texttt{false}   
 
:sub:`Type: Boolean`


Some other functions that are quite useful for manipulating numerical
values are:

::

    sin(x)         Sine of x
    cos(x)         Cosine of x
    tan(x)         Tangent of x
    asin(x)        Arcsin of x
    acos(x)        Arccos of x
    atan(x)        Arctangent of x
    gcd(x,y)       Greatest common divisor of x and y
    lcm(x,y)       Lowest common multiple of x and y
    max(x,y)       Maximum of x and y
    min(x,y)       Minimum of x and y
    factorial(x)   Factorial of x
    factor(x)      Prime factors of x
    divide(x,y)    Quotient and remainder of x/y


Some simple infix and prefix operators:

::
    
    +      Addition             -      Subtraction
    -      Numerical Negation   ~      Logical Negation
    /\     Conjunction (AND)    \/     Disjunction (OR)
    and    Logical AND (/\\)    or     Logical OR (\\/)
    not    Logical Negation     ^      Exponentiation
    *      Multiplication       /      Division
    quo    Quotient             rem    Remainder
    <      less than            >      greater than
    <=     less than or equal   >=     greater than or equal


Some useful FriCAS macros:

::
    
    %i              The square root of -1
    %e              The base of the natural logarithm
    %pi             Pi
    %infinity       Infinity
    %plusInfinity   Positive Infinity
    %minusInfinity  Negative Infinity
