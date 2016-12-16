=======
4 Usage
=======

4.0 Examples
------------

In this chapter some examples are provided.

4.1 Calculus in :math:`\mathbb{R}^3`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will prove the following identities (see the summary, 4.1.4, for details):

.. math::

    d\,f = [\mathtt{grad}\,f]_1 \\
    d\,[T]_1 = [\mathtt{curl}\,T]_2 \\
    d\,[T]_2 = [\mathtt{div}\,T]_3

Let M denote our differential graded algebra on :math:`\mathbb{R}^3`. In
FriCAS we can express this as

::
    
     M ==> DFORM(INT,[x,y,z])
     
.. math::

   \mathtt{DifferentialForms(Integer,[x,y,z])}
   
:sub:`Type: Type`

The list of available methods can be seen by

::
    
    )show M
    
    DifferentialForms(Integer,[x,y,z]) is a package constructor.
    Abbreviation for DifferentialForms is DFORM
    This constructor is exposed in this frame.
    ------------------------------- Operations --------------------------------

    coordSymbols : () -> List(Symbol)
    ...
    baseForms : () -> List(DeRhamComplex(Integer,[x,y,z]))
    coordVector : () -> List(Expression(Integer))
    .
    .
    .
    
The position vector :math:`P=(x,y,z)` and the basis of one forms can be
obtained by

::
    
    P:=coordVector()$M
    
.. math::

    [x,y,z]
    
:sub:`Type: List(Expression(Integer))`

and

::
    
     dP:=baseForms()$M
     
.. math::

   [dx,dy,dz]
   
:sub:`Type: List(DeRhamComplex(Integer,[x,y,z]))`

This way we can call the coordinates as :math:`P.i` and the basis one forms
as :math:`dP.i`. Of course, we can also use :math:`dx,dy,dz` directly when
we set 

::
    
    [dx,dy,dz]:=baseForms()$M
    
or when we use the generators of the domain ``DeRhamComplex`` itself:

::
    
     dx:=generator(1)$DERHAM(INT,[x,y,z])
     dy:= ...
     

The first method, however, is quite convenient when using indexed coordinates
and also because we can form expressions like

::
    
    P * dP
    
.. math::

     z\ dz + y\ dy + x\ dx
     
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`.

4.1.1 Gradient
..............
There are many ways to create a zero form, one of those is

::
    
    f := zeroForm(f)$M
    
.. math::

   f(x,y,z)
   
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`

Now we apply the exterior differential operator to f:

::
    
    d f
    
.. math::

   {{{f _ {{,3}}}
   \left(
   {x, \: y, \: z}
   \right)}
   \  dz}+{{{f _ {{,2}}}
   \left(
   {x, \: y, \: z}
   \right)}
   \  dy}+{{{f _ {{,1}}}
   \left(
   {x, \: y, \: z}
   \right)}
   \  dx}

:sub:`Type: DeRhamComplex(Integer,[x,y,z])`

The coefficients of :math:`df` are just

::
    
    [coefficient(d f, dP.j) for j in 1..3]


.. math::

  \left[
  {{f _ {{,1}}}
  \left(
  {x, \: y, \: z}
  \right)},
  \: {{f _ {{,2}}}
  \left(
  {x, \: y, \: z}
  \right)},
  \: {{f _ {{,3}}}
  \left(
  {x, \: y, \: z}
  \right)}
 \right]
 
:sub:`Type: List(Expression(Integer))` 
 
the components of the gradient vector :math:`\nabla f` of :math:`f`.

4.1.2 Curl
..........

Let T be a generic vector field on :math:`M=\mathbb{R}^3`:

::
    
    T := vectorField(T)$M
    
.. math::

    \left[
    {{T _ {1}}
    \left(
    {x, \: y, \: z}
    \right)},
    \: {{T _ {2}}
    \left(
    {x, \: y, \: z}
    \right)},
    \: {{T _ {3}}
    \left(
    {x, \: y, \: z}
    \right)}
    \right]
    
:sub:`Type: List(Expression(Integer))`

Then we build the general one form :math:`\tau`:

::
    
    tau := T * dP
    
.. math;;

   {{{T _ {3}}
   \left(
    {x, \: y, \: z}
   \right)}
   \  dz}+{{{T _ {2}}
   \left(
   {x, \: y, \: z}
   \right)}
   \  dy}+{{{T _ {1}}
   \left(
   {x, \: y, \: z}
   \right)}
   \  dx}

Now we apply the exterior differential operator :math:`d`:

::
    
    d tau
    
.. math::

    \scriptstyle{
    {{\left( {{{T _ {3}} _ {{,2}}}
    \left(
    {x, \: y, \: z}
    \right)}
    -{{{T _ {2}} _ {{,3}}}
    \left(
    {x, \: y, \: z}
    \right)}
    \right)}
    \  dy \  dz}+{{\left( {{{T _ {3}} _ {{,1}}}
    \left(
    {x, \: y, \: z}
    \right)}
    -{{{T _ {1}} _ {{,3}}}
    \left(
    {x, \: y, \: z}
    \right)}
    \right)}
    \  dx \  dz}+  \\ {{\left( {{{T _ {2}} _ {{,1}}}
    \left(
    {x, \: y, \: z}
    \right)}
    -{{{T _ {1}} _ {{,2}}}
    \left(
    {x, \: y, \: z}
    \right)}
    \right)}
    \  dx \  dy}
    }

    
:sub:`Type: DeRhamComplex(Integer,[x,y,z])`

Next, we want to extract the coefficients:

::
    
    [coefficient(d tau, m) for m in monomials(2)$M]


.. math::

    \scriptstyle{
    \left[
    {{{{T _ {2}} _ {{,1}}}
    \left(
    {x, \: y, \: z}
    \right)}
    -{{{T _ {1}} _ {{,2}}}
    \left(
    {x, \: y, \: z}
    \right)}},
    \: {{{{T _ {3}} _ {{,1}}}
    \left(
    {x, \: y, \: z}
    \right)}
    -{{{T _ {1}} _ {{,3}}}
    \left(
    {x, \: y, \: z}
    \right)}},
    \: {{{{T _ {3}} _ {{,2}}}
    \left(
    {x, \: y, \: z}
    \right)}
    -{{{T _ {2}} _ {{,3}}}
    \left(
    {x, \: y, \: z}
    \right)}}
    \right]}

The (well known) **curl** is defined as

.. math::

    \mathtt{curl}(T) =\nabla\times T= \scriptstyle{
    \left(
    \frac{\partial T_3}{\partial y} - \frac{\partial T_2}{\partial z},
    \frac{\partial T_1}{\partial z} - \frac{\partial T_3}{\partial x},
    \frac{\partial T_2}{\partial x} - \frac{\partial T_1}{\partial y}
    \right)}
    
::
    
    curl(V) == [D(V.3,y)-D(V.2,z),D(V.1,z)-D(V.3,x),D(V.2,x)-D(V.1,y)]
 
    
We now **claim** that the following identity holds:

.. math::

  d (T\, dP) =  \star(\mathtt{curl}(V)\, dP)
  
where ``*`` denotes the Hodge star operator with respect to the Euclidean
metric

::
    
    g:=diagonalMatrix([1,1,1])
    
.. math::

   \left[
   \begin{array}{ccc}
   1 & 0 & 0 \\
   0 & 1 & 0 \\
   0 & 0 & 1
   \end{array}
   \right]

To prove it we just have to test:

::
    
     test( d(T*dP) = hodgeStar(g,curl(T)*dP)$M )
     
.. math::

    \mathtt{true}
    
:sub:`Type: Boolean`

4.1.3 Divergence
................

Again, let T be a generic vector field on :math:`M=\mathbb{R}^3`, then the
divergence is defined by

.. math::

   \mathtt{div}(T) = \nabla \bullet T =
   \scriptstyle{
   \frac{\partial T_1}{\partial x} +
   \frac{\partial T_2}{\partial y} +
   \frac{\partial T_3}{\partial z}}.
   
When we calculate

::
    
    d hodgeStar(g, T*dP)$M
    
we get the 3-form

.. math::

    {\left( {{{T _ {3}} _ {{,3}}}
    \left(
    {x, \: y, \: z}
    \right)}+{{{T
    _ {2}} _ {{,2}}}
    \left(
    {x, \: y, \: z}
    \right)}+{{{T
    _ {1}} _ {{,1}}}
    \left(
    {x, \: y, \: z}
    \right)}
    \right)}
    \  dx \  dy \  dz

    
4.1.4 Summary
.............

Let us summarize what we have obtained above. We use the following notation
for the mapping of scalar functions and vector fields to differential forms:

.. math::

    f \rightarrow [f]_0 \\
    T \rightarrow [T]_1 
    
where the index denotes the degree of the form. Moreover, we define another
pair of forms by applying the Hodge operator:

.. math::
   
    [T]_2 = \star [T]_1 \\
    [f]_3 = \star [f]_0
    
So we can state the general identities:

.. math::

    d\,f = [\nabla\,f]_1 \\
    d\,[T]_1 = [\mathtt{curl}\,T]_2 \\
    d\,[T]_2 = [\mathtt{div}\,T]_3

     
4.1.5 Hodge duals
.................

To conclude this example, we are going to calculate a table for the Hodge
duals of the monomials.

::
    
     g:=diagonalMatrix([1,1,1])::SquareMatrix(3,INT)
     
     [[hodgeStar(g,m)$M for m in monomials(j)$M] for j in 0..3]
     
.. math::

   \left[
   {\left[ {dx \  dy \  dz}
   \right]},
   \: {\left[ {dy \  dz}, \: -{dx \  dz}, \: {dx \  dy}
   \right]},
   \: {\left[ dz, \: -dy, \: dx
   \right]},
   \: {\left[ 1
   \right]}
   \right]

   
:sub:`Type: List(List(DeRhamComplex(Integer,[x,y,z])))`

Thus we get the following table:
   
==============      =============================      ========================
:math:`\alpha`      :math:`\star\alpha`                :math:`\star\star\alpha`
==============      =============================      ========================
:math:`1`           :math:`dx\wedge dy \wedge dz`      :math:`1`
:math:`dx`          :math:`dy \wedge dz`               :math:`dx`
:math:`dy`          :math:`-dx \wedge dz`              :math:`dy`
:math:`dz`          :math:`dx \wedge dy`               :math:`dz`
==============      =============================      ========================

By the way, this method can be applied in any dimension for any metric.


4.2 Faraday 2-form
~~~~~~~~~~~~~~~~~~

The free electromagnetic field can be described by a 2-form **F** in 
Minkowski space. This form - also known as Faraday 2-form - is given by

.. math::

   \scriptstyle{
   F=B_1\ dy\wedge dz + B_2\ dz\wedge dx + B_3\ dx\wedge dy +
     E_1\ dx\wedge dt + E_2\ dy\wedge dt + E_3\ dz\wedge dt 
   }
   
where we here use the **cgs** system and **E**, **B** denote the classical
fields (see the example in the documentation of ``DeRhamComplex``).

To represent **F** in FriCAS we have to choose space-time variables 
:math:`x,y,z,t`, in the correct order, and :math:`g` will be the 
Minkowski metric:

::
    
    v := [x,y,z,t]
    
    g := diagonalMatrix([-1,-1,-1,1])::SquareMatrix(4,INT)
    
    M := DFORM(INT,v) 
    
    R ==> EXPR(INT)
   
Instead of :math:`x,y,z,t` we also could have chosen :math:`x_0,x_1,x_2,x_3`
for instance. Now we need the coordinates and basis one forms:

**Important**
  The order of the variables must coincide with that in the metric g.
  That means for example, for :math:`t,x,y,z` the positive ``1`` comes
  first.

::
    
    X := coordVector()$M
    
    dX := baseForms()$M
    
We also need the field **E** and **B**, but this time we will not choose the 
``vectorField`` function because we only need three components:

::
    
    E := [operator E[i] for i in 1..3]
    B := [operator B[i] for i in 1..3]
    
Eventually we can build **F**:

::
    
    F := (B.1 X)*dX.2*dX.3 + (B.2 X)*dX.3*dX.1 + (B.3 X)*dX.1*dX.2 +_
         (E.1 X)*dX.1*dX.4 + (E.2 X)*dX.2*dX.4 + (E.3 X)*dX.3*dX.4
  
.. math::

    \scriptstyle{
    {{{E _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dz \  dt}+{{{E _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dy \  dt}+{{{B _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)} 
    \  dy \  dz} + \\
    {{{E _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dx \  dt} -{{{B _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dx \  dz}+{{{B _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dx \  dy}
    }
    
:sub:`Type: DeRhamComplex(Integer,[x,y,z,t])`

We apply the exterior differential operator **d** to **F**:

::
    
    d F
    
.. math::

  \scriptstyle{
    {{\left( {{{E _ {3}} _ {{,2}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{E _ {2}} _ {{,3}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}+{{{B
    _ {1}} _ {{,4}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dy \  dz \  dt}\, + \\ 
    {{\left( {{{E _ {3}} _ {{,1}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{E _ {1}} _ {{,3}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{B _ {2}} _ {{,4}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dx \  dz \  dt}\, + \\
    {{\left( {{{E _ {2}} _ {{,1}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{E _ {1}} _ {{,2}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}+{{{B
    _ {3}} _ {{,4}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dx \  dy \  dt}\, + \\ 
    {{\left( {{{B _ {3}} _ {{,3}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}+{{{B
    _ {2}} _ {{,2}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}+{{{B
    _ {1}} _ {{,1}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dx \  dy \  dz}
    }

:sub:`Type: DeRhamComplex(Integer,[x,y,z,t])`  

We see at once that the first three terms of the sum correspond to the
vector

.. math::

    \nabla\times\mathbf{E}+\frac{\partial\mathbf{B}}{\partial t}
    
and the fourth term is

.. math::

      \nabla\bullet\mathbf{B}.
      
Actually, all terms are zero by two of the *Maxwell* equations. Consequently
we have shown (the well known fact)

.. math::

      d\mathbf{F} = 0
      
Now let us apply the :math:`\star`-operator to **F**, which is also a 2-form:

::
    
    %F := hodgeStar(g,F)$M
    
.. math::

   \scriptstyle{
    {{{B _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dz \  dt} + {{{B _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dy \  dt} -{{{E _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dy \  dz}+ \\ 
    {{{B _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dx \  dt} + {{{E _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dx \  dz}- {{{E _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  dx \  dy}
    }

:sub:`Type: DeRhamComplex(Integer,[x,y,z,t])`

Now, as before:

::
    
    d %F
    
.. math::

    \scriptstyle{
    {{\left( -{{{E _ {1}} _ {{,4}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}+{{{B
    _ {3}} _ {{,2}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{B _ {2}} _ {{,3}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dy \  dz \  dt}+ \\ 
    {{\left( {{{E _ {2}} _ {{,4}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}+{{{B
    _ {3}} _ {{,1}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{B _ {1}} _ {{,3}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dx \  dz \  dt}+ \\ 
    {{\left( -{{{E _ {3}} _ {{,4}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}+{{{B
    _ {2}} _ {{,1}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{B _ {1}} _ {{,2}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dx \  dy \  dt}+ \\ 
    {{\left( -{{{E _ {3}} _ {{,3}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{E _ {2}} _ {{,2}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    -{{{E _ {1}} _ {{,1}}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \right)}
    \  dx \  dy \  dz}
    }

:sub:`Type: DeRhamComplex(Integer,[x,y,z,t])`    

Again, we see that the first three terms correspond to

.. math::

       -\frac{\partial\mathbf{E}}{\partial t}+ \nabla\times\mathbf{B}
       
while the last one corresponds to:

.. math::

       -\,\nabla\bullet\mathbf{E}
       
Thus, in vacuum, these are the second pair of *Maxwell's* equation and we
have:

.. math::

       d \star\mathbf{F} = 0
       
To conclude this example we will compute the quantities (4-forms):

.. math::

     \mathbf{F} \wedge \mathbf{F} \ \ \mathrm{and} \ \
     \mathbf{F} \wedge \star\mathbf{F}.
     
Recalling the definition of the Hodge dual it is sufficient (in principle)
to compute the scalar product :math:`\langle F,F\rangle`:

::
    
    dot(g,F,F)$M
    
.. math::

   \scriptstyle{
    -{{{{E _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    ^ {2}} -{{{{E _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    ^ {2}} -{{{{E _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    ^ {2}}+ \\ 
    {{{{B _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    ^ {2}}+{{{{B _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    ^ {2}}+{{{{B _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    ^ {2}}
    }

:sub:`Type: Expression(Integer)`

and :math:`\langle F,\star F\rangle`:

::
    
     dot(g,F,%F)$M

.. math::

   \scriptstyle{
    -{2 \  {{B _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  {{E _ {3}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    -{2 \  {{B _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  {{E _ {2}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    -{2 \  {{B _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}
    \  {{E _ {1}}
    \left(
    {x, \: y, \: z, \: t}
    \right)}}
    }

:sub:`Type: Expression(Integer)`

Indeed, we can *test* the defining identity, e.g. for the first case:

::
    
     test(F * %F = dot(g,F,F)$M * volumeForm(g)$M)
     
.. math::

   \mathtt{true}
   
:sub:`Type: Boolean`

4.3 Some Examples from *Maple*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Examples from `Maple`_.

.. _Maple: http://www.maplesoft.com/support/help/Maple/view.aspx?path=DifferentialGeometry/Tensor/HodgeStar


4.3.1 5-dimensional Manifold
............................

First create a 5-dimensional manifold M and define a metric tensor g on the 
tangent space of M:

::
    
    v:=[x[j] for j in 1..5]
    M:=DFORM(INT,v)
    g:=diagonalMatrix([1,1,1,1,1])::SquareMatrix(5,INT)
    dX:=baseForms()$M    

    
::
    
    hodgeStar(g,dX.1)$M
    
.. math::

   {dx _ {2}} \  {dx _ {3}} \  {dx _ {4}} \  {dx _ {5}}
   
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4],x[5]])`


::
    
    hodgeStar(g,dX.2)$M
    
.. math::           

   -{{dx _ {1}} \  {dx _ {3}} \  {dx _ {4}} \  {dx _ {5}}}
   
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4],x[5]])`


::
    
    hodgeStar(g,dX.2*dX.3)$M
    
.. math::           

   {dx _ {1}} \  {dx _ {4}} \  {dx _ {5}}
   
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4],x[5]])`


::
    
    hodgeStar(g,dX.2*dX.4)$M
    
.. math::           

   -{{dx _ {1}} \  {dx _ {3}} \  {dx _ {5}}}
   
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4],x[5]])`


::
    
    hodgeStar(g,dX.2*dX.3*dX.4)$M
    
.. math::           

   -{{dx _ {1}} \  {dx _ {5}}}
   
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4],x[5]])`


We see an exact match with the published results. 


4.3.2 General metric (2-dim)
............................

To show the dependence of the Hodge star operator upon the metric, we consider 
a general metric g on a 2-dimensional manifold. 

::
    
    v:=[x,y]
    M:=DFORM(INT,v)
    R ==> EXPR INT
    g:=matrix([[a::R,b],[b,c]])::SquareMatrix(2,R)
    [dx,dy]:=baseForms()$M  

    
::
    
   hodgeStar(g,dx)$M
    
.. math::

    {{{c \  {\sqrt {{abs
    \left(
    {{{a \  c} -{{b} ^ {2}}}}
    \right)}}}}
    \over {{a \  c} -{{b} ^ {2}}}} \  dy}+{{{b \  {\sqrt {{abs
    \left(
    {{{a \  c} -{{b} ^ {2}}}}
    \right)}}}}
    \over {{a \  c} -{{b} ^ {2}}}} \  dx}
    
:sub:`Type: DeRhamComplex(Integer,[x,y])`    


::
    
    hodgeStar(g,dy)$M
    
.. math::

    -{{{b \  {\sqrt {{abs
    \left(
    {{{a \  c} -{{b} ^ {2}}}}
    \right)}}}}
    \over {{a \  c} -{{b} ^ {2}}}} \  dy} -{{{a \  {\sqrt {{abs
    \left(
    {{{a \  c} -{{b} ^ {2}}}}
    \right)}}}}
    \over {{a \  c} -{{b} ^ {2}}}} \  dx}
    
:sub:`Type: DeRhamComplex(Integer,[x,y])`


::
    
    f := hodgeStar(g,dx*dy)$M
    
.. math::

  {\sqrt {{abs
   \left(
   {{{a \  c} -{{b} ^ {2}}}}
   \right)}}}
   \over {{a \  c} -{{b} ^ {2}}}
    
:sub:`Type: DeRhamComplex(Integer,[x,y])`

::
    
    hodgeStar(g,f)$M
    
.. math::

  {{abs
  \left(
  {{{a \  c} -{{b} ^ {2}}}}
  \right)}
  \over {{a \  c} -{{b} ^ {2}}}} \  dx \  dy

:sub:`Type: DeRhamComplex(Integer,[x,y])`


4.3.3 Laplacian
...............

The Laplacian of a function with respect to a metric g can be calculated 
using the exterior derivative and the Hodge star operator. Generally, the
following identity holds:

.. math::

   \Delta = d \circ \delta + \delta \circ d 
   
where :math:`\delta:=(-1)^p\, \star^{-1}\,d \,\star` is the **codifferential**
to be applied on a p-form (resulting in a (p-1)-form). Therefore, the 
Laplacian applied to a function f (zero form) is:

.. math::

     \Delta f = \delta \circ df = \star^{-1}\, d \,\star df=
     \star\, d \, \star df.
     
::
    
    v:=[r,u]  -- polar coordinates 
    M:=DFORM(INT,v)
    R ==> EXPR INT
    g:=matrix([[1,0],[0,r^2]])::SquareMatrix(2,R)
    [dr,du]:=baseForms()$M
    
    
A function on M can easiliy be defined by

::
    
    f:=zeroForm(f)$M
   
.. math::
 
   f\left({r, \: u}\right)
   
:sub:`Type: DeRhamComplex(Integer,[r,u])`

We translate the formula:

::
    
    hodgeStar(g, d hodgeStar(g,d f)$M)$M


.. math::

    {{{abs
    \left(
    {{{r} ^ {2}}}
    \right)}
    \  {{f _ {{{,2}{,2}}}}
    \left(
    {r, \: u}
    \right)}}+{{{r}
    ^ {2}} \  {abs
    \left(
    {{{r} ^ {2}}}
    \right)}
    \  {{f _ {{{,1}{,1}}}}
    \left(
    {r, \: u}
    \right)}}+{r
    \  {abs
    \left(
    {{{r} ^ {2}}}
    \right)}
    \  {{f _ {{,1}}}
    \left(
    {r, \: u}
    \right)}}}
    \over {{r} ^ {4}}
    
:sub:`Type: DeRhamComplex(Integer,[r,u])`

Simplifying yields for M:

.. math::

   \Delta_M f = \frac{\partial^2 f}{\partial r^2} +
              \frac{1}{r} \frac{\partial f}{\partial r} +
              \frac{1}{r^2} \frac{\partial^2 f}{\partial u^2}
              
         
4.3.4 Lie derivative
....................

::
    
    v:=[x[i] for i in 1..3]
    M:=DFORM(INT,v)
    dX:=baseForms()$M
    V:=vectorField(V)$M
    f:=scalarField(f)$M
    

::
    
     lieDerivative(V,dX.1)
     

.. math::

    \scriptstyle{
    {{{{V _ {1}} _ {{,3}}}
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
    \right)}
    \  {dx _ {3}}}+{{{{V _ {1}} _ {{,2}}}
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
    \right)}
    \  {dx _ {2}}}+{{{{V _ {1}} _ {{,1}}}
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}}
    \right)}
    \  {dx _ {1}}}}
    
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3]])`


::
    
    lieDerivative(V,f*dX.1)
    
.. math::

    \cal{L}_V\,f\,dx_1
 
    
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3]])`


::
    
     lieDerivative(V,f*dX.1*dX.2)
     
.. math::

   \cal{L}_V\,f\,dx_1\wedge dx_2


:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3]])`


4.4 More examples (way of working)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:Setup:

::
    
   )clear all
 
     All user variables and function definitions have been cleared.

::
    
    n:=4 -- dim of base space (n>=2 !)
    R:=Integer  -- Ring
 
    v:=[subscript(x,[j::OutputForm]) for j in 1..n] -- (x_1,..,x_n)
 
    M:=DFORM(R,v)
 
    -- basis 1-forms and coordinate vector
    dx:=baseForms()$M     -- [dx[1],...,dx[n]]
    x:=coordVector()$M    -- [x[1],...,x[n]]
    xs:=coordSymbols()$M  -- as above but as List Symbol (for differentiate, D)
 
    -- operator, vector field, scalar field, symbol
    a:=operator 'a         -- operator
    b:=vectorField(b)$M    -- generic vector field [b1(x1..xn),...,bn(x1..xn)]
    c:=vectorField(c)$M
    P:=scalarField(P)$M -- scalar field P(x1,..,xn)
 
    -- metric
    g:=diagonalMatrix([1 for i in 1..n])$SquareMatrix(n,EXPR R)  -- Euclidean
    h:=diagonalMatrix(c)$SquareMatrix(n,EXPR R)
 
    -- vector field (R)
    vf:=vector b
 
:Macros:

::
    
    -- macros
    dV(g) ==> volumeForm(g)$M 
    i(X,w) ==> interiorProduct(X,w)$M  
    L(X,w) ==> lieDerivative(X,w)$M
    ** w ==> hodgeStar(g,w)$M  -- don't use * instead of ** !
 

::

    w:=x.1*dx.2-x.2*dx.1
 
.. math::
    {{x _ {1}} \  {dx _ {2}}} -{{x _ {2}} \  {dx _ {1}}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d w
 

.. math::

    2 \  {dx _ {1}} \  {dx _ {2}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`
 

::
    
    w*w
 
.. math::
    0 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
                           
    i(vf,w)
 

.. math::
    {{x _ {1}} \  {{b _ {2}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{b _ {1}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    L(vf,w)
 
.. math::

    {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {4}}}+ \\ {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {3}}}+ \\ {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}+{{b
    _ {1}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \right)}
    \  {dx _ {2}}}+ \\ {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{b _ {2}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \right)}
    \  {dx _ {1}}} 
    

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d i(vf,w) + i(vf,d w)
 

.. math::

    {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {4}}}+ \\ {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {3}}}+ \\ {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}+{{b
    _ {1}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \right)}
    \  {dx _ {2}}}+ \\ {{\left( {{x _ {1}} \  {{{b _ {2}} _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{x _ {2}} \  {{{b _ {1}} _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    -{{b _ {2}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \right)}
    \  {dx _ {1}}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    % - L(vf,w)
 
.. math::

    0 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`


::
    
    dot(g,w,w)$M
 

.. math::

    {{{x _ {2}}} ^ {2}}+{{{x _ {1}}} ^ {2}} 

:sub:`Type: Expression(Integer)`

::
    
    d i(vf,dV(g)) -- div(b) dV
 

.. math::
     
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    {\left( {{{b \sb {4}} \sb {{,4}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}+{{{b
    \sb {3}} \sb {{,3}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}+{{{b
    \sb {2}} \sb {{,2}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}+{{{b
    \sb {1}} \sb {{,1}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}
    \right)}
    \  {dx \sb {1}} \  {dx \sb {2}} \  {dx \sb {3}} \  {dx \sb {4}} 




:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::

    d (P*one()$M) -- One()?
 
.. math::

    {{{P _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {4}}}+{{{P _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {3}}}+ \\ {{{P _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {2}}}+{{{P _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {1}}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    i(vf,%)
 
.. math::

    {{{b _ {1}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{P _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}+ \\ {{{b
    _ {2}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{P _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}+ \\ {{{b
    _ {3}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{P _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}+ \\ {{{b
    _ {4}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{P _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`


::
    
    1/dot(g,w,w)$M*w 
 

.. math::

    {{{x _ {1}} \over {{{{x _ {2}}} ^ {2}}+{{{x _ {1}}} ^ {2}}}} \  {dx 
    _ {2}}} -{{{x _ {2}} \over {{{{x _ {2}}} ^ {2}}+{{{x _ {1}}} ^ 
    {2}}}} \  {dx _ {1}}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d %
 
.. math::

    0 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    s:=zeroForm('s)$M
 

.. math::

    s 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d s
 
.. math::

    {{{s _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {4}}}+{{{s _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {3}}}+ \\ {{{s _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {2}}}+{{{s _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {1}}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d (** s)
 
.. math::

    0 
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    ** ( d s)
 

.. math::

    {{{s _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {2}} \  {dx _ {3}} \  {dx _ {4}}} -{{{s _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {1}} \  {dx _ {3}} \  {dx _ {4}}}+ \\ {{{s _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {1}} \  {dx _ {2}} \  {dx _ {4}}} -{{{s _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {dx _ {1}} \  {dx _ {2}} \  {dx _ {3}}} 

    
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d (** ( d s)) -- Laplacian(s) dV
 

.. math::

    {\left( {{s \sb {{{,1}{,1}}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}+{{s
    \sb {{{,2}{,2}}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}+{{s
    \sb {{{,3}{,3}}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}+{{s
    \sb {{{,4}{,4}}}} 
    \left(
    {{x \sb {1}}, \: {x \sb {2}}, \: {x \sb {3}}, \: {x \sb {4}}} 
    \right)}
    \right)}
    \  {dx \sb {1}} \  {dx \sb {2}} \  {dx \sb {3}} \  {dx \sb {4}} 
    


:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    r:=sin(x.1*x.2)*one()$M
 

.. math::

    \sin 
    \left(
    {{{x _ {1}} \  {x _ {2}}}} 
    \right)
    
:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d r
 

.. math::

    {{x _ {1}} \  {\cos 
    \left(
    {{{x _ {1}} \  {x _ {2}}}} 
    \right)}
    \  {dx _ {2}}}+{{x _ {2}} \  {\cos 
    \left(
    {{{x _ {1}} \  {x _ {2}}}} 
    \right)}
    \  {dx _ {1}}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d (** ( d r))
 

.. math::

    {\left( -{{{x _ {2}}} ^ {2}} -{{{x _ {1}}} ^ {2}} 
    \right)}
    \  {\sin 
    \left(
    {{{x _ {1}} \  {x _ {2}}}} 
    \right)}
    \  {dx _ {1}} \  {dx _ {2}} \  {dx _ {3}} \  {dx _ {4}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`


::
    
    ** (d (** ( d r)))
 
.. math::

    {\left( -{{{x _ {2}}} ^ {2}} -{{{x _ {1}}} ^ {2}} 
    \right)}
    \  {\sin 
    \left(
    {{{x _ {1}} \  {x _ {2}}}} 
    \right)}

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::

    ** (d (** ( d r)))::EXPR INT
 

.. math::

    {\left( -{{{x _ {2}}} ^ {2}} -{{{x _ {1}}} ^ {2}} 
    \right)}
    \  {\sin 
    \left(
    {{{x _ {1}} \  {x _ {2}}}} 
    \right)}

:sub:`Type: Expression(Integer)`

::
    
    eval(%,xs.1=%pi)
 

.. math::

    {\left( -{{\pi} ^ {2}} -{{{x _ {2}}} ^ {2}} 
    \right)}
    \  {\sin 
    \left(
    {{{x _ {2}} \  \pi}} 
    \right)}
    

:sub:`Type: Expression(Integer)`

::
    
    eval(%,xs.2=%pi/3)
 
.. math::

    -{{{10} \  {{\pi} ^ {2}} \  {\sin 
    \left(
    {{{{\pi} ^ {2}} \over 3}} 
    \right)}}
    \over 9} 

:sub:`Type: Expression(Integer)`

::
    
    a(P)*one()$M
 

.. math::

    a 
    \left(
    {{P 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`

::
    
    d (a(P)*one()$M) -- chain diff
 

.. math::

    {{{P _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{a _ {{\ }} ^ {,}} 
    \left(
    {{P 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {4}}}+ \\ {{{P _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{a _ {{\ }} ^ {,}} 
    \left(
    {{P 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {3}}}+ \\ {{{P _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{a _ {{\ }} ^ {,}} 
    \left(
    {{P 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {2}}}+ \\ {{{P _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \  {{a _ {{\ }} ^ {,}} 
    \left(
    {{P 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}}
    \right)}
    \  {dx _ {1}}} 

:sub:`Type: DeRhamComplex(Integer,[x[1],x[2],x[3],x[4]])`


