.. status: ok


9.27 Float
----------

FriCAS provides two kinds of floating point numbers. The domain Float
(abbreviation FLOAT) implements a model of arbitrary precision floating
point numbers. The domain DoubleFloat (abbreviation DFLOAT) is intended
to make available hardware floating point arithmetic in FriCAS. The
actual model of floating point that DoubleFloat provides is
system-dependent. For example, on the IBM system 370 FriCAS uses IBM
double precision which has fourteen hexadecimal digits of precision or
roughly sixteen decimal digits. Arbitrary precision floats allow the
user to specify the precision at which arithmetic operations are
computed. Although this is an attractive facility, it comes at a cost.
Arbitrary-precision floating-point arithmetic typically takes twenty to
two hundred times more time than hardware floating point.

For more information about FriCAS's numeric and graphic facilities, see
`ugGraphPage <ugGraphPage>`__ in Section
`ugGraphNumber <ugGraphNumber>`__ ,
`ugProblemNumeric <section-8.1.html#ugProblemNumeric>`__ , and
`DoubleFloatXmpPage <section-9.17.html#DoubleFloatXmpPage>`__ .



9.27.1 Introduction to Float
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Scientific notation is supported for input and output of floating point
numbers. A floating point number is written as a string of digits
containing a decimal point optionally followed by the letter E, and then
the exponent.

We begin by doing some calculations using arbitrary precision floats.
The default precision is twenty decimal digits.


.. spadInput
::

	1.234


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 1.234   |
+---------+




.. spadType

:sub:`Type: Float`



A decimal base for the exponent is assumed, so the number 1.234E2
denotes .


.. spadInput
::

	1.234E2


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 123.4   |
+---------+




.. spadType

:sub:`Type: Float`



The normal arithmetic operations are available for floating point
numbers.


.. spadInput
::

	sqrt(1.2 + 2.3 / 3.4 ^ 4.5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| 1.0996972790671286226   |
+-------------------------+




.. spadType

:sub:`Type: Float`







9.27.2 Conversion Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can use conversion (`ugTypesConvertPage <ugTypesConvertPage>`__ in
Section `ugTypesConvertNumber <ugTypesConvertNumber>`__ ) to go back and
forth between Integer, Fraction Integer and Float, as appropriate.


.. spadInput
::

	i := 3 :: Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 3.0   |
+-------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	i :: Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: Integer`




.. spadInput
::

	i :: Fraction Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



Since you are explicitly asking for a conversion, you must take
responsibility for any loss of exactness.


.. spadInput
::

	r := 3/7 :: Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| 0.42857142857142857143   |
+--------------------------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	r :: Fraction Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 37   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



This conversion cannot be performed: use truncatetruncateFloat or
roundroundFloat if that is what you intend.


.. spadInput
::

	r :: Integer


.. spadMathAnswer
.. spadVerbatim

::

    Cannot convert from type Float to Integer for value
    0.4285714285 7142857143



The operations truncatetruncateFloat and roundroundFloat truncate ...


.. spadInput
::

	truncate 3.6


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 3.0   |
+-------+




.. spadType

:sub:`Type: Float`



and round to the nearest integral Float respectively.


.. spadInput
::

	round 3.6


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 4.0   |
+-------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	truncate(-3.6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| -3.0   |
+--------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	round(-3.6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| -4.0   |
+--------+




.. spadType

:sub:`Type: Float`



The operation fractionPartfractionPartFloat computes the fractional part
of x, that is, x - truncate x.


.. spadInput
::

	fractionPart 3.6


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 0.6   |
+-------+




.. spadType

:sub:`Type: Float`



The operation digitsdigitsFloat allows the user to set the precision. It
returns the previous value it was using.


.. spadInput
::

	digits 40


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 20   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	sqrt 0.2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------+
| 0.4472135954999579392818347337462552470881   |
+----------------------------------------------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	pi()$Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| 3.141592653589793238462643383279502884197   |
+---------------------------------------------+




.. spadType

:sub:`Type: Float`



The precision is only limited by the computer memory available.
Calculations at 500 or more digits of precision are not difficult.


.. spadInput
::

	digits 500


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 40   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	pi()$Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Float`



Reset digitsdigitsFloat to its default value.


.. spadInput
::

	digits 20


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 500   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



Numbers of type Float are represented as a record of two integers,
namely, the mantissa and the exponent where the base of the exponent is
binary. That is, the floating point number (m,e) represents the number .
A consequence of using a binary base is that decimal numbers can not, in
general, be represented exactly.





9.27.3 Output Functions
~~~~~~~~~~~~~~~~~~~~~~~

A number of operations exist for specifying how numbers of type Float
are to be displayed. By default, spaces are inserted every ten digits in
the output for readability.Note that you cannot include spaces in the
input form of a floating point number, though you can use underscores.

Output spacing can be modified with the outputSpacingoutputSpacingFloat
operation. This inserts no spaces and then displays the value of x.


.. spadInput
::

	outputSpacing 0; x := sqrt 0.2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| 0.44721359549995793928   |
+--------------------------+




.. spadType

:sub:`Type: Float`



Issue this to have the spaces inserted every 5 digits.


.. spadInput
::

	outputSpacing 5; x


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| 0.44721359549995793928   |
+--------------------------+




.. spadType

:sub:`Type: Float`



By default, the system displays floats in either fixed format or
scientific format, depending on the magnitude of the number.


.. spadInput
::

	y := x/10^10


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| 0.44721359549995793928E -10   |
+-------------------------------+




.. spadType

:sub:`Type: Float`



A particular format may be requested with the operations
outputFloatingoutputFloatingFloat and outputFixedoutputFixedFloat.


.. spadInput
::

	outputFloating(); x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| 0.44721359549995793928E 0   |
+-----------------------------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	outputFixed(); y


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| 0.000000000044721359549995793928   |
+------------------------------------+




.. spadType

:sub:`Type: Float`



Additionally, you can ask for n digits to be displayed after the decimal
point.


.. spadInput
::

	outputFloating 2; y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 0.45E -10   |
+-------------+




.. spadType

:sub:`Type: Float`




.. spadInput
::

	outputFixed 2; x


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 0.45   |
+--------+




.. spadType

:sub:`Type: Float`



This resets the output printing to the default behavior.


.. spadInput
::

	outputGeneral()


.. spadMathAnswer
.. spadType

:sub:`Type: Void`







9.27.4 An Example: Determinant of a Hilbert Matrix
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Consider the problem of computing the determinant of a 10 by 10 Hilbert
matrix. The (i,j)-th entry of a Hilbert matrix is given by 1/(i+j+1).

First do the computation using rational numbers to obtain the exact
result.


.. spadInput
::

	a: Matrix Fraction Integer := matrix [ [1/(i+j+1) for j in 0..9] for i
in 0..9]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [11213141516171819110121314151617181911011113141516171819110111112141516171819110111112113151617181911011111211311416171819110111112113114115171819110111112113114115116181911011111211311411511611719110111112113114115116117118110111112113114115116117118119]   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Matrix Fraction Integer`



This version of determinantdeterminantMatrix uses Gaussian elimination.


.. spadInput
::

	d:= determinant a


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------+
| 146206893947914691316295628839036278726983680000000000   |
+----------------------------------------------------------+




.. spadType

:sub:`Type: Fraction Integer`




.. spadInput
::

	d :: Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| 0.21641792264314918691E -52   |
+-------------------------------+




.. spadType

:sub:`Type: Float`



Now use hardware floats. Note that a semicolon (;) is used to prevent
the display of the matrix.


.. spadInput
::

	b: Matrix DoubleFloat := matrix [ [1/(i+j+1$DoubleFloat) for j in 0..9]
for i in 0..9];


.. spadMathAnswer
.. spadType

:sub:`Type: Matrix DoubleFloat`



The result given by hardware floats is correct only to four significant
digits of precision. In the jargon of numerical analysis, the Hilbert
matrix is said to be ill-conditioned.


.. spadInput
::

	determinant b


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| 2.1643677945721411e-53   |
+--------------------------+




.. spadType

:sub:`Type: DoubleFloat`



Now repeat the computation at a higher precision using Float.


.. spadInput
::

	digits 40


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 20   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	c: Matrix Float := matrix [ [1/(i+j+1$Float) for j in 0..9] for i in
0..9];


.. spadMathAnswer
.. spadType

:sub:`Type: Matrix Float`




.. spadInput
::

	determinant c


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| 0.2164179226431491869060594983622617436159E -52   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Float`



Reset digitsdigitsFloat to its default value.


.. spadInput
::

	digits 20


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 40   |
+------+




.. spadType

:sub:`Type: PositiveInteger`







