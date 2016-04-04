.. status: ok


12.9 Attributes
---------------

Most axioms are not computationally useful. Those that are can be
explicitly expressed by what FriCAS calls an attribute. The attribute
commutative("*"), for example, is used to assert that a domain has
commutative multiplication. Its definition is given by its
documentation:



A domain R has commutative("*") if it has an operation "*": (R,R)->R
such that x*y=y*x.



Just as you can test whether a domain has the category Ring, you can
test that a domain has a given attribute.

Do polynomials over the integers have commutative multiplication?


.. spadInput
::

	Polynomial Integer has commutative("*")


.. spadMathAnswer
Do matrices over the integers have commutative multiplication?


.. spadInput
::

	Matrix Integer has commutative("*")


.. spadMathAnswer
Attributes are used to conditionally export and define operations for a
domain (see
`ugDomainsAssertions <section-13.3.html#ugDomainsAssertions>`__ ).
Attributes can also be asserted in a category definition.

After mentioning category Ring many times in this book, it is high time
that we show you its definition: Ring


.. spadVerbatim

::

 Ring(): Category ==
   Join(Rng,Monoid,LeftModule($: Rng)) with
       characteristic: -> NonNegativeInteger
       coerce: Integer -> $
       unitsKnown
     add
       n:Integer
       coerce(n) == n * 1$$



There are only two new things here. First, look at the $$ on the last
line. This is not a typographic error! The first $ says that the 1 is to
come from some domain. The second $ says that the domain is this domain.
If $ is Fraction(Integer), this line reads coerce(n) == n *
1$Fraction(Integer).

The second new thing is the presence of attribute unitsKnown. FriCAS can
always distinguish an attribute from an operation. An operation has a
name and a type. An attribute has no type. The attribute unitsKnown
asserts a rather subtle mathematical fact that is normally taken for
granted when working with rings.With this axiom, the units of a domain
are the set of elements x that each have a multiplicative inverse y in
the domain. Thus 1 and -1 are units in domain Integer. Also, for
Fraction Integer, the domain of rational numbers, all non-zero elements
are units. Because programs can test for this attribute, FriCAS can
correctly handle rather more complicated mathematical structures (ones
that are similar to rings but do not have this attribute).



