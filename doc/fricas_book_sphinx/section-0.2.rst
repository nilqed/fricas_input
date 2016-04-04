0.2 A Technical Introduction
----------------------------

FriCAS has both an interactive language for user interactions and a
programming language for building library modules. Like Modula 2, PASCAL,
FORTRAN and Ada, Ada the programming language emphasizes strict type-checking. 
Unlike these languages, types in FriCAS are dynamic objects: they are created 
at run-time in response to user commands.

Here is the idea of the FriCAS programming language in a nutshell.
FriCAS types range from algebraic ones (like polynomials, matrices, and
power series) to data structures (like lists, dictionaries, and input
files). Types combine in any meaningful way. You can build polynomials
of matrices, matrices of polynomials of power series, hash tables with
symbolic keys and rational function entries, and so on.

Categories define algebraic properties to ensure mathematical
correctness. They ensure, for example, that matrices of polynomials are
OK, but matrices of input files are not. Through categories, programs
can discover that polynomials of continued fractions have a commutative
multiplication whereas polynomials of matrices do not.

Categories allow algorithms to be defined in their most natural setting.
For example, an algorithm can be defined to solve polynomial equations
over any field. Likewise a greatest common divisor can compute the *gcd*
of two elements from any Euclidean domain. Categories foil attempts to
compute meaningless *gcds*, for example, of two hashtables. Categories
also enable algorithms to be compiled into machine code that can be run
with arbitrary types.

The FriCAS interactive language is oriented towards ease-of-use. The
FriCAS interpreter uses type-inferencing to deduce the type of an object
from user input. Type declarations can generally be omitted for common
types in the interactive language.

So much for the nutshell. Here are these basic ideas described by ten
design principles:


0.2.1 Types are Defined by Abstract Datatype Programs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Basic types are called domains of computation, or, simply, domains.
domain Domains are defined by FriCAS programs of the form:

::
    
    Name(...): Exports == Implementation


Each domain has a capitalized Name that is used to refer to the class of
its members. For example, Integer denotes the *class of integers*,
Float, *the class of floating point numbers*, and String, 
*the class of strings*.

The ... part following Name lists zero or more parameters to the
constructor. Some basic ones like Integer take no parameters. Others,
like Matrix, Polynomial and List, take a single parameter that again
must be a domain. For example, Matrix(Integer) denotes *matrices over
the integers*, Polynomial (Float) denotes *polynomial with floating
point coefficients*, and List (Matrix (Polynomial (Integer))) denotes
*lists of matrices of polynomials over the integers*. There is no
restriction on the number or type of parameters of a domain constructor.

``SquareMatrix(2,Integer)`` is an example of a domain constructor that
accepts both a particular data value as well as an integer. In this case
the number 2 specifies the number of rows and columns the square matrix
will contain. Elements of the matricies are integers.

The Exports part specifies operations for creating and manipulating
objects of the domain. For example, type Integer exports constants
:math:`0` and :math:`1`, and operations ``+``, -, and *. While these
operations are common, others such as ``odd?``odd?Integer and
bit?\ ````\ Integer are not. In addition the Exports section can contain
symbols that represent properties that can be tested. For example, the
Category EntireRing has the symbol noZeroDivisors which asserts that if
a product is zero then one of the factors must be zero.

The Implementation part defines functions that implement the exported
operations of the domain. These functions are frequently described in
terms of another lower-level domain used to represent the objects of the
domain. Thus the operation of adding two vectors of real numbers can be
described and implemented using the addition operation from Float.


0.2.2 The Type of Basic Objects is a Domain or Subdomain
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Every FriCAS object belongs to a unique domain. The domain of an object
is also called its type. Thus the integer :math:`7` has type Integer and
the string "daniel" has type String.

The type of an object, however, is not unique. The type of integer
:math:`7` is not only Integer but NonNegativeInteger, PositiveInteger,
and possibly, in general, any other *subdomain* of the domain Integer. A
subdomain subdomain is a domain with a *membership predicate*.
PositiveInteger is a subdomain of Integer with the predicate *is the
integer* :math:`> 0`?.

Subdomains with names are defined by abstract datatype programs similar
to those for domains. The Export part of a subdomain, however, must list
a subset of the exports of the domain. The Implementation part
optionally gives special definitions for subdomain objects.


0.2.3 Domains Have Types Called Categories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Domain and subdomains in FriCAS are themselves objects that have types.
The type of a domain or subdomain is called a category. category
Categories are described by programs of the form:

::
    
    Name(...): Category == Exports


The type of every category is the distinguished symbol Category. The
category Name is used to designate the class of domains of that type.
For example, category Ring designates the class of all rings. Like
domains, categories can take zero or more parameters as indicated by the
... part following Name. Two examples are Module(R) and
MatrixCategory(R,Row,Col).

The Exports part defines a set of operations. For example, Ring exports
the operations 0, 1, +, -, and *. Many algebraic domains such as
Integer and Polynomial (Float) are rings. String and List (R) (for any
domain :math:`R`) are not.

Categories serve to ensure the type-correctness. The definition of
matrices states Matrix(R: Ring) requiring its single parameter :math:`R`
to be a ring. Thus a *matrix of polynomials* is allowed, but *matrix of
lists* is not.

Categories say nothing about representation. Domains, which are
instances of category types, specify representations.


0.2.4 Operations Can Refer To Abstract Types
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All operations have prescribed source and target types. Types can be
denoted by symbols that stand for domains, called *symbolic domains*.
The following lines of FriCAS code use a symbolic domain :math:`R`:

::
    
    R: Ring
    power: (R, NonNegativeInteger): R -> R
    power(x, n) == x ^ n

Line 1 declares the symbol :math:`R` to be a ring. Line 2 declares the
type of :math:`power` in terms of :math:`R`. From the definition on line
3, :math:`{power}\left( 3,2 \right)` produces 9 for :math:`x = 3` and
:math:`R =` Integer. Also, :math:`{power}\left( 3.0,2 \right)` produces
:math:`9.0` for :math:`x = 3.0` and :math:`R =` Float.
:math:`{power}\left( "{oxford}",2 \right)` however fails since
:math:`"{oxford}"` has type String which is not a ring.

Using symbolic domains, algorithms can be defined in their most natural
or general setting.


0.2.5 Categories Form Hierarchies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Categories form hierarchies (technically, directed-acyclic graphs). A
simplified hierarchical world of algebraic categories is shown below. At
the top of this world is SetCategory, the class of algebraic sets. The
notions of parents, ancestors, and descendants is clear. Thus ordered
sets (domains of category OrderedSet) and rings are also algebraic sets.
Likewise, fields and integral domains are rings and algebraic sets.
However fields and integral domains are not ordered sets.

::
    
 SetCategory +---- Ring       ---- IntegralDomain ---- Field
             |
             +---- Finite     ---+
             |                    \\
             +---- OrderedSet -----+ OrderedFinite


Figure 1. A simplified category hierarchy.


0.2.6 Domains Belong to Categories by Assertion
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A category designates a class of domains. Which domains? You might think
that Ring designates the class of all domains that export :math:`0`,
:math:`1`, +, -, and *. But this is not so. Each domain must assert
which categories it belongs to.

The Export part of the definition for Integer reads, for example:

::

 Join(OrderedSet, IntegralDomain,  ...) with ...


This definition asserts that Integer is both an ordered set and an
integral domain. In fact, Integer does not explicitly export constants
:math:`0` and :math:`1` and operations +, - and * at all: it inherits
them all from :math:`Ring`! Since IntegralDomain is a descendant of
:math:`Ring`, Integer is therefore also a ring.

Assertions can be conditional. For example, Complex(R) defines its
exports by:

::
    
 Ring with ... if R has Field then Field ...


Thus Complex(Float) is a field but Complex(Integer) is not since Integer
is not a field.

You may wonder: *Why not simply let the set of operations determine
whether a domain belongs to a given category?*. FriCAS allows operation
names (for example, norm) to have very different meanings in different
contexts. The meaning of an operation in FriCAS is determined by
context. By associating operations with categories, operation names can
be reused whenever appropriate or convenient to do so. As a simple
example, the operation < might be used to denote
lexicographic-comparison in an algorithm. However, it is wrong to use
the same < with this definition of absolute-value:
``abs(x) = if x<0 then -x else x``

Such a definition for abs in FriCAS is protected by context: argument
:math:`x` is required to be a member of a domain of category OrderedSet.


0.2.7 Packages Are Clusters of Polymorphic Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In FriCAS, facilities for symbolic integration, solution of equations,
and the like are placed in *packages*. A package package is a special
kind of domain: one whose exported operations depend solely on the
parameters of the constructor and/or explicit domains. Packages, unlike
Domains, do not specify the representation.

If you want to use FriCAS, for example, to define some algorithms for
solving equations of polynomials over an arbitrary field :math:`F`, you
can do so with a package of the form:

::
    
 MySolve(F: Field): Exports == Implementation


where Exports specifies the solve operations you wish to export from the
domain and the Implementation defines functions for implementing your
algorithms. Once FriCAS has compiled your package, your algorithms can
then be used for any F: floating-point numbers, rational numbers,
complex rational functions, and power series, to name a few.


0.2.8 The Interpreter Builds Domains Dynamically
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The FriCAS interpreter reads user input then builds whatever types it
needs to perform the indicated computations. For example, to create the
matrix using the command:

::
    
    M = [ [x^2+1,0],[0,x / 2] ]::Matrix(POLY(FRAC(INT)))



.. math::                               
                                         
    M = \left\lbrack \begin{array}{ll}   
    {x^{2} + 1} & 0 \\                   
    0 & {x/2} \\                         
    \end{array} \right\rbrack            
                                         
:sub:`Type: Matrix Polynomial Fraction Integer`


the interpreter first loads the modules Matrix, Polynomial, Fraction,
and Integer from the library, then builds the domain tower matrices of
polynomials of rational numbers (i.e. fractions of integers).

You can watch the loading process by first typing

::
    
    )set message autoload on


In addition to the named domains above many additional domains and
categories are loaded. Most systems are preloaded with such common
types. For efficiency reasons the most common domains are preloaded but
most (there are more than 1100 domains, categories, and packages) are
not. Once these domains are loaded they are immediately available to the
interpreter.

Once a domain tower is built, it contains all the operations specific to
the type. Computation proceeds by calling operations that exist in the
tower. For example, suppose that the user asks to square the above
matrix. To do this, the function * from Matrix is passed the matrix
:math:`M` to compute :math:`M*M`. The function is also passed an
environment containing :math:`R` that, in this case, is Polynomial
(Fraction (Integer)). This results in the successive calling of the *
operations from Polynomial, then from Fraction, and then finally from
Integer.

Categories play a policing role in the building of domains. Because the
argument of Matrix is required to be a Ring, FriCAS will not build
nonsensical types such as matrices of input files.


0.2.9 FriCAS Code is Compiled
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS programs are statically compiled to machine code, then placed
into library modules. Categories provide an important role in obtaining
efficient object code by enabling:

* static type-checking at compile time;
* fast linkage to operations in domain-valued parameters;
* optimization techniques to be used for partially specified types
   (operations for *vectors of* :math:`R`, for instance, can be
   open-coded even though R is unknown).


0.2.10 FriCAS is Extensible
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Users and system implementers alike use the FriCAS language to add
facilities to the FriCAS library. The entire FriCAS library is in fact
written in the FriCAS source code and available for user modification
and/or extension.

FriCAS's use of abstract datatypes clearly separates the exports of a
domain (what operations are defined) from its implementation (how the
objects are represented and operations are defined). Users of a domain
can thus only create and manipulate objects through these exported
operations. This allows implementers to remove and replace parts of the
library safely by newly upgraded (and, we hope, correct) implementations
without consequence to its users.

Categories protect names by context, making the same names available for
use in other contexts. Categories also provide for code-economy.
Algorithms can be parameterized categorically to characterize their
correct and most general context. Once compiled, the same machine code
is applicable in all such contexts.

Finally, FriCAS provides an automatic, guaranteed interaction between
new and old code. For example:

*  if you write a new algorithm that requires a parameter to be a field,
   then your algorithm will work automatically with every field defined
   in the system; past, present, or future.
*  if you introduce a new domain constructor that produces a field, then
   the objects of that domain can be used as parameters to any algorithm
   using field objects defined in the system; past, present, or future.

These are the key ideas. For further information, we particularly
recommend your reading chapters 11, 12, and 13, where these ideas are
explained in greater detail.
