.. status: ok


21.5 images6.input
------------------


.. spadVerbatim

::


gam(x,y) ==                                                The height and color are the

  g := Gamma complex(x,y)                                  real and argument parts

  point [x,y,max(min(real g, 4), -4), argument g]          of the Gamma function,

                                                           respectively.

draw(gam, -%pi..%pi, -%pi..%pi,                            The Gamma Function
      title == "Gamma(x + %i*y)", _
      var1Steps == 100, var2Steps == 100)
 b(x,y) == Beta(x,y)

draw(b, -3.1..3, -3.1 .. 3, title == "Beta(x,y)")          The Beta Function
 atf(x,y) == 
   a := atan complex(x,y)
   point [x,y,real a, argument a]

draw(atf, -3.0..%pi, -3.0..%pi)                            The Arctangent function



function:Gamma function:Euler Beta Euler:Beta function



