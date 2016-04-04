.. status: ok



8.14 Non-Associative Algebras and Modelling Genetic Laws
--------------------------------------------------------

Many algebraic structures of mathematics and FriCAS have a
multiplication operation * that satisfies the associativity law
associativity law a*(b*c)=(a*b)*c for all a, b and c. The octonions
are a well known exception. There are many other interesting
non-associative structures, such as the class of Lie algebra Lie
algebras.Two FriCAS implementations of Lie algebras are LieSquareMatrix
and FreeNilpotentLie. Lie algebras can be used, for example, to analyse
Lie symmetry algebras of symmetry partial differential differential
equation:partial equations. partial differential equation In this
section we show a different application of non-associative algebras,
non-associative algebra the modelling of genetic laws.
algebra:non-associative

The FriCAS library contains several constructors for creating
non-associative structures, ranging from the categories Monad,
NonAssociativeRng, and FramedNonAssociativeAlgebra, to the domains
AlgebraGivenByStructuralConstants and GenericNonAssociativeAlgebra.
Furthermore, the package AlgebraPackage provides operations for
analysing the structure of such algebras. The interested reader can
learn more about these aspects of the FriCAS library from the paper
Computations in Algebras of Finite Rank, by Johannes Grabmeier and
Robert Wisbauer, Technical Report, IBM Heidelberg Scientific Center,
1992.

Mendel's genetic laws are often written in a form like


.. spadMathOutput
.. math::

+------------------------+
| AaxAa=14AA+12Aa+14aa   |
+------------------------+



The implementation of general algebras in FriCAS allows us to Mendel's
genetic laws use this as the definition for multiplication in an
algebra. genetics Hence, it is possible to study questions of genetic
inheritance using FriCAS. To demonstrate this more precisely, we discuss
one example from a monograph of A. Wörz-Busekros, where you can also
find a general setting of this theory. Wörz-Busekros, A., Algebras in
Genetics, Springer Lectures Notes in Biomathematics 36, Berlin e.a.
(1980). In particular, see example 1.3.

We assume that there is an infinitely large random mating population.
Random mating of two gametes ai and aj gives zygotes zygote , which
produce new gametes. gamete In classical Mendelian segregation we have
aiaj=12ai+12aj. In general, we have


.. spadMathOutput
.. math::

+---------------------+
| aiaj=∑k=1nγi,jkak   |
+---------------------+



The segregation rates γi,j are the structural constants of an
n-dimensional algebra. This is provided in FriCAS by the constructor
AlgebraGivenByStructuralConstants (abbreviation ALGSC).

Consider two coupled autosomal loci with alleles A, a, B, and b,
building four different gametes a1=AB,a2=Ab,a3=aB, and a4=ab {
a1:=AB,a2:=Ab,a3:=aB, and a4:=ab}. The zygotes produce gametes ai and aj
with classical Mendelian segregation. Zygote a1a4 undergoes transition
to a2a3 and vice versa with probability 0≤θ≤12.

Define a list of four four-by-four matrices giving the segregation
rates. We use the value 1/10 for θ.


.. spadInput
::

	segregationRates : List SquareMatrix(4,FRAC INT) := [matrix [ [1, 1/2,
1/2, 9/20], [1/2, 0, 1/20, 0], [1/2, 1/20, 0, 0], [9/20, 0, 0, 0] ],
matrix [ [0, 1/2, 0, 1/20], [1/2, 1, 9/20, 1/2], [0, 9/20, 0, 0], [1/20,
1/2, 0, 0] ], matrix [ [0, 0, 1/2, 1/20], [0, 0, 9/20, 0], [1/2, 9/20,
1, 1/2], [1/20, 0, 1/2, 0] ], matrix [ [0, 0, 0, 9/20], [0, 0, 1/20,
1/2], [0, 1/20, 0, 1/2], [9/20, 1/2, 1/2, 1] ] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------+
| [[1121292012012001212000920000],[0120120121920120920001201200],[0012120009200129201121200120],[0009200012012012001292012121]]   |
+---------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List SquareMatrix(4,Fraction Integer)`



Choose the appropriate symbols for the basis of gametes,


.. spadInput
::

	gametes := ['AB,'Ab,'aB,'ab]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [AB,Ab,aB,ab]   |
+-----------------+




.. spadType

:sub:`Type: List OrderedVariableList [AB,Ab,aB,ab]`



Define the algebra.


.. spadInput
::

	A := ALGSC(FRAC INT, 4, gametes, segregationRates)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------+
| AlgebraGivenByStructuralConstants(FractionInteger,4,[AB,Ab,aB,ab],[MATRIX,MATRIX,MATRIX,MATRIX])   |
+----------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Domain`



What are the probabilities for zygote a1a4 to produce the different
gametes?


.. spadInput
::

	a := basis()$A


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| [AB,Ab,aB,ab]   |
+-----------------+




.. spadType

:sub:`Type: Vector AlgebraGivenByStructuralConstants(Fraction`
Integer,4,[AB,Ab,aB,ab], [MATRIX,MATRIX,MATRIX,MATRIX])




.. spadInput
::

	a.1*a.4


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| 920ab+120aB+120Ab+920AB   |
+---------------------------+




.. spadType

:sub:`Type: AlgebraGivenByStructuralConstants(Fraction`
Integer,4,[AB,Ab,aB,ab], [MATRIX,MATRIX,MATRIX,MATRIX])



Elements in this algebra whose coefficients sum to one play a
distinguished role. They represent a population with the distribution of
gametes reflected by the coefficients with respect to the basis of
gametes.

Random mating of different populations x and y is described by their
product x*y.

This product is commutative only if the gametes are not sex-dependent,
as in our example.


.. spadInput
::

	commutative?()$A


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



In general, it is not associative.


.. spadInput
::

	associative?()$A


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Random mating within a population x is described by x*x. The next
generation is (x*x)*(x*x).

Use decimal numbers to compare the distributions more easily.


.. spadInput
::

	x : ALGSC(DECIMAL, 4, gametes, segregationRates) := convert [3/10, 1/5,
1/10, 2/5]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| 0.4ab+0.1aB+0.2Ab+0.3AB   |
+---------------------------+




.. spadType

:sub:`Type:`
AlgebraGivenByStructuralConstants(DecimalExpansion,4,[AB,Ab,aB,ab],
[MATRIX,MATRIX,MATRIX,MATRIX])



To compute directly the gametic distribution in the fifth generation, we
use plenaryPower.


.. spadInput
::

	plenaryPower(x,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------+
| 0.36561ab+0.13439aB+0.23439Ab+0.26561AB   |
+-------------------------------------------+




.. spadType

:sub:`Type:`
AlgebraGivenByStructuralConstants(DecimalExpansion,4,[AB,Ab,aB,ab],
[MATRIX,MATRIX,MATRIX,MATRIX])



We now ask two questions: Does this distribution converge to an
equilibrium state? What are the distributions that are stable?

This is an invariant of the algebra and it is used to answer the first
question. The new indeterminates describe a symbolic distribution.


.. spadInput
::

	q := leftRankPolynomial()$GCNAALG(FRAC INT, 4, gametes,
segregationRates) :: UP(Y, POLY FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------+
| Y3+(-2920%x4-2920%x3-2920%x2-2920%x1)Y2+((920%x42+(910%x3+910%x2+910%x1)%x4+.920%x32+(910%x2+910%x1)%x3+920%x22+.910%x1%x2+920%x12))Y   |
+-----------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(Y,Polynomial Fraction Integer)`



Because the coefficient 920 has absolute value less than 1, all
distributions do converge, by a theorem of this theory.


.. spadInput
::

	factor(q :: POLY FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| (Y-%x4-%x3-%x2-%x1)*(Y-920%x4-920%x3-920%x2-920%x1)Y   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Factored Polynomial Fraction Integer`



The second question is answered by searching for idempotents in the
algebra.


.. spadInput
::

	cI := conditionsForIdempotents()$GCNAALG(FRAC INT, 4, gametes,
segregationRates)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [910%x1%x4+(110%x2+%x1)%x3+%x1%x2+%x12-%x1,(%x2+110%x1)%x4+910%x2%x3+%x22+(%x1-1)%x2,(%x3+110%x1)%x4+%x32+(910%x2+%x1-1)%x3,%x42+(%x3+%x2+910%x1-1)%x4+110%x2%x3]   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Polynomial Fraction Integer`



Solve these equations and look at the first solution.


.. spadInput
::

	gbs:= groebnerFactorize cI


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadType

:sub:`Type: List List Polynomial Fraction Integer`




.. spadInput
::

	gbs.1


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------+
| [%x4+%x3+%x2+%x1-1,(%x2+%x1)%x3+%x1%x2+%x12-%x1]   |
+----------------------------------------------------+




.. spadType

:sub:`Type: List Polynomial Fraction Integer`



Further analysis using the package PolynomialIdeals shows that there is
a two-dimensional variety of equilibrium states and all other solutions
are contained in it.

Choose one equilibrium state by setting two indeterminates to concrete
values.


.. spadInput
::

	sol := solve concat(gbs.1,[%x1-1/10,%x2-1/10])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [[%x4=25,%x3=25,%x2=110,%x1=110]]   |
+-------------------------------------+




.. spadType

:sub:`Type: List List Equation Fraction Polynomial Integer`




.. spadInput
::

	e : A := represents reverse (map(rhs, sol.1) :: List FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| 25ab+25aB+110Ab+110AB   |
+-------------------------+




.. spadType

:sub:`Type: AlgebraGivenByStructuralConstants(Fraction`
Integer,4,[AB,Ab,aB,ab], [MATRIX,MATRIX,MATRIX,MATRIX])



Verify the result.


.. spadInput
::

	e*e-e


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: AlgebraGivenByStructuralConstants(Fraction`
Integer,4,[AB,Ab,aB,ab], [MATRIX,MATRIX,MATRIX,MATRIX])





