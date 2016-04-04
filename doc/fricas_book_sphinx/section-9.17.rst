.. status: ok


9.17 DoubleFloat
----------------

FriCAS provides two kinds of floating point numbers. The domain Float
(abbreviation FLOAT) implements a model of arbitrary precision floating
point numbers. The domain DoubleFloat (abbreviation DFLOAT) is intended
to make available hardware floating point arithmetic in FriCAS. The
actual model of floating point DoubleFloat that provides is
system-dependent. For example, on the IBM system 370 FriCAS uses IBM
double precision which has fourteen hexadecimal digits of precision or
roughly sixteen decimal digits. Arbitrary precision floats allow the
user to specify the precision at which arithmetic operations are
computed. Although this is an attractive facility, it comes at a cost.
Arbitrary-precision floating-point arithmetic typically takes twenty to
two hundred times more time than hardware floating point.

The usual arithmetic and elementary functions are available for
DoubleFloat. Use )show DoubleFloat to get a list of operations or the
HyperDoc browse facility to get more extensive documentation about
DoubleFloat.

By default, floating point numbers that you enter into FriCAS are of
type Float.


.. spadInput
::

	2.71828


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2.71828   |
+-----------+




.. spadType

:sub:`Type: Float`



You must therefore tell FriCAS that you want to use DoubleFloat values
and operations. The following are some conservative guidelines for
getting FriCAS to use DoubleFloat.

To get a value of type DoubleFloat, use a target with @, ...


.. spadInput
::

	2.71828@DoubleFloat


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2.71828   |
+-----------+




.. spadType

:sub:`Type: DoubleFloat`



a conversion, ...


.. spadInput
::

	2.71828 :: DoubleFloat


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2.71828   |
+-----------+




.. spadType

:sub:`Type: DoubleFloat`



or an assignment to a declared variable. It is more efficient if you use
a target rather than an explicit or implicit conversion.


.. spadInput
::

	eApprox : DoubleFloat := 2.71828


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2.71828   |
+-----------+




.. spadType

:sub:`Type: DoubleFloat`



You also need to declare functions that work with DoubleFloat.


.. spadInput
::

	avg : List DoubleFloat -> DoubleFloat


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadVerbatim

::

 avg l ==
   empty? l => 0 :: DoubleFloat
   reduce(_+,l) / #l




.. spadType

:sub:`Type: Void`




.. spadInput
::

	avg []


.. spadMathAnswer
this complains but succeeds


.. spadInput
::

	avg [3.4,9.7,-6.8]


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function avg with type List Float -> DoubleFloat 




.. spadMathOutput
.. math::

+-------+
| 2.1   |
+-------+




.. spadType

:sub:`Type: DoubleFloat`



Use package-calling for operations from DoubleFloat unless the arguments
themselves are already of type DoubleFloat.


.. spadInput
::

	cos(3.1415926)$DoubleFloat


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| -0.999999999999999   |
+----------------------+




.. spadType

:sub:`Type: DoubleFloat`




.. spadInput
::

	cos(3.1415926 :: DoubleFloat)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| -0.999999999999999   |
+----------------------+




.. spadType

:sub:`Type: DoubleFloat`



By far, the most common usage of DoubleFloat is for functions to be
graphed. For more information about FriCAS's numerical and graphical
facilities, see Section `ugGraph <section-7.0.html#ugGraph>`__ ,
`ugProblemNumeric <section-8.1.html#ugProblemNumeric>`__ , and
`FloatXmpPage <section-9.17.html#DoubleFloatXmpPage>`__ .



