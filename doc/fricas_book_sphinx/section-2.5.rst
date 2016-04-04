.. status: ok


2.5 Unions
----------

Type ``Union`` is used for objects that can be of any of a specific finite
set of types. Union Two versions of unions are available, one with
selectors (like records) and one without. union



2.5.1 Unions Without Selectors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The declaration x:Union(Integer,String,Float) states that x can have
values that are integers, strings or big floats. If, for example, the
Union object is an integer, the object is said to belong to the Integer
branch of the Union. Note that we are being a bit careless with the
language here. Technically, the type of x is always Union(Integer,
String, Float). If it belongs to the Integer branch, x may be converted
to an object of type Integer.

The syntax for writing a Union type without selectors is

::
    
   Union(type1, type2, ..., typeN)

The types in a union without selectors must be distinct.


It is possible to create unions like ``Union(Integer, PositiveInteger)`` but
they are difficult to work with because of the overlap in the branch
types. See below for the rules FriCAS uses for converting something into
a union object.

The case infix operator returns a Boolean and can be used to
determine the branch in which an object lies.

This function displays a message stating in which branch of the Union
the object (defined as x above) lies.


.. spadVerbatim

::

 sayBranch(x : Union(Integer,String,Float)) : Void  ==
   output
     x case Integer => "Integer branch"
     x case String  => "String branch"
     "Float branch"



This tries sayBranch with an integer.


.. spadInput
::

	sayBranch 1


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function sayBranch with type Union(Integer,String,Float)
     -> Void 
  Integer branch

.. spadType
:sub:`Type: Void`



This tries sayBranch with a string.


.. spadInput
::
    
	sayBranch "hello"

.. spadMathAnswer
.. spadVerbatim

::

    String branch

.. spadType
:sub:`Type: Void`



This tries sayBranch with a floating-point number.


.. spadInput
::

	sayBranch 2.718281828


.. spadMathAnswer
.. spadVerbatim

::

    Float branch

.. spadType
:sub:`Type: Void`



There are two things of interest about this particular example to which
we would like to draw your attention.

1. FriCAS normally converts a result to the target value before passing
   it to the function. If we left the declaration information out of
   this function definition then the sayBranch call would have been
   attempted with an Integer rather than a Union, and an error would
   have resulted.
2. The types in a Union are searched in the order given. So if the type
   were given as sayBranch(x: Union(String,Integer,Float,Any)): Void
   then the result would have been String branch because there is a
   conversion from Integer to String.

Sometimes Union types can have extremely long names. FriCAS therefore
abbreviates the names of unions by printing the type of the branch first
within the Union and then eliding the remaining types with an ellipsis
``(...)``.

Here the Integer branch is displayed first. Use ``::`` to create a
Union object from an object.


.. spadInput
::

	78 :: Union(Integer,String)


.. spadMathAnswer
.. spadMathOutput
.. math::

  78

.. spadType
:sub:`Type: Union(Integer,...)`



Here the String branch is displayed first.


.. spadInput
::

	s := "string" :: Union(Integer,String)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{"string"} 

.. spadType
:sub:`Type: Union(String,...)`



Use typeOf to see the full and actual Union type. typeOf


.. spadInput
::

	typeOf s


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{Union(Integer,String)}

.. spadType
:sub:`Type: Domain`



A common operation that returns a union is exquoexquoInteger which
returns the exact quotient if the quotient is exact,


.. spadInput
::

	three := exquo(6,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: Union(Integer,...)`



and "failed" if the quotient is not exact.


.. spadInput
::

	exquo(5,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

   \mathrm{"failed"}   

.. spadType
:sub:`Type: Union("failed",...)`


A union with a "failed" is frequently used to indicate the failure or
lack of applicability of an object. As another example, assign an
integer a variable r declared to be a rational number.


.. spadInput
::

	r: FRAC INT := 3


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: Fraction Integer`


The operation ``retractIfCan`` tries to retract the
fraction to the underlying domain Integer. It produces a union object.
Here it succeeds.


.. spadInput
::

	retractIfCan(r)


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: Union(Integer,...)`



Assign it a rational number.


.. spadInput
::

	r := 3/2


.. spadMathAnswer
.. spadMathOutput
.. math::

  32

.. spadType
:sub:`Type: Fraction Integer`



Here the retraction fails.


.. spadInput
::

	retractIfCan(r)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{"failed"}

.. spadType
:sub:`Type: Union("failed",...)`


2.5.2 Unions With Selectors
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Like records (`ugTypesRecords <section-2.4.html#ugTypesRecords>`__ ),
you can write Union types selector:union with selectors. union:selector


The syntax for writing a Union type with selectors is

::

    Union(selector1:type1, selector2:type2, ..., selectorN:typeN)

You must be careful if a selector has the same name as a variable in
the workspace. If this occurs, precede the selector name by a single
quote quote. selector:quoting It is an error to use a selector that does
not correspond to the branch of the Union in which the element actually
lies.

Be sure to understand the difference between records and unions with
selectors. union:difference from record Records can have more than one
component and the selectors are used to refer to the components.
record:difference from union Unions always have one component but the
type of that one component can vary. An object of type Record(a:
Integer, b: Float, c: String) contains an integer and a float and a
string. An object of type Union(a: Integer, b: Float, c: String)
contains an integer or a float or a string.

Here is a version of the sayBranch function (cf.
`ugTypesUnionsWOSel <section-2.5.html#ugTypesUnionsWOSel>`__ ) that
works with a union with selectors. It displays a message stating in
which branch of the Union the object lies.


.. spadVerbatim

::

 sayBranch(x:Union(i:Integer,s:String,f:Float)):Void==
   output
     x case i => "Integer branch"
     x case s  => "String branch"
     "Float branch"



Note that case uses the selector name as its right-hand argument. case
If you accidentally use the branch type on the right-hand side of case,
false will be returned.

Declare variable u to have a union type with selectors.


.. spadInput
::

	u : Union(i : Integer, s : String)


.. spadMathAnswer
.. spadType
:sub:`Type: Void`


Give an initial value to u.


.. spadInput
::

	u := "good morning"


.. spadMathAnswer
.. spadMathOutput
.. math::

   \mathrm{"goodmorning"}  

.. spadType
:sub:`Type: Union(s: String,...)`



Use case to determine in which branch of a Union an object lies.


.. spadInput
::

	u case i


.. spadMathAnswer
.. spadMathOutput
.. math::

   \mathrm{false}

.. spadType
:sub:`Type: Boolean`




.. spadInput
::

	u case s


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{true}

.. spadType
:sub:`Type: Boolean`


To access the element in a particular branch, use the selector.


.. spadInput
::

	u.s


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{"goodmorning"}

.. spadType
:sub:`Type: String`







