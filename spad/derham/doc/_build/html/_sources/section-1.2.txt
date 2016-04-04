1.2 Exported methods
--------------------

Let us briefly disuss the exported methods of X=DERHAM:


**leadingCoefficient**
    Returns the leading coefficient, obviously, but what is the leading 
    coefficient?

::
    
    leadingCoefficient alpha

    
    c(x,y,z,0)
                                                    Type: Expression(Integer)

It seems that it is the first coefficient given in the OutputForm. 
It is not quite clear what happens when this order is changed by some method,
if possible at all (todo).

    
**leadingBasisTerm**
    Returns the basis form (corresponding to the leadingCoefficient).

::
    
    leadingBasisTerm alpha

     dy dz
                                         Type: DeRhamComplex(Integer,[x,y,z])

                                         
                                         
**reductum**
    Returns df minus the leading term of σ if σ has two or more terms, and 0 
    otherwise.

::
    
    reductum alpha

    99dx + b(x,y,z,0)dx dz + a(x,y,z,0)dx dy
                                         Type: DeRhamComplex(Integer,[x,y,z])

                                         
One can see that this works like a list of cons': head/tail where head can 
be split into coefficient and basis term and so on, allowing traverse the 
term recursively.


**coefficient**
    coefficient(σ, u), where σ is a differential form, returns the coefficient 
    of df containing the basis term u if such a term exists, and 0 otherwise.
    If we want the coefficient of the basis term d x∧d y for example:

::
    
    coefficient(alpha,dx*dy)

    a(x,y,z,0)
                                                    Type: Expression(Integer)

                                                    
**generator**
    generator(i) returns the i^th basis 1-form for X. For instance

::
    
    generator(1)$X

    dx
                                         Type: DeRhamComplex(Integer,[x,y,z])

The description given in derham.spad seems to be not quite suitable.


**homogeneous?**
    homogeneous?(σ) tests if all of the terms of differential form σ have 
    the same degree. The degree is defined as p if σ is a pure p-form.

::
    
    homogeneous? alpha

    (18)  false
                                                                Type: Boolean
                                                                                                                           
**retractable?**
    retractable?(σ) tests if differential form σ is a 0-form, i.e., if 
    degree(σ) = 0.

::
    
    retractable? (1::X)

    true
                                                                 Type: Boolean
    retractable? alpha

    false
                                                                 Type: Boolean
     
**degree**
    degree(σ) returns the homogeneous degree of differential form σ.

::
    
    degree alpha

    >> Error detected within library code:
    not a homogeneous element

    degree(dx*dy)

     2
                                                        Type: PositiveInteger


**map**
    map(f, σ) replaces each coefficient c of a differential form σ by f(c).
    For example let f:R→R⁣,x↦x^2, then all coefficients should be squared:

::
    
    f:R->R
                                                                   Type: Void
    f(x)==x^2
                                                                   Type: Void
    map(T,alpha)
                   2                           2                  2
    c(x,y,z,0) dy dz + 9801dx + b(x,y,z,0) dx dz + a(x,y,z,0) dx dy

                                         Type: DeRhamComplex(Integer,[x,y,z])


**totalDifferential**
    totalDifferential(f) returns the total differential (gradient) form for 
    a function f. 

::
    
    totalDifferential(a(x,y,z))$X

     a  (x,y,z)dz + a  (x,y,z)dy + a  (x,y,z)dx
          ,3             ,2             ,1
                                          Type: DeRhamComplex(Integer,[x,y,z])

Here, polynomial expressions are allowed as well:

    (27) -> totalDifferential(x^m)$X

            m - 1
     (27)  m x     dx
                                          Type: DeRhamComplex(Integer,[x,y,z])

even mixed ones:

(28) -> totalDifferential(x^2*sin(x-y)*b(z))$X

   (28)
        2           ,         2
     - x sin(y - x)b (z)dz - x b(z)cos(y - x)dy

   +
                             2
     (- 2x b(z)sin(y - x) + x b(z)cos(y - x))dx
                                          Type: DeRhamComplex(Integer,[x,y,z])

**exteriorDifferential**
    exteriorDifferential(σ) returns the exterior derivative of the differential
    form σ. This is the  well known d with d∘d=0. We will abbreviate it by

(29) -> d ==> exteriorDifferential
                                                                   Type: Void
(30) -> d alpha

   (30)  (c  (x,y,z,0) - b  (x,y,z,0) + a  (x,y,z,0))dx dy dz
           ,1             ,2             ,3
                                         Type: DeRhamComplex(Integer,[x,y,z])
                                       