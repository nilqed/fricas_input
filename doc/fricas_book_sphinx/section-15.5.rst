.. status: ok



15.5 Library
------------

ugWhatsNewLibrary

The FullPartialFractionExpansion domain has been added. This domain
computes factor-free full partial fraction expansions. See section
FullPartialFractionExpansion for examples.

We have implemented the Bertrand/Cantor algorithm for integrals of
hyperelliptic functions. This brings a major speedup for some classes of
algebraic integrals.

We have implemented a new (direct) algorithm for integrating
trigonometric functions. This brings a speedup and an improvement in the
answer quality.

The SmallFloat domain has been renamed DoubleFloat and SmallInteger has
been renamed SingleInteger. The new abbreviations as DFLOAT and SINT,
respectively. We have defined the macro SF, the old abbreviation for
{\\sf SmallFloat}, to expand to DoubleFloat and modified the
documentation and input file examples to use the new names and
abbreviations. You should do the same in any private FriCAS files you
have.

There are many new categories, domains and packages related to the NAG
Library Link facility. See the file

src/algebra/exposed.lsp

for a list of constructors in the naglink FriCAS exposure group.

We have made improvements to the differential equation solvers and there
is a new facility for solving systems of first-order linear differential
equations. In particular, an important fix was made to the solver for
inhomogeneous linear ordinary differential equations that corrected the
calculation of particular solutions. We also made improvements to the
polynomial and transcendental equation solvers including the ability to
solve some classes of systems of transcendental equations.

The efficiency of power series have been improved and left and right
expansions of tan(f(x)) at x= a pole of f(x) can now be computed. A
number of power series bugs were fixed and the
GeneralUnivariatePowerSeries domain was added. The power series variable
can appear in the coefficients and when this happens, you cannot
differentiate or integrate the series. Differentiation and integration
with respect to other variables is supported.

A domain was added for representing asymptotic expansions of a function
at an exponential singularity.

For limits, the main new feature is the exponential expansion domain
used to treat certain exponential singularities. Previously, such
singularities were treated in an ad hoc way and only a few cases were
covered. Now FriCAS can do things like


.. spadVerbatim

::

 limit( (x+1)^(x+1)/x^x - x^x/(x-1)^(x-1), x = %plusInfinity)



in a systematic way. It only does one level of nesting, though. In other
words, we can handle exp(somefunctionwithapole), but not
exp(exp(somefunctionwithapole)).

The computation of integral bases has been improved through careful use
of Hermite row reduction. A P-adic algorithm for function fields of
algebraic curves in finite characteristic has also been developed.

Miscellaneous: There is improved conversion of definite and indefinite
integrals to InputForm; binomial coefficients are displayed in a new
way; some new simplifications of radicals have been implemented; the
operation complexForm for converting to rectangular coordinates has been
added; symmetric product operations have been added to
LinearOrdinaryDifferentialOperator.



