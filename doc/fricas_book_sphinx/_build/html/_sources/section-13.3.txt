.. status: ok


13.3 Category Assertions
------------------------

The Category Assertions part of your domain constructor definition lists
those categories of which all domains created by the constructor are
unconditionally members. The word unconditionally means that membership
in a category does not depend on the values of the parameters to the
domain constructor. This part thus defines the link between the domains
and the category hierarchies given on the inside covers of this book. As
described in
`ugCategoriesCorrectness <section-12.8.html#ugCategoriesCorrectness>`__
it is this link that makes it possible for you to pass objects of the
domains as arguments to other operations in FriCAS.

Every QuadraticForm domain is declared to be unconditionally a member of
category AbelianGroup. An abelian group is a collection of elements
closed under addition. Every object x of an abelian group has an
additive inverse y such that x+y=0. The exports of an abelian group
include 0, +, -, and scalar multiplication by an integer. After
asserting that QuadraticForm domains are abelian groups, it is possible
to pass quadratic forms to algorithms that only assume arguments to have
these abelian group properties.

In
`ugCategoriesConditionals <section-12.11.html#ugCategoriesConditionals>`__
you saw that Fraction(R), a member of QuotientFieldCategory(R), is a
member of OrderedSet if R is a member of OrderedSet. Likewise, from the
Exports part of the definition of ModMonic(R, S),


.. spadVerbatim

::

 UnivariatePolynomialCategory(R) with
   if R has Finite then Finite
      ...



you see that ModMonic(R, S) is a member of Finite if R is.

The Exports part of a domain definition is the same kind of expression
that can appear to the right of an == in a category definition. If a
domain constructor is unconditionally a member of two or more
categories, a Join form is used. Join The Exports part of the definition
of FlexibleArray(S) reads, for example:


.. spadVerbatim

::


Join(ExtensibleLinearAggregate(S), OneDimensionalArrayAggregate(S)) with...





