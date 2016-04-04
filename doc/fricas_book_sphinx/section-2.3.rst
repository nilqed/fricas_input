.. status: ok


2.3 Declarations
----------------

A declaration is an expression used to restrict the type of values that
can be assigned to variables. A colon ``:`` is always used after a
variable or list of variables to be declared.


For a single variable, the syntax for declaration is

::
    
    variableName : typeOrMode



For multiple variables, the syntax is

::

    (, , ... ): typeOrMode


You can always combine a declaration with an assignment. When you do, it
is equivalent to first giving a declaration statement, then giving an
assignment. For more information on assignment, see Section
`ugIntroAssign <section-1.3.html#ugIntroAssign>`__ and Section
`ugLangAssign <section-5.1.html#ugLangAssign>`__ . To see how to
declare your own functions, see
`ugUserDeclare <section-6.4.html#ugUserDeclare>`__ .

This declares one variable to have a type.


.. spadInput
::

	a : Integer


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



This declares several variables to have a type.


.. spadInput
::

	(b,c) : Integer


.. spadMathAnswer
.. spadType
:sub:`Type: Void`


a , b and c can only hold integer values.


.. spadInput
::

	a := 45

.. spadMathAnswer
.. spadMathOutput
.. math::
  
  45

.. spadType
:sub:`Type: Integer`



If a value cannot be converted to a declared type, an error message is
displayed.


.. spadInput
::

	b := 4/5

.. spadMathAnswer
.. spadVerbatim

.. warn::

  
    Cannot convert right-hand side of assignment
    4
    -
    5
       to an object of the type Integer of the left-hand side.



This declares a variable with a mode.


.. spadInput
::

	n : Complex ?


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



This declares several variables with a mode.


.. spadInput
::

	(p,q,r) : Matrix Polynomial ?


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



This complex object has integer real and imaginary parts.


.. spadInput
::

	n := -36 + 9 * %i


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{36}+{9 \  i}

.. spadType
:sub:`Type: Complex Integer`


This complex object has fractional symbolic real and imaginary parts.


.. spadInput
::

	n := complex(4/(x + y),y/x)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {4 \over {y+x}}+{{y \over x} \  i}

.. spadType
:sub:`Type: Complex Fraction Polynomial Integer`



This matrix has entries that are polynomials with integer coefficients.


.. spadInput
::

	p := [ [1,2],[3,4],[5,6] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

   \left[{\left[ 1, \: 2 \right]}, \: {\left[ 3, \: 4
   \right]},\: {\left[ 5, \: 6 \right]} \right]

.. spadType
:sub:`Type: Matrix Polynomial Integer`



This matrix has a single entry that is a polynomial with rational number
coefficients.


.. spadInput
::

	q := [ [x - 2/3] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

   \left[ {\left[ {x -{2 \over 3}} \right]} \right]

.. spadType
:sub:`Type: Matrix Polynomial Fraction Integer`



This matrix has entries that are polynomials with complex integer
coefficients.


.. spadInput
::

	r := [ [1-%i*x,7*y+4*%i] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

   \left[ {\left[ {-{i \  x}+1}, \: {{7 \  y}+{4 \  i}} \right]} \right]

.. spadType
:sub:`Type: Matrix Polynomial Complex Integer`



Note the difference between this and the next example. This is a complex
object with polynomial real and imaginary parts.


.. spadInput
::

	f : COMPLEX POLY ? := (x + y*%i)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{y} ^ {2}}+{{x} ^ {2}}+{2 \  x \  y \  i}

.. spadType
:sub:`Type: Complex Polynomial Integer`



This is a polynomial with complex integer coefficients. The objects are
convertible from one to the other. See
`ugTypesConvert <section-2.7.html#ugTypesConvert>`__ for more
information.


.. spadInput
::

	g : POLY COMPLEX ? := (x + y*%i)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{y} ^ {2}}+{2 \  i \  x \  y}+{{x} ^ {2}}


.. spadType
:sub:`Type: Polynomial Complex Integer`
