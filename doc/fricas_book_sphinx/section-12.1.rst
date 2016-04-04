.. status: ok


12.1 Definitions
----------------

A category is defined by a function with exactly the same format as
category:definition any other function in FriCAS.

The definition of a category has the syntax:



CategoryForm : Category  ==  Extensions [ with Exports ]



The brackets [ ] here indicate optionality.

The first example of a category definition is SetCategory, the most
basic of the algebraic categories in FriCAS. SetCategory


.. spadVerbatim

::

 SetCategory(): Category ==
    Join(Type,CoercibleTo OutputForm) with
       "=" : ($, $) -> Boolean



The definition starts off with the name of the category (SetCategory);
this is always in column one in the source file. All parts of a category
definition are then indented with respect to this indentation first
line.

In Chapter `ugTypes <section-2.0.html#ugTypes>`__ , we talked about
Ring as denoting the class of all domains that are rings, in short, the
class of all rings. While this is the usual naming convention in FriCAS,
it is also common to use the word Category at the end of a category name
for clarity. The interpretation of the name SetCategory is, then, the
category of all domains that are (mathematical) sets.

The name SetCategory is followed in the definition by its formal
parameters enclosed in parentheses (). Here there are no parameters. As
required, the type of the result of this category function is the
distinguished name Category.

Then comes the ==. As usual, what appears to the right of the == is a
definition, here, a category definition. A category definition always
has two parts separated by the reserved word with with. Debugging hint:
it is very easy to forget the with!

The first part tells what categories the category extends. Here, the
category extends two categories: Type, the category of all domains, and
CoercibleTo(OutputForm). CoercibleTo(OutputForm) can also be written
(and is written in the definition above) without parentheses. The
operation Join is a system-defined operation that Join forms a single
category from two or more other categories.

Every category other than Type is an extension of some other category.
If, for example, SetCategory extended only the category Type, the
definition here would read Type with .... In fact, the Type is optional
in this line; with ... suffices.



