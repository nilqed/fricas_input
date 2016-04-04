.. status: ok


21.9 tknot.input
----------------

Create a (p,q) torus-knot with radius r around the curve. The formula
was derived by Larry Lambe.


.. spadVerbatim

::

 )read ntube
 torusKnot: (DFLOAT, DFLOAT, DFLOAT, PI, PI) -> VIEW3D
 torusKnot(p, q ,r, uSteps, tSteps) ==

  knot := (t:DFLOAT):Point DFLOAT +->                      Function for the torus knot
     fac := 4/(2.2@DFLOAT-sin(q*t))
     fac * point [cos(p*t), sin(p*t), cos(q*t)]

  circle := (u:DFLOAT, t:DFLOAT): Point DFLOAT +->         The cross section
     r * point [cos u, sin u]
   ntubeDrawOpt(knot, circle, 0..2*%pi, 0..2*%pi,

                                                           Draw the circle around the knot
                var1Steps == uSteps, var2Steps == tSteps)





