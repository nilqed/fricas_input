.. status: ok


2.1 The Basic Idea
------------------

The FriCAS world deals with many kinds of objects. There are
mathematical objects such as numbers and polynomials, data structure
objects such as lists and arrays, and graphics objects such as points
and graphic images. Functions are objects too.

FriCAS organizes objects using the notion of domain of computation, or
simply *domain*. Each domain denotes a class of objects. The class of
objects it denotes is usually given by the name of the domain: ``Integer``
for the integers, ``Float`` for floating-point numbers, and so on. The
convention is that the first letter of a domain name is capitalized.
Similarly, the domain ``Polynomial(Integer)`` denotes polynomials with
integer coefficients. Also, ``Matrix(Float)`` denotes matrices with
floating-point entries.

Every basic FriCAS object belongs to a **unique** domain. The integer 3
belongs to the domain Integer and the polynomial x+3 belongs to the
domain Polynomial(Integer). The domain of an object is also called its
*type*. Thus we speak of the type Integer and the type
Polynomial(Integer).

After an FriCAS computation, the type is displayed toward the right-hand
side of the page (or screen).


.. spadInput
::

	-3


.. spadMathAnswer
.. spadMathOutput
.. math::
  -3

.. spadType
:sub:`Type: Integer`



Here we create a rational number but it looks like the last result. The
type however tells you it is different. You cannot identify the type of
an object by how FriCAS displays the object.


.. spadInput
::

	-3/1


.. spadMathAnswer
.. spadMathOutput
.. math::

 -3

.. spadType
:sub:`Type: Fraction Integer`



When a computation produces a result of a simpler type, FriCAS leaves
the type unsimplified. Thus no information is lost.


.. spadInput
::

	x + 3 - x

.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: Polynomial Integer`



This seldom matters since FriCAS retracts the answer to the simpler type
if it is necessary.


.. spadInput
::

	factorial(%)


.. spadMathAnswer
.. spadMathOutput
.. math::

  6

.. spadType
:sub:`Type: Expression Integer`



When you issue a positive number, the type ``PositiveInteger`` is printed.
Surely, 3 also has type Integer! The curious reader may now have two
questions. First, is the type of an object not unique? Second, how is
PositiveInteger related to Integer?


.. spadInput
::

	3


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: PositiveInteger`



Any domain can be refined to a subdomain by a membership predicate. A
predicate is a function that, when applied to an object of the domain,
returns either true or false. For example, the domain Integer can be
refined to the subdomain PositiveInteger, the set of integers x such
that x>0, by giving the FriCAS predicate ``x+->x>0``. Similarly, FriCAS can
define subdomains such as the subdomain of diagonal matrices, the
subdomain of lists of length two, the subdomain of monic irreducible
polynomials in x, and so on. Trivially, any domain is a subdomain of
itself.

While an object belongs to a unique domain, it can belong to any number
of subdomains. Any subdomain of the domain of an object can be used as
the type of that object. The type of 3 is indeed both Integer and
PositiveInteger as well as any other subdomain of integer whose
predicate is satisfied, such as the prime integers, the odd positive
integers between 3 and 17, and so on.



2.1.1 Domain Constructors
~~~~~~~~~~~~~~~~~~~~~~~~~

In FriCAS, domains are objects. You can create them, pass them to
functions, and, as we'll see later, test them for certain properties.

In FriCAS, you ask for a value of a function by applying its name to a
set of arguments.

To ask for the factorial of 7 you enter this expression to FriCAS. This
applies the function factorial to the value 7 to compute the result.


.. spadInput
::

	factorial(7)


.. spadMathAnswer
.. spadMathOutput
.. math::

  5040

.. spadType
:sub:`Type: PositiveInteger`



Enter the type Polynomial (Integer) as an expression to FriCAS. This
looks much like a function call as well. It is! The result is
appropriately stated to be of type Domain, which according to our usual
convention, denotes the class of all domains.


.. spadInput
::

	Polynomial(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{Polynomial(Integer)}

.. spadType
:sub:`Type: Domain`



The most basic operation involving domains is that of building a new
domain from a given one. To create the domain of polynomials over the
integers, FriCAS applies the function ``Polynomial`` to the domain Integer.
A function like Polynomial is called a domain constructor or,
constructor:domain more simply, a constructor. A domain constructor is a
function that creates a domain. An argument to a domain constructor can
be another domain or, in general, an arbitrary kind of object.
Polynomial takes a single domain argument while SquareMatrix takes a
positive integer as an argument to give its dimension and a domain
argument to give the type of its components.

What kinds of domains can you use as the argument to Polynomial or
SquareMatrix or List? Well, the first two are mathematical in nature.
You want to be able to perform algebraic operations like ``+`` and *
on polynomials and square matrices, and operations such as determinant
on square matrices. So you want to allow polynomials of integers and
polynomials of square matrices with complex number coefficients and, in
general, anything that makes sense. At the same time, you don't want
FriCAS to be able to build nonsense domains such as ``polynomials of
strings!``

In contrast to algebraic structures, data structures can hold any kind
of object. Operations on lists such as insertinsertList,
deletedeleteList, and concatconcatList just manipulate the list itself
without changing or operating on its elements. Thus you can build List
over almost any datatype, including itself.

Create a complicated algebraic domain.


.. spadInput
::

	List (List (Matrix (Polynomial (Complex (Fraction (Integer))))))


.. spadMathAnswer
.. spadMathOutput
.. math::

 \mathrm{List(List(Matrix(Polynomial(Complex(Fraction(Integer))))))}

.. spadType
:sub:`Type: Domain`



Try to create a meaningless domain.


.. spadInput
::

	Polynomial(String)


.. spadMathAnswer
.. spadVerbatim

.. warn::

    Polynomial String is not a valid type.


Evidently from our last example, FriCAS has some mechanism that tells
what a constructor can use as an argument. This brings us to the notion
of *category*. As domains are objects, they too have a domain. The domain
of a domain is a category. A category is simply a type whose members are
domains.

A common algebraic category is ``Ring``, the class of all domains that are
rings. A ring is an algebraic structure with constants 0 and 1 and
operations ``+, -``, and ``*``. These operations are assumed closed with
respect to the domain, meaning that they take two objects of the domain
and produce a result object also in the domain. The operations are
understood to satisfy certain axioms, certain mathematical principles
providing the algebraic foundation for rings. For example, the additive
inverse axiom for rings states:


   Every element x has an additive inverse y such that x+y=0.


The prototypical example of a domain that is a ring is the integers.
Keep them in mind whenever we mention Ring.

Many algebraic domain constructors such as Complex, Polynomial,
Fraction, take rings as arguments and return rings as values. You can
use the infix operator has to ask a domain if it belongs to a particular
category.

All numerical types are rings. Domain constructor Polynomial builds the
ring of polynomials over any other ring.


.. spadInput
::

	Polynomial(Integer) has Ring


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{true}

.. spadType
:sub:`Type: Boolean`



Constructor List never produces a ring.


.. spadInput
::

	List(Integer) has Ring


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{false}

.. spadType
:sub:`Type: Boolean`



The constructor Matrix(R) builds the domain of all matrices over the
ring R. This domain is never a ring since the operations ``+, -``, and
``*`` on matrices of arbitrary shapes are undefined.


.. spadInput
::

	Matrix(Integer) has Ring


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{false}

.. spadType
:sub:`Type: Boolean`



Thus you can never build polynomials over matrices.


.. spadInput
::

	Polynomial(Matrix(Integer))


.. spadMathAnswer
.. spadVerbatim

.. warn::

    Polynomial Matrix Integer is not a valid type.


Use ``SquareMatrix(n,R)`` instead. For any positive integer n, it builds the
ring of n by n matrices over R.


.. spadInput
::

	Polynomial(SquareMatrix(7,Complex(Integer)))


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{Polynomial(SquareMatrix(7,Complex(Integer)))}

.. spadType
:sub:`Type: Domain`


Another common category is ``Field``, the class of all fields. A field
is a ring with additional operations. For example, a field has
commutative multiplication and a closed operation ``/`` for the division of
two elements. Integer is not a field since, for example, 3/2 does not
have an integer result. The prototypical example of a field is the
rational numbers, that is, the domain ``Fraction(Integer)``. In general, the
constructor ``Fraction`` takes an ``IntegralDomain``, which is a ring with
additional properties, as an argument and returns a field. Actually, the
argument domain must have some additional so as to belong to the
category IntegralDomain Other domain constructors, such as ``Complex``,
build fields only if their argument domain is a field.

The complex integers (often called the *Gaussian integers*) do not form a
field.


.. spadInput
::

	Complex(Integer) has Field


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{false}

.. spadType
:sub:`Type: Boolean`



But fractions of complex integers do.


.. spadInput
::

	Fraction(Complex(Integer)) has Field


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{true}

.. spadType
:sub:`Type: Boolean`



The algebraically equivalent domain of complex rational numbers is a
field since domain constructor Complex produces a field whenever its
argument is a field.


.. spadInput
::

	Complex(Fraction(Integer)) has Field


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{true}

.. spadType
:sub:`Type: Boolean`



The most basic category is **Type**. Type It denotes the class of all
domains and subdomains. Note carefully that Type does not denote the
class of all types. The type of all categories is **Category**. The type of
Type itself is undefined. Domain constructor List is able to build lists
of elements from domain D for arbitrary D simply by requiring that D
belong to category Type.

Now, you may ask, what exactly is a category? category Like domains,
categories can be defined in the FriCAS language. A category is defined
by three components:

1. a name (for example, Ring), used to refer to the class of domains
   that the category represents;
2. a set of operations, used to refer to the operations that the domains
   of this class support (for example, ``+,-``, and ``*`` for rings);
   and
3. an optional list of other categories that this category extends.

This last component is a new idea. And it is key to the design of
FriCAS! Because categories can extend one another, they form
hierarchies. Detailed charts showing the category hierarchies in FriCAS
are displayed in Appendix (TPDHERE). There you see that all categories
are extensions of Type and that Field is an extension of Ring.

The operations supported by the domains of a category are called the
exports of that category because these are the operations made available
for system-wide use. The exports of a domain of a given category are not
only the ones explicitly mentioned by the category. Since a category
extends other categories, the operations of these other categories---and
all categories these other categories extend - are also exported by the
domains.

For example, polynomial domains belong to ``PolynomialCategory``. This
category explicitly mentions some twenty-nine operations on polynomials,
but it extends eleven other categories (including Ring). As a result,
the current system has over one hundred operations on polynomials.

If a domain belongs to a category that extends, say, Ring, it is
convenient to say that the domain exports Ring. The name of the category
thus provides a convenient shorthand for the list of operations exported
by the category. Rather than listing operations such as ``+`` and ``*`` of 
Ring each time they are needed, the definition of a type simply asserts 
that it exports category Ring.

The category name, however, is more than a shorthand. The name Ring, in
fact, implies that the operations exported by rings are required to
satisfy a set of axioms associated with the name Ring. This subtle but
important feature distinguishes FriCAS from other abstract datatype
designs.

Why is it not correct to assume that some type is a ring if it exports
all of the operations of Ring? Here is why. Some languages such as APL
denote the Boolean constants true and false by the integers 1 and 0
respectively, then use ``+`` and ``*`` to denote the logical operators or
and and. But with these definitions Boolean is not a ring since the
additive inverse axiom is violated. That is, there is no inverse element
a such that ``1+a=0``, or, in the usual terms: true or ``a = false``. This
alternative definition of Boolean can be easily and correctly
implemented in FriCAS, since Boolean simply does not assert that it is
of category Ring. This prevents the system from building meaningless
domains such as Polynomial(Boolean) and then wrongfully applying
algorithms that presume that the ring axioms hold.

Enough on categories. To learn more about them, see Chapter
`ugCategories <section-12.0.html#ugCategories>`__ . We now return to
our discussion of domains.

Domains export a set of operations to make them available for
system-wide use. Integer, for example, exports the operations ``+`` and 
``=`` given by the signatures 

::
    
  + : (Integer,Integer)->Integer 
  
and

::
    
   = :(Integer,Integer)->Boolean 
  
respectively. Each of these operations takes
two Integer arguments. The ``+`` operation also returns an Integer but ``=``
returns a Boolean: **true** or **false**. The operations exported by a domain
usually manipulate objects of the domain - but not always.

The operations of a domain may actually take as arguments, and return as
values, objects from any domain. For example, Fraction (Integer) exports
the operations ``/: (Integer,Integer)->Fraction(Integer)`` and
``characteristic : -> NonNegativeInteger``.

Suppose all operations of a domain take as arguments and return as
values, only objects from other domains. package This kind of domain
is what FriCAS calls a **package**.

A package does not designate a class of objects at all. Rather, a
package is just a collection of operations. Actually the bulk of the
FriCAS library of algorithms consists of packages. The facilities for
factorization; integration; solution of linear, polynomial, and
differential equations; computation of limits; and so on, are all
defined in packages. Domains needed by algorithms can be passed to a
package as arguments or used by name if they are not variable. Packages
are useful for defining operations that convert objects of one type to
another, particularly when these types have different parameterizations.
As an example, the package ``PolynomialFunction2(R,S)`` defines operations
that convert polynomials over a domain R to polynomials over S. To
convert an object from Polynomial(Integer) to Polynomial(Float), FriCAS
builds the package PolynomialFunctions2(Integer,Float) in order to
create the required conversion function. (This happens behind the scenes
for you: see `ugTypesConvert <section-2.7.html#ugTypesConvert>`__ for
details on how to convert objects.)

FriCAS categories, domains and packages and all their contained
functions are written in the FriCAS programming language and have been
compiled into machine code. This is what comprises the FriCAS library.
We will show you how to use these domains and their functions and how to
write your own functions.





