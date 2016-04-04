.. status: ok


13.9 Defaults
-------------

In Chapter `ugPackages <section-11.0.html#ugPackages>`__ we saw that
categories can provide default implementations for their operations. How
and when are they used? When FriCAS finds that QuadraticForm(2, Fraction
Integer) does not implement the operations *, +, and -, it goes to
SquareMatrix(2,Fraction Integer) to find it. As it turns out,
SquareMatrix(2, Fraction Integer) does not implement any of these
operations!

What does FriCAS do then? Here is its overall strategy. First, FriCAS
looks for a function in the capsule for the domain. If it is not there,
FriCAS looks in the add-domain for the operation. If that fails, FriCAS
searches the add-domain of the add-domain, and so on. If all those fail,
it then searches the default packages for the categories of which the
domain is a member. In the case of QuadraticForm, it searches
AbelianGroup, then its parents, grandparents, and so on. If this fails,
it then searches the default packages of the add-domain. Whenever a
function is found, the search stops immediately and the function is
returned. When all fails, the system calls error to report this
unfortunate news to you. To find out the actual order of constructors
searched for QuadraticForm, consult Browse: from the QuadraticForm,
click on Cross Reference, then on Lineage.

Let's apply this search strategy for our example 3*q-q+q. The scalar
multiplication comes first. FriCAS finds a default implementation in
AbelianGroup&. Remember from
`ugCategoriesDefaults <section-12.6.html#ugCategoriesDefaults>`__ that
SemiGroup provides a default definition for xn by repeated squaring.
AbelianGroup similarly provides a definition for nx by repeated
doubling.

But the search of the defaults for QuadraticForm fails to find any + or
* in the default packages for the ancestors of QuadraticForm. So it now
searches among those for SquareMatrix. Category MatrixCategory, which
provides a uniform interface for all matrix domains, is a grandparent of
SquareMatrix and has a capsule defining many functions for matrices,
including matrix addition, subtraction, and scalar multiplication. The
default package MatrixCategory& is where the functions for + and - (from
QuadraticForm) come from.

You can use Browse to discover where the operations for QuadraticForm
are implemented. First, get the page describing QuadraticForm. With your
mouse somewhere in this window, type a 2, press the Tab key, and then
enter Fraction Integer to indicate that you want the domain
QuadraticForm(2, Fraction Integer). Now click on Operations to get a
table of operations and on * to get a page describing the * operation.
Finally, click on implementation at the bottom.



