.. status: ok


13.10 Origins
-------------

Aside from the notion of where an operation is implemented,
operation:origin a useful notion is the origin or home of an operation.
When an operation (such as quadraticFormquadraticFormQuadraticForm) is
explicitly exported by a domain (such as QuadraticForm), you can say
that the origin of that operation is that domain. If an operation is not
explicitly exported from a domain, it is inherited from, and has as
origin, the (closest) category that explicitly exports it. The
operations + and - (from AbelianMonoid) of QuadraticForm, for example,
are inherited from AbelianMonoid. As it turns out, AbelianMonoid is the
origin of virtually every + operation in FriCAS!

Again, you can use Browse to discover the origins of operations. From
the Browse page on QuadraticForm, click on Operations, then on origins
at the bottom of the page.

The origin of the operation is the only place where on-line
documentation is given. However, you can re-export an operation to give
it special documentation. Suppose you have just invented the world's
fastest algorithm for inverting matrices using a particular internal
representation for matrices. If your matrix domain just declares that it
exports MatrixCategory, it exports the inverse operation, but the
documentation the user gets from Browse is the standard one from
MatrixCategory. To give your version of inverse the attention it
deserves, simply export the operation explicitly with new documentation.
This redundancy gives inverse a new origin and tells Browse to present
your new documentation.



