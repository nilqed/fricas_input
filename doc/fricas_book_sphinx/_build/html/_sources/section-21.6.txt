.. status: ok


21.6 images7.input
------------------

First we look at the conformal conformal map map z↦z+1/z.


.. spadVerbatim

::


)read conformal                                            Read program for drawing

                                                           conformal maps

f z == z                                                   The coordinate grid for the

                                                           complex plane

conformalDraw(f, -2..2, -2..2, 9, 9, "cartesian")          Mapping 1: Source

f z == z + 1/z                                             The map z↦z+1/z

conformalDraw(f, -2..2, -2..2, 9, 9, "cartesian")          Mapping 1: Target



The map z↦-(z+1)/(z-1) maps the unit disk to the right half-plane, as
shown Riemann:sphere on the Riemann sphere.


.. spadVerbatim

::


f z == z                                                   The unit disk

riemannConformalDraw(f,0.1..0.99,0..2*%pi,7,11,"polar")    Mapping 2: Source

f z == -(z+1)/(z-1)                                        The map x↦-(z+1)/(z-1)

riemannConformalDraw(f,0.1..0.99,0..2*%pi,7,11,"polar")    Mapping 2: Target

riemannSphereDraw(-4..4, -4..4, 7, 7, "cartesian")         Riemann Sphere Mapping





