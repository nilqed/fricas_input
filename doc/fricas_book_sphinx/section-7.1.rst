.. status: ok


7.1 Two-Dimensional Graphics
----------------------------

The FriCAS two-dimensional graphics package provides the ability to
graphics:two-dimensional display

-  curves defined by functions of a single real variable
-  curves defined by parametric equations
-  implicit non-singular curves defined by polynomial equations
-  planar graphs generated from lists of point components.

These graphs can be modified by specifying various options, such as
calculating points in the polar coordinate system or changing the size
of the graph viewport window.



7.1.1 Plotting Two-Dimensional Functions of One Variable
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

curve:one variable function The first kind of two-dimensional graph is
that of a curve defined by a function y=f(x) over a finite interval of
the x axis.





The general format for drawing a function defined by a formula f(x) is:



draw(f(x), x = a..b, options)



| where a..b defines the range of x, and where options prescribes zero
or more options as described in
`ugGraphTwoDOptions <section-7.1.html#ugGraphTwoDOptions>`__ . An
example of an option is curveColor==brightred(). An alternative format
involving functions f and g is also available.





A simple way to plot a function is to use a formula. The first argument
is the formula. For the second argument, write the name of the
independent variable (here, x), followed by an =, and the range of
values.

Display this formula over the range 0≤x≤6. FriCAS converts your formula
to a compiled function so that the results can be computed quickly and
efficiently.



draw(sin(tan(x)) - tan(sin(x)),x = 0..6)



Once again the formula is converted to a compiled function before any
points were computed. If you want to graph the same function on several
intervals, it is a good idea to define the function first so that the
function has to be compiled only once.

This time we first define the function.


.. spadInput
::

	f(x) == (x-1)*(x-2)*(x-3)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



To draw the function, the first argument is its name and the second is
just the range with no independent variable.



draw(f, 0..4)







7.1.2 Plotting Two-Dimensional Parametric Plane Curves
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The second kind of two-dimensional graph is that of parametric plane
curve curves produced by parametric equations. curve:parametric plane
Let x=f(t) and y=g(t) be formulas or two functions f and g as the
parameter t ranges over an interval [a,b]. The function curve takes the
two functions f and g as its parameters.





The general format for drawing a two-dimensional plane curve defined by
parametric formulas x=f(t) and y=g(t) is:



draw(curve(f(t), g(t)), t = a..b, options)



where a..b defines the range of the independent variable t, and where
options prescribes zero or more options as described in
`ugGraphThreeDOptions <section-7.2.html#ugGraphThreeDOptions>`__ . An
example of an option is curveColor==brightred().





Here's an example:

Define a parametric curve using a range involving %pi, FriCAS's way of
saying π. For parametric curves, FriCAS compiles two functions, one for
each of the functions f and g.



draw(curve(sin(t)*sin(2*t)*sin(3*t),
sin(4*t)*sin(5*t)*sin(6*t)), t = 0..2*%pi)



The title may be an arbitrary string and is an optional argument to the
draw command.



draw(curve(cos(t), sin(t)), t = 0..2*%pi)



If you plan on plotting x=f(t), y=g(t) as t ranges over several
intervals, you may want to define functions f and g first, so that they
need not be recompiled every time you create a new graph. Here's an
example:

As before, you can first define the functions you wish to draw.


.. spadInput
::

	f(t:DFLOAT):DFLOAT == sin(3*t/4)


.. spadMathAnswer
.. spadVerbatim

::

    Function declaration f : DoubleFloat -> DoubleFloat has been 
       added to workspace.




.. spadType

:sub:`Type: Void`



FriCAS compiles them to map DoubleFloat values to DoubleFloat values.


.. spadInput
::

	g(t:DFLOAT):DFLOAT == sin(t)


.. spadMathAnswer
.. spadVerbatim

::

    Function declaration f : DoubleFloat -> DoubleFloat has been added 
       to workspace.




.. spadType

:sub:`Type: Void`



Give to curve the names of the functions, then write the range without
the name of the independent variable.



draw(curve(f,g),0..%pi)



Here is another look at the same curve but over a different range.
Notice that f and g are not recompiled. Also note that FriCAS provides a
default title based on the first function specified in curve.



draw(curve(f,g),-4*%pi..4*%pi)







7.1.3 Plotting Plane Algebraic Curves
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A third kind of two-dimensional graph is a non-singular solution curve
curve:plane algebraic in a rectangular region of the plane. A solution
curve is a curve defined by a polynomial equation p(x,y)=0. plane
algebraic curve Non-singular means that the curve is smooth in that it
does not cross itself or come to a point (cusp). Algebraically, this
means that for any point (x,y) on the curve, that is, a point such that
p(x,y)=0, the partial derivatives ∂p∂x(x,y) and ∂p∂y(x,y) are not both
zero. curve:smooth curve:non-singular smooth curve non-singular curve





The general format for drawing a non-singular solution curve given by a
polynomial of the form p(x,y)=0 is:



draw(p(x,y) = 0, x, y, range == [a..b, c..d], options)



| where the second and third arguments name the first and second
independent variables of p. A range option is always given to designate
a bounding rectangular region of the plane a≤x≤b,c≤y≤d. Zero or more
additional options as described in
`ugGraphTwoDOptions <section-7.1.html#ugGraphTwoDOptions>`__ may be
given.





We require that the polynomial has rational or integral coefficients.
Here is an algebraic curve example (Cartesian ovals): Cartesian:ovals


.. spadInput
::

	p := ((x^2 + y^2 + 1) - 8*x)^2 - (8*(x^2 + y^2 + 1)-4*x-1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| y4+(2x2-16x-6)y2+x4-16x3+58x2-12x-6   |
+---------------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`



The first argument is always expressed as an equation of the form p=0
where p is a polynomial.



draw(p = 0, x, y, range == [-1..11, -7..7])







7.1.4 Two-Dimensional Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The draw commands take an optional list of options, such as title shown
above. Each option is given by the syntax: name == value. Here is a list
of the available options in the order that they are described below.

+------------+--------------+---------------+
| adaptive   | clip         | unit          |
+------------+--------------+---------------+
| clip       | curveColor   | range         |
+------------+--------------+---------------+
| toScale    | pointColor   | coordinates   |
+------------+--------------+---------------+

The adaptive option turns adaptive plotting on or off. adaptive plotting
Adaptive plotting uses an algorithm that traverses a graph and computes
more points for those parts of the graph with high curvature. The higher
the curvature of a region is, the more points the algorithm computes.
graphics:2D options:adaptive

The adaptive option is normally on. Here we turn it off.



draw(sin(1/x),x=-2*%pi..2*%pi, adaptive == false)



The clip option turns clipping on or off. graphics:2D options:clipping
If on, large values are cut off according to
clipPointsDefaultclipPointsDefaultGraphicsDefaults.



draw(tan(x),x=-2*%pi..2*%pi, clip == true)



Option toScale does plotting to scale if true or uses the entire
viewport if false. The default can be determined using
drawToScaledrawToScaleGraphicsDefaults. graphics:2D options:to scale



draw(sin(x),x=-%pi..%pi, toScale == true, unit == [1.0,1.0])



Option clip with a range sets point clipping of a graph within the
graphics:2D options:clip in a range ranges specified in the list
[xrange,yrange]. clipping If only one range is specified, clipping
applies to the y-axis.



draw(sec(x),x=-2*%pi..2*%pi, clip == [-2*%pi..2*%pi,-%pi..%pi], unit
== [1.0,1.0])



Option curveColor sets the color of the graph curves or lines to be the
graphics:2D options:curve color indicated palette color curve:color (see
`ugGraphColor <section-7.1.html#ugGraphColor>`__ and
`ugGraphColorPalette <section-7.1.html#ugGraphColorPalette>`__ ).
color:curve



draw(sin(x),x=-%pi..%pi, curveColor == bright red())



Option pointColor sets the color of the graph points to the indicated
graphics:2D options:point color palette color (see
`ugGraphColor <section-7.1.html#ugGraphColor>`__ and
`ugGraphColorPalette <section-7.1.html#ugGraphColorPalette>`__ ).
color:point



draw(sin(x),x=-%pi..%pi, pointColor == pastel yellow())



Option unit sets the intervals at which the axis units are plotted
graphics:2D options:set units according to the indicated steps [ x
interval, y interval].



draw(curve(9*sin(3*t/4),8*sin(t)), t = -4*%pi..4*%pi, unit ==
[2.0,1.0])



Option range sets the range of variables in a graph to be within the
ranges graphics:2D options:range for solving plane algebraic curve
plots.



draw(y^2 + y - (x^3 - x) = 0, x, y, range == [-2..2,-2..1],
unit==[1.0,1.0])



A second example of a solution plot.



draw(x^2 + y^2 = 1, x, y, range == [-3/2..3/2,-3/2..3/2],
unit==[0.5,0.5])



Option coordinates indicates the coordinate system in which the graph
graphics:2D options:coordinates is plotted. The default is to use the
Cartesian coordinate system. Cartesian:coordinate system For more
details, see `ugGraphCoord <section-7.2.html#ugGraphCoord>`__ or
CoordinateSystems. coordinate system:Cartesian



draw(curve(sin(5*t),t),t=0..2*%pi, coordinates == polar)







7.1.5 Color
~~~~~~~~~~~

The domain Color Color provides operations for manipulating
graphics:color colors in two-dimensional graphs. color Colors are
objects of Color. Each color has a hue and a weight. hue Hues are
represented by integers that range from 1 to the
numberOfHues()numberOfHues()Color, normally graphics:color:number of
hues 27. weight Weights are floats and have the value 1.0 by default.

 color (integer)
    creates a color of hue integer and weight 1.0.
 hue (color)
    returns the hue of color as an integer. graphics:color:hue function
 red ()
    blue(), green(), and yellow() graphics:color:primary color functions
    create colors of that hue with weight 1.0.
 color1 + color2
    returns the color that results from additively combining the
    indicated color1 and color2. Color addition is not commutative:
    changing the order of the arguments produces different results.
integer * color
    changes the weight of color by integer without affecting its hue.
    graphics:color:multiply function For example, red()+3*yellow()
    produces a color closer to yellow than to red. Color multiplication
    is not associative: changing the order of grouping
    color:multiplication produces different results.

These functions can be used to change the point and curve colors for
two- and three-dimensional graphs. Use the pointColor option for points.



draw(x^2,x=-1..1,pointColor == green())



Use the curveColor option for curves.



draw(x^2,x=-1..1,curveColor == color(13) + 2*blue())







7.1.6 Palette
~~~~~~~~~~~~~

graphics:palette

Domain Palette is the domain of shades of colors: dark, dim, bright,
pastel, and light, designated by the integers 1 through 5, respectively.
Palette

Colors are normally bright.


.. spadInput
::

	shade red()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



To change the shade of a color, apply the name of a shade to it.
color:shade shade


.. spadInput
::

	myFavoriteColor := dark blue()


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| [Hue:22Weight:1.0]fromtheDarkpalette   |
+----------------------------------------+




.. spadType

:sub:`Type: Palette`



The expression shade(color) returns the value of a shade of color.


.. spadInput
::

	shade myFavoriteColor


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The expression hue(color) returns its hue.


.. spadInput
::

	hue myFavoriteColor


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| Hue:22Weight:1.0   |
+--------------------+




.. spadType

:sub:`Type: Color`



Palettes can be used in specifying colors in two-dimensional graphs.



draw(x^2,x=-1..1,curveColor == dark blue())







7.1.7 Two-Dimensional Control-Panel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

graphics:2D control-panel Once you have created a viewport, move your
mouse to the viewport and click with your left mouse button to display a
control-panel. The panel is displayed on the side of the viewport
closest to where you clicked. Each of the buttons which toggle on and
off show the current state of the graph.



7.1.7.1 Transformations
~~~~~~~~~~~~~~~~~~~~~~~

graphics:2D control-panel:transformations

Object transformations are executed from the control-panel by
mouse-activated potentiometer windows.

Scale:
    To scale a graph, click on a mouse button graphics:2D
    control-panel:scale within the Scale window in the upper left corner
    of the control-panel. The axes along which the scaling is to occur
    are indicated by setting the toggles above the arrow. With X On and
    Y On appearing, both axes are selected and scaling is uniform. If
    either is not selected, for example, if X Off appears, scaling is
    non-uniform.
Translate:
    To translate a graph, click the mouse in the graphics:2D
    control-panel:translate Translate window in the direction you wish
    the graph to move. This window is located in the upper right corner
    of the control-panel. Along the top of the Translate window are two
    buttons for selecting the direction of translation. Translation
    along both coordinate axes results when X On and Y On appear or
    along one axis when one is on, for example, X On and Y Off appear.





7.1.7.2 Messages
~~~~~~~~~~~~~~~~

graphics:2D control-panel:messages

| The window directly below the transformation potentiometer windows is
used to display system messages relating to the viewport and the
control-panel. The following format is displayed:



| [scaleX, scaleY] >graph < [translateX, translateY]



The two values to the left show the scale factor along the X and Y
coordinate axes. The two values to the right show the distance of
translation from the center in the X and Y directions. The number in the
center shows which graph in the viewport this data pertains to. When
multiple graphs exist in the same viewport, the graph must be selected
(see Multiple Graphs, below) in order for its transformation data to be
shown, otherwise the number is 1.





7.1.7.3 Multiple Graphs
~~~~~~~~~~~~~~~~~~~~~~~

graphics:2D control-panel:multiple graphs The Graphs window contains
buttons that allow the placement of two-dimensional graphs into one of
nine available slots in any other two-dimensional viewport. In the
center of the window are numeral buttons from one to nine that show
whether a graph is displayed in the viewport. Below each number button
is a button showing whether a graph that is present is selected for
application of some transformation. When the caret symbol is displayed,
then the graph in that slot will be manipulated. Initially, the graph
for which the viewport is created occupies the first slot, is displayed,
and is selected.

Clear:
    The Clear button deselects every viewport graph slot. graphics:2D
    control-panel:clear A graph slot is reselected by selecting the
    button below its number.
Query:
    The Query button is used to display the scale and graphics:2D
    control-panel:query translate data for the indicated graph. When
    this button is selected the message Click on the graph to query
    appears. Select a slot number button from the Graphs window. The
    scaling factor and translation offset of the graph are then
    displayed in the message window.
Pick:
    The Pick button is used to select a graph graphics:2D
    control-panel:pick to be placed or dropped into the indicated
    viewport. When this button is selected, the message Click on the
    graph to pick appears. Click on the slot with the graph number of
    the desired graph. The graph information is held waiting for you to
    execute a Drop in some other graph.
Drop:
    Once a graph has been picked up using the Pick button, graphics:2D
    control-panel:drop the Drop button places it into a new viewport
    slot. The message Click on the graph to drop appears in the message
    window when the Drop button is selected. By selecting one of the
    slot number buttons in the Graphs window, the graph currently being
    held is dropped into this slot and displayed.





7.1.7.4 Buttons
~~~~~~~~~~~~~~~

graphics:2D control-panel:buttons

Axes
    turns the coordinate axes on or off. graphics:2D control-panel:axes
Units
    turns the units along the x and y axis on or off. graphics:2D
    control-panel:units
Box
    encloses the area of the viewport graph in a bounding box, or
    removes the box if already enclosed. graphics:2D control-panel:box
Pts
    turns on or off the display of points. graphics:2D
    control-panel:points
Lines
    turns on or off the display of lines connecting points. graphics:2D
    control-panel:lines
PS
    writes the current viewport contents to graphics:2D control-panel:ps
    a file axiom2D.ps or to a name specified in the user's
    graphics:.Xdefaults:PostScript file name .Xdefaults file.
    file:.Xdefaults @ .Xdefaults The file is placed in the directory
    from which FriCAS or the viewAlone program was invoked. PostScript
Reset
    resets the object transformation characteristics and attributes back
    to their initial states. graphics:2D control-panel:reset
Hide
    makes the control-panel disappear. graphics:2D control-panel:hide
Quit
    queries whether the current viewport graphics:2D control-panel:quit
    session should be terminated.







7.1.8 Operations for Two-Dimensional Graphics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is a summary of useful FriCAS operations for two-dimensional
graphics. Each operation name is followed by a list of arguments. Each
argument is written as a variable informally named according to the type
of the argument (for example, integer). If appropriate, a default value
for an argument is given in parentheses immediately following the name.

 adaptive ([boolean(true)])
    adaptive plotting sets or indicates whether graphs are plotted
    graphics:set 2D defaults:adaptive according to the adaptive
    refinement algorithm.
 axesColorDefault ([color(dark blue())])
    sets or indicates the default color of the graphics:set 2D
    defaults:axes color axes in a two-dimensional graph viewport.
 clipPointsDefault ([boolean(false)])
    sets or indicates whether point clipping is graphics:set 2D
    defaults:clip points to be applied as the default for graph plots.
 drawToScale ([boolean(false)])
    sets or indicates whether the plot of a graph graphics:set 2D
    defaults:to scale is to scale or uses the entire viewport space as
    the default.
 lineColorDefault ([color(pastel yellow())])
    sets or indicates the default color of the graphics:set 2D
    defaults:line color lines or curves in a two-dimensional graph
    viewport.
 maxPoints ([integer(500)])
    sets or indicates the default maximum number of graphics:set 2D
    defaults:max points possible points to be used when constructing a
    two-dimensional graph.
 minPoints ([integer(21)])
    sets or indicates the default minimum number of graphics:set 2D
    defaults:min points possible points to be used when constructing a
    two-dimensional graph.
 pointColorDefault ([color(bright red())])
    sets or indicates the default color of the graphics:set 2D
    defaults:point color points in a two-dimensional graph viewport.
 pointSizeDefault ([integer(5)])
    sets or indicates the default size of the graphics:set 2D
    defaults:point size dot used to plot points in a two-dimensional
    graph.
 screenResolution ([integer(600)])
    sets or indicates the default screen graphics:set 2D defaults:screen
    resolution resolution constant used in setting the computation limit
    of adaptively adaptive plotting generated curve plots.
 unitsColorDefault ([color(dim green())])
    sets or indicates the default color of the graphics:set 2D
    defaults:units color unit labels in a two-dimensional graph
    viewport.
 viewDefaults ()
    resets the default settings for the following graphics:set 2D
    defaults:reset viewport attributes: point color, line color, axes
    color, units color, point size, viewport upper left-hand corner
    position, and the viewport size.
 viewPosDefault ([list([100,100])])
    sets or indicates the default position of the graphics:set 2D
    defaults:viewport position upper left-hand corner of a
    two-dimensional viewport, relative to the display root window. The
    upper left-hand corner of the display is considered to be at the (0,
    0) position.
 viewSizeDefault ([list([200,200])])
    sets or indicates the default size in which two graphics:set 2D
    defaults:viewport size dimensional viewport windows are shown. It is
    defined by a width and then a height.
 viewWriteAvailable ([list(["pixmap","bitmap", "postscript", "image"])])
    indicates the possible file types graphics:2D defaults:available
    viewport writes that can be created with the
    writewriteTwoDimensionalViewport function.
 viewWriteDefault ([list([])])
    sets or indicates the default types of files, in graphics:set 2D
    defaults:write viewport addition to the data file, that are created
    when a write function is executed on a viewport.
 units (viewport, integer(1), string("off"))
    turns the units on or off for the graph with index integer.
 axes (viewport, integer(1), string("on"))
    turns the axes on graphics:2D commands:axes or off for the graph
    with index integer.
 close (viewport)
    closes viewport. graphics:2D commands:close
 connect (viewport, integer(1), string("on"))
    declares whether lines graphics:2D commands:connect connecting the
    points are displayed or not.
 controlPanel (viewport, string("off"))
    declares whether the two-dimensional control-panel is automatically
    displayed or not.
 graphs (viewport)
    returns a list graphics:2D commands:graphs describing the state of
    each graph. If the graph state is not being used this is shown by
    "undefined", otherwise a description of the graph's contents is
    shown.
 graphStates (viewport)
    displays graphics:2D commands:state of graphs a list of all the
    graph states available for viewport, giving the values for every
    property.
 key (viewport)
    returns the process graphics:2D commands:key ID number for viewport.
 move (viewport, integerx(viewPosDefault), integery(viewPosDefault))
    moves viewport on the screen so that the graphics:2D commands:move
    upper left-hand corner of viewport is at the position (x,y).
 options (viewport)
    returns a list graphics:2D commands:options of all the DrawOptions
    used by viewport.
 points (viewport, integer(1), string("on"))
    specifies whether the graph points for graph integer are graphics:2D
    commands:points to be displayed or not.
 region (viewport, integer(1), string("off"))
    declares whether graph integer is or is not to be displayed with a
    bounding rectangle.
 reset (viewport)
    resets all the properties of viewport.
 resize (viewport, integerwidth, integerheight)
    graphics:2D commands:resize resizes viewport with a new width and
    height.
 scale (viewport, integern(1), integerx(0.9), integery(0.9))
    scales values for the graphics:2D commands:scale x and y coordinates
    of graph n.
 show (viewport, integern(1), string("on"))
    indicates if graph n is shown or not.
 title (viewport, string("FriCAS 2D"))
    designates the title for viewport.
 translate (viewport, integern(1), floatx(0.0), floaty(0.0))
    graphics:2D commands:translate causes graph n to be moved x and y
    units in the respective directions.
 write (viewport, stringdirectory, [strings])
    if no third argument is given, writes the data file onto the
    directory with extension data. The third argument can be a single
    string or a list of strings with some or all the entries "pixmap",
    "bitmap", "postscript", and "image".





7.1.9 Addendum: Building Two-Dimensional Graphs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this section we demonstrate how to create two-dimensional graphs from
lists of points and give an example showing how to read the lists of
points from a file.



7.1.9.1 Creating a Two-Dimensional Viewport from a List of Points
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS creates lists of points in a two-dimensional viewport by
utilizing the GraphImage and TwoDimensionalViewport domains. In this
example, the makeGraphImagemakeGraphImageGraphImage function takes a
list of lists of points parameter, a list of colors for each point in
the graph, a list of colors for each line in the graph, and a list of
sizes for each point in the graph.

The following expressions create a list of lists of points which will be
read by FriCAS and made into a two-dimensional viewport.


.. spadInput
::

	p1 := point [1,1]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [1.0,1.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p2 := point [0,1]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0.0,1.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p3 := point [0,0]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0.0,0.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p4 := point [1,0]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [1.0,0.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p5 := point [1,.5]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [1.0,0.5]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p6 := point [.5,0]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0.5,0.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p7 := point [0,0.5]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0.0,0.5]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p8 := point [.5,1]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0.5,1.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p9 := point [.25,.25]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [0.25,0.25]   |
+---------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p10 := point [.25,.75]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [0.25,0.75]   |
+---------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p11 := point [.75,.75]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [0.75,0.75]   |
+---------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p12 := point [.75,.25]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [0.75,0.25]   |
+---------------+




.. spadType

:sub:`Type: Point DoubleFloat`



Finally, here is the list.


.. spadInput
::

	llp := [ [p1,p2], [p2,p3], [p3,p4], [p4,p1], [p5,p6], [p6,p7], [p7,p8],
[p8,p5], [p9,p10], [p10,p11], [p11,p12], [p12,p9] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [[[1.0,1.0],[0.0,1.0]],[[0.0,1.0],[0.0,0.0]],[[0.0,0.0],[1.0,0.0]],[[1.0,0.0],[1.0,1.0]],[[1.0,0.5],[0.5,0.0]],[[0.5,0.0],[0.0,0.5]],[[0.0,0.5],[0.5,1.0]],[[0.5,1.0],[1.0,0.5]],[[0.25,0.25],[0.25,0.75]],[[0.25,0.75],[0.75,0.75]],[[0.75,0.75],[0.75,0.25]],[[0.75,0.25],[0.25,0.25]]]   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List Point DoubleFloat`



Now we set the point sizes for all components of the graph.


.. spadInput
::

	size1 := 6::PositiveInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 6   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	size2 := 8::PositiveInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	size3 := 10::PositiveInteger


.. spadMathAnswer
.. spadInput
::

	lsize := [size1, size1, size1, size1, size2, size2, size2, size2, size3,
size3, size3, size3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| [6,6,6,6,8,8,8,8,size3,size3,size3,size3]   |
+---------------------------------------------+




.. spadType

:sub:`Type: List Polynomial Integer`



Here are the colors for the points.


.. spadInput
::

	pc1 := pastel red()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| [Hue:1Weight:1.0]fromthePastelpalette   |
+-----------------------------------------+




.. spadType

:sub:`Type: Palette`




.. spadInput
::

	pc2 := dim green()


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| [Hue:14Weight:1.0]fromtheDimpalette   |
+---------------------------------------+




.. spadType

:sub:`Type: Palette`




.. spadInput
::

	pc3 := pastel yellow()


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| [Hue:11Weight:1.0]fromthePastelpalette   |
+------------------------------------------+




.. spadType

:sub:`Type: Palette`




.. spadInput
::

	lpc := [pc1, pc1, pc1, pc1, pc2, pc2, pc2, pc2, pc3, pc3, pc3, pc3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [[Hue:1Weight:1.0]fromthePastelpalette,[Hue:1Weight:1.0]fromthePastelpalette,[Hue:1Weight:1.0]fromthePastelpalette,[Hue:1Weight:1.0]fromthePastelpalette,[Hue:14Weight:1.0]fromtheDimpalette,[Hue:14Weight:1.0]fromtheDimpalette,[Hue:14Weight:1.0]fromtheDimpalette,[Hue:14Weight:1.0]fromtheDimpalette,[Hue:11Weight:1.0]fromthePastelpalette,[Hue:11Weight:1.0]fromthePastelpalette,[Hue:11Weight:1.0]fromthePastelpalette,[Hue:11Weight:1.0]fromthePastelpalette]   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Palette`



Here are the colors for the lines.


.. spadInput
::

	lc := [pastel blue(), light yellow(), dim green(), bright red(), light
green(), dim yellow(), bright blue(), dark red(), pastel red(), light
blue(), dim green(), light yellow()]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [[Hue:22Weight:1.0]fromthePastelpalette,[Hue:11Weight:1.0]fromtheLightpalette,[Hue:14Weight:1.0]fromtheDimpalette,[Hue:1Weight:1.0]fromtheBrightpalette,[Hue:14Weight:1.0]fromtheLightpalette,[Hue:11Weight:1.0]fromtheDimpalette,[Hue:22Weight:1.0]fromtheBrightpalette,[Hue:1Weight:1.0]fromtheDarkpalette,[Hue:1Weight:1.0]fromthePastelpalette,[Hue:22Weight:1.0]fromtheLightpalette,[Hue:14Weight:1.0]fromtheDimpalette,[Hue:11Weight:1.0]fromtheLightpalette]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Palette`



Now the GraphImage is created according to the component specifications
indicated above.


.. spadInput
::

	g := makeGraphImage(llp,lpc,lc,lsize)$GRIMAGE


.. spadMathAnswer
The makeViewport2DmakeViewport2DTwoDimensionalViewport function now
creates a TwoDimensionalViewport for this graph according to the list of
options specified within the brackets.



makeViewport2D(g,[title("Lines")])$VIEW2D



This example demonstrates the use of the GraphImage functions
componentcomponentGraphImage and appendPointappendPointGraphImage in
adding points to an empty GraphImage.


.. spadInput
::

	)clear all


.. spadMathAnswer
.. spadInput
::

	g := graphImage()$GRIMAGE


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| Graphwith0pointlists   |
+------------------------+




.. spadType

:sub:`Type: GraphImage`




.. spadInput
::

	p1 := point [0,0]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0.0,0.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p2 := point [.25,.25]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [0.25,0.25]   |
+---------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p3 := point [.5,.5]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [0.5,0.5]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p4 := point [.75,.75]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [0.75,0.75]   |
+---------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	p5 := point [1,1]$(Point DFLOAT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| [1.0,1.0]   |
+-------------+




.. spadType

:sub:`Type: Point DoubleFloat`




.. spadInput
::

	component(g,p1)$GRIMAGE


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	component(g,p2)$GRIMAGE


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	appendPoint(g,p3)$GRIMAGE


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	appendPoint(g,p4)$GRIMAGE


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	appendPoint(g,p5)$GRIMAGE


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	g1 := makeGraphImage(g)$GRIMAGE


.. spadMathAnswer
Here is the graph.



makeViewport2D(g1,[title("Graph Points")])$VIEW2D



A list of points can also be made into a GraphImage by using the
operation coercecoerceGraphImage. It is equivalent to adding each point
to g2 using componentcomponentGraphImage.


.. spadInput
::

	g2 := coerce([ [p1],[p2],[p3],[p4],[p5] ])$GRIMAGE


.. spadMathAnswer
Now, create an empty TwoDimensionalViewport.


.. spadInput
::

	v := viewport2D()$VIEW2D


.. spadMathAnswer
.. spadInput
::

	options(v,[title("Just Points")])$VIEW2D


.. spadMathAnswer
Place the graph into the viewport.


.. spadInput
::

	putGraph(v,g2,1)$VIEW2D


.. spadMathAnswer
Take a look.



makeViewport2D(v)$VIEW2D







7.1.9.2 Creating a Two-Dimensional Viewport of a List of Points from a File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following three functions read a list of points from a file and then
draw the points and the connecting lines. The points are stored in the
file in readable form as floating point numbers (specifically,
DoubleFloat values) as an alternating stream of x- and y-values. For
example,


.. spadVerbatim

::

 0.0 0.0     1.0 1.0     2.0 4.0
 3.0 9.0     4.0 16.0    5.0 25.0




.. spadVerbatim

::

 drawPoints(lp:List Point DoubleFloat):VIEW2D ==
   g := graphImage()$GRIMAGE
   for p in lp repeat
     component(g,p,pointColorDefault(),lineColorDefault(),
       pointSizeDefault())
   gi := makeGraphImage(g)$GRIMAGE
   makeViewport2D(gi,[title("Points")])$VIEW2D
 drawLines(lp:List Point DoubleFloat):VIEW2D ==
   g := graphImage()$GRIMAGE
   component(g, lp, pointColorDefault(), lineColorDefault(),
     pointSizeDefault())$GRIMAGE
   gi := makeGraphImage(g)$GRIMAGE
   makeViewport2D(gi,[title("Points")])$VIEW2D
 plotData2D(name, title) ==
   f:File(DFLOAT) := open(name,"input")
   lp:LIST(Point DFLOAT) := empty()
   while ((x := readIfCan!(f)) case DFLOAT) repeat
     y : DFLOAT := read!(f)
     lp := cons(point [x,y]$(Point DFLOAT), lp)
     lp
   close!(f)
   drawPoints(lp)
   drawLines(lp)



This command will actually create the viewport and the graph if the
point data is in the file "file.data".


.. spadVerbatim

::

 plotData2D("file.data", "2D Data Plot")









7.1.10 Addendum: Appending a Graph to a Viewport Window Containing a Graph
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section demonstrates how to append a two-dimensional graph to a
viewport already containing other graphs. The default draw command
places a graph into the first GraphImage slot position of the
TwoDimensionalViewport.

This graph is in the first slot in its viewport.


.. spadInput
::

	v1 := draw(sin(x),x=0..2*%pi)


.. spadMathAnswer
So is this graph.


.. spadInput
::

	v2 := draw(cos(x),x=0..2*%pi, curveColor==light red())


.. spadMathAnswer
The operation getGraphgetGraphTwoDimensionalViewport retrieves the
GraphImage g1 from the first slot position in the viewport v1.


.. spadInput
::

	g1 := getGraph(v1,1)


.. spadMathAnswer
Now putGraphputGraphTwoDimensionalViewport places g1 into the the second
slot position of v2.


.. spadInput
::

	putGraph(v2,g1,2)


.. spadMathAnswer
Display the new TwoDimensionalViewport containing both graphs.



makeViewport2D(v2)







