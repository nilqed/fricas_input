.. status: ok


9.7 CartesianTensor
-------------------

CartesianTensor(i0,dim,R) provides Cartesian tensors with components
belonging to a commutative ring R. Tensors can be described as a
generalization of vectors and matrices. This gives a concise tensor
algebra for multilinear objects supported by the CartesianTensor domain.
You can form the inner or outer product of any two tensors and you can
add or subtract tensors with the same number of components.
Additionally, various forms of traces and transpositions are useful.

The CartesianTensor constructor allows you to specify the minimum index
for subscripting. In what follows we discuss in detail how to manipulate
tensors.

Here we construct the domain of Cartesian tensors of dimension 2 over
the integers, with indices starting at 1.


.. spadInput
::

	CT := CARTEN(i0 := 1, 2, Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| CartesianTensor(1,2,Integer)   |
+--------------------------------+




.. spadType

:sub:`Type: Domain`





7.1 Forming tensors
~~~~~~~~~~~~~~~~~~~

Scalars can be converted to tensors of rank zero.


.. spadInput
::

	t0: CT := 8


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	rank t0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



Vectors (mathematical direct products, rather than one dimensional array
structures) can be converted to tensors of rank one.


.. spadInput
::

	v: DirectProduct(2, Integer) := directProduct [3,4]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [3,4]   |
+---------+




.. spadType

:sub:`Type: DirectProduct(2,Integer)`




.. spadInput
::

	Tv: CT := v


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [3,4]   |
+---------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



Matrices can be converted to tensors of rank two.


.. spadInput
::

	m: SquareMatrix(2, Integer) := matrix [ [1,2],[4,5] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [1245]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	Tm: CT := m


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [1245]   |
+----------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	n: SquareMatrix(2, Integer) := matrix [ [2,3],[0,1] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [2301]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	Tn: CT := n


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [2301]   |
+----------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



In general, a tensor of rank k can be formed by making a list of rank
k-1 tensors or, alternatively, a k-deep nested list of lists.


.. spadInput
::

	t1: CT := [2, 3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [2,3]   |
+---------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	rank t1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	t2: CT := [t1, t1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [2323]   |
+----------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	t3: CT := [t2, t2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [[2323],[2323]]   |
+-------------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	tt: CT := [t3, t3]; tt := [tt, tt]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------+
| [[[2323][2323][2323][2323]],[[2323][2323][2323][2323]]]   |
+-----------------------------------------------------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	rank tt


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 5   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`







7.2 Multiplication
~~~~~~~~~~~~~~~~~~

Given two tensors of rank k1 and k2, the outer
productproductCartesianTensor forms a new tensor of rank k1+k2. Here


.. spadMathOutput
.. math::

+-------------------------------+
| Tmn(i,j,k,l)=Tm(i,j)Tn(k,l)   |
+-------------------------------+




.. spadInput
::

	Tmn := product(Tm, Tn)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [[2301][4602][81204][101505]]   |
+---------------------------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



The inner product (contractcontractCartesianTensor) forms a tensor of
rank k1+k2-2. This product generalizes the vector dot product and
matrix-vector product by summing component products along two indices.

Here we sum along the second index of Tm and the first index of Tv. Here


.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadInput
::

	Tmv := contract(Tm,2,Tv,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [11,32]   |
+-----------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



The multiplication operator * is scalar multiplication or an inner
product depending on the ranks of the arguments.

If either argument is rank zero it is treated as scalar multiplication.
Otherwise, a*b is the inner product summing the last index of a with
the first index of b.


.. spadInput
::

	Tm*Tv


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [11,32]   |
+-----------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



This definition is consistent with the inner product on matrices and
vectors.


.. spadInput
::

	Tmv = m * v


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [11,32]=[11,32]   |
+-------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`







7.3 Selecting Components
~~~~~~~~~~~~~~~~~~~~~~~~

For tensors of low rank (that is, four or less), components can be
selected by applying the tensor to its indices.


.. spadInput
::

	t0()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	t1(1+1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	t2(2,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	t3(2,1,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	Tmn(2,1,2,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`



A general indexing mechanism is provided for a list of indices.


.. spadInput
::

	t0[]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	t1[2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	t2[2,1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The general mechanism works for tensors of arbitrary rank, but is
somewhat less efficient since the intermediate index list must be
created.


.. spadInput
::

	t3[2,1,2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	Tmn[2,1,2,1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: NonNegativeInteger`







7.4 Contraction
~~~~~~~~~~~~~~~

A contraction between two tensors is an inner product, as we have seen
above. You can also contract a pair of indices of a single tensor. This
corresponds to a trace in linear algebra. The expression
contract(t,k1,k2) forms a new tensor by summing the diagonal given by
indices in position k1 and k2.

This is the tensor given by


.. spadInput
::

	cTmn := contract(Tmn,1,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [121806]   |
+------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



Since Tmn is the outer product of matrix m and matrix n, the above is
equivalent to this.


.. spadInput
::

	trace(m) * n


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [121806]   |
+------------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



In this and the next few examples, we show all possible contractions of
Tmn and their matrix algebra equivalents.


.. spadInput
::

	contract(Tmn,1,2) = trace(m) * n


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [121806]=[121806]   |
+---------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`




.. spadInput
::

	contract(Tmn,1,3) = transpose(m) * n


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [27411]=[27411]   |
+-------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`




.. spadInput
::

	contract(Tmn,1,4) = transpose(m) * transpose(n)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [144195]=[144195]   |
+---------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`




.. spadInput
::

	contract(Tmn,2,3) = m * n


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [25817]=[25817]   |
+-------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`




.. spadInput
::

	contract(Tmn,2,4) = m * transpose(n)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| [82235]=[82235]   |
+-------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`




.. spadInput
::

	contract(Tmn,3,4) = trace(n) * m


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------+
| [361215]=[361215]   |
+---------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`







7.5 Transpositions
~~~~~~~~~~~~~~~~~~

You can exchange any desired pair of indices using the
transposetransposeCartesianTensor operation.

Here the indices in positions one and three are exchanged, that is,
tTmn(i,j,k,l)=Tmn(k,j,i,l).


.. spadInput
::

	tTmn := transpose(Tmn,1,3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [[23812][461015][0104][0205]]   |
+---------------------------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



If no indices are specified, the first and last index are exchanged.


.. spadInput
::

	transpose Tmn


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [[2800][41000][31214][61525]]   |
+---------------------------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



This is consistent with the matrix transpose.


.. spadInput
::

	transpose Tm = transpose m


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [1425]=[1425]   |
+-----------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`



If a more complicated reordering of the indices is required, then the
reindexreindexCartesianTensor operation can be used. This operation
allows the indices to be arbitrarily permuted.

This defines


.. spadInput
::

	rTmn := reindex(Tmn, [1,4,2,3])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [[2040][3162][80100][124155]]   |
+---------------------------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`







7.6 Arithmetic
~~~~~~~~~~~~~~

Tensors of equal rank can be added or subtracted so arithmetic
expressions can be used to produce new tensors.


.. spadInput
::

	tt := transpose(Tm)*Tn - Tn*transpose(Tm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [-6-1626]   |
+-------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	Tv*(tt+Tn)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [-4,-11]   |
+------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`




.. spadInput
::

	reindex(product(Tn,Tn),[4,3,2,1])+3*Tn*product(Tm,Tm)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| [[4684174212][57114228285][18245763][17306376]]   |
+---------------------------------------------------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`







7.7 Specific Tensors
~~~~~~~~~~~~~~~~~~~~

Two specific tensors have properties which depend only on the dimension.

The Kronecker delta satisfies


.. spadVerbatim

::

              +-
              |   1  if i  = j
 delta(i,j) = |
              |   0  if i ^= j
              +-




.. spadInput
::

	delta: CT := kroneckerDelta()


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [1001]   |
+----------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



This can be used to reindex via contraction.


.. spadInput
::

	contract(Tmn, 2, delta, 1) = reindex(Tmn, [1,3,4,2])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------+
| [[2436][0012][8101215][0045]]=[[2436][0012][8101215][0045]]   |
+---------------------------------------------------------------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`



The Levi Civita symbol determines the sign of a permutation of indices.


.. spadInput
::

	epsilon:CT := leviCivitaSymbol()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [01-10]   |
+-----------+




.. spadType

:sub:`Type: CartesianTensor(1,2,Integer)`



Here we have:


.. spadVerbatim

::

 epsilon(i1,...,idim)
      = +1  if i1,...,idim is an even permutation of i0,...,i0+dim-1
      = -1  if i1,...,idim is an  odd permutation of i0,...,i0+dim-1
      =  0  if i1,...,idim is not   a permutation of i0,...,i0+dim-1



This property can be used to form determinants.


.. spadInput
::

	contract(epsilon*Tm*epsilon, 1,2) = 2 * determinant m


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| -6=-6   |
+---------+




.. spadType

:sub:`Type: Equation CartesianTensor(1,2,Integer)`







7.8 Properties of the CartesianTensor domain
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GradedModule(R,E) denotes E-graded R-module, that is, a collection of
R-modules indexed by an abelian monoid E. An element g of G[s] for some
specific s in E is said to be an element of G with
degreedegreeGradedModule s. Sums are defined in each module G[s] so two
elements of G can be added if they have the same degree. Morphisms can
be defined and composed by degree to give the mathematical category of
graded modules.

GradedAlgebra(R,E) denotes E-graded R-algebra. A graded algebra is a
graded module together with a degree preserving R-bilinear map, called
the productproductGradedAlgebra.


.. spadVerbatim

::

 degree(product(a,b))    = degree(a) + degree(b)
 product(r*a,b)          = product(a,r*b) = r*product(a,b)
 product(a1+a2,b)        = product(a1,b) + product(a2,b)
 product(a,b1+b2)        = product(a,b1) + product(a,b2)
 product(a,product(b,c)) = product(product(a,b),c)



The domain CartesianTensor(i0, dim, R) belongs to the category
GradedAlgebra(R, NonNegativeInteger). The non-negative integer
degreedegreeGradedAlgebra is the tensor rank and the graded algebra
productproductGradedAlgebra is the tensor outer product. The graded
module addition captures the notion that only tensors of equal rank can
be added.

If V is a vector space of dimension dim over R, then the tensor module
T[k](V) is defined as


.. spadVerbatim

::

 T[0](V) = R
 T[k](V) = T[k-1](V) * V



where * denotes the R-module tensor productproductGradedAlgebra.
CartesianTensor(i0,dim,R) is the graded algebra in which the degree k
module is T[k](V).





7.9 Tensor Calculus
~~~~~~~~~~~~~~~~~~~

It should be noted here that often tensors are used in the context of
tensor-valued manifold maps. This leads to the notion of covariant and
contravariant bases with tensor component functions transforming in
specific ways under a change of coordinates on the manifold. This is no
more directly supported by the CartesianTensor domain than it is by the
Vector domain. However, it is possible to have the components implicitly
represent component maps by choosing a polynomial or expression type for
the components. In this case, it is up to the user to satisfy any
constraints which arise on the basis of this interpretation.





