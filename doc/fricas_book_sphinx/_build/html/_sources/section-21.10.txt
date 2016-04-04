.. status: ok


21.10 ntube.input
-----------------

The functions in this file create generalized tubes (also known as
generalized cylinders). These functions draw a 2-d curve in the normal
planes around a 3-d curve.


.. spadVerbatim

::


R3 := Point DFLOAT                                         Points in 3-Space

R2 := Point DFLOAT                                         Points in 2-Space
 S := Segment Float                                         Draw ranges

                                                           Introduce types for functions for:

ThreeCurve := DFLOAT -> R3                                 --the space curve function

TwoCurve := (DFLOAT, DFLOAT) -> R2                         --the plane curve function

Surface := (DFLOAT, DFLOAT) -> R3                          --the surface function

                                                           Frenet frames define a

FrenetFrame :=                                             coordinate system around a
    Record(value:R3,tangent:R3,normal:R3,binormal:R3)

                                                           point on a space curve

frame: FrenetFrame                                         The current Frenet frame

                                                           for a point on a curve



 ntubeDraw(spaceCurve, planeCurve, u0..u1, t0..t1) draws planeCurve in
the normal planes of spaceCurve. The parameter u0..u1 specifies the
parameter range for planeCurve and t0..t1 specifies the parameter range
for spaceCurve. Additionally, the plane curve function takes a second
parameter: the current parameter of spaceCurve. This allows the plane
curve to change shape as it goes around the space curve. See
`ugFimagesFive <section-21.4.html#ugFimagesFive>`__ for an example of
this.


.. spadVerbatim

::

 ntubeDraw: (ThreeCurve,TwoCurve,S,S) -> VIEW3D
 ntubeDraw(spaceCurve,planeCurve,uRange,tRange) ==
   ntubeDrawOpt(spaceCurve, planeCurve, uRange, _
                tRange, []$List DROPT)
 ntubeDrawOpt: (ThreeCurve,TwoCurve,S,S,List DROPT)
     -> VIEW3D
 ntubeDrawOpt(spaceCurve,planeCurve,uRange,tRange,l) ==

                                                           This function is similar

                                                           to ntubeDraw, but takes

  delT:DFLOAT := (hi(tRange) - lo(tRange))/10000           optional parameters that it

  oldT:DFLOAT := lo(tRange) - 1                            passes to the draw command
   fun := ngeneralTube(spaceCurve,planeCurve,delT,oldT)
   draw(fun, uRange, tRange, l)



 nfrenetFrame(c, t, delT) numerically computes the Frenet frame about
the curve c at t. Parameter delT is a small number used to compute
derivatives.


.. spadVerbatim

::

 nfrenetFrame(c, t, delT) ==
   f0 := c(t)
   f1 := c(t+delT)
   t0 := f1 - f0                              The tangent
   n0 := f1 + f0
   b := cross(t0, n0)                         The binormal
   n := cross(b,t0)                           The normal
   ln := length n
   lb := length b
   ln = 0 or lb = 0 =>
       error "Frenet Frame not well defined"

  n := (1/ln)*n                              Make into unit length vectors
   b := (1/lb)*b
   [f0, t0, n, b]$FrenetFrame



 ngeneralTube(spaceCurve, planeCurve, delT, oltT) creates a function
that can be passed to the system axiomFun{draw} command. The function is
a parameterized surface for the general tube around spaceCurve. delT is
a small number used to compute derivatives. oldT is used to hold the
current value of the t parameter for spaceCurve. This is an efficiency
measure to ensure that frames are only computed once for each value of
t.


.. spadVerbatim

::

 ngeneralTube: (ThreeCurve, TwoCurve, DFLOAT, DFLOAT) -> Surface
 ngeneralTube(spaceCurve, planeCurve, delT, oldT) ==

  free frame                                               Indicate that frame is global
   (v:DFLOAT, t: DFLOAT): R3 +->

    if (t $\\sim$= oldT) then                               If not already computed

      frame := nfrenetFrame(spaceCurve, t, delT)           compute new frame
       oldT := t
     p := planeCurve(v, t)
     frame.value + p.1*frame.normal + p.2*frame.binormal

                                                           Project p into the normal plane





