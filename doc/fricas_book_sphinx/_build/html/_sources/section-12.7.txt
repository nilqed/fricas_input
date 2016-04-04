.. status: ok


12.7 FriCASs
------------

In the previous section you saw the complete FriCAS program defining
axiom SemiGroup. According to this definition semigroups are sets with
the operations * and ^. SemiGroup

You might ask: \`\`Aside from the notion of default packages, isn't a
category just a macro, that is, a shorthand equivalent to the two
operations * and ** with their types?'' If a category were a macro,
every time you saw the word SemiGroup, you would rewrite it by its list
of exported operations. Furthermore, every time you saw the exported
operations of SemiGroup among the exports of a constructor, you could
conclude that the constructor exported SemiGroup.

A category is not a macro and here is why. The definition for SemiGroup
has documentation that states:



Category SemiGroup denotes the class of all multiplicative semigroups,
that is, a set with an associative operation *.

FriCASs:

associative("*" : ($,$)->$) -- (x*y)*z = x*(y*z)



According to the author's remarks, the mere exporting of an operation
named * and ** is not enough to qualify the domain as a SemiGroup. In
fact, a domain can be a semigroup only if it explicitly exports a **
and a * satisfying the associativity axiom.

In general, a category name implies a set of axioms, even mathematical
theorems. There are numerous axioms from Ring, for example, that are
well-understood from the literature. No attempt is made to list them
all. Nonetheless, all such mathematical facts are implicit by the use of
the name Ring.



