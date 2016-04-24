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

Let T be generic vector field on :math:`M=\mathbb{R}^3`:

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

Then we build the general one form `\tau`:

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

    \small{
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

    \small{
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

    \mathtt{curl}(T) =\nabla\times T= \small{
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

To prove it we just have to 

::
    
     test( d(T*dP) = hodgeStar(g,curl(T)*dP)$M )
     
.. math::

    \mathtt{true}
    
:sub:`Type: Boolean`

4.1.3 Divergence
................

Again, let T be generic vector field on :math:`M=\mathbb{R}^3`, then the
divergence is defined by

.. math::

   \mathtt{div}(T) = \nabla \bullet T =
   \small{
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
    
where the index denotes the degree of the form. Moreover we define another
pair of forms by applying the Hodge operator:

.. math::
   
    [T]_2 = \star [T]_1 \\
    [f]_3 = \star [f]_0
    
So, we can state the general identities:

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


