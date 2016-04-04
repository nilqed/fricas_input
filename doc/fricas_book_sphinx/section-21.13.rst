.. status: ok


21.13 antoine.input
-------------------

Draw Antoine's Necklace. Antoine's Necklace Thank you to Matthew Grayson
at IBM's T.J Watson Research Center for the idea.


.. spadVerbatim

::


)set expose add con DenavitHartenbergMatrix                Bring DH matrices into

                                                           the environment

torusRot: DHMATRIX(DFLOAT)                                 The  transformation for

                                                           drawing a sub ring

drawRings(n) ==                                            Draw Antoine's Necklace with n

  s := createThreeSpace()                                  levels of recursive subdivision

  dh:DHMATRIX(DFLOAT) := identity()                        The number of subrings is 10n

  drawRingsInner(s, n, dh)                                 Do the real work
   makeViewport3D(s, "Antoine's Necklace")



In order to draw Antoine rings, we take one ring, scale it down to a
smaller size, rotate it around its central axis, translate it to the
edge of the larger ring and rotate it around the edge to a point
corresponding to its count (there are 10 positions around the edge of
the larger ring). For each of these new rings we recursively perform the
operations, each ring becoming 10 smaller rings. Notice how the DHMATRIX
operations are used to build up the proper matrix composing all these
transformations.


.. spadVerbatim

::


drawRingsInner(s, n, dh) ==                                Recursively draw Antoine's
   n = 0 =>                                                 Necklace
     drawRing(s, dh)
     void()

  t := 0.0@DFLOAT                                          Angle around ring

  p := 0.0@DFLOAT                                          Angle of subring from plane

  tr := 1.0@DFLOAT                                         Amount to translate subring

  inc := 0.1@DFLOAT                                        The translation increment

  for i in 1..10 repeat                                    Subdivide into 10 linked rings
     tr := tr + inc
     inc := -inc
     dh' := dh*rotatez(t)*translate(tr,0.0@DFLOAT,0.0@DFLOAT)*

                                                           Transform ring in center
                                                            to a link
            rotatey(p)*scale(0.35@DFLOAT, 0.48@DFLOAT, 0.4@DFLOAT)
     drawRingsInner(s, n-1, dh')
     t := t + 36.0@DFLOAT
     p := p + 90.0@DFLOAT
   void()

drawRing(s, dh) ==                                         Draw a single ring into

  free torusRot                                            the given subspace,

  torusRot := dh                                           transformed by the given
                                                            DHMATRIX
   makeObject(torus, 0..2*%pi, 0..2*%pi, var1Steps == 6,
              space == s, var2Steps == 15)

torus(u ,v) ==                                             Parameterization of a torus,

  cu := cos(u)/6                                           transformed by the

                                                           DHMATRIX in torusRot.
   torusRot*point [(1+cu)*cos(v),(1+cu)*sin(v),(sin u)/6]





