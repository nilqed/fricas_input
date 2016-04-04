.. status: ok


12.12 Anonymous Categories
--------------------------

The part of a category to the right of a with is also regarded as a
category---an anonymous category. Thus you have already seen a category
definition category:anonymous in Chapter
`ugPackages <section-11.0.html#ugPackages>`__ . The Exports part of the
package DrawComplex
(`ugPackagesAbstract <section-11.3.html#ugPackagesAbstract>`__ ) is an
anonymous category. This is not necessary. We could, instead, give this
category a name:


.. spadVerbatim

::

 DrawComplexCategory(): Category == with
    drawComplex: (C -> C,S,S,Boolean) -> VIEW3D
    drawComplexVectorField: (C -> C,S,S) -> VIEW3D
    setRealSteps: INT -> INT
    setImagSteps: INT -> INT
    setClipValue: DFLOAT-> DFLOAT



and then define DrawComplex by:


.. spadVerbatim

::

 DrawComplex(): DrawComplexCategory == Implementation
    where
       ...



There is no reason, however, to give this list of exports a name since
no other domain or package exports it. In fact, it is rare for a package
to export a named category. As you will see in the next chapter,
however, it is very common for the definition of domains to mention one
or more category before the with. with



