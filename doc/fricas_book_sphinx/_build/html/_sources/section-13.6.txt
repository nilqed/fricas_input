.. status: ok



13.6 Representation
-------------------

The Implementation part of an FriCAS capsule for a domain constructor
uses the special variable Rep to Rep @ Rep identify the lower level data
type used to represent the objects representation:of a domain of the
domain. domain:representation The Rep for quadratic forms is
SquareMatrix(n, K). This means that all objects of the domain are
required to be n by n matrices with elements from K.

The code for quadraticForm in Figure
`figquadform <section-13.2.html#figquadform>`__ checks that the matrix
is symmetric and then converts it to $, which means, as usual, this
domain. Such explicit conversions conversion are generally required by
the compiler. Aside from checking that the matrix is symmetric, the code
for this function essentially does nothing. The m :: $ on line 28
coerces m to a quadratic form. In fact, the quadratic form you created
in step (3) of `ugDomainsDemo <section-13.4.html#ugDomainsDemo>`__ is
just the matrix you passed it in disguise! Without seeing this
definition, you would not know that. Nor can you take advantage of this
fact now that you do know! When we try in the next step of
`ugDomainsDemo <section-13.4.html#ugDomainsDemo>`__ to regard q as a
matrix by asking for nrows, the number of its rows, FriCAS gives you an
error message saying, in effect, \`\`Good try, but this won't work!''

The definition for the matrixmatrixQuadraticForm function could hardly
be simpler: it just returns its argument after explicitly coercing its
argument to a matrix. Since the argument is already a matrix, this
coercion does no computation.

Within the context of a capsule, an object of $ is regarded both as a
quadratic form and as a matrix.In case each of $ and Rep have the same
named operation available, the one from $ takes precedence. Thus, if you
want the one from Rep, you must package call it using a $Rep suffix.
This makes the definition of q.v easy---it just calls the
dotdotDirectProduct product from DirectProduct to perform the indicated
operation.



