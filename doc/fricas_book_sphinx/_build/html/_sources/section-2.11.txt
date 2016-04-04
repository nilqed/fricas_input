.. status: ok


2.11 Exposing Domains and Packages
----------------------------------

In this section we discuss how FriCAS makes some operations available to
you while hiding others that are meant to be used by developers or only
in rare cases. If you are a new user of FriCAS, it is likely that
everything you need is available by default and you may want to skip
over this section on first reading.

Every constructor:exposed domain and package in the FriCAS library
either exposed (meaning that you can use its operations without doing 
anything special) or it is hidden (meaning you have to either package call 
(see `ugTypesPkgCall <section-2.9.html#ugTypesPkgCall>`__) the operations it
contains or explicitly expose it to use the operations). The initial
exposure status for a constructor is set in the file *exposed.lsp* (see
the Installer's Note exposed.lsp for FriCAS if you need to know the location 
of this file). Constructors are collected together in groups. Categories are 
all in the exposure group categories and the bulk of the basic set of packages 
and domains that are exposed are in the exposure group basic. Here is an 
abbreviated sample of the file (without the Lisp parentheses):


.. spadVerbatim

::

 basic
 
         AlgebraicNumber                          AN
         AlgebraGivenByStructuralConstants        ALGSC
         Any                                      ANY
         AnyFunctions1                            ANY1
         BinaryExpansion                          BINARY
         Boolean                                  BOOLEAN
         CardinalNumber                           CARD
         CartesianTensor                          CARTEN
         Character                                CHAR
         CharacterClass                           CCLASS
         CliffordAlgebra                          CLIF
         Color                                    COLOR
         Complex                                  COMPLEX
         ContinuedFraction                        CONTFRAC
         DecimalExpansion                         DECIMAL
         ...




.. spadVerbatim

::

 categories
 
         AbelianGroup                             ABELGRP
         AbelianMonoid                            ABELMON
         AbelianMonoidRing                        AMR
         AbelianSemiGroup                         ABELSG
         Aggregate                                AGG
         Algebra                                  ALGEBRA
         AlgebraicallyClosedField                 ACF
         AlgebraicallyClosedFunctionSpace         ACFS
         ArcHyperbolicFunctionCategory            AHYP
         ...



For each constructor in a group, the full name and the abbreviation is
given. There are other groups in exposed.lsp but initially only the
constructors in exposure groups basic categories naglink and anna are
exposed.

As an interactive user of FriCAS, you do not need to modify this file.
Instead, use )set expose to expose, hide or query the exposure status of
an individual constructor or exposure group. set expose The reason for
having exposure groups is to be able to expose or hide multiple
constructors with a single command. For example, you might group
together into exposure group quantum a number of domains and packages
useful for quantum mechanical computations. These probably should not be
available to every user, but you want an easy way to make the whole
collection visible to FriCAS when it is looking for operations to apply.

If you wanted to hide all the basic constructors available by default,
you would issue )set expose drop group basic. set expose drop group We
do not recommend that you do this. If, however, you discover that you
have hidden all the basic constructors, you should issue )set expose add
group basic to restore your default environment. set expose add group

It is more likely that you would want to expose or hide individual
constructors. In `ugUserTriangle <section-6.19.html#ugUserTriangle>`__
we use several operations from OutputForm, a domain usually hidden. To
avoid package calling every operation from OutputForm, we expose the
domain and let FriCAS conclude that those operations should be used. Use
``)set expose add`` constructor and )set expose drop constructor to expose
and hide a constructor, respectively. set expose drop constructor You
should use the constructor name, not the abbreviation. The ``)set expose``
command guides you through these options. set expose add constructor

If you expose a previously hidden constructor, FriCAS exhibits new
behavior (that was your intention) though you might not expect the
results that you get. OutputForm is, in fact, one of the worst offenders
in this regard. OutputForm This domain is meant to be used by other
domains for creating a structure that FriCAS knows how to display. It
has functions like + that form output representations rather than do
mathematical calculations. Because of the order in which FriCAS looks at
constructors when it is deciding what operation to apply, OutputForm
might be used instead of what you expect.

This is a polynomial.


.. spadInput
::

	x + x


.. spadMathAnswer
.. spadMathOutput
.. math::

  2 \  x

.. spadType
:sub:`Type: Polynomial Integer`



Expose OutputForm.


.. spadInput
::

	)set expose add constructor OutputForm


.. spadMathAnswer
.. spadVerbatim

::

    OutputForm is now explicitly exposed in frame G82322 



This is what we get when OutputForm is automatically available.


.. spadInput
::

	x + x


.. spadMathAnswer
.. spadMathOutput
.. math::

   x + x

.. spadType
:sub:`Type: OutputForm`



Hide OutputForm so we don't run into problems with any later examples!


.. spadInput
::

	)set expose drop constructor OutputForm


.. spadMathAnswer
.. spadVerbatim

::

    OutputForm is now explicitly hidden in frame G82322 



Finally, exposure is done on a frame-by-frame basis. A frame (see
`ugSysCmdframe <section-16.11.html#ugSysCmdframe>`__ ) 
is one of possibly several logical FriCAS workspaces within a
physical one, each having its own environment (for example, variables
and function definitions). If you have several FriCAS workspace windows
on your screen, they are all different frames, automatically created for
you by HyperDoc. Frames can be manually created, made active and
destroyed by the ``)frame`` system command. frame They do not share exposure
information, so you need to use ``)set expose`` in each one to add or drop
constructors from view.



