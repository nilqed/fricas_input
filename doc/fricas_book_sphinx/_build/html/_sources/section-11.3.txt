.. status: ok


11.3 Abstract Datatypes
-----------------------

A constructor as defined in FriCAS is called an abstract datatype in the
computer science literature. Abstract datatypes separate specification
(what operations are provided) from implementation (how the operations
are implemented). The Exports (specification) part of a constructor is
said to be public (it provides the user interface to the package)
whereas the Implementation part is private (information here is
effectively hidden---programs cannot take advantage of it).

The Exports part specifies what operations the package provides to
users. As an author of a package, you must ensure that the
Implementation part provides a function for each operation in the
Exports part.The DrawComplex package enhances the facility described in
Chapter `ugIntProgCompFuns <section-10.8.html#ugIntProgCompFuns>`__ by
allowing a complex function to have arrows emanating from the surface to
indicate the direction of the complex argument.

An important difference between interactive programming and the use of
packages is in the handling of global variables such as realSteps and
imagSteps. In interactive programming, you simply change the values of
variables by assignment. With packages, such variables are local to the
package---their values can only be set using functions exported by the
package. In our example package, we provide two functions setRealSteps
and setImagSteps for this purpose.

Another local variable is clipValue which can be changed using the
exported operation setClipValue. This value is referenced by the
internal function clipFun that decides whether to use the computed value
of the function at a point or, if the magnitude of that value is too
large, the value assigned to clipValue (with the appropriate sign).



