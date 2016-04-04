.. status: ok


21.8 conformal.input
--------------------

The functions in this section draw conformal maps both on the conformal
map plane and on the Riemann sphere. Riemann:sphere


.. spadVerbatim

::


C := Complex DoubleFloat                                   Complex Numbers
 S := Segment DoubleFloat                                   Draw ranges

R3 := Point DFLOAT                                         Points in 3-space



 conformalDraw(f, rRange, tRange, rSteps, tSteps, coord) draws the image
of the coordinate grid under f in the complex plane. The grid may be
given in either polar or Cartesian coordinates. Argument f is the
function to draw; rRange is the range of the radius (in polar) or real
(in Cartesian); tRange is the range of θ (in polar) or imaginary (in
Cartesian); tSteps, rSteps, are the number of intervals in the r and θ
directions; and coord is the coordinate system to use (either "polar" or
"cartesian").


.. spadVerbatim

::

 conformalDraw: (C -> C, S, S, PI, PI, String) -> VIEW3D
 conformalDraw(f,rRange,tRange,rSteps,tSteps,coord) ==

  transformC :=                                            Function for changing an (x,y)

    coord = "polar" => polar2Complex                       pair into a complex number
     cartesian2Complex
   cm := makeConformalMap(f, transformC)

  sp := createThreeSpace()                                 Create a fresh space

  adaptGrid(sp, cm, rRange, tRange, rSteps, tSteps)        Plot the coordinate lines

  makeViewport3D(sp, "Conformal Map")                      Draw the image



 riemannConformalDraw(f, rRange, tRange, rSteps, tSteps, coord) draws
the image of the coordinate grid under f on the Riemann sphere. The grid
may be given in either polar or Cartesian coordinates. Its arguments are
the same as those for conformalDraw.


.. spadVerbatim

::

 riemannConformalDraw:(C->C,S,S,PI,PI,String)->VIEW3D
 riemannConformalDraw(f, rRange, tRange,
                      rSteps, tSteps, coord) ==

  transformC :=                                            Function for changing an (x,y)

    coord = "polar" => polar2Complex                       pair into a complex number
     cartesian2Complex

  sp := createThreeSpace()                                 Create a fresh space
   cm := makeRiemannConformalMap(f, transformC)

  adaptGrid(sp, cm, rRange, tRange, rSteps, tSteps)        Plot the coordinate lines
   curve(sp,[point [0,0,2.0@DFLOAT,0],point [0,0,2.0@DFLOAT,0] ])

                                                           Add an invisible point at

  makeViewport3D(sp,"Map on the Riemann Sphere")           the north pole for scaling

adaptGrid(sp, f, uRange, vRange,  uSteps, vSteps) == Plot  the coordinate grid

  delU := (hi(uRange) - lo(uRange))/uSteps                 using adaptive plotting for

  delV := (hi(vRange) - lo(vRange))/vSteps                 coordinate lines, and draw

  uSteps := uSteps + 1; vSteps := vSteps + 1               tubes around the lines
   u := lo uRange

  for i in 1..uSteps repeat                                Draw coordinate lines in the v

    c := curryLeft(f,u)                                    direction; curve c fixes the

    cf := (t:DFLOAT):DFLOAT +-> 0                          current value of u
     makeObject(c,vRange::SEG Float,colorFunction==cf,

                                                           Draw the v coordinate line
       space == sp, tubeRadius == .02, tubePoints == 6)
     u := u + delU
   v := lo vRange

  for i in 1..vSteps repeat                                Draw coodinate lines in the u

    c := curryRight(f,v)                                   direction; curve c fixes the

    cf := (t:DFLOAT):DFLOAT +-> 1                          current value of v
     makeObject(c,uRange::SEG Float,colorFunction==cf,

                                                           Draw the u coordinate line
       space == sp, tubeRadius == .02, tubePoints == 6)
     v := v + delV
   void()

riemannTransform(z) ==                                     Map a point in the complex

  r := sqrt norm z                                         plane to the Riemann sphere
   cosTheta := (real z)/r
   sinTheta := (imag z)/r
   cp := 4*r/(4+r^2)
   sp := sqrt(1-cp*cp)
   if r>2 then sp := -sp
   point [cosTheta*cp, sinTheta*cp, -sp + 1]

cartesian2Complex(r:DFLOAT, i:DFLOAT):C ==                 Convert Cartesian coordinates to

  complex(r, i)                                            complex Cartesian form

polar2Complex(r:DFLOAT, th:DFLOAT):C ==                    Convert polar coordinates to

  complex(r*cos(th), r*sin(th))                            complex Cartesian form

makeConformalMap(f, transformC) ==                         Convert complex function f

  (u:DFLOAT,v:DFLOAT):R3 +->                               to a mapping: 

                                                           (DFLOAT,DFLOAT) ↦ R3

    z := f transformC(u, v)                                in the complex plane
     point [real z, imag z, 0.0@DFLOAT]

makeRiemannConformalMap(f, transformC) ==                  Convert a complex function f

  (u:DFLOAT, v:DFLOAT):R3 +->                              to a mapping:

                                                           (DFLOAT,DFLOAT) ↦ R3

    riemannTransform f transformC(u, v)                    on the Riemann sphere
 riemannSphereDraw: (S, S, PI, PI, String) -> VIEW3D

                                                           Draw a picture of the mapping

                                                           of the complex plane to

                                                           the Riemann sphere
 riemannSphereDraw(rRange,tRange,rSteps,tSteps,coord) ==
   transformC :=
     coord = "polar" => polar2Complex
     cartesian2Complex

  grid := (u:DFLOAT, v:DFLOAT): R3 +->                     Coordinate grid function
     z1 := transformC(u, v)
     point [real z1, imag z1, 0]

  sp := createThreeSpace()                                 Create a fresh space

  adaptGrid(sp, grid, rRange, tRange, rSteps, tSteps)      Draw the flat grid
   connectingLines(sp,grid,rRange,tRange,rSteps,tSteps)

  makeObject(riemannSphere,0..2*%pi,0..%pi,space==sp)      Draw the sphere
   f := (z:C):C +-> z
   cm := makeRiemannConformalMap(f, transformC)

  adaptGrid(sp, cm, rRange, tRange, rSteps, tSteps)        Draw the sphere grid
   makeViewport3D(sp, "Riemann Sphere")
  
 connectingLines(sp,f,uRange,vRange,uSteps,vSteps) ==

                                                           Draw the lines that connect

  delU := (hi(uRange) - lo(uRange))/uSteps                 the points in the complex

  delV := (hi(vRange) - lo(vRange))/vSteps                 plane to the north pole

  uSteps := uSteps + 1; vSteps := vSteps + 1               of the Riemann sphere
   u := lo uRange
   for i in 1..uSteps repeat                                For each u
     v := lo vRange
     for j in 1..vSteps repeat                              For each v
       p1 := f(u,v)

      p2 := riemannTransform complex(p1.1, p1.2)           Project p1 onto the sphere

      fun := lineFromTo(p1,p2)                             Create a line function
       cf := (t:DFLOAT):DFLOAT +-> 3

      makeObject(fun, 0..1,space==sp,tubePoints==4,        Draw the connecting line
                  tubeRadius==0.01,colorFunction==cf)
       v := v + delV
     u := u + delU
   void()

riemannSphere(u,v) ==                                      A sphere sitting on the

  sv := sin(v)                                             complex plane, with radius 1
   0.99@DFLOAT*(point [cos(u)*sv,sin(u)*sv,cos(v),0.0@DFLOAT])+
     point [0.0@DFLOAT, 0.0@DFLOAT, 1.0@DFLOAT, 4.0@DFLOAT]
  

lineFromTo(p1, p2) ==                                      Create a line function

  d := p2 - p1                                             that goes from p1 to p2
   (t:DFLOAT):Point DFLOAT +->
     p1 + t*d





