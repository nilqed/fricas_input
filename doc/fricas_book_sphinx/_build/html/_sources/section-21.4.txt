.. status: ok


21.4 images5.input
------------------

The parameterization of the Etruscan Venus is due to George Frances.
Etruscan Venus


.. spadVerbatim

::

 venus(a,r,steps) ==
   surf := (u:DFLOAT, v:DFLOAT): Point DFLOAT +->
     cv := cos(v)
     sv := sin(v)
     cu := cos(u)
     su := sin(u)
     x := r * cos(2*u) * cv + sv * cu
     y := r * sin(2*u) * cv - sv * su
     z := a * cv
     point [x,y,z]
   draw(surf, 0..%pi, -%pi..%pi, var1Steps==steps,
        var2Steps==steps, title == "Etruscan Venus")

venus(5/2, 13/10, 50)                                  The Etruscan Venus



The Figure-8 Klein Bottle Klein bottle parameterization is from
Differential Geometry and Computer Graphics by Thomas Banchoff, in
Perspectives in Mathematics, Anniversary of Oberwolfasch 1984,
Birkh\\"{a}user-Verlag, Basel, pp. 43-60.


.. spadVerbatim

::

 klein(x,y) ==
   cx := cos(x)
   cy := cos(y)
   sx := sin(x)
   sy := sin(y)
   sx2 := sin(x/2)
   cx2 := cos(x/2)
   sq2 := sqrt(2.0@DFLOAT)
   point [cx * (cx2 * (sq2 + cy) + (sx2 * sy * cy)), _
          sx * (cx2 * (sq2 + cy) + (sx2 * sy * cy)), _
          -sx2 * (sq2 + cy) + cx2 * sy * cy]

draw(klein, 0..4*%pi, 0..2*%pi, var1Steps==50,             Figure-8 Klein bottle
      var2Steps==50,title=="Figure Eight Klein Bottle")



The next two images are examples of generalized tubes.


.. spadVerbatim

::

 )read ntube

rotateBy(p, theta) ==                                      Rotate a point p by

  c := cos(theta)                                          θ around the origin
   s := sin(theta)
   point [p.1*c - p.2*s, p.1*s + p.2*c]

bcircle t ==                                               A circle in three-space
   point [3*cos t, 3*sin t, 0]

twist(u, t) ==                                             An ellipse that twists

  theta := 4*t                                             around four times as

  p := point [sin u, cos(u)/2]                             t revolves once
   rotateBy(p, theta)

ntubeDrawOpt(bcircle, twist, 0..2*%pi, 0..2*%pi,           Twisted Torus
              var1Steps == 70, var2Steps == 250)

twist2(u, t) ==                                            Create a twisting circle
   theta := t
   p := point [sin u, cos(u)]
   rotateBy(p, theta)

cf(u,v) == sin(21*u)                                       Color function with 21 stripes

ntubeDrawOpt(bcircle, twist2, 0..2*%pi, 0..2*%pi,          Striped Torus
   colorFunction == cf, var1Steps == 168,
   var2Steps == 126)





