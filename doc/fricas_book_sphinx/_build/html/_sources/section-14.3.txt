.. status: ok


14.3 Miscellaneous Features of Browse
-------------------------------------



14.3.1 The Description Page for Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From the constructor page of Matrix, click on Operations to bring up the
table of operations for Matrix.

Find the operation inverse in the table and click on it. This takes you
to a page showing the documentation for this operation.



|picture|



Operation inverseinverseMatrix from Matrix.





Here is the significance of the headings you see.



14.3.1.1 Arguments
~~~~~~~~~~~~~~~~~~

This lists each of the arguments of the operation in turn, paraphrasing
the signature of the operation. As for signatures, a $ is used to
designate this domain, that is, Matrix(R).





14.3.1.2 Returns
~~~~~~~~~~~~~~~~

This describes the return value for the operation, analogous to the
Arguments part.





14.3.1.3 Origin
~~~~~~~~~~~~~~~

This tells you which domain or category explicitly exports the
operation. In this example, the domain itself is the Origin.





14.3.1.4 Conditions
~~~~~~~~~~~~~~~~~~~

This tells you that the operation is exported by Matrix(R) only if R has
Field, that is, R is a member of category Field. When no Conditions part
is given, the operation is exported for all values of R.





14.3.1.5 Description
~~~~~~~~~~~~~~~~~~~~

Here are the ++ comments that appear in the source code of its Origin,
here Matrix. You find these comments in the source code for Matrix.



|picture|



Operations map from Matrix.





Click on |up button| to return to the table of operations. Click on map.
Here you find three different operations named map. This should not
surprise you. Operations are identified by name and signature. There are
three operations named map, each with different signatures. What you see
is the descriptions view of the operations. If you like, select the
button in the heading of one of these descriptions to get only that
operation.





14.3.1.6 Where
~~~~~~~~~~~~~~

This part qualifies domain parameters mentioned in the arguments to the
operation.







14.3.2 Views of Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~

We suggest that you go to the constructor page for Matrix and click on
Operations to bring up a table of operations with a Views panel at the
bottom.



14.3.2.1 names
~~~~~~~~~~~~~~

This view lists the names of the operations. Unlike constructors,
however, there may be several operations with the same name. The heading
for the page tells you the number of unique names and the number of
distinct operations when these numbers are different.





14.3.2.2 filter
~~~~~~~~~~~~~~~

As for constructors, you can use this button to cut down the list of
operations you are looking at. Enter, for example, m* into the input
area to the right of filter then click on filter. As usual, any logical
expression is permitted. For example, use


.. spadVerbatim

::

 *! or *?



to get a list of destructive operations and predicates.





14.3.2.3 documentation
~~~~~~~~~~~~~~~~~~~~~~

This gives you the most information: a detailed description of all the
operations in the form you have seen before. Every other button
summarizes these operations in some form.





14.3.2.4 signatures
~~~~~~~~~~~~~~~~~~~

This views the operations by showing their signatures.





14.3.2.5 parameters
~~~~~~~~~~~~~~~~~~~

This views the operations by their distinct syntactic forms with
parameters.





14.3.2.6 origins
~~~~~~~~~~~~~~~~

This organizes the operations according to the constructor that
explicitly exports them.





14.3.2.7 conditions
~~~~~~~~~~~~~~~~~~~

This view organizes the operations into conditional and unconditional
operations.





14.3.2.8 usage
~~~~~~~~~~~~~~

This button is only available if your user-level is set to user-level
development. The usage button produces a table of constructors that
reference this operation.FriCAS requires an especially long time to
produce this table, so anticipate this when requesting this information.





14.3.2.9 implementation
~~~~~~~~~~~~~~~~~~~~~~~

This button is only available if your user-level is set to development.
user-level If you enter values for all domain parameters on the
constructor page, then the implementation button appears in place of the
conditions button. This button tells you what domains or packages
actually implement the various operations.This button often takes a long
time; expect a delay while you wait for an answer.

With your user-level set to development, we suggest you try this
exercise. Return to the main constructor page for Matrix, then enter
Integer into the input area at the bottom as the value of R. Then click
on Operations to produce a table of operations. Note that the conditions
part of the Views table is replaced by implementation. Click on
implementation. After some delay, you get a page describing what
implements each of the matrix operations, organized by the various
domains and packages.



|picture|



Implementation domains for Matrix.









14.3.2.10 generalize
~~~~~~~~~~~~~~~~~~~~

This button only appears for an operation page of a constructor
involving a unique operation name.

From an operations page for Matrix, select any operation name, say rank.
In the views panel, the filter button is replaced by generalize. Click
on it! What you get is a description of all FriCAS operations named
rank.If there were more than 10 operations of the name, you get instead
a page with a Views panel at the bottom and the message to Select a view
below. To get the descriptions of all these operations as mentioned
above, select the description button.



|picture|



All operations named rank in FriCAS.









14.3.2.11 all domains
~~~~~~~~~~~~~~~~~~~~~

This button only appears on an operation page resulting from a search
from the front page of Browse or from selecting generalize from an
operation page for a constructor.

Note that the filter button in the Views panel is replaced by all
domains. Click on it to produce a table of all domains or packages that
export a rank operation.



|picture|



Table of all domains that export rank.





We note that this table specifically refers to all the rank operations
shown in the preceding page. Return to the descriptions of all the rank
operations and select one of them by clicking on the button in its
heading. Select all domains. As you see, you have a smaller table of
constructors. When there is only one constructor, you get the
constructor page for that constructor.







14.3.3 Capitalization Convention
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When entering search keys for constructors, you can use capital letters
to search for abbreviations. For example, enter UTS into the input area
and click on Constructors. Up comes a page describing
UnivariateTaylorSeries whose abbreviation is UTS.

Constructor abbreviations always have three or more capital letters. For
short constructor names (six letters or less), abbreviations are not
generally helpful as their abbreviation is typically the constructor
name in capitals. For example, the abbreviation for Matrix is MATRIX.

Abbreviations can also contain numbers. For example, POLY2 is the
abbreviation for constructor PolynomialFunctions2. For default packages,
the abbreviation is the same as the abbreviation for the corresponding
category with the & replaced by -. For example, for the category default
package MatrixCategory& the abbreviation is MATCAT- since the
corresponding category MatrixCategory has abbreviation MATCAT.





.. |picture| image:: ps/h-matinv.png
.. |picture| image:: ps/h-matmap.png
.. |up button| image:: ps/up.png
.. |picture| image:: ps/h-matimp.png
.. |picture| image:: ps/h-allrank.png
.. |picture| image:: ps/h-alldoms.png
