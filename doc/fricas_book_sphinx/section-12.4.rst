.. status: ok


12.4 Hierarchies
----------------

A second example of a category is SemiGroup, defined by: SemiGroup


.. spadVerbatim

::

 SemiGroup(): Category == SetCategory with
       "*":  ($,$) -> $
       "^": ($, PositiveInteger) -> $



This definition is as simple as that for SetCategory, except that there
are two exported operations. Multiple exported operations are written as
a pile, that is, they all begin in the same column. Here you see that
the category mentions another type, PositiveInteger, in a signature. Any
domain can be used in a signature.

Since categories extend one another, they form hierarchies. Each
category other than Type has one or more parents given by the one or
more categories mentioned before the with part of the definition.
SemiGroup extends SetCategory and SetCategory extends both Type and
CoercibleTo (OutputForm). Since CoercibleTo (OutputForm) also extends
Type, the mention of Type in the definition is unnecessary but included
for emphasis.



