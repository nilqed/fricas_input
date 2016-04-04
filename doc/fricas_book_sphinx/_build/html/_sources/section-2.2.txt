.. status: ok


2.2 Writing Types and Modes
---------------------------

We have already seen in the last section
`ugTypesBasic <section-2.1.html#ugTypesBasic>`__ several examples of
types. Most of these examples had either no arguments (for example,
Integer) or one argument (for example, Polynomial (Integer)). In this
section we give details about writing arbitrary types. We then define
modes and discuss how to write them. We conclude the section with a
discussion on constructor abbreviations.

When might you need to write a type or mode? You need to do so when you
declare variables.


.. spadInput
::

	a : PositiveInteger


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



You need to do so when you declare functions (See Section
`ugTypesDeclare <section-2.3.html#ugTypesDeclare>`__ ),


.. spadInput
::

	f : Integer -> String


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



You need to do so when you convert an object from one type to another
(See Section `ugTypesConvert <section-2.7.html#ugTypesConvert>`__ ).


.. spadInput
::

	factor(2 :: Complex(Integer))


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{i \  {{{\left( 1+i
    \right)}} ^ {2}}}


.. spadType
:sub:`Type: Factored Complex Integer`




.. spadInput
::

	(2 = 3) $Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{false}

.. spadType
:sub:`Type: Boolean`



You need to do so when you give computation target type information (See
Section `ugTypesPkgCall <section-2.9.html#ugTypesPkgCall>`__ ).


.. spadInput
::

	(2 = 3)@Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{false}

.. spadType
:sub:`Type: Boolean`


2.2.1 Types with No Arguments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A constructor with no arguments can be written either with or without 
parentheses:using with types trailing opening and closing parentheses ``()``.



|  Boolean() is the same as Boolean
|  Integer() is the same as Integer
|  String() is the same as String
|  Void() is the same as Void



It is customary to omit the parentheses.



2.2.2 Types with One Argument
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A constructor with one argument can frequently be type:using parentheses
written with no parentheses:using with types parentheses. Types nest
from right to left so that Complex Fraction Polynomial Integer is the
same as Complex (Fraction (Polynomial (Integer))). You need to use
parentheses to force the application of a constructor to the correct
argument, but you need not use any more than is necessary to remove
ambiguities.

Here are some guidelines for using parentheses (they are possibly
slightly more restrictive than they need to be).

If the argument is an expression like 2+3 then you must enclose the
argument in parentheses.


.. spadInput
::

	e : PrimeField(2 + 3)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



If the type is to be used with *package calling* then you must enclose the
argument in parentheses.


.. spadInput
::

	content(2) $Polynomial(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

  2

.. spadType
:sub:`Type: Integer`



Alternatively, you can write the type without parentheses then enclose
the whole type expression with parentheses.


.. spadInput
::

	content(2) $(Polynomial Complex Fraction Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

  2

.. spadType
:sub:`Type: Complex Fraction Integer`



If you supply computation target type information (See Section
`ugTypesPkgCall <section-2.9.html#ugTypesPkgCall>`__ ) then you should
enclose the argument in parentheses.


.. spadInput
::

	(2/3)@Fraction(Polynomial(Integer))


.. spadMathAnswer
.. spadMathOutput
.. math::

  2 \over 3

.. spadType
:sub:`Type: Fraction Polynomial Integer`



If the type itself has parentheses around it and we are not in the case
of the first example above, then the parentheses can usually be omitted.


.. spadInput
::

	(2/3)@Fraction(Polynomial Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

  2 \over 3

.. spadType
:sub:`Type: Fraction Polynomial Integer`



If the type is used in a declaration and the argument is a single-word
type, integer or symbol, then the parentheses can usually be omitted.


.. spadInput
::

	(d,f,g) : Complex Polynomial Integer


.. spadMathAnswer
.. spadType
:sub:`Type: Void`



2.2.3 Types with More Than One Argument
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If a constructor type:using parentheses has more than parentheses:using
with types one argument, you must use parentheses. Some examples are


|  UnivariatePolynomial(x, Float)
|  MultivariatePolynomial([z,w,r], Complex Float)
|  SquareMatrix(3, Integer)
|  FactoredFunctions2(Integer,Fraction Integer)



2.2.4 Modes
~~~~~~~~~~~

A mode is a type that possibly is a question mark ``(?)`` or contains one
in an argument position. For example, the following are all modes.

|  ?
|  Polynomial ?
|  Matrix Polynomial ?
|  SquareMatrix(3,?)
|  Integer
|  OneDimensionalArray(Float)

As is evident from these examples, a mode is a type with a part that is
not specified (indicated by a question mark). Only one ? is allowed per
mode and it must appear in the most deeply nested argument that is a
type. Thus ?(Integer), Matrix(? (Polynomial)), SquareMatrix(?, Integer)
(it requires a numeric argument) and SquareMatrix(?, ?) are all invalid.
The question mark must take the place of a domain, not data. This rules
out, for example, the two SquareMatrix expressions.

Modes can be used for declarations (See Section
`ugTypesDeclare <section-2.3.html#ugTypesDeclare>`__ ) and conversions
(Section `ugTypesConvert <section-2.7.html#ugTypesConvert>`__ ).
However, you cannot use a mode for package calling or giving target type
information.





2.2.5 Abbreviations
~~~~~~~~~~~~~~~~~~~

Every constructor has an abbreviation that abbreviation:constructor you
can freely constructor:abbreviation substitute for the constructor name.
In some cases, the abbreviation is nothing more than the capitalized
version of the constructor name.



Aside from allowing types to be written more concisely, abbreviations
are used by FriCAS to name various system files for constructors (such
as library filenames, test input files and example files). Here are some
common abbreviations.



+----------------------------------+---------------------------------------+
| COMPLEX abbreviates Complex      | DFLOAT abbreviates DoubleFloat        |
+----------------------------------+---------------------------------------+
| EXPR abbreviates Expression      | FLOAT abbreviates Float               |
+----------------------------------+---------------------------------------+
| FRAC abbreviates Fraction        | INT abbreviates Integer               |
+----------------------------------+---------------------------------------+
| MATRIX abbreviates Matrix        | NNI abbreviates NonNegativeInteger    |
+----------------------------------+---------------------------------------+
| PI abbreviates PositiveInteger   | POLY abbreviates Polynomial           |
+----------------------------------+---------------------------------------+
| STRING abbreviates String        | UP abbreviates UnivariatePolynomial   |
+----------------------------------+---------------------------------------+


You can combine both full constructor names and abbreviations in a type
expression. Here are some types using abbreviations.



+----------------------+------------------+----------------------------+
| POLY INT             | is the same as   | Polynomial(INT)            |
+----------------------+------------------+----------------------------+
| POLY(Integer)        | is the same as   | Polynomial(Integer)        |
+----------------------+------------------+----------------------------+
| POLY(Integer)        | is the same as   | Polynomial(INT)            |
+----------------------+------------------+----------------------------+
| FRAC(COMPLEX(INT))   | is the same as   | Fraction Complex Integer   |
+----------------------+------------------+----------------------------+
| FRAC(COMPLEX(INT))   | is the same as   | FRAC(Complex Integer)      |
+----------------------+------------------+----------------------------+


There are several ways of finding the names of constructors and their
abbreviations. For a specific constructor, use ``)abbreviation`` query.
abbreviation You can also use the ``)what`` system command to see the names
and abbreviations of constructors. what For more information about
``)what``, see `ugSysCmdwhat <ugSysCmdwhat>`__ .

``)abbreviation query`` can be abbreviated (no pun intended) to ``)abb q``.


.. spadInput
::

	)abb q Integer


.. spadMathAnswer
.. spadVerbatim

::

    INT abbreviates domain Integer 



The )abbreviation query command lists the constructor name if you give
the abbreviation. Issue )abb q if you want to see the names and
abbreviations of all FriCAS constructors.


.. spadInput
::

	)abb q DMP


.. spadMathAnswer
.. spadVerbatim

::

    DMP abbreviates domain DistributedMultivariatePolynomial 



Issue this to see all packages whose names contain the string ode. what
packages


.. spadInput
::

	)what packages ode


.. spadMathAnswer
.. spadVerbatim

::

 ---------------------- Packages -----------------------
 Packages with names matching patterns:
      ode 
  EXPRODE  ExpressionSpaceODESolver     
  FCPAK1   FortranCodePackage1
  GRAY     GrayCode                     
  LODEEF   ElementaryFunctionLODESolver
  NODE1    NonLinearFirstOrderODESolver 
  ODECONST ConstantLODE
  ODEEF    ElementaryFunctionODESolver  
  ODEINT   ODEIntegration
  ODEPAL   PureAlgebraicLODE            
  ODERAT   RationalLODE
  ODERED   ReduceLODE                   
  ODESYS   SystemODESolver
  ODETOOLS ODETools
  UTSODE   UnivariateTaylorSeriesODESolver
  UTSODETL UTSodetools

