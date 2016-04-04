.. status: ok


2.7 Conversion
--------------

Conversion is the process of changing an object of one type into an
object of another type. The syntax for conversion is: object::newType


By default, 3 has the type PositiveInteger.


.. spadInput
::

	3


.. spadMathAnswer
.. spadMathOutput
.. math::

  3
  
.. spadType
:sub:`Type: PositiveInteger`



We can change this into an object of type Fraction Integer by using
``::``.


.. spadInput
::

	3 :: Fraction Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: Fraction Integer`



A *coercion* is a special kind of conversion that FriCAS is allowed to do
automatically when you enter an expression. Coercions are usually
somewhat safer than more general conversions. The FriCAS library
contains operations called coerce and convert. Only the coerce
operations can be used by the interpreter to change an object into an
object of another type unless you explicitly use a ``::``.

By now you will be quite familiar with what types and modes look like.
It is useful to think of a type or mode as a pattern for what you want
the result to be.

Let's start with a square matrix of polynomials with complex rational
number coefficients. SquareMatrix


.. spadInput
::

	m : SquareMatrix(2,POLY COMPLEX FRAC INT)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`




.. spadInput
::

	m := matrix [ [x-3/4*%i,z*y^2+1/2],[3/7*%i*y^4 - x,12-%i*9/5] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {x -{{3 \over 4} \  i}} & {{{{y} ^ {2}} \  z}+{1 \over 2}} \\
  {{{3 \over 7} \  i \  {{y} ^ {4}}} -x} & {{12} -{{9 \over 5} \  i}}
  \end{array}
  \right]

.. spadType
:sub:`Type: SquareMatrix(2,Polynomial Complex Fraction Integer)`



We first want to interchange the Complex and Fraction layers. We do the
conversion by doing the interchange in the type expression.


.. spadInput
::

	m1 := m :: SquareMatrix(2,POLY FRAC COMPLEX INT)


.. spadMathAnswer
.. spadMathOutput
.. math::
 
  \left[
  \begin{array}{cc}
  {x -{{3 \  i} \over 4}} & {{{{y} ^ {2}} \  z}+{1 \over 2}} \\
  {{{{3 \  i} \over 7} \  {{y} ^ {4}}} -x} & {{{60} -{9 \  i}} \over 5}
  \end{array}
  \right]
 
.. spadType
:sub:`Type: SquareMatrix(2,Polynomial Fraction Complex Integer)`



Interchange the Polynomial and the Fraction levels.


.. spadInput
::

	m2 := m1 :: SquareMatrix(2,FRAC POLY COMPLEX INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {{{4 \  x} -{3 \  i}} \over 4} & {{{2 \  {{y} ^ {2}} \  z}+1} \over 2} \\
  {{{3 \  i \  {{y} ^ {4}}} -{7 \  x}} \over 7} & {{{60} -{9 \  i}} \over 5}
  \end{array}
  \right]

.. spadType
:sub:`Type: SquareMatrix(2,Fraction Polynomial Complex Integer)`



Interchange the Polynomial and the Complex levels.


.. spadInput
::

	m3 := m2 :: SquareMatrix(2,FRAC COMPLEX POLY INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {{{4 \  x} -{3 \  i}} \over 4} & {{{2 \  {{y} ^ {2}} \  z}+1} \over 2} \\
  {{-{7 \  x}+{3 \  {{y} ^ {4}} \  i}} \over 7} & {{{60} -{9 \  i}} \over 5}
  \end{array}
  \right]

.. spadType
:sub:`Type: SquareMatrix(2,Fraction Complex Polynomial Integer)`



All the entries have changed types, although in comparing the last two
results only the entry in the lower left corner looks different. We did
all the intermediate steps to show you what FriCAS can do.

In fact, we could have combined all these into one conversion.


.. spadInput
::

	m :: SquareMatrix(2,FRAC COMPLEX POLY INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {{{4 \  x} -{3 \  i}} \over 4} & {{{2 \  {{y} ^ {2}} \  z}+1} \over 2} \\
  {{-{7 \  x}+{3 \  {{y} ^ {4}} \  i}} \over 7} & {{{60} -{9 \  i}} \over 5}
  \end{array}
  \right]

.. spadType
:sub:`Type: SquareMatrix(2,Fraction Complex Polynomial Integer)`



There are times when FriCAS is not be able to do the conversion in one
step. You may need to break up the transformation into several
conversions in order to get an object of the desired type.

We cannot move either Fraction or Complex above (or to the left of,
depending on how you look at it) SquareMatrix because each of these
levels requires that its argument type have commutative multiplication,
whereas SquareMatrix does not. That is because Fraction requires that
its argument belong to the category IntegralDomain and category Complex
requires that its argument belong to CommutativeRing. See
`ugTypesBasic <section-2.1.html#ugTypesBasic>`__ for a brief discussion
of categories. The Integer level did not move anywhere because it does
not allow any arguments. We also did not move the SquareMatrix part
anywhere, but we could have.

Recall that m looks like this.


.. spadInput
::

	m


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left[
  \begin{array}{cc}
  {x -{{3 \over 4} \  i}} & {{{{y} ^ {2}} \  z}+{1 \over 2}} \\
  {{{3 \over 7} \  i \  {{y} ^ {4}}} -x} & {{12} -{{9 \over 5} \  i}}
  \end{array}
  \right]

.. spadType
:sub:`Type: SquareMatrix(2,Polynomial Complex Fraction Integer)`



If we want a polynomial with matrix coefficients rather than a matrix
with polynomial entries, we can just do the conversion.


.. spadInput
::

	m :: POLY SquareMatrix(2,COMPLEX FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{\left[
  \begin{array}{cc}
  0 & 1 \\
  0 & 0
  \end{array}
  \right]}
  \  {{y} ^ {2}} \  z}+{{\left[
  \begin{array}{cc}
  0 & 0 \\
  {{3 \over 7} \  i} & 0
  \end{array}
  \right]}
  \  {{y} ^ {4}}}+{{\left[
  \begin{array}{cc}
  1 & 0 \\
  -1 & 0
  \end{array}
  \right]}
  \  x}+{\left[
  \begin{array}{cc}
  -{{3 \over 4} \  i} & {1 \over 2} \\
  0 & {{12} -{{9 \over 5} \  i}}
  \end{array}
  \right]}


.. spadType
:sub:`Type: Polynomial SquareMatrix(2,Complex Fraction Integer)`



We have not yet used modes for any conversions. Modes are a great
shorthand for indicating the type of the object you want. Instead of
using the long type expression in the last example, we could have simply
said this.


.. spadInput
::

	m :: POLY ?


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{\left[
  \begin{array}{cc}
  0 & 1 \\
  0 & 0
  \end{array}
  \right]}
  \  {{y} ^ {2}} \  z}+{{\left[
  \begin{array}{cc}
  0 & 0 \\
  {{3 \over 7} \  i} & 0
  \end{array}
  \right]}
  \  {{y} ^ {4}}}+{{\left[
  \begin{array}{cc}
  1 & 0 \\
  -1 & 0
  \end{array}
  \right]}
  \  x}+{\left[
  \begin{array}{cc}
  -{{3 \over 4} \  i} & {1 \over 2} \\
  0 & {{12} -{{9 \over 5} \  i}}
  \end{array}
  \right]}


.. spadType
:sub:`Type: Polynomial SquareMatrix(2,Complex Fraction Integer)`



We can also indicate more structure if we want the entries of the
matrices to be fractions.


.. spadInput
::

	m :: POLY SquareMatrix(2,FRAC ?)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{\left[
  \begin{array}{cc}
  0 & 1 \\
  0 & 0
  \end{array}
  \right]}
  \  {{y} ^ {2}} \  z}+{{\left[
  \begin{array}{cc}
  0 & 0 \\
  {{3 \  i} \over 7} & 0
  \end{array}
  \right]}
  \  {{y} ^ {4}}}+{{\left[
  \begin{array}{cc}
  1 & 0 \\
  -1 & 0
  \end{array}
  \right]}
  \  x}+{\left[
  \begin{array}{cc}
  -{{3 \  i} \over 4} & {1 \over 2} \\
  0 & {{{60} -{9 \  i}} \over 5}
  \end{array}
  \right]}

.. spadType
:sub:`Type: Polynomial SquareMatrix(2,Fraction Complex Integer)`
