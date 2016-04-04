.. status: ok


21.14 scherk.input
------------------

Scherk's minimal surface, defined by: Scherk's minimal surface
ezcos(x)=cos(y). See: A Comprehensive Introduction to Differential
Geometry, Vol. 3, by Michael Spivak, Publish Or Perish, Berkeley, 1979,
pp. 249-252.


.. spadVerbatim

::


(xOffset, yOffset):DFLOAT                                   Offsets for a single piece

                                                            of Scherk's minimal surface

drawScherk(m,n) ==                                          Draw Scherk's minimal surface

  free xOffset, yOffset                                     on an m by n patch
   space := createThreeSpace()
   for i in 0..m-1 repeat
     xOffset := i*%pi
     for j in 0 .. n-1 repeat

      rem(i+j, 2) = 0 => 'iter                              Draw only odd patches
       yOffset := j*%pi

      drawOneScherk(space)                                  Draw a patch
   makeViewport3D(space, "Scherk's Minimal Surface")

scherk1(u,v) ==                                             The first patch that makes

  x := cos(u)/exp(v)                                        up a single piece of

  point [xOffset + acos(x), yOffset + u, v, abs(v)]         Scherk's minimal surface

scherk2(u,v) ==                                             The second patch
   x := cos(u)/exp(v)
   point [xOffset - acos(x), yOffset + u, v, abs(v)]

scherk3(u,v) ==                                             The third patch
   x := exp(v) * cos(u)
   point [xOffset + u, yOffset + acos(x), v, abs(v)]

scherk4(u,v) ==                                             The fourth patch
   x := exp(v) * cos(u)
   point [xOffset + u, yOffset - acos(x), v, abs(v)]

drawOneScherk(s) ==                                         Draw the surface by

                                                            breaking it into four

                                                            patches and then drawing
                                                             the patches
   makeObject(scherk1,-%pi/2..%pi/2,0..%pi/2,space==s,
              var1Steps == 28, var2Steps == 28)       
   makeObject(scherk2,-%pi/2..%pi/2,0..%pi/2,space==s,
              var1Steps == 28, var2Steps == 28)
   makeObject(scherk3,-%pi/2..%pi/2,-%pi/2..0,space==s,
              var1Steps == 28, var2Steps == 28)
   makeObject(scherk4,-%pi/2..%pi/2,-%pi/2..0,space==s,
              var1Steps == 28, var2Steps == 28)
   void()





