.. status: ok


10.3 Coloring and Positioning Ribbons
-------------------------------------

Before leaving the ribbon example, we make two improvements. Normally,
the color given to each point in the space is a function of its height
within a bounding box. The points at the bottom of the box are red,
those at the top are purple.

To change the normal coloring, you can give an option
colorFunction==function. When FriCAS goes about displaying the data, it
determines the range of colors used for all points within the box.
FriCAS then distributes these numbers uniformly over the number of hues.
Here we use the simple color function (x,y)↦i for the i-th ribbon.

Also, we add an argument yrange so you can give the range of y occupied
by the ribbons. For example, if the yrange is given as y=0..1 and there
are 5 ribbons to be displayed, each ribbon would have width 0.2 and
would appear in the range 0≤y≤1.

Refer to lines 4-9. Line 4 assigns to yVar the variable part of the
yrange (after all, it need not be y). Suppose that yrange is given as
t=a..b where a and b have numerical values. Then line 5 assigns the
value of a to the variable y0. Line 6 computes the width of the ribbon
by dividing the difference of a and b by the number, num, of ribbons.
The result is assigned to the variable width. Note that in the for-loop
in line 7, we are iterating in parallel; it is not a nested loop.


.. spadVerbatim

::

 drawRibbons(flist, xrange, yrange) ==}{}
   sp := createThreeSpace()                     Create empty space $sp$.
   num :=  # flist                              The number of ribbons.
   yVar := variable yrange                      The ribbon variable.

  y0:Float    := lo segment yrange             The first ribbon coordinate.
   width:Float := (hi segment yrange - y0)/num  The width of a ribbon.
   for f in flist for color in 1..num repeat    For each function $f$,
     makeObject(f, xrange, yVar = y0..y0+width, create and add ribbon to
       var2Steps == 1, colorFunction == (x,y) +-> color, _

      space == sp)                             $sp$ of a different color.

    y0 := y0 + width                           The next ribbon coordinate.
   vp := makeViewport3D(sp, "Ribbons")          Create viewport.
   drawStyle(vp, "shade")                       Select shading style.
   outlineRender(vp, "on")                      Show polygon outlines.
   showRegion(vp, "on")                         Enclose in a box.
   vp                                           Return the viewport.





The final drawRibbons function.





