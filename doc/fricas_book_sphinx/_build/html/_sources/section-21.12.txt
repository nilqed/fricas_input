.. status: ok


21.12 tetra.input
-----------------


.. spadVerbatim

::


)set expose add con DenavitHartenbergMatrix                Bring DH matrices into the
                                                            environment

x1:DFLOAT := sqrt(2.0@DFLOAT/3.0@DFLOAT)                   Set up the coordinates of the

x2:DFLOAT := sqrt(3.0@DFLOAT)/6                            corners of the tetrahedron.

p1 := point [-0.5@DFLOAT, -x2, 0.0@DFLOAT]                 Some needed points
 p2 := point [0.5@DFLOAT, -x2, 0.0@DFLOAT]
 p3 := point [0.0@DFLOAT, 2*x2, 0.0@DFLOAT]
 p4 := point [0.0@DFLOAT, 0.0@DFLOAT, x1]

baseTriangle  := [p2, p1, p3]                              The base of the tetrahedron
 mt  := [0.5@DFLOAT*(p2+p1), 0.5@DFLOAT*(p1+p3), 0.5@DFLOAT*(p3+p2)]

                                                           The middle triangle inscribed

                                                           in the base of the tetrahedron

bt1 := [mt.1, p1, mt.2]                                    The bases of the triangles of

bt2 := [p2, mt.1, mt.3]                                    the subdivided tetrahedron
 bt3 := [mt.2, p3, mt.3]
 bt4 := [0.5@DFLOAT*(p2+p4), 0.5@DFLOAT*(p1+p4), 0.5@DFLOAT*(p3+p4)]

tt1 := tri2tri(baseTriangle, bt1)                          Create the transformations

tt2 := tri2tri(baseTriangle, bt2)                          that bring the base of the

tt3 := tri2tri(baseTriangle, bt3)                          tetrahedron to the bases of

tt4 := tri2tri(baseTriangle, bt4)                          the subdivided tetrahedron

drawPyramid(n) ==                                          Draw a Sierpinsky tetrahedron

  s := createThreeSpace()                                  with n levels of recursive
   dh := rotatex(0.0@DFLOAT)                                subdivision
   drawPyramidInner(s, n, dh)
   makeViewport3D(s, "Sierpinsky Tetrahedron")

drawPyramidInner(s, n, dh) ==                              Recursively draw a Sierpinsky
   n = 0 => makeTetrahedron(s, dh, n)                       tetrahedron

  drawPyramidInner(s, n-1, dh * tt1)                       Draw the 4 recursive pyramids
   drawPyramidInner(s, n-1, dh * tt2)
   drawPyramidInner(s, n-1, dh * tt3)
   drawPyramidInner(s, n-1, dh * tt4)

makeTetrahedron(sp, dh, color) ==                          Draw a tetrahedron into the

  w1 := dh*p1                                              given space with the given

  w2 := dh*p2                                              color, transforming it by

  w3 := dh*p3                                              the given DH matrix
   w4 := dh*p4
   polygon(sp, [w1, w2, w4])
   polygon(sp, [w1, w3, w4])
   polygon(sp, [w2, w3, w4])
   void()



Sierpinsky's Tetrahedron



