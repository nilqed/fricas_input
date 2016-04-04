.. status: ok



13.11 Short Forms
-----------------

In FriCAS, a domain could be defined using only an add-domain and no
capsule. Although we talk about rational numbers as quotients of
integers, there is no type RationalNumber in FriCAS. To create such a
type, you could compile the following short-form definition:


.. spadVerbatim

::

 RationalNumber() == Fraction(Integer)



The Exports part of this definition is missing and is taken to be
equivalent to that of Fraction(Integer). Because of the add-domain
philosophy, you get precisely what you want. The effect is to create a
little stub of a domain. When a user asks to add two rational numbers,
FriCAS would ask RationalNumber for a function implementing this +.
Since the domain has no capsule, the domain then immediately sends its
request to Fraction (Integer).

The short form definition for domains is used to define such domains as
MultivariatePolynomial: MultivariatePolynomial


.. spadVerbatim

::

 MultivariatePolynomial(vl: List Symbol, R: Ring) ==
    SparseMultivariatePolynomial(R,
       OrderedVariableList vl)





