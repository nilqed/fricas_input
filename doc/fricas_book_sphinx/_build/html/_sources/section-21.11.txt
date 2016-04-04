.. status: ok


21.11 dhtri.input
-----------------

Create affine transformations (DH matrices) that transform a given
triangle into another.


.. spadVerbatim

::

 tri2tri: (List Point DFLOAT, List Point DFLOAT) -> DHMATRIX(DFLOAT)

                                                           Compute a DHMATRIX that

tri2tri(t1, t2) ==                                         transforms t1 to t2, where

  n1 := triangleNormal(t1)                                 t1 and t2 are the vertices

  n2 := triangleNormal(t2)                                 of two triangles in 3-space
   tet2tet(concat(t1, n1), concat(t2, n2))
 tet2tet: (List Point DFLOAT, List Point DFLOAT) -> DHMATRIX(DFLOAT)

                                                           Compute a DHMATRIX that

tet2tet(t1, t2) ==                                         transforms t1 to t2,

  m1 := makeColumnMatrix t1                                where t1 and t2 are the

  m2 := makeColumnMatrix t2                                vertices of two tetrahedrons
   m2 * inverse(m1)                                         in 3-space

makeColumnMatrix(t) ==                                     Put the vertices of a tetra-

  m := new(4,4,0)$DHMATRIX(DFLOAT)                         hedron into matrix form
   for x in t for i in 1..repeat
     for j in 1..3 repeat
       m(j,i) := x.j
     m(4,i) := 1
   m

triangleNormal(t) ==                                       Compute a vector normal to

  a := triangleArea t                                      the given triangle, whose

  p1 := t.2 - t.1                                          length is the square root

  p2 := t.3 - t.2                                          of the area of the triangle
   c := cross(p1, p2)
   len := length(c)
   len = 0 => error "degenerate triangle!"
   c := (1/len)*c
   t.1 + sqrt(a) * c

triangleArea t ==                                          Compute the area of a

  a := length(t.2 - t.1)                                   triangle using Heron's
   b := length(t.3 - t.2)                                   formula
   c := length(t.1 - t.3)
   s := (a+b+c)/2
   sqrt(s*(s-a)*(s-b)*(s-c))





