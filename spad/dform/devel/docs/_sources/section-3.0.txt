3.0 Implementation Notes
------------------------

In this section some implementation details will be described. This is a 
ongoing process and might be improved.

3.1 Internal Representation
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Differential forms are represented as ``List Record(k:EAB, c:R)`` where each 
basic term is represented as ``Record(k:EAB, c:R)``, for instance:

.. math::

    h (x, y, z)\ dz + g (x, y, z)\ dy + f (x, y, z)\ dx
    
maps to

::
    
   [[k= [0,0,1],c= h(x,y,z)],[k= [0,1,0],c= g(x,y,z)],[k= [1,0,0],c= f(x,y,z)]]
   
or, another example:

.. math::

   c (x, y, z)\ dy\ dz + b (x, y, z)\ dx\ dz + a (x, y, z)\ dx\ dy
   
goes to

::
    
    
   [[k= [0,1,1],c= c(x,y,z)],[k= [1,0,1],c= b(x,y,z)],[k= [1,1,0],c= a(x,y,z)]]
    

It is easily seen that for n generators :math:`x_1, \ldots, x_n` the term 
:math:`d x_{j_p} \wedge \ldots \wedge d x_{j_q}` is represented by
:math:`[k = [a_{i_1}, \ldots, a_{i_n}], c = \pm 1]`
where :math:`a_{i_s} \in \{ 0, 1 \}` depending on whether 
:math:`d x_{i_s}` is contained in the term or not. The (local) function 
**terms** sends a differential form :math:`\omega` to the representation 
:math:`r (\omega)`.
Note that the operations are destructive, this means that one has to copy the
objects in order to get new ones (mere assignment inherits all previous 
changes).

**Note**
  The interpreter normalizes the basic terms according to increasing
  generators, i.e for example: :math:`d x_3 \wedge d x_2` will be stored 
  as :math:`- d x_2 \wedge d x_3`, whereby the signum of the permutation is 
  calculated and transferred to the ``c``-field in the record.
  
Example:

::
    
    terms(dx3*dx2) -> [[k= [0,1,1],c= - 1]]
    
3.2 dot :: inner product
~~~~~~~~~~~~~~~~~~~~~~~~    
Given a (pseudo)-Riemannian metric g, the scalar product of two basic terms of
the same degree is given by

.. math::

 \langle d x_{i_1} \ldots d x_{i_p}, d x_{j_1} \ldots d x_{j_p} \rangle =
   \det (\langle d x_{i_k} , d x_{j_l} \rangle) = \det (g^{- 1} (i_k,
   j_l)), 
   
whereby :math:`1 \leqslant k, l \leqslant p`. Note that 
:math:`g^{- 1} (i_k, j_l) = g^{i_k j_l}` is the inverse of 
:math:`g_{i_k j_l}` (raised indexes as usual). In other words, the scalar 
product is inherited from the dual vector space of the space where the 
coordinates :math:`(x_1, \ldots, x_n)` live, and is continued by linearity.
By the way, terms of different **degree** are considered to be
*orthogonal* to each other.

Example:

::
    
    [x,y,z], G = matrix(G[i,j]) = g^{- 1}, 
    
.. math::
   
   \langle d x \wedge d y, d y \wedge d z \rangle = \langle d x, d y \rangle
     \langle d y, d z \rangle - \langle d x, d z \rangle \langle d y, d y
     \rangle = \\ {G[1,2] G[2, 3] - G[1, 3] G[2, 2]} 


The corresponding EAB's are ``[1,1,0]`` and ``[0,1,1]``. If we define a 
function **pos** which gives the positions of 0 or 1 respectively, the example
tells us:

::
    
            pos([1,1,0],1)=[1,2] and pos([0,1,1],1)=[2,3]

so that the direct product of the two resulting lists gives the desired minor:

::
    
    [1,2]x[2,3]=[[1,2],[1,3],[2,2],[2,3]] =>
    
.. math::
  
    \left|\begin{array}{c}
     G_{12} G_{1 3}\\
     G_{2 2} G_{2 3}
   \end{array}\right| .
   

This essentially comprises the method we will use to compute the scalar product
w.r.t symmetric matrices g and two basic terms of equal degree.

Local function: **dot2**

* compute the inverse of \tmverbatim{g}.
* build the \tmverbatim{pos} lists.
* build the minor and apply ``determinant``.

Actually there are two functions **dot1** and **dot2**, where the former
is used when the metric g is *diagonal* (which is equivalent to the
basis vectors being orthogonal) because the performance might be better if the
dimension of the space is huge.

3.3 hodgeStar :: Hodge dual
~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this new version we have removed the first method (3.3.1) because the
performance difference is not as significant as we thought in the first
place, at least not for :math:`n\leq 7`. However, we save the method in
case someone has to deal with really high space dimensions.


3.3.1 Diagonal, non-degenerated g
.................................

If g is a diagonal matrix then the components of :math:`\star \beta` reduce to

.. math::

 (\star \beta)_{j_1, \ldots, j_{n - p}} = \frac{1}{p!} \varepsilon_{k_1,
   \ldots, k_p, j_1, \ldots, j_{n - p}}  \sqrt{| \det g |}  [g^{k_1 k_1}
   \ldots g^{k_p k_p}] \beta_{k_1, \ldots, k_p} 
   
which implies that :math:`(j_1, \ldots, j_{n - p})` must be the complement of 
:math:`(k_1,\ldots, k_p)$ in $\{ 1, 2, \ldots, n \}` and

.. math::

  \star (d x_{k_1} \wedge \ldots \wedge d x_{k_p}) = C d x_{j_1} \wedge
   \ldots \wedge d x_{j_{n - p}} 
   
for some (yet unknown) factor ``C`` which must actually be equal to the right
hand side of the component formula above. When we recollect the internal
representation of :math:`d x_{k_1} \wedge \ldots \wedge d x_{k_p}` as
EAB then it is easy to get the complement by flipping the
0 and 1. Define a function **flip** such that

.. math::

  \mathrm{flip} (d x_{k_1} \wedge \ldots \wedge d x_{k_p}) = d x_{j_1} 
  \wedge \ldots \wedge d x_{j_{n - p}}
  
then by using the Hodge formula with 
:math:`\alpha = \beta = dx_{k_1} \wedge \ldots \wedge d x_{k_p}` we get using
:math:`\star \alpha = C\ \mathrm{flip} (\alpha)`:

.. math::

  C \alpha \wedge \mathrm{flip} (\alpha) = \langle \alpha, \alpha \rangle \eta
   = \langle \alpha, \alpha \rangle \sqrt{| \det (g) |} d x_1 \wedge \ldots
   \wedge d x_n . 
   
Since :math:`\alpha \wedge \mathrm{flip} (\alpha)` is a n-form, the function
**leadingCoefficient** returns the one and only coefficient. Thus we
can calculate ``C`` to

.. math::

   C = \frac{\langle \alpha, \alpha \rangle \sqrt{| \det (g)
   |}}{\mathtt{leadingCoefficient} (\alpha \wedge \mathrm{flip} (\alpha))} . 
   
In **SPAD** syntax this looks like:

.. math::

  \mathtt{C =}  \frac{\mathtt{dot} (\alpha, \alpha) \star
   \mathtt{sqrt\left(abs\left(\right.determinant\left(g\right)\right)}}{\mathtt{leadingCoefficient}
   \left( \alpha \star \mathtt{flip} (\alpha) \right)} . 
   
This way the interpreter saved us the tedious computation of the permutation
signatures. Moreover, we have not to care whether the metric g is positive or
negative definite.

3.3.2 General case 
..................

Let :math:`J` denote an ordered multi-index and :math:`J_\sharp` its dual.
Then a generic p-vector may be written as

.. math::

      \beta = \sum_{|J|=p} b^J \ e_J.
      
Thus by definition we obtain:

.. math::

    \alpha\wedge\star\beta=(\alpha,\beta)\,\eta \Rightarrow
    e_J\wedge\star\beta=(e_J,\beta)\,\eta
    
Since :math:`\star\beta` is a (n-p)-form, we get:

.. math::

   \star\beta=\sum_{|K|=n-p} a^K e_K \Rightarrow
   \sum_{|K|=n-p} a^K e_J\wedge e_K=\sum_{|I|=p} b^I (e_J,e_I)=
   \sum_{|I|=p} g_{JI} b^I \eta = b_J \eta. 
   
Now the term :math:`e_J\wedge e_K` is non-zero only if :math:`K=J_\sharp`,
therefore

.. math::

   a^{J_\sharp} =\sqrt{g}\, \epsilon(J)\, \sum_{|I|=p} g_{JI} b^I
   
where :math:`e_J\wedge e_{J_\sharp}=\epsilon(J)\, \eta\ ` defines 
:math:`\epsilon`.

If we choose :math:`\beta=e_M` we finally get

.. math::

      \star e_M = \sqrt{g} \sum_{|J|=p} \epsilon(J)\, g_{JM}\, e_{J_\sharp}.
      

This formula will be used to compute the Hodge dual for *monomials*. We define
a function **hodgeBT**, in pseudo-code:

::
    
  hodgeStarBT(dx[M])= sqrt(g)* 
       SUM[J] {eps(dx[J])*dot(g,dx[J],dx[M])*conjBasisTerm(dx[j])}
       
which then allows to compute the Hodge dual of any form by simple recursion:

::
    
    hodgeStar(g:SMR,x:DRC):DRC ==
      x=0$DRC => x
      leadingCoefficient(x) * hodgeStarBT(g,leadingBasisTerm(x)) + _
        hodgeStar(g, reductum(x))
        

3.4 interiorProduct :: Interior product
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this newer version we have replaced the method which uses the Hodge
operator. Instead we used the fact that the interior product is 
an *antiderivation*, actually the unique antiderivation of degree 
:math:`-1` on the exterior algebra such that :math:`i_X(\alpha)=\alpha(X)`:

.. math::

    i_X(\beta\wedge\gamma)=i_X(\beta)\wedge\gamma)+
     (-1)^{{\mathtt deg}\, \beta}\ \beta\wedge i_X(\gamma)
     
This also allows an easy implementation by recursion.
  

3.5 lieDerivative :: Lie derivative
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here we use *Cartan's formula* (see 1.1.5), so that there is not much to
say.

::
    
    lieDerivative(w:Vector X,x:DRC):DRC ==
      a := exteriorDifferential(interiorProduct(w,x))
      b := interiorProduct(w, exteriorDifferential(x))
      a+b

                       
3.6 proj :: Projection
~~~~~~~~~~~~~~~~~~~~~~

Since the elements of :math:`\mathtt{DeRhamComplex}` are in

.. math::

   X = \bigoplus_{p = 0}^n \Omega^p (V) 
   
it is convenient to have a function 
:math:`\mathtt{proj}:\{ 0, \ldots,n \}\times X \rightarrow X` which 
returns the projection on the homogeneous component
:math:`\Omega^p (V)`. The implementation is straightforward when using the
internals of EAB. Probably there are better ways to do this,
especially by using exported functions only.

::
    
    ** deprecated **
    proj(x,p) ==
      t:List REA := x::List REA
      idx := [j for j in 1..#t | #pos(t.j.k,1)=p]
      s := [copy(t.j) for j in idx::List(NNI)]
      convert(s)$DRC
      
**NEW**

In the new version we actually replaced the function above by the following
recursive one:

::
    
    proj(p,x) ==
      x=0 => x
      homogeneous? x and degree(x)=p => x
      a:=leadingBasisTerm(x)
      if degree(a)=p then
        leadingCoefficient(x)*a + proj(p, reductum x)
      else
        proj(p, reductum x)
        
**NOTE**
We have changed the order of arguments from (DRC,NNI) to (NNI,DRC) because
this corresponds more to the usual nomenclature of projections. 
        