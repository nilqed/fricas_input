1.2 Exported methods
--------------------

Let us briefly disuss the exported methods of X=DERHAM:


**leadingCoefficient**
    Returns the leading coefficient, obviously, but what is the leading 
    coefficient?

::
    
    leadingCoefficient(a*dx + b*dy + c*dz)

.. math::
    
    c
                                                    
:sub:`Type: Expression(Integer)`

It seems that it is the first coefficient given in the OutputForm. 
It is not quite clear what happens when this order is changed by some method,
if possible at all (todo).

    
**leadingBasisTerm**
    Returns the basis form (corresponding to the leadingCoefficient).

::
    
    leadingBasisTerm(a*dx + b*dy +c*dz)

.. math::

    dz


:sub:`Type: DeRhamComplex(Integer,[x,y,z])`

                                         
                                         
**reductum**
    Returns df minus the leading term of σ if σ has two or more terms, and 0 
    otherwise.

::
    
    reductum(a*dx + b*dy + c*dz)

.. math::

    b dy + a dx
    
                                         
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`

                                         
One can see that this works like a list of cons': head/tail where head can 
be split into coefficient and basis term and so on, allowing traverse the 
term recursively.


**coefficient**
    coefficient(σ, u), where σ is a differential form, returns the coefficient 
    of df containing the basis term u if such a term exists, and 0 otherwise.
    If we want the coefficient of the basis term d x∧d y for example:

::
    
    coefficient(a*dx + b*dy + c*dz, dy)

.. math::

    b


:sub:`Type: Expression(Integer)`

                                                    
**generator**
    generator(i) returns the i^th basis 1-form for X. For instance

::
    
    generator(1)$X

.. math::

    dx

    
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`

The description given in derham.spad seems to be not quite suitable.


**homogeneous?**
    homogeneous?(σ) tests if all of the terms of differential form σ have 
    the same degree. The degree is defined as p if σ is a pure p-form.

::
    
    homogeneous?(a*dx + b*dy + c*dz)

.. math::

    \mathrm{true}
                                                              
    
:sub:`Type: Boolean`
                                                              
Adding a term like ``dx*dy`` above would result in ``false``.
                                                              
                                                              
**retractable?**
    retractable?(σ) tests if differential form σ is a 0-form, i.e., if 
    degree(σ) = 0.

::
    
    retractable? (1::X)

.. math::

    \mathrm{true}
    
:sub:`Type: Boolean`

::
    
    retractable? dx

.. math::

    \mathrm{false}
    
                                                                 
:sub:`Type: Boolean`
     

**degree**
    degree(σ) returns the homogeneous degree of differential form σ.

::
    
    degree(dx+dx*dz)

    >> Error detected within library code:
    not a homogeneous element

    degree(dx*dy)

.. math::

     2
                                                        
  
:sub:`Type: PositiveInteger`


**map**
    map(f, σ) replaces each coefficient c of a differential form σ by f(c).
    For example let f:R→R⁣,x↦x^2, then all coefficients should be squared:

::
    
    R ==> Expression Integer 
    f:R->R                                                               
    f(x)==x^2
                                                                  
    map(f,a*dx + b*dy + c*dz)
   

.. math::

             
    c^2\, dz + b^2\, dy + a^2\, dx
                                         
    
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`


**totalDifferential**
    totalDifferential(f) returns the total differential (gradient) form for 
    a function f. 

::
    
    g:=operator 'g
    
    totalDifferential(g(x,y,z))$X

 
.. math::

  {{{g _ {{,3}}}
  \left(
  {x, \: y, \: z}
  \right)}
  \  dz}+{{{g _ {{,2}}}
  \left(
  {x, \: y, \: z}
  \right)}
  \  dy}+{{{g _ {{,1}}}
  \left(
  {x, \: y, \: z}
  \right)}
  \  dx}

    
                                        
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`

                                        
Here, polynomial expressions are allowed as well:

::

    totalDifferential(x^m)$X

    
.. math::

      m\,x^{m-1}\,dx
                                          
    
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`



                                          
**exteriorDifferential**
    exteriorDifferential(σ) returns the exterior derivative of the differential
    form σ. This is the  well known d with d∘d=0. We will abbreviate it by


    
::
    
    d ==> exteriorDifferential
    
    d(x*dy + z*dx*dy) 
    
.. math::

    {dx \  dy}+{dx \  dy \  dz}
  
     
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`
                              
:ref:`startpage`