.. status: ok


14.1 The Front Page: Searching the Library
------------------------------------------

To enter Browse, click on Browse on the top level page of HyperDoc to
get the front page of Browse.



|picture|



The Browse front page.





To use this page, you first enter a search string into the input area at
the top, then click on one of the buttons below. We show the use of each
of the buttons by example.



14.1.1 Constructors
~~~~~~~~~~~~~~~~~~~

First enter the search string Matrix into the input area and click on
Constructors. What you get is the constructor page for Matrix. We show
and describe this page in detail in
`ugBrowseDomain <section-14.2.html#ugBrowseDomain>`__ . By convention,
FriCAS does a case-insensitive search for a match. Thus matrix is just
as good as Matrix, has the same effect as MaTrix, and so on. We
recommend that you generally use small letters for names however. A
search string with only capital letters has a special meaning (see
`ugBrowseCapitalizationConvention <section-14.3.html#ugBrowseCapitalizationConvention>`__
).

Click on |up button| to return to the Browse front page.

Use the symbol * in search strings as a wild card. A wild card matches
any substring, including the empty string. For example, enter the search
string *matrix* into the input area and click on Constructors.To get
only categories, domains, or packages, rather than all constructors, you
can click on the corresponding button to the right of Constructors. What
you get is a table of all constructors whose names contain the string
matrix.



|picture|



Table of exposed constructors matching *matrix* .





All constructors containing the string are listed, whether exposed or
unexposed. You can hide the names of the unexposed constructors by
clicking on the *= unexposed button in the Views panel at the bottom of
the window. (The button will change to exposed only.)

One of the names in this table is Matrix. Click on Matrix. What you get
is again the constructor page for Matrix. As you see, Browse gives you a
large network of information in which there are many ways to reach the
same pages. Matrix

Again click on the |up button| to return to the table of constructors
whose names contain matrix.

Below the table is a Views panel. This panel contains buttons that let
you view constructors in different ways. To learn about views of
constructors, skip to
`ugBrowseViewsOfConstructors <section-14.2.html#ugBrowseViewsOfConstructors>`__
.

Click on |up button| to return to the Browse front page.





14.1.2 Operations
~~~~~~~~~~~~~~~~~

Enter *matrix into the input area and click on Operations. This time
you get a table of operations whose names end with matrix or Matrix.



|picture|



Table of operations matching *matrix .





If you select an operation name, you go to a page describing all the
operations in FriCAS of that name. At the bottom of an operation page is
another kind of Views panel, one for operation pages. To learn more
about these views, skip to
`ugBrowseViewsOfOperations <section-14.3.html#ugBrowseViewsOfOperations>`__
.

Click on |up button| to return to the Browse front page.





14.1.3 Attributes
~~~~~~~~~~~~~~~~~

This button gives you a table of attribute names that match the search
string. Enter the search string * and click on Attributes to get a list
of all system attributes.

Click on |up button| to return to the Browse front page.



|picture|



Table of FriCAS attributes.





Again there is a Views panel at the bottom with buttons that let you
view the attributes in different ways.





14.1.4 General
~~~~~~~~~~~~~~

This button does a general search for all constructor, operation, and
attribute names matching the search string. Enter the search string
*matrix* into the input area. Click on General to find all constructs
that have matrix as a part of their name.



|picture|



Table of all constructs matching *matrix* .





The summary gives you all the names under a heading when the number of
entries is less than 10.

Click on |up button| to return to the Browse front page.





14.1.5 Documentation
~~~~~~~~~~~~~~~~~~~~

Again enter the search key *matrix* and this time click on
Documentation. This search matches any constructor, operation, or
attribute name whose documentation contains a substring matching matrix.



|picture|



Table of constructs with documentation matching *matrix* .





Click on |up button| to return to the Browse front page.





14.1.6 Complete
~~~~~~~~~~~~~~~

This search combines both General and Documentation.



|picture|



Table summarizing complete search for pattern *matrix* .









.. |picture| image:: ps/h-brfront.png
.. |up button| image:: ps/up.png
.. |picture| image:: ps/h-consearch.png
.. |picture| image:: ps/h-matrixops.png
.. |picture| image:: ps/h-atsearch.png
.. |picture| image:: ps/h-gensearch.png
.. |picture| image:: ps/h-docsearch.png
.. |picture| image:: ps/h-comsearch.png
