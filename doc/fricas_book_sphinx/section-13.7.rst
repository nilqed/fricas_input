.. status: ok


13.7 Multiple Representations
-----------------------------

To write functions that implement the operations of a domain, you want
to choose the most computationally efficient data structure to represent
the elements of your domain.

A classic problem in computer algebra is the optimal choice for an
internal representation of polynomials. If you create a polynomial, say
3x2+5, how does FriCAS hold this value internally? There are many ways.
FriCAS has nearly a dozen different representations of polynomials, one
to suit almost any purpose. Algorithms for solving polynomial equations
work most efficiently with polynomials represented one way, whereas
those for factoring polynomials are most efficient using another. One
often-used representation is a list of terms, each term consisting of
exponent-coefficient records written in the order of decreasing
exponents. For example, the polynomial 3x2+5 is represented by the list
[[e:2,c:3],[e:0,c:5]].

What is the optimal data structure for a matrix? It depends on the
application. For large sparse matrices, a linked-list structure of
records holding only the non-zero elements may be optimal. If the
elements can be defined by a simple formula f(i,j), then a compiled
function for f may be optimal. Some programmers prefer to represent
ordinary matrices as vectors of vectors. Others prefer to represent
matrices by one big linear array where elements are accessed with
linearly computable indexes.

While all these simultaneous structures tend to be confusing, FriCAS
provides a helpful organizational tool for such a purpose: categories.
PolynomialCategory, for example, provides a uniform user interface
across all polynomial types. Each kind of polynomial implements
functions for all these operations, each in its own way. If you use only
the top-level operations in PolynomialCategory you usually do not care
what kind of polynomial implementation is used.

Within a given domain, however, you define (at most) one
representation.You can make that representation a Union type, however.
See `ugTypesUnions <section-2.5.html#ugTypesUnions>`__ for examples of
unions. If you want to have multiple representations (that is, several
domains, each with its own representation), use a category to describe
the Exports, then define separate domains for each representation.



