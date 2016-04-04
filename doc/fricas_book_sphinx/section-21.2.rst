.. status: ok


21.2 images2.input
------------------

These images illustrate how Newton's method converges when computing the
Newton iteration complex cube roots of 2. Each point in the (x,y)-plane
represents the complex number x+iy, which is given as a starting point
for Newton's method. The poles in these images represent bad starting
values. The flat areas are the regions of convergence to the three
roots.


.. spadVerbatim

::


)read newton                                       Read the programs from
 )read vectors                                      Chapter 10

f := newtonStep(x^3 - 2)                          Create a Newton's iteration
                                                    function for x3=2



The function fn computes n steps of Newton's method.


.. spadVerbatim

::


clipValue := 4                                     Clip values with magnitude > 4

drawComplexVectorField(f^3, -3..3, -3..3)         The vector field for f3
 drawComplex(f^3, -3..3, -3..3)                    The surface for f3
 drawComplex(f^4, -3..3, -3..3)                    The surface for f4





