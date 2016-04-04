.. status: ok


12.3 Documentation
------------------

The definition of SetCategory above is missing an important component:
its library documentation. documentation Here is its definition,
complete with documentation.


.. spadVerbatim

::

 ++ Description:
 ++ \\bs{}axiomType\\{SetCategory\\} is the basic category
 ++ for describing a collection of elements with
 ++ \\bs{}axiomOp\\{=\\} (equality) and a \\bs{}axiomFun\\{coerce\\}
 ++ to \\bs{}axiomType\\{OutputForm\\}.
 SetCategory(): Category ==
   Join(Type, CoercibleTo OutputForm) with
     "=": ($, $) -> Boolean
       ++ \\bs{}axiom\\{x = y\\} tests if \\bs{}axiom\\{x\\} and
       ++ \\bs{}axiom\\{y\\} are equal.



Documentary comments are an important part of constructor definitions.
Documentation is given both for the category itself and for each export.
A description for the category precedes the code. Each line of the
description begins in column one with ++. The description starts with
the word Description:.Other information such as the author's name, date
of creation, and so on, can go in this area as well but are currently
ignored by FriCAS. All lines of the description following the initial
line are indented by the same amount.

Surround the name of any constructor (with or without parameters) with
an {\\bf }. Similarly, surround an operator name with {\\tt }, an FriCAS
operation with {\\bf }, and a variable or FriCAS expression with $$.
Library documentation is given in a TeX-like language so that it can be
used both for hard-copy and for Browse. These different wrappings cause
operations and types to have mouse-active buttons in Browse. For
hard-copy output, wrapped expressions appear in a different font. The
above documentation appears in hard-copy as:



SetCategory is the basic category for describing a collection of
elements with = (equality) and a coerce to OutputForm.



and



x=y tests if x and y are equal.



For our purposes in this chapter, we omit the documentation from further
category descriptions.



