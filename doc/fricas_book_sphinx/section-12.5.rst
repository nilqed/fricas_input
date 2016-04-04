.. status: ok


12.5 Membership
---------------

We say a category designates a class of domains. What class of domains?
category:membership That is, how does FriCAS know what domains belong to
what categories? The simple answer to this basic question is key to the
design of FriCAS:



 Domains belong to categories by assertion.



When a domain is defined, it is asserted to belong to one or more
categories. Suppose, for example, that an author of domain String wishes
to use the binary operator * to denote concatenation. Thus
"hello"*"there" would produce the string "hellothere". Actually,
concatenation of strings in FriCAS is done by juxtaposition or by using
the operation concatconcatString. The expression "hello""there" produces
the string "hellothere". The author of String could then assert that
String is a member of SemiGroup. According to our definition of
SemiGroup, strings would then also have the operation ** defined
automatically. Then "--"**4 would produce a string of eight dashes
"--------". Since String is a member of SemiGroup, it also is a member
of SetCategory and thus has an operation = for testing that two strings
are equal.

Now turn to the algebraic category hierarchy inside the front cover of
this book. Any domain that is a member of a category extending SemiGroup
is a member of SemiGroup (that is, it is a semigroup). In particular,
any domain asserted to be a Ring is a semigroup since Ring extends
Monoid, that, in turn, extends SemiGroup. The definition of Integer in
FriCAS asserts that Integer is a member of category IntegerNumberSystem,
that, in turn, asserts that it is a member of EuclideanDomain. Now
EuclideanDomain extends PrincipalIdealDomain and so on. If you trace up
the hierarchy, you see that EuclideanDomain extends Ring, and,
therefore, SemiGroup. Thus Integer is a semigroup and also exports the
operations * and **.



