.. status: ok


13.2 Definitions
----------------

The syntax for defining a domain constructor is the same as for any
function in FriCAS:



 DomainForm : Exports == Implementation



As this definition usually extends over many lines, a where expression
is generally used instead. where

| A recommended format for the definition of a domain is:

 DomainForm : Exports == Implementation where
 optional type declarations
 Exports == [ Category Assertions] with
 list of exported operations
 Implementation == [ Add Domain] add
 [Rep := Representation]
 list of function definitions for exported operations

Note: The brackets [ ] here denote optionality.

A complete domain constructor definition for QuadraticForm is shown
below. Interestingly, this little domain illustrates all the new
concepts you need to learn.


.. spadVerbatim

::

 )abbrev domain QFORM QuadraticForm
 ++ Description:
 ++   This domain provides modest support for
 ++   quadratic forms.
 QuadraticForm(n, K): Exports == Implementation where
     n: PositiveInteger
     K: Field
     Exports == AbelianGroup with                --The exports
       quadraticForm: SquareMatrix(n,K) -> $     --export this
         ++ \\bs{}axiom\\{quadraticForm(m)\\} creates a quadratic
         ++ quadratic form from a symmetric,
         ++ square matrix \\bs{}axiom\\{m\\}.
       matrix:  $ -> SquareMatrix(n,K)           -- export matrix
         ++ \\bs{}axiom\\{matrix(qf)\\} creates a square matrix
         ++ from the quadratic form \\bs{}axiom\\{qf\\}.
       elt: ( $, DirectProduct(n,K)) -> K        -- export elt
         ++ \\bs{}axiom\\{qf(v)\\} evaluates the quadratic form
         ++ \\bs{}axiom\\{qf\\} on the vector \\bs{}axiom\\{v\\},
         ++ producing a scalar.
     Implementation == SquareMatrix(n,K) add     --The exports
       Rep := SquareMatrix(n,K)                  --representation
       quadraticForm m ==                        --definition 
         not symmetric? m => error                      
           "quadraticForm requires a symmetric matrix"
         m :: $
       matrix q == q :: Rep                      --definition 
       elt(q,v) == dot(v, (matrix q * v))        --definition 





The QuadraticForm domain.



A domain constructor can take any number and type of parameters.
QuadraticForm takes a positive integer n and a field K as arguments.
Like a package, a domain has a set of explicit exports and an
implementation described by a capsule. Domain constructors are
documented in the same way as package constructors.

Domain QuadraticForm(n, K), for a given positive integer n and domain K,
explicitly exports three operations:

-  quadraticForm(A) creates a quadratic form from a matrix A.
-  matrix(q) returns the matrix A used to create the quadratic form q.
-  q.v computes the scalar vTAv for a given vector v.

Compared with the corresponding syntax given for the definition of a
package, you see that a domain constructor has three optional parts to
its definition: Category Assertions, Add Domain, and Representation.



