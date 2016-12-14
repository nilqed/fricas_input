.. _introduction:

1.0 Introduction
----------------

The package ``DifferentialForms`` (in file ``dform.spad``) builds on the 
domain ``DeRhamComplex``. In the following section we give a brief overview
of the functions that are going to be implemented. The focus is on precise
definitions of the notions, since those may be varying in the literature.
In section (2) we will describe the exported functions and how they work, 
in section (3) some short implementation notes will be given and finally
the last section is devoted to some examples. 


1.1 Definitions
---------------

Let :math:`\mathcal{M}` be a n-dimensional manifold (sufficiently smooth and 
orientable). To each point :math:`P \in \mathcal{M}` there is a neighborhood 
which can be diffeomorphically mapped to some region in :math:`\mathbb{R}^n`, 
with coordinates 

.. math::

   x_1 (P'), \ldots, x_n (P') 


for all :math:`P' \in \mathcal{U} (P) \subset \mathcal{M}`. The tangent space
:math:`T_{P'} (\mathcal{M})` at the point :math:`P'` is a vector space, that 
is spanned by the basis

.. math::

     e_1 (P'), \ldots, e_n (P')

which also is often denoted by 

.. math::

  \partial_1, \ldots, \partial_n =
   \frac{\partial}{\partial x_1}, \ldots, 
   \frac{\partial}{\partial x_n}.  

   
A tangent vector :math:`v` has the form

.. math::

    v = \sum_{j = 1}^n v^j e_j . 


The cotangent space :math:`T_{P'}^{} (\mathcal{M})^{\star}` is the vector space
of linear functionals 

.. math::

   \alpha : T_{P'} (\mathcal{M}) \rightarrow \mathbb{R},


spanned by the basis :math:`e^1 (P'), \ldots, e^n (P')`
which (corresponding to the basis :math:`\partial_j`) is also denoted by 

.. math::

   d x^1,\ldots, d x^n. 

The latter notation indicates the dependency on the moving
point :math:`P'`. The dual basis is by definition comprised of those linear
functionals such that

.. math::

    e^j (e_k) = \delta^j_k . 
   
Therefore we have 

.. math::

   \alpha (v) = \alpha \left( \sum_{j = 1}^n v^j e_j \right) =
   \sum_{j = 1}^n v^j \alpha (e_j) = \sum_{j = 1}^n v^j \alpha_j,
   
where :math:`\alpha = \sum_{j = 1}^n \alpha_j e^j`.
   
  
1.1.1 Inner product of differential forms (**dot**)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let :math:`g_x` be a symmetric :math:`n \times n` matrix which is nondegenerate
(i.e. :math:`\det (g_x) \neq 0`). The index x indicates that this matrix 
depends on the coordinates :math:`x_1 (P), \ldots, x_n (P)` and may be varying 
from point to point. If this dependency is smooth (enough) we speak of a 
(pseudo-) Riemannian metric (locally). This way we get an isomorphism between 
tangent vectors and 1-forms (= covectors):

.. math::

   \alpha_j = g_{j k} v^k, \hspace{1.2em} v^j = g^{j k} \alpha_j . 
   
Clearly, :math:`\sum_k g^{j k} g_{k l} = \delta^j_l`, in other words 
:math:`(g^{j k})` is the inverse of g. The metric g defines an *inner product* 
of vectors

.. math::

   g (v, w) = \langle v, w \rangle : = g_{i j} v^i w^j 
   
and by duality also on 1-forms:

.. math::

  g^{- 1} (\alpha, \beta) = \langle \alpha, \beta \rangle : = g^{i j}
   \alpha_i \beta_j . 
   
   
Now, this inner product is extended to arbitrary p-forms by

.. math::

  \langle \alpha_1 \wedge \ldots \wedge \alpha_p , \beta_1 \wedge
  \ldots \wedge \beta_p \rangle : = \det (\langle \alpha_i, \beta_j \rangle)
  , \hspace{1.8em} (1 \leqslant i, j \leqslant p), \label{dot}

and linearity.


1.1.2. The volume form :math:`\eta` (**volumeForm**)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Riemannian *volume form* :math:`\eta` is (by definition) given by the 
n-form 

.. math::

  \eta = \sqrt{| \det g |} e^1 \wedge \ldots \wedge e^n = \sqrt{| \det\,g |} d
  x^1 \wedge \ldots \wedge d x^n . \label{vol}

This definition makes sense because by a (orientation preserving) change of
coordinates :math:`\sqrt{\mathrm{det} g}` transforms like the component of
a n-form.


1.1.3. Hodge dual (**hodgeStar**)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The *Hodge dual* of a differential p-form :math:`\beta` is the (n - p)-form
:math:`\star \beta` such that

.. math::
  \alpha \wedge \star \beta = \langle \alpha, \beta \rangle \eta \label{hodge}
  
  
holds, for all p-forms :math:`\alpha`. The linear operator :math:`(\star)` is 
called the *Hodge star operator*. By the *Riesz representation theorem* the 
Hodge dual is uniquely defined by the expression above.

**Warning**

Flanders [4]_ defines the Hodge dual by the equality

.. math::

   \lambda \wedge \mu = \langle \star \lambda, \mu \rangle \eta 
   
where :math:`\lambda` is a p-form and :math:`\mu` a (n - p)-form.
This can result in different signs. The generally adopted definition (2016)
is the one given at the beginning of this subsection. 


The components of :math:`\star \beta` are

.. math::
  (\star \beta)_{j_1, \ldots, j_{n - p}} = \frac{1}{p!} \varepsilon_{i_1,
   \ldots, i_p, j_1, \ldots, j_{n - p}}  \sqrt{| \det g |} g^{i_1 k_1} \ldots
   g^{i_p k_p} \beta_{k_1, \ldots, k_p} 
   
what is equal to

.. math::

  \frac{1}{p! \sqrt{| \det g |}} \varepsilon_{}^{k_1, \ldots, k_p, l_1,
   \ldots, l_{n - p}} g_{j_1 l_1} \ldots g_{j_{n - p}, l_{n - p}} \beta_{k_1,
   \ldots, k_p} .
   

1.1.4 Interior product (**interiorProduct**)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The *interior product* of a vectorfield :math:`v` and a p-form :math:`\alpha` 
is a (p -1)-form :math:`i_v (\alpha)` such that

.. math::

  i_v (\alpha) (v_1, \ldots, v_{p - 1}) = \alpha (v, v_1, \ldots, v_{p - 1})
  
holds, for all vectorfields :math:`v_1, \ldots, v_{p - 1}`. Therefore, the 
components of :math:`i_v (\alpha)` are

.. math::

 i_v (\alpha)_{j_1, \ldots, j_{p - 1}} = v^j \alpha_{j, j_1, \ldots, j_{p -
   1} .} 
   
   
One can express the interior product by using the :math:`\star`-operator. 
Let :math:`\alpha` be the 1-form defined by the equation 

.. math::

   \alpha (w) = g (v, w), \forall w. 
   
That means in components: :math:`\alpha_j = g_{j k} v^k`, 
thus we have

.. math::

  i_v (\beta) = (-)^{p - 1} \star^{- 1} (\alpha \wedge \star \beta) .

Clearly, the interior product is independent of any metric, whereas the 
Hodge operator is **not**! So, usually one should not use the Hodge 
operator to compute the interior product.

We will use the fact that the interior product is an *antiderivation*,
which allows a recursive implementation.
  
  
1.1.5 The Lie derivative (**lieDerivative**)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The *Lie derivative* with respect to a vector field :math:`v` can be 
calculated (and defined) using Cartan's formula:

.. math::
 
  \mathcal{L}_v \alpha = d i_v (\alpha) + i_v (d \alpha).
  
  
There are other ways to define :math:`\mathcal{L}_v \alpha`, however, 
it is convenient to compute it this way when :math:`d` and :math:`i_v` are 
already at hand.


Literature
----------

.. [1] Ralph Abraham, Jerrold E.Marsden and Tudor Ratiu.Manifolds, 
       Tensor Analysis, and Applications. Springer,
       Auflage: 2nd Corrected ed. 1988. Corr. 2nd printing 1993 edition.
       
.. [2] Henri Cartan. Di erential Forms. Dover Pubn Inc, Au age: Tra edition.

.. [3] Herbert Federer. Geometric Measure Theory. Springer, Au age: Reprint of 
       the 1st ed. Berlin, Heidelberg, New York 1969 edition.

.. [4] Harley Flanders and Mathematics. Differential Forms with Applications to 
       the Physical Sciences. Dover Pubn Inc, Auflage: Revised. edition.

.. [5] L. A. Lambe and D. E. Radford. Introduction to the Quantum Yang-Baxter 
       Equation and Quantum Groups:An Algebraic Approach. Springer, 
       Auflage: 1997 edition.

.. [6] Walter Rudin and RudinWalter. Principles ofMathematicalAnalysis.Mcgraw 
       Hill Book Co, Au age: Revised. edition.

.. [7] Hassler Whitney. Geometric Integration Theory: Princeton Mathematical 
       Series, No. 21. Literary Licensing, LLC.
       

