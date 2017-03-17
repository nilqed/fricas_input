    This is an attempt to make the content of the Axiom book (by Jenks
    and Sutor) available again in order to describe the FriCAS project
    (which is a fork of the original Axiom code). The following material
    is mainly taken from the original Axiom book, but is partly tailored
    to new developments in FriCAS.

    **WARNING: This is work-in-progress! There might be errors and even
    false statements.**

    Plan is as follows:

    #. Make LaTeX compilation work and include (generated) pictures and
       generated output of algebra commands.

    #. Simplify and remove redundant LaTeX commands.

    #. Build on modern advanced latex packages.

    #. Generate indices and hyperrefs.

    All of the above will be done by taking care of still generating the
    same ``.ht`` files although the technicalities might look different.
    The contents of the files (no matter how wrong it actually is) will
    only be changed marginally. Rewriting of the contents will only
    happen after the technical part of producing the PDF file has been
    finished.

    Ralf Hemmecke

Welcome to the world of FriCAS. We call FriCAS a scientific computation
system: a self-contained toolbox designed to meet your scientific
programming needs, from symbolics, to numerics, to graphics.

This introduction is a quick overview of what FriCAS offers.

FriCAS provides a wide range of simple commands for symbolic
mathematical problem solving. Do you need to solve an equation, to
expand a series, or to obtain an integral? If so, just ask FriCAS to do
it.

Integrate :math:`\frac{1}{(x^3 \  {(a+b x)}^{1/3})}` with respect to .

integrate(1/(x^3 \* (a+b\*x)^(1/3)),x)

1

Union(Expression(Integer), ...)

FriCAS provides state-of-the-art algebraic machinery to handle your most
advanced symbolic problems. For example, FriCAS’s integrator gives you
the answer when an answer exists. If one does not, it provides a proof
that there is no answer. Integration is just one of a multitude of
symbolic operations that FriCAS provides.

FriCAS has a numerical library that includes operations for linear
algebra, solution of equations, and special functions. For many of these
operations, you can select any number of floating point digits to be
carried out in the computation.

Solve :math:`x^{49}-49x^4+9` to 49 digits of accuracy.

solve(x^49-49\*x^4+9 = 0,1.e-49)

1

List(Equation(Polynomial(Float)))

The output of a computation can be converted to FORTRAN to be used in a
later numerical computation. Besides floating point numbers, FriCAS
provides literally dozens of kinds of numbers to compute with. These
range from various kinds of integers, to fractions, complex numbers,
quaternions, continued fractions, and to numbers represented with an
arbitrary base.

What is to the power in base ?

radix(10^100,32)

2 4995164572827226462585700000000000000000000

RadixExpansion(32)

You may often want to visualize a symbolic formula or draw a graph from
a set of numerical values. To do this, you can call upon the FriCAS
graphics capability.

Draw :math:`J_0(\sqrt{x^2+y^2})` for :math:`-20 \leq x,y \leq 20`.

draw(5\*besselJ(0,sqrt(x^2+y^2)), x=-20..20, y=-20..20)

Graphs in FriCAS are interactive objects you can manipulate with your
mouse. Just click on the graph, and a control panel pops up. Using this
mouse and the control panel, you can translate, rotate, zoom, change the
coloring, lighting, shading, and perspective on the picture. You can
also generate a PostScript copy of your graph to produce hard-copy
output.

presents you windows on the world of FriCAS, offering on-line help,
examples, tutorials, a browser, and reference material. gives you
on-line access to this book in a “hypertext” format. Words that appear
in a different font (for example, , , and ) are generally mouse-active;
if you click on one with your mouse, shows you a new window for that
word.

As another example of a facility, suppose that you want to compute the
roots of :math:`x^{49} - 49x^4 + 9` to digits (as in our previous
example) and you don’t know how to tell FriCAS to do this. The “basic
command” facility of leads the way. Through the series of windows shown
in Figure [fig-intro-br] and the specified mouse clicks, you and
generate the correct command to issue to compute the answer.

.5

FriCAS’s interactive programming language lets you define your own
functions. A simple example of a user-defined function is one that
computes the successive Legendre polynomials. FriCAS lets you define
these polynomials in a piece-wise way.

The first Legendre polynomial.

p(0) == 1

The second Legendre polynomial.

p(1) == x

The Legendre polynomial for :math:`(n > 1)`.

p(n) == ((2\*n-1)\*x\*p(n-1) - (n-1) \* p(n-2))/n

In addition to letting you define simple functions like this, the
interactive language can be used to create entire application packages.
All the graphs in the section in the center of the book, for example,
were created by programs written in the interactive language.

The above definitions for do no computation—they simply tell FriCAS how
to compute for some positive integer . To actually get a value of a
Legendre polynomial, you ask for it.

What is the tenth Legendre polynomial?

p(10)

Compiling function p with type Integer -> Polynomial(Fraction( Integer))

Compiling function p as a recurrence relation.

4 -+-+-

Polynomial(Fraction(Integer))

FriCAS applies the above pieces for to obtain the value of . But it does
more: it creates an optimized, compiled function for . The function is
formed by putting the pieces together into a single piece of code. By
*compiled*, we mean that the function is translated into basic
machine-code. By *optimized*, we mean that certain transformations are
performed on that code to make it run faster. For , FriCAS actually
translates the original definition that is recursive (one that calls
itself) to one that is iterative (one that consists of a simple loop).

What is the coefficient of in ?

coefficient(p(90),x,90)

5

Polynomial(Fraction(Integer))

In general, a user function is type-analyzed and compiled on first use.
Later, if you use it with a different kind of object, the function is
recompiled if necessary.

A variety of data structures are available for interactive use. These
include strings, lists, vectors, sets, multisets, and hash tables. A
particularly useful structure for interactive use is the infinite
stream:

Create the infinite stream of derivatives of Legendre polynomials

[D(p(i),x) for i in 1..]

There are no library operations named p Use HyperDoc Browse or issue
)what op p to learn if there is any operation containing “ p ” in its
name.

Cannot find a definition or applicable library operation named p with
argument type(s) PositiveInteger

Perhaps you should use “@” to indicate the required return type, or “$”
to specify which version of the function you need.

FriCAS will attempt to step through and interpret the code.

Interpret-Code mode is not supported for stream bodies.

Streams display only a few of their initial elements. Otherwise, they
are “lazy”: they only compute elements when you ask for them.

Data structures are an important component for building application
software. Advanced users can represent data for applications in optimal
fashion. In all, FriCAS offers over forty kinds of aggregate data
structures, ranging from mutable structures (such as cyclic lists and
flexible arrays) to storage efficient structures (such as bit vectors).
As an example, streams are used as the internal data structure for power
series.

What is the series expansion of :math:`\log(\cot(x))` about
:math:`x=\pi/2`?

series(log(cot(x)),x =

1 ++++

GeneralUnivariatePowerSeries(Expression(Integer), x, %pi/2)

Series and streams make no attempt to compute *all* their elements!
Rather, they stand ready to deliver elements on demand.

What is the coefficient of the term of this series?

coefficient(

2

Expression(Integer)

FriCAS also has many kinds of mathematical structures. These range from
simple ones (like polynomials and matrices) to more esoteric ones (like
ideals and Clifford algebras). Most structures allow the construction of
arbitrarily complicated “types.”

Even a simple input expression can result in a type with several levels.

matrix [[x +

1

| 2+&0
| 1&-2

Matrix(Polynomial(Complex(Integer)))

The FriCAS interpreter builds types in response to user input. Often,
the type of the result is changed in order to be applicable to an
operation.

The inverse operation requires that elements of the above matrices are
fractions.

inverse(

2

| 2&0
| &-

Union(Matrix(Fraction(Polynomial(Complex(Integer)))), ...)

A convenient facility for symbolic computation is “pattern matching.”
Suppose you have a trigonometric expression and you want to transform it
to some equivalent form. Use a command to describe the transformation
rules you need. Then give the rules a name and apply that name as a
function to your trigonometric expression.

Introduce two rewrite rules.

sinCosExpandRules := rule sin(x+y) == sin(x)\*cos(y) + sin(y)\*cos(x)
cos(x+y) == cos(x)\*cos(y) - sin(x)\*sin(y) sin(2\*x) ==
2\*sin(x)\*cos(x) cos(2\*x) == cos(x)^2 - sin(x)^2

1

Ruleset(Integer, Integer, Expression(Integer))

Apply the rules to a simple trigonometric expression.

sinCosExpandRules(sin(a+2\*b+c))

2 -+2+

Expression(Integer)

Using input files, you can create your own library of transformation
rules relevant to your applications, then selectively apply the rules
you need.

All components of the FriCAS algebra library are written in the FriCAS
library language. This language is similar to the interactive language
except for protocols that authors are obliged to follow. The library
language permits you to write “polymorphic algorithms,” algorithms
defined to work in their most natural settings and over a variety of
types.

Define a system of polynomial equations .

S := [3\*x^3 + y + 1 = 0,y^2 = 4]

1

List(Equation(Polynomial(Integer)))

Solve the system using rational number arithmetic and 30 digits of
accuracy.

solve(S,1/10^30)

2

List(List(Equation(Polynomial(Fraction(Integer)))))

Solve with the solutions expressed in radicals.

radicalSolve(S)

3

List(List(Equation(Expression(Integer))))

While these solutions look very different, the results were produced by
the same internal algorithm! The internal algorithm actually works with
equations over any “field.” Examples of fields are the rational numbers,
floating point numbers, rational functions, power series, and general
expressions involving radicals.

Users and system developers alike can augment the FriCAS library, all
using one common language. Library code, like interpreter code, is
compiled into machine binary code for run-time efficiency.

Using this language, you can create new computational types and new
algorithmic packages. All library code is polymorphic, described in
terms of a database of algebraic properties. By following the language
protocols, there is an automatic, guaranteed interaction between your
code and that of colleagues and system implementers.
