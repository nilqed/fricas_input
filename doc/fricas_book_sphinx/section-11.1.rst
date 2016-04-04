.. status: ok


11.1 Names, Abbreviations, and File Structure
---------------------------------------------

Each package has a name and an abbreviation. For a package of the
complex draw functions from Chapter
`ugIntProg <section-10.0.html#ugIntProg>`__ , we choose the name
DrawComplex and abbreviation:constructor abbreviation DRAWCX.An
abbreviation can be any string of constructor:abbreviation between two
and seven capital letters and digits, beginning with a letter. See
`ugTypesWritingAbbr <section-2.2.html#ugTypesWritingAbbr>`__ for more
information. To be sure that you have not chosen a name or abbreviation
already used by the system, issue the system command )show for both the
name and the abbreviation. show

Once you have named the package and its abbreviation, you can choose any
new filename you like with extension `` .spad`` to hold the definition
of your package. We choose the name drawpak.spad. If your application
involves more than one package, you can put them all in the same file.
FriCAS assumes no relationship between the name of a library file, and
the name or abbreviation of a package.

Near the top of the `` .spad`` file, list all the abbreviations for
the packages using )abbrev, each command beginning in column one. Macros
giving names to FriCAS expressions can also be placed near the top of
the file. The macros are only usable from their point of definition
until the end of the file.

Consider the definition of DrawComplex in Figure
`fig-pak-cdraw <fig-pak-cdraw>`__ . After the macro macro definition


.. spadVerbatim

::

 S      ==> Segment DoubleFloat



the name S can be used in the file as a shorthand for Segment
DoubleFloat.The interpreter also allows macro for macro definitions. The
abbreviation command for the package


.. spadVerbatim

::

 )abbrev package DRAWCX DrawComplex



is given after the macros (although it could precede them).



