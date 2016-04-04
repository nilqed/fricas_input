.. status: ok


12.10 Parameters
----------------

Like domain constructors, category constructors can also have
parameters. For example, category MatrixCategory is a parameterized
category for defining matrices over a ring R so that the matrix domains
can have different representations and indexing schemes. Its definition
has the form:


.. spadVerbatim

::

 MatrixCategory(R,Row,Col): Category ==
     TwoDimensionalArrayCategory(R,Row,Col) with ...



The category extends TwoDimensionalArrayCategory with the same
arguments. You cannot find TwoDimensionalArrayCategory in the algebraic
hierarchy listing. Rather, it is a member of the data structure
hierarchy, given inside the back cover of this book. In particular,
TwoDimensionalArrayCategory is an extension of HomogeneousAggregate
since its elements are all one type.

The domain Matrix(R), the class of matrices with coefficients from
domain R, asserts that it is a member of category MatrixCategory(R,
Vector(R), Vector(R)). The parameters of a category must also have
types. The first parameter to MatrixCategory R is required to be a ring.
The second and third are required to be domains of category
FiniteLinearAggregate(R). This is another extension of
HomogeneousAggregate that you can see in the data structure hierarchy.
In practice, examples of categories having parameters other than domains
are rare.

Adding the declarations for parameters to the definition for
MatrixCategory, we have:


.. spadVerbatim

::

 R: Ring
 (Row, Col): FiniteLinearAggregate(R)
 MatrixCategory(R, Row, Col): Category ==
     TwoDimensionalArrayCategory(R, Row, Col) with ...





