.. status: ok


1.8 Polynomials
---------------

Polynomials are the commonly used algebraic types in symbolic
computation. Interactive users of FriCAS generally only see
one type of polynomial: ``Polynomial(R)``. This type represents polynomials
in any number of unspecified variables over a particular coefficient
domain R. This type represents its coefficients sparsely: only terms
with non-zero coefficients are represented.

In building applications, many other kinds of polynomial representations
are useful. Polynomials may have one variable or multiple variables, the
variables can be named or unnamed, the coefficients can be stored
sparsely or densely. So-called distributed multivariate polynomials
store polynomials as coefficients paired with vectors of exponents. This
type is particularly efficient for use in algorithms for solving systems
of non-linear polynomial equations.

The polynomial constructor most familiar to the interactive user is
``Polynomial``.


.. spadInput
::

	(x^2 - x*y^3 +3*y)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{x} ^ {2}} \  {{y} ^ {6}}} -{6 \  x \  {{y} ^ {4}}} -{2 \  {{x} ^
  {3}} \  {{y} ^ {3}}}+{9 \  {{y} ^ {2}}}+{6 \  {{x} ^ {2}} \  y}+{{x}
  ^ {4}}


.. spadType
:sub:`Type: Polynomial Integer`



If you wish to restrict the variables used, ``UnivariatePolynomial``
provides polynomials in one variable.


.. spadInput
::

	p: UP(x,INT) := (3*x-1)^2 * (2*x + 8)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{18} \  {{x} ^ {3}}}+{{60} \  {{x} ^ {2}}} -{{46} \  x}+8

.. spadType
:sub:`Type: UnivariatePolynomial(x,Integer)`



The constructor ``MultivariatePolynomial`` provides polynomials in one or
more specified variables.


.. spadInput
::

	m: MPOLY([x,y],INT) := (x^2-x*y^3+3*y)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{x} ^ {4}} -{2 \  {{y} ^ {3}} \  {{x} ^ {3}}}+{{\left( {{y} ^
  {6}}+{6 \  y}
  \right)}
  \  {{x} ^ {2}}} -{6 \  {{y} ^ {4}} \  x}+{9 \  {{y} ^ {2}}}

.. spadType
:sub:`Type: MultivariatePolynomial([x,y],Integer)`



You can change the way the polynomial appears by modifying the variable
ordering in the explicit list.


.. spadInput
::

	m :: MPOLY([y,x],INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{x} ^ {2}} \  {{y} ^ {6}}} -{6 \  x \  {{y} ^ {4}}} -{2 \  {{x} ^
  {3}} \  {{y} ^ {3}}}+{9 \  {{y} ^ {2}}}+{6 \  {{x} ^ {2}} \  y}+{{x}
  ^ {4}}


.. spadType
:sub:`Type: MultivariatePolynomial([y,x],Integer)`



The constructor DistributedMultivariatePolynomial provides polynomials
in one or more specified variables with the monomials ordered
lexicographically.


.. spadInput
::

	m :: DMP([y,x],INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{y} ^ {6}} \  {{x} ^ {2}}} -{6 \  {{y} ^ {4}} \  x} -{2 \  {{y} ^
  {3}} \  {{x} ^ {3}}}+{9 \  {{y} ^ {2}}}+{6 \  y \  {{x} ^ {2}}}+{{x}
  ^ {4}}



.. spadType
:sub:`Type: DistributedMultivariatePolynomial([y,x],Integer)`



The constructor HomogeneousDistributedMultivariatePolynomial is similar
except that the monomials are ordered by total order refined by reverse
lexicographic order.


.. spadInput
::

	m :: HDMP([y,x],INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{{y} ^ {6}} \  {{x} ^ {2}}} -{2 \  {{y} ^ {3}} \  {{x} ^ {3}}} -{6 \
  {{y} ^ {4}} \  x}+{{x} ^ {4}}+{6 \  y \  {{x} ^ {2}}}+{9 \  {{y} ^
  {2}}}


.. spadType
:sub:`Type: HomogeneousDistributedMultivariatePolynomial([y,x],Integer)`



More generally, the domain constructor
``GeneralDistributedMultivariatePolynomial`` allows the user to provide an
arbitrary predicate to define his own term ordering. These last three
constructors are typically used in *Gröbner basis* applications and when a
flat (that is, non-recursive) display is wanted and the term ordering is
critical for controlling the computation.
