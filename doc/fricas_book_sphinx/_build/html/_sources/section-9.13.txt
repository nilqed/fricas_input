.. status: ok


9.13 CycleIndicators
--------------------

This section is based upon the paper J. H. Redfield, The Theory of
Group-Reduced Distributions, American J. Math.,49 (1927) 433-455, and is
an application of group theory to enumeration problems. It is a
development of the work by P. A. MacMahon on the application of
symmetric functions and Hammond operators to combinatorial theory.

The theory is based upon the power sum symmetric functions si which are
the sum of the i-th powers of the variables. The cycle index of a
permutation is an expression that specifies the sizes of the cycles of a
permutation, and may be represented as a partition. A partition of a
non-negative integer n is a collection of positive integers called its
parts whose sum is n. For example, the partition (32212) will be used to
represent and will indicate that the permutation has two cycles of
length 3, one of length 2 and two of length 1. The cycle index of a
permutation group is the sum of the cycle indices of its permutations
divided by the number of permutations. The cycle indices of certain
groups are provided.

The operation complete returns the cycle index of the symmetric group of
order n for argument n. Alternatively, it is the n-th complete
homogeneous symmetric function expressed in terms of power sum symmetric
functions.


.. spadInput
::

	complete 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| (1)   |
+-------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`




.. spadInput
::

	complete 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 12(2)+12(12)   |
+----------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`




.. spadInput
::

	complete 3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| 13(3)+12(21)+16(13)   |
+-----------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`




.. spadInput
::

	complete 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------------+
| 17(7)+16(61)+110(52)+110(512)+112(43)+18(421)+124(413)+118(321)+124(322)+112(3212)+172(314)+148(231)+148(2213)+1240(215)+15040(17)   |
+--------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The operation elementary computes the n-th elementary symmetric function
for argument n.


.. spadInput
::

	elementary 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------------------------------+
| 17(7)-16(61)-110(52)+110(512)-112(43)+18(421)-124(413)+118(321)+124(322)-112(3212)+172(314)-148(231)+148(2213)-1240(215)+15040(17)   |
+--------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The operation alternating returns the cycle index of the alternating
group having an even number of even parts in each cycle partition.


.. spadInput
::

	alternating 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------+
| 27(7)+15(512)+14(421)+19(321)+112(322)+136(314)+124(2213)+12520(17)   |
+-----------------------------------------------------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The operation cyclic returns the cycle index of the cyclic group.


.. spadInput
::

	cyclic 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 67(7)+17(17)   |
+----------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The operation dihedral is the cycle index of the dihedral group.


.. spadInput
::

	dihedral 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| 37(7)+12(231)+114(17)   |
+-------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The operation graphs for argument n returns the cycle index of the group
of permutations on the edges of the complete graph with n nodes induced
by applying the symmetric group to the nodes.


.. spadInput
::

	graphs 5


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------+
| 16(631)+15(52)+14(422)+16(331)+18(2412)+112(2314)+1120(110)   |
+---------------------------------------------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The cycle index of a direct product of two groups is the product of the
cycle indices of the groups. Redfield provided two operations on two
cycle indices which will be called cup and cap here. The cup of two
cycle indices is a kind of scalar product that combines monomials for
permutations with the same cycles. The cap operation provides the sum of
the coefficients of the result of the cup operation which will be an
integer that enumerates what Redfield called group-reduced
distributions.

We can, for example, represent complete 2 * complete 2 as the set of
objects a a b b and complete 2 * complete 1 * complete 1 as c c d e.

This integer is the number of different sets of four pairs.


.. spadInput
::

	cap(complete 2^2, complete 2*complete 1^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



For example,


.. spadVerbatim

::

 a a b b     a a b b    a a b b   a a b b
 c c d e     c d c e    c e c d   d e c c



This integer is the number of different sets of four pairs no two pairs
being equal.


.. spadInput
::

	cap(elementary 2^2, complete 2*complete 1^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



For example,


.. spadVerbatim

::

 a a b b    a a b b
 c d c e    c e c d



In this case the configurations enumerated are easily constructed,
however the theory merely enumerates them providing little help in
actually constructing them.

Here are the number of 6-pairs, first from a a a b b c, second from d d
e e f g.


.. spadInput
::

	cap(complete 3*complete 2*complete 1,complete 2^2*complete 1^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 24   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



Here it is again, but with no equal pairs.


.. spadInput
::

	cap(elementary 3*elementary 2*elementary 1,complete 2^2*complete 1^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`




.. spadInput
::

	cap(complete 3*complete 2*complete 1,elementary 2^2*elementary 1^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



The number of 6-triples, first from a a a b b c, second from d d e e f
g, third from h h i i j j.


.. spadInput
::

	eval(cup(complete 3*complete 2*complete 1, cup(complete 2^2*complete
1^2,complete 2^3)))


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1500   |
+--------+




.. spadType

:sub:`Type: Fraction Integer`



The cycle index of vertices of a square is dihedral 4.


.. spadInput
::

	square:=dihedral 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| 14(4)+38(22)+14(212)+18(14)   |
+-------------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The number of different squares with 2 red vertices and 2 blue vertices.


.. spadInput
::

	cap(complete 2^2,square)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



The number of necklaces with 3 red beads, 2 blue beads and 2 green
beads.


.. spadInput
::

	cap(complete 3*complete 2^2,dihedral 7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 18   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



The number of graphs with 5 nodes and 7 edges.


.. spadInput
::

	cap(graphs 5,complete 7*complete 3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



The cycle index of rotations of vertices of a cube.


.. spadInput
::

	s(x) == powerSum(x)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	cube:=(1/24)*(s 1^8+9*s 2^4 + 8*s 3^2*s 1^2+6*s 4^2)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function s with type PositiveInteger -> 
       SymmetricPolynomial Fraction Integer 




.. spadMathOutput
.. math::

+----------------------------------+
| 14(42)+13(3212)+38(24)+124(18)   |
+----------------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



The number of cubes with 4 red vertices and 4 blue vertices.


.. spadInput
::

	cap(complete 4^2,cube)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



The number of labeled graphs with degree sequence 2 2 2 1 1 with no
loops or multiple edges.


.. spadInput
::

	cap(complete 2^3*complete 1^2,wreath(elementary 4,elementary 2))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



Again, but with loops allowed but not multiple edges.


.. spadInput
::

	cap(complete 2^3*complete 1^2,wreath(elementary 4,complete 2))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 17   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



Again, but with multiple edges allowed, but not loops


.. spadInput
::

	cap(complete 2^3*complete 1^2,wreath(complete 4,elementary 2))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



Again, but with both multiple edges and loops allowed


.. spadInput
::

	cap(complete 2^3*complete 1^2,wreath(complete 4,complete 2))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 23   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



Having constructed a cycle index for a configuration we are at liberty
to evaluate the si components any way we please. For example we can
produce enumerating generating functions. This is done by providing a
function f on an integer i to the value required of si, and then
evaluating eval(f, cycleindex).


.. spadInput
::

	x: ULS(FRAC INT,'x,0) := 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`




.. spadInput
::

	ZeroOrOne: INT -> ULS(FRAC INT, 'x, 0)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	Integers: INT -> ULS(FRAC INT, 'x, 0)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



For the integers 0 and 1, or two colors.


.. spadInput
::

	ZeroOrOne n == 1+x^n


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	ZeroOrOne 5


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function ZeroOrOne with type Integer -> 
       UnivariateLaurentSeries(Fraction Integer,x,0) 




.. spadMathOutput
.. math::

+--------+
| 1+x5   |
+--------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



For the integers 0, 1, 2, ... we have this.


.. spadInput
::

	Integers n == 1/(1-x^n)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	Integers 5


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function Integers with type Integer -> 
       UnivariateLaurentSeries(Fraction Integer,x,0) 




.. spadMathOutput
.. math::

+--------------+
| 1+x5+O(x8)   |
+--------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The coefficient of xn is the number of graphs with 5 nodes and n edges.

Note that there is an eval function that takes two arguments. It has the
signature:


.. spadVerbatim

::

 ((Integer -> D1),SymmetricPolynomial Fraction Integer) -> D1
   from EvaluateCycleIndicators D1 if D1 has ALGEBRA FRAC INT



This function is not normally exposed (it will not normally be
considered in the list of eval functions) as it is only useful for this
particular domain. To use it we ask that it be considered thus:


.. spadInput
::

	)expose EVALCYC


.. spadMathAnswer
and now we can use it:


.. spadInput
::

	eval(ZeroOrOne, graphs 5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| 1+x+2x2+4x3+6x4+6x5+6x6+4x7+O(x8)   |
+-------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The coefficient of xn is the number of necklaces with n red beads and
n-8 green beads.


.. spadInput
::

	eval(ZeroOrOne,dihedral 8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| 1+x+4x2+5x3+8x4+5x5+4x6+x7+O(x8)   |
+------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The coefficient of xn is the number of partitions of n into 4 or fewer
parts.


.. spadInput
::

	eval(Integers,complete 4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------+
| 1+x+2x2+3x3+5x4+6x5+9x6+11x7+O(x8)   |
+--------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The coefficient of xn is the number of partitions of n into 4 boxes
containing ordered distinct parts.


.. spadInput
::

	eval(Integers,elementary 4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| x6+x7+2x8+3x9+5x10+6x11+9x12+11x13+O(x14)   |
+---------------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The coefficient of xn is the number of different cubes with n red
vertices and 8-n green ones.


.. spadInput
::

	eval(ZeroOrOne,cube)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| 1+x+3x2+3x3+7x4+3x5+3x6+x7+O(x8)   |
+------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The coefficient of xn is the number of different cubes with integers on
the vertices whose sum is n.


.. spadInput
::

	eval(Integers,cube)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| 1+x+4x2+7x3+21x4+37x5+85x6+151x7+O(x8)   |
+------------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The coefficient of xn is the number of graphs with 5 nodes and with
integers on the edges whose sum is n. In other words, the enumeration is
of multigraphs with 5 nodes and n edges.


.. spadInput
::

	eval(Integers,graphs 5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| 1+x+3x2+7x3+17x4+35x5+76x6+149x7+O(x8)   |
+------------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



Graphs with 15 nodes enumerated with respect to number of edges.


.. spadInput
::

	eval(ZeroOrOne ,graphs 15)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| 1+x+2x2+5x3+11x4+26x5+68x6+177x7+O(x8)   |
+------------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



Necklaces with 7 green beads, 8 white beads, 5 yellow beads and 10 red
beads.


.. spadInput
::

	cap(dihedral 30,complete 7*complete 8*complete 5*complete 10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| 49958972383320   |
+------------------+




.. spadType

:sub:`Type: Fraction Integer`



The operation SFunction is the S-function or Schur function of a
partition written as a descending list of integers expressed in terms of
power sum symmetric functions.

In this case the argument partition represents a tableau shape. For
example 3,2,2,1 represents a tableau with three boxes in the first row,
two boxes in the second and third rows, and one box in the fourth row.
SFunction [3,2,2,1] counts the number of different tableaux of shape 3,
2, 2, 1 filled with objects with an ascending order in the columns and a
non-descending order in the rows.


.. spadInput
::

	sf3221:= SFunction [3,2,2,1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------------+
| 112(62)-112(612)-116(42)+112(431)+124(414)-136(322)+136(3212)-124(3221)-136(3213)-172(315)-1192(24)+148(2312)+196(2214)-1144(216)+1576(18)   |
+----------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: SymmetricPolynomial Fraction Integer`



This is the number filled with a a b b c c d d.


.. spadInput
::

	cap(sf3221,complete 2^4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: Fraction Integer`



The configurations enumerated above are:


.. spadVerbatim

::

 a a b    a a c    a a d
 b c      b b      b b
 c d      c d      c c
 d        d        d



This is the number of tableaux filled with 1..8.


.. spadInput
::

	cap(sf3221, powerSum 1^8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 70   |
+------+




.. spadType

:sub:`Type: Fraction Integer`



The coefficient of xn is the number of column strict reverse plane
partitions of n of shape 3 2 2 1.


.. spadInput
::

	eval(Integers, sf3221)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| x9+3x10+7x11+14x12+27x13+47x14+O(x15)   |
+-----------------------------------------+




.. spadType

:sub:`Type: UnivariateLaurentSeries(Fraction Integer,x,0)`



The smallest is


.. spadVerbatim

::

 0 0 0
 1 1
 2 2
 3





