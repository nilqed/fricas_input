4.4 More examples (way of working)
----------------------------------

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

    {\left( {{{b _ {4}} _ {{,4}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}+{{{b
    _ {3}} _ {{,3}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}+ \\ {{{b
    _ {2}} _ {{,2}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}+{{{b
    _ {1}} _ {{,1}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \right)}
    \  {dx _ {1}} \  {dx _ {2}} \  {dx _ {3}} \  {dx _ {4}}


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

    {\left( {{s _ {{{,1}{,1}}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}+{{s
    _ {{{,2}{,2}}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}+ \\ {{s
    _ {{{,3}{,3}}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}+{{s
    _ {{{,4}{,4}}}} 
    \left(
    {{x _ {1}}, \: {x _ {2}}, \: {x _ {3}}, \: {x _ {4}}} 
    \right)}
    \right)}
    \  {dx _ {1}} \  {dx _ {2}} \  {dx _ {3}} \  {dx _ {4}} 

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


