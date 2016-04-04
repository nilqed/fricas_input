.. status: ok



11.0 Packages
-------------

Packages provide the bulk of package FriCAS's algorithmic library, from
numeric packages for computing special functions to symbolic facilities
for constructor:package differential equations, symbolic integration,
and limits. package:constructor

In Chapter `ugIntProg <section-10.0.html#ugIntProg>`__ , we developed
several useful functions for drawing vector fields and complex
functions. We now show you how you can add these functions to the FriCAS
library to make them available for general use.

The way we created the functions in Chapter
`ugIntProg <section-10.0.html#ugIntProg>`__ is typical of how you, as
an advanced FriCAS user, may interact with FriCAS. You have an
application. You go to your editor and create an input file defining
some functions for the application. Then you run the file and try the
functions. Once you get them all to work, you will often want to extend
them, add new features, perhaps write additional functions.

Eventually, when you have a useful set of functions for your
application, you may want to add them to your local FriCAS library. To
do this, you embed these function definitions in a package and add that
package to the library.

To introduce new packages, categories, and domains into the system, you
need to use the FriCAS compiler to convert the constructors into
executable machine code. An existing compiler in FriCAS is available on
an as-is basis. A new, faster compiler will be available in version 2.0
of FriCAS.


.. spadVerbatim

::


C      ==> Complex DoubleFloat                           All constructors used in a file

S      ==> Segment DoubleFloat                           must be spelled out in full

INT    ==> Integer                                       unless abbreviated by macros

DFLOAT ==> DoubleFloat                                   like these at the top of
 VIEW3D ==> ThreeDimensionalViewport                      a file
 CURVE  ==> List List Point DFLOAT

)abbrev package DRAWCX DrawComplex                       Identify kinds and abbreviations

DrawComplex(): Exports == Implementation where           Type definition begins here

  Exports == with                                        Export part begins

    drawComplex: (C -> C,S,S,Boolean) -> VIEW3D          Exported Operations
     drawComplexVectorField: (C -> C,S,S) -> VIEW3D
     setRealSteps: INT -> INT
     setImagSteps: INT -> INT
     setClipValue: DFLOAT-> DFLOAT

  Implementation == add                                  Implementation part begins

    arrowScale : DFLOAT := (0.2)::DFLOAT --relative size Local variable 1

    arrowAngle : DFLOAT := pi()-pi()/(20::DFLOAT)        Local variable 2

    realSteps  : INT := 11 --# real steps                Local variable 3

    imagSteps  : INT := 11 --# imaginary steps           Local variable 4
     clipValue  : DFLOAT  := 10::DFLOAT --maximum vector length

                                                         Local variable 5

    setRealSteps(n) == realSteps := n                    Exported function definition 1

    setImagSteps(n) == imagSteps := n                    Exported function definition 2

    setClipValue(c) == clipValue := c                    Exported function definition 3
     clipFun: DFLOAT -> DFLOAT --Clip large magnitudes.
     clipFun(x) == min(max(x, -clipValue), clipValue)

                                                         Local function definition 1
     makeArrow: (Point DFLOAT,Point DFLOAT,DFLOAT,DFLOAT) -> CURVE

    makeArrow(p1, p2, len, arg) == ...                   Local function definition 2
     drawComplex(f, realRange, imagRange, arrows?) == ...

                                                         Exported function definition 4





The DrawComplex package.





