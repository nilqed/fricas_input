

2.0 Package Details
-------------------

:Package Name: DifferentialForms
:Abbreviation: DFORM
:Source files: dform.spad
:Dependent on: DeRhamComplex (DERHAM)

::
    
    DifferentialForms(R,v) 
    
    R: Join(Ring,Comparable)   -- e.g. Integer
    v: List Symbol             -- e.g. [x,y,z] or [x[0],x[1],x[2]]

    X ==> Expression R         -- function Ring
    

For the examples following, we choose ``R=Integer`` and 
``v=[x[0],x[1],x[2],x[3]]``, and the abbreviation ``M:=DFORM(R,v)``.

    
2.1 The metric g
----------------
Some functions expect the metric ``g`` as a parameter. Generally this
will be provided by an invertible square matrix ``g:SquareMatrix(#v,X)``. 

For the examples following, we choose the Minkowski metric:::
    
    g := diagonalMatrix([-1,1,1,1])@SquareMatrix(4,Integer)
    
.. math::

  \left[
  \begin{array}{cccc}
  -1 & 0 & 0 & 0 \\
  0 & 1 & 0 & 0 \\
  0 & 0 & 1 & 0 \\
  0 & 0 & 0 & 1
  \end{array}
  \right]
  
:sub:`Type: SquareMatrix(4,Integer)`

  
2.2 Exported Functions
----------------------

The function **baseForms** return the basis one forms, while **coordVector**
returns a list of the coordinates. The function **coordSymbols** also returns
the coordinates, however, as symbols only (convenient when used by **D**).

::
    
    SMR ==> SquareMatrix(#v,X)
    DRC ==> DeRhamComplex(R,v)

    dx:=baseForms()$M     -- [dx[0],...,dx[3]]
    x:=coordVector()$M    -- [x[0],...,x[3]]
    xs:=coordSymbols()$M  -- as above but as List Symbol (for differentiation)

    
2.2.1 Volume Form
~~~~~~~~~~~~~~~~~

**volumeForm**
  Given a metric :math:`g` the function returns the corresponding volume 
  element of the Riemannian (pseudo-) manifold.   

::
    
    volumeForm : SquareMatrix(#v,X) -> DeRhamComplex(R,v)
    
    volumeForm(g)$M

.. math::

  {dx _ {0}} \  {dx _ {1}} \  {dx _ {2}} \  {dx _ {3}}
  
:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`


2.2.1 Scalar Product
~~~~~~~~~~~~~~~~~~~~

**dot**
  Compute the inner product of two differential forms with respect to the
  metric ``g``.
  
::

    
    dot : (SMR,DRC,DRC) -> X
    
    dot(g,dx.1*dx.2,dx.1*dx.2)$M   -- note dx.1 corresponds to dx[0].
    
.. math::

    - 1
    
:sub:`Type: Expression(Integer)`

2.2.2 Hodge Star Operator
~~~~~~~~~~~~~~~~~~~~~~~~~

**hodgeStar**
 Compute the Hodge dual form of a differential form with respect
 to a metric ``g``.
 
 
::
    
    hodgeStar : (SMR,DRC) -> DRC
     
    hodgeStar(g,dx.2 * dx.3)
    
.. math::

   {dx _ {0}} \  {dx _ {3}}
   
:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`

2.2.3 Interior Product
~~~~~~~~~~~~~~~~~~~~~~

**interiorProduct**
  Calculate the interior product :math:`i_X(a)` of the vector field X
  with the differential form a.
  
::
    
  interiorProduct : (Vector(X),DRC) -> DRC
  
  interiorProduct(vector x, dx.1*dx.3)$M
  
.. math::

  {{x _ {0}} \  {dx _ {2}}} -{{x _ {2}} \  {dx _ {0}}}
  
:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`


2.2.4 Lie Derivative
~~~~~~~~~~~~~~~~~~~~

**lieDerivative**
    Calculates the Lie derivative :math:`\mathcal{L}_X(a)` of the differential 
    form a with respect to the vector field X.
      
::
    
    lieDerivative : (Vector(X),DRC) -> DRC
    
    lieDerivative(vector x, dx.1 * dx.3 * dx.4)
    
      
.. math::

  3 \  {dx _ {0}} \  {dx _ {2}} \  {dx _ {3}}
  
:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`


2.2.5 Projection
~~~~~~~~~~~~~~~~

**proj**
  Project to homogeneous terms of degree p.
  
::
    
    NNI ==> NonNegativeInteger
    proj : (NNI,DRC) -> DRC
    
    proj(2, 2*dx.1 + dx.2*dx.3 - dx.3*dx.4)
    
.. math::

   -{{dx _ {2}} \  {dx _ {3}}}+{{dx _ {1}} \  {dx _ {2}}}
   
:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`

2.2.6 Monomials
~~~~~~~~~~~~~~~

**monomials**
  List all monomials of degree p (p in 1..n).
  This is a basis for :math:`\Lambda_p^n`.
  
::
    
    monomials : NNI -> List DRC
    
    monomials(3)$M
    
.. math::

  \left[
  {{dx _ {0}} \  {dx _ {1}} \  {dx _ {2}}}, \: {{dx _ {0}} \  {dx _
  {1}} \  {dx _ {3}}}, \: {{dx _ {0}} \  {dx _ {2}} \  {dx _ {3}}}, \:
  {{dx _ {1}} \  {dx _ {2}} \  {dx _ {3}}}
  \right]
  
:sub:`Type: List DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`

2.2.7 Atomize Basis Term
~~~~~~~~~~~~~~~~~~~~~~~~

**atomizeBasisTerm**
  Given a basis term, return a list of the generators (atoms).
  
::
    
    atomizeBasisTerm : DRC -> List DRC
    
    atomizeBasisTerm(dx.1 * dx.2 * dx.4) 
    
.. math::

  \left[
   {dx _ {0}}, \: {dx _ {1}}, \: {dx _ {3}}
  \right]
  
:sub:`Type: List(DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]]))`

2.2.8 Conjugate Basis Term
~~~~~~~~~~~~~~~~~~~~~~~~~~

**conjBasisTerm**
  Return the complement of a basis term with respect to the Euclidean
  volume form.
  
::
    
    conjBasisTerm : DRC -> DRC
    
    conjBasisTerm dx.4
    
.. math::

   {dx _ {0}} \  {dx _ {1}} \  {dx _ {2}}

:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`


2.2.9 Scalar and Vector Field
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**vectorField**
  Generate a generic vector field named by a given symbol.
  
**covectorField**
  Generate a generic co-vector field named by a given symbol.
  
**scalarField**
  Generate a generic scalar field named by a given symbol.


::
    
   vectorField   : Symbol -> List X
   covectorField : Symbol -> List DRC
   scalarField   : Symbol -> X
   
   vectorField(Q)$M
   scalarField(f)$M
   
   

.. math::

   \left[
   {{Q _ {1}}
   \left(
   {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
   \right)},
   \: {{Q _ {2}}
   \left(
   {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
   \right)},
   \: {{Q _ {3}}
   \left(
   {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
   \right)},
   \: {{Q _ {4}}
   \left(
   {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
   \right)}
   \right]

:sub:`Type: List(Expression(Integer))`


.. math::

  f
  \left(
   {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
  \right)
  

:sub:`Type: Expression(Integer)`


2.2.10 Miscellaneous Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A *zero form* with symbol s can be generated by

::
    
    zeroForm : Symbol -> DRC
    
    zeroForm(s)$M
    
   
.. math::

  s
  \left(
   {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
  \right)
   
:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`

A synonym for the **exteriorDerivative** is the common operator **d**:

::
    
    d : DRC -> DRC
    
    d zeroForm(f)$M
    
.. math::

  {{{f _ {{,4}}}
  \left(
  {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
  \right)}
  \  {dx _ {3}}}+{{{f _ {{,3}}}
  \left(
  {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
  \right)} 
  \  {dx _ {2}}}+ \\ {{{f _ {{,2}}}
  \left(
  {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
  \right)}
  \  {dx _ {1}}}+{{{f _ {{,1}}}
  \left(
  {{x _ {0}}, \: {x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
  \right)}
  \  {dx _ {0}}}

 
The special zero forms **0** and **1** can be generated by

:: 
    
    one :  -> DRC
    zero : -> DRC
    
    zero()$M
    one()$M
    

There are also some special multiplication operators which allow to deal
with a kind *vector valued* forms (actually lists):

::
    
      _* : (List X, List DRC)   -> DRC
      _* : (List DRC, List DRC) -> DRC

      Note: the lists must have dimension #v.
      
      For instance:
      
      x * dx 
      
.. math::

  {{x _ {3}} \  {dx _ {3}}}+{{x _ {2}} \  {dx _ {2}}}+{{x _ {1}} \
  {dx _ {1}}}+{{x _ {0}} \  {dx _ {0}}}
  
  
An example for the second case:

::
    
    dx*[hodgeStar(g,dx.j)$M for j in 1..4]
    
.. math::

  2 \  {dx _ {0}} \  {dx _ {1}} \  {dx _ {2}} \  {dx _ {3}}
  
  
:sub:`Type: DeRhamComplex(Integer,[x[0],x[1],x[2],x[3]])`


      