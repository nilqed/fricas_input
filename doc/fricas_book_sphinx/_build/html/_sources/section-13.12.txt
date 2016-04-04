.. status: ok



13.12 Example 1: Clifford Algebra
---------------------------------

Now that we have QuadraticForm available, let's put it to use. Given
some quadratic form Q described by an n by n matrix over a field K, the
domain CliffordAlgebra(n, K, Q) defines a vector space of dimension 2n
over K. This is an interesting domain since complex numbers,
quaternions, exterior algebras and spin algebras are all examples of
Clifford algebras.

The basic idea is this: the quadratic form Q defines a basis e1,e2…,en
for the vector space Kn, the direct product of K with itself n times.
From this, the Clifford algebra generates a basis of 2n elements given
by all the possible products of the ei in order without duplicates, that
is,

1, e1, e2, e1e2, e3, e1e3, e2e3, e1e2e3, and so on.

The algebra is defined by the relations


.. spadMathOutput
.. math::

+------------------------------+
| eiei=Q(ei)eiej=-ejeifori≠j   |
+------------------------------+



Now look at the snapshot of its definition given below. Lines 9-10 show
part of the definitions of the Exports. A Clifford algebra over a field
K is asserted to be a ring, an algebra over K, and a vector space over
K. Its explicit exports include e(n), which returns the n-th unit
element.


.. spadVerbatim

::

 NNI ==> NonNegativeInteger
 PI  ==> PositiveInteger
 CliffordAlgebra(n,K,q): Exports == Implementation where
     n: PI
     K: Field
     q: QuadraticForm(n, K)
     Exports == Join(Ring,Algebra(K),VectorSpace(K)) with
       e: PI -> $
           ...        
     Implementation == add
       Qeelist :=  
         [q.unitVector(i::PI) for i in 1..n]
       dim     :=  2^n
       Rep     := PrimitiveArray K
       New ==> new(dim, 0$K)$Rep
       x + y ==
         z := New
         for i in 0..dim-1 repeat z.i := x.i + y.i
         z
       addMonomProd: (K, NNI, K, NNI, $) -> $
       addMonomProd(c1, b1, c2, b2, z) ==  ...
       x * y ==
         z := New
         for ix in 0..dim-1 repeat
           if x.ix \\notequal{} 0 then for iy in 0..dim-1 repeat
             if y.iy \\notequal{} 0
             then addMonomProd(x.ix,ix,y.iy,iy,z)
           z
            ...





Part of the CliffordAlgebra domain.



The Implementation part begins by defining a local variable Qeelist to
hold the list of all q.v where v runs over the unit vectors from 1 to
the dimension n. Another local variable dim is set to 2n, computed once
and for all. The representation for the domain is PrimitiveArray(K),
which is a basic array of elements from domain K. Line 18 defines New as
shorthand for the more lengthy expression new(dim,0$K)$Rep, which
computes a primitive array of length 2n filled with 0's from domain K.

Lines 19-22 define the sum of two elements x and y straightforwardly.
First, a new array of all 0's is created, then filled with the sum of
the corresponding elements. Indexing for primitive arrays starts at 0.
The definition of the product of x and y first requires the definition
of a local function addMonomProd. FriCAS knows it is local since it is
not an exported function. The types of all local functions must be
declared.



