.. status: ok


9.6 CardinalNumber
------------------

The CardinalNumber domain can be used for values indicating the
cardinality of sets, both finite and infinite. For example, the
dimensiondimensionVectorSpace operation in the category VectorSpace
returns a cardinal number.

The non-negative integers have a natural construction as cardinals


.. spadVerbatim

::

 0 = #{ }, 1 = {0}, 2 = {0, 1}, ..., n = {i | 0 <= i < n}.



The fact that 0 acts as a zero for the multiplication of cardinals is
equivalent to the axiom of choice.

Cardinal numbers can be created by conversion from non-negative
integers.


.. spadInput
::

	c0 := 0 :: CardinalNumber


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: CardinalNumber`




.. spadInput
::

	c1 := 1 :: CardinalNumber


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: CardinalNumber`




.. spadInput
::

	c2 := 2 :: CardinalNumber


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: CardinalNumber`




.. spadInput
::

	c3 := 3 :: CardinalNumber


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: CardinalNumber`



They can also be obtained as the named cardinal Aleph(n).


.. spadInput
::

	A0 := Aleph 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| Aleph(0)   |
+------------+




.. spadType

:sub:`Type: CardinalNumber`




.. spadInput
::

	A1 := Aleph 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| Aleph(1)   |
+------------+




.. spadType

:sub:`Type: CardinalNumber`



The finite?finite?CardinalNumber operation tests whether a value is a
finite cardinal, that is, a non-negative integer.


.. spadInput
::

	finite? c2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	finite? A0


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Similarly, the countable?countable?CardinalNumber operation determines
whether a value is a countable cardinal, that is, finite or Aleph(0).


.. spadInput
::

	countable? c2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	countable? A0


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	countable? A1


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Arithmetic operations are defined on cardinal numbers as follows: If x =
#X and y = #Y then

x+y= #(X+Y)cardinalityofthedisjointunionx-y=
#(X-Y)cardinalityoftherelativecomplementx*y=
#(X*Y)cardinalityoftheCartesianproductx^y=
#(X^Y)cardinalityofthesetofmapsfromYtoX

Here are some arithmetic examples.


.. spadInput
::

	[c2 + c2, c2 + A1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| [4,Aleph(1)]   |
+----------------+




.. spadType

:sub:`Type: List CardinalNumber`




.. spadInput
::

	[c0*c2, c1*c2, c2*c2, c0*A1, c1*A1, c2*A1, A0*A1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| [0,2,4,0,Aleph(1),Aleph(1),Aleph(1)]   |
+----------------------------------------+




.. spadType

:sub:`Type: List CardinalNumber`




.. spadInput
::

	[c2^c0, c2^c1, c2^c2, A1^c0, A1^c1, A1^c2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [1,2,4,1,Aleph(1),Aleph(1)]   |
+-------------------------------+




.. spadType

:sub:`Type: List CardinalNumber`



Subtraction is a partial operation: it is not defined when subtracting a
larger cardinal from a smaller one, nor when subtracting two equal
infinite cardinals.


.. spadInput
::

	[c2-c1, c2-c2, c2-c3, A1-c2, A1-A0, A1-A1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------+
| [1,0,"failed",Aleph(1),Aleph(1),"failed"]   |
+---------------------------------------------+




.. spadType

:sub:`Type: List Union(CardinalNumber,"failed")`



The generalized continuum hypothesis asserts that


.. spadVerbatim

::

 2^Aleph i = Aleph(i+1)



and is independent of the axioms of set theory. Goedel, The consistency
of the continuum hypothesis, Ann. Math. Studies, Princeton Univ. Press,
1940.

The CardinalNumber domain provides an operation to assert whether the
hypothesis is to be assumed.


.. spadInput
::

	generalizedContinuumHypothesisAssumed true


.. spadMathAnswer
When the generalized continuum hypothesis is assumed, exponentiation to
a transfinite power is allowed.


.. spadInput
::

	[c0^A0, c1^A0, c2^A0, A0^A0, A0^A1, A1^A0, A1^A1]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| [0,1,Aleph(1),Aleph(1),Aleph(2),Aleph(1),Aleph(2)]   |
+------------------------------------------------------+




.. spadType

:sub:`Type: List CardinalNumber`



Three commonly encountered cardinal numbers are

a= #Zcountableinfinityc= #Rthecontinuumf= #{g|g:[0,1]->R}

In this domain, these values are obtained under the generalized
continuum hypothesis in this way.


.. spadInput
::

	a := Aleph 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| Aleph(0)   |
+------------+




.. spadType

:sub:`Type: CardinalNumber`




.. spadInput
::

	c := 2^a


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| Aleph(1)   |
+------------+




.. spadType

:sub:`Type: CardinalNumber`




.. spadInput
::

	f := 2^c


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| Aleph(2)   |
+------------+




.. spadType

:sub:`Type: CardinalNumber`





