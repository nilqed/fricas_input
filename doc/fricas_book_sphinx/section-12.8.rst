.. status: ok


12.8 Correctness
----------------

While such statements are only comments, correctness FriCAS can enforce
their intention simply by shifting the burden of responsibility onto the
author of a domain. A domain belongs to category Ring only if the author
asserts that the domain belongs to Ring or to a category that extends
Ring.

This principle of assertion is important for large user-extendable
systems. FriCAS has a large library of operations offering facilities in
many areas. Names such as norm and product, for example, have diverse
meanings in diverse contexts. An inescapable hindrance to users would be
to force those who wish to extend FriCAS to always invent new names for
operations. I don't think disambiguate is really a word, though I like
it FriCAS allows you to reuse names, and then use context to
disambiguate one from another.

Here is another example of why this is important. Some languages, such
as APL, APL denote the Boolean constants true and false by the integers
1 and 0. You may want to let infix operators + and * serve as the
logical operators or and and, respectively. But note this: Boolean is
not a ring. The inverse axiom for Ring states:



Every element x has an additive inverse y such that x+y=0.



Boolean is not a ring since true has no inverse---there is no inverse
element a such that 1+a=0 (in terms of booleans, (true or a) = false).
Nonetheless, FriCAS could easily and correctly implement Boolean this
way. Boolean simply would not assert that it is of category Ring. Thus
the ``+`` for Boolean values is not confused with the one for Ring.
Since the Polynomial constructor requires its argument to be a ring,
FriCAS would then refuse to build the domain Polynomial(Boolean). Also,
FriCAS would refuse to wrongfully apply algorithms to Boolean elements
that presume that the ring axioms for ``+`` hold.



