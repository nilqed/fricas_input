.. status: ok


12.11 Conditionals
------------------

As categories have parameters, the actual operations exported by a
conditional category can depend on these parameters. As an example, the
operation determinantdeterminantMatrixCategory from category
MatrixCategory is only exported when the underlying domain R has
commutative multiplication:


.. spadVerbatim

::

 if R has commutative("*") then
    determinant: $ -> R



Conditionals can also define conditional extensions of a category. Here
is a portion of the definition of QuotientFieldCategory:
QuotientFieldCategory


.. spadVerbatim

::

 QuotientFieldCategory(R) : Category == ... with ...
      if R has OrderedSet then OrderedSet
      if R has IntegerNumberSystem then
        ceiling: $ -> R
          ...



Think of category QuotientFieldCategory(R) as denoting the domain
Fraction(R), the class of all fractions of the form a/b for elements of
R. The first conditional means in English: If the elements of R are
totally ordered ( R is an OrderedSet), then so are the fractions a/b.
Fraction

The second conditional is used to conditionally export an operation
ceiling which returns the smallest integer greater than or equal to its
argument. Clearly, ceiling makes sense for integers but not for
polynomials and other algebraic structures. Because of this conditional,
the domain Fraction(Integer) exports an operation ceiling: Fraction
Integer->Integer, but Fraction Polynomial Integer does not.

Conditionals can also appear in the default definitions for the
operations of a category. For example, a default definition for
ceilingceilingField within the part following the add reads:


.. spadVerbatim

::

 if R has IntegerNumberSystem then
     ceiling x == ...



Here the predicate used is identical to the predicate in the Exports
part. This need not be the case. See
`ugPackagesConds <section-11.8.html#ugPackagesConds>`__ for a more
complicated example.



