1.3 Example: Maxwell's Equation
-------------------------------

Equipped with the machinery provided by the ``DeRhamComplex`` we try to verify 
some calculations done in [4]_ , namely *Maxwell's field equations* in 
differential form notation. The ordinary well known form of the equations reads
as follows, where the first set is *Faraday's* and *Ampere's* law and the 
second set are the continuity laws:

.. math::

  \operatorname {curl} E = - \frac{1}{c}  \frac{\partial B}{\partial t}, 
  \hspace{2.4em}
  \operatorname {curl} H = \frac{4 \pi}{c} J + \frac{1}{c}  
  \frac{\partial D}{\partial t},
 
and

.. math::

  \operatorname{div} D = 4 \pi \rho, \hspace{1.8em} 
  \operatorname{div} B = 0.
  

The vector functions **E,H,B,D** and **J**  are called, in this order, 
*electric*- and *magnetic* field, *magnetic induction*, 
*dielectric displacement* and *electric current*. The only scalar function ρ 
is the *charge density*. Each of the vector functions is a 
function :math:`\mathbb{R}^4\rightarrow \mathbb{R}^3`,
and ρ is :math:`\mathbb{R}^4\rightarrow \mathbb{R}`, a scalar function in the 
variables :math:`(x,y,z,t)`. And **c** denotes the *speed of light*. 
*Flanders* defines the following differential forms:

.. math::
 \alpha = (E_1 d x + E_2 d y + E_3 d z) \wedge c d t + (B_1 d y \wedge d z +
   B_2 d z \wedge d x + B_3 d x \wedge d y)
  
and

.. math::

  \beta = - (H_1 d x + H_2 d y + H_3 d z) \wedge c d t + (D_1 d y \wedge 
  d z + D_2 d z \wedge d x + D_3 d x \wedge d y)
  
and 

.. math::
    
    \gamma = (J_1 d y \wedge d z + J_2 d z \wedge d x + J_3 d x 
    \wedge d y) \wedge d t - \rho d x \wedge d y \wedge d z.
  

Then it is claimed that the four vector equations above are equivalent to the 
following two differential form equations:

.. math::                      

   d \alpha = 0 \hspace{1.8em} \mathrm{and} \hspace{1.8em} d \beta + 
   4 \pi \gamma = 0.
   

Now let us prove this. We choose :math:`c=1` for simplicity.

::
      
   R:=Expression(Integer) 
   M := DERHAM(Integer,[x,y,z,t])
   X := [x,y,z,t]::List R
   dX := [dx,dy,dz,dt] := [generator(i)$M for i in 1..4]
   d ==> exteriorDifferential


 
:sub:`Type: List(DeRhamComplex(Integer,[x,y,z,t]))`


After these preparations we define the various fields and functions:

::
    
   E:=vector [(operator E[j]) X for j in 1..3] 
   D:=vector [(operator D[j]) X for j in 1..3]
   B:=vector [(operator B[j]) X for j in 1..3]
   H:=vector [(operator H[j]) X for j in 1..3]
   J:=vector [(operator J[j]) X for j in 1..3]
   
   rho := (operator 'rho) X
   

Now we may define the forms :math:`\alpha,\beta,\gamma`:

::
    
   alpha:=(E.1*dx + E.2*dy + E.3*dz)*dt+ B.1*dy*dz + B.2*dz*dx + B.3*dx*dy
   
   
.. math::

  {{{E _ {3}}\left({x, \: y, \: z, \: t}\right)}\  dz \  dt}+{{{E _ {2}}
  \left({x, \: y, \: z, \: t}\right)}\  dy \  dt}+{{{B _ {1}} 
  \left({x, \: y, \: z, \: t}\right)}\  dy \  dz}+  \\ 
  {{{E _ {1}}\left({x, \: y, \: z, \: t}\right)}\  dx \  dt} -{{{B _ {2}}
  \left({x, \: y, \: z, \: t}\right)}\  dx \  dz}+{{{B _ {3}}
  \left({x, \: y, \: z, \: t}\right)}\  dx \  dy}
  
  
:sub:`Type: DeRhamComplex(Integer,[x,y,z,t])`


::
    
    beta:=-(H.1*dx + H.2*dy + H.3*dz)*dt + D.1*dy*dz + D.2*dz*dx + D.3*dx*dy

and finally

::    
    
    gamma:=(J.1*dy*dz + J.2*dz*dx + J.3*dx*dy)*dt - rho*dx*dy*dz
    

 
Now let us calculate :math:`d\alpha`

::
    
   d alpha

 

giving the output

::
   
     (E   (x,y,z,t) - E   (x,y,z,t) + B   (x,y,z,t))dy dz dt
       3,2             2,3             1,4
   +
     (E   (x,y,z,t) - E   (x,y,z,t) - B   (x,y,z,t))dx dz dt
       3,1             1,3             2,4
   +
     (E   (x,y,z,t) - E   (x,y,z,t) + B   (x,y,z,t))dx dy dt
       2,1             1,2             3,4
   +
     (B   (x,y,z,t) + B   (x,y,z,t) + B   (x,y,z,t))dx dy dz
       3,3             2,2             1,1
       
                                       Type: DeRhamComplex(Integer,[x,y,z,t])
                                       
Thus, if we extract the coefficients of each term, we get for dα=0:

.. math::

   \begin{array}{c}
   \frac{\partial B_1}{\partial t} + E_{3, 2} - E_{2, 3}=0\\
   \\
   - \frac{\partial B_2}{\partial t} + E_{3, 1} - E_{1, 3}=0\\
   \\
   \frac{\partial B_3}{\partial t} + E_{2, 1} - E_{1, 2}=0\\
   \\
   B_{1, 1} + B_{2, 2} + B_{3, 3}=0
   \end{array}
   

which is just the first and last of the Maxwell equations. 
In the same manner we see that dβ+4πγ corresponds to the second and third one.

::
    
   -> d beta + 4 * %pi * gamma


resulting in

::
    
  (- H   (x,y,z,t) + H   (x,y,z,t) + D   (x,y,z,t) + 4%pi J (x,y,z,t))dy dz dt
      3,2             2,3             1,4                  1
   +
  (- H   (x,y,z,t) + H   (x,y,z,t) - D   (x,y,z,t) - 4%pi J (x,y,z,t))dx dz dt
      3,1             1,3             2,4                  2
   +
  (- H   (x,y,z,t) + H   (x,y,z,t) + D   (x,y,z,t) + 4%pi J (x,y,z,t))dx dy dt
      2,1             1,2             3,4                  3
   +
  (D   (x,y,z,t) + D   (x,y,z,t) + D   (x,y,z,t) - 4%pi rho(x,y,z,t)) dx dy dz
    3,3             2,2             1,1
    
                                       Type: DeRhamComplex(Integer,[x,y,z,t])
                                       

 
.. [4] Harley Flanders and Mathematics. Differential Forms with Applications to 
       the Physical Sciences. Dover Pubn Inc, Auflage: Revised. edition.
