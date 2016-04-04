.. status: ok


9.23 FactoredFunctions2
-----------------------

The FactoredFunctions2 package implements one operation,
mapmapFactoredFunctions2, for applying an operation to every base in a
factored object and to the unit.


.. spadInput
::

	double(x) == x + x


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	f := factor(720)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 24325   |
+---------+




.. spadType

:sub:`Type: Factored Integer`



Actually, the mapmapFactoredFunctions2 operation used in this example
comes from Factored itself, since double takes an integer argument and
returns an integer result.


.. spadInput
::

	map(double,f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2446210   |
+-----------+




.. spadType

:sub:`Type: Factored Integer`



If we want to use an operation that returns an object that has a type
different from the operation's argument, the mapmapFactoredFunctions2 in
Factored cannot be used and we use the one in FactoredFunctions2.


.. spadInput
::

	makePoly(b) == x + b


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



In fact, the 2 in the name of the package means that we might be using
factored objects of two different types.


.. spadInput
::

	g := map(makePoly,f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| (x+1)(x+2)4(x+3)2(x+5)   |
+--------------------------+




.. spadType

:sub:`Type: Factored Polynomial Integer`



It is important to note that both versions of mapmapFactoredFunctions2
destroy any information known about the bases (the fact that they are
prime, for instance).

The flags for each base are set to nil in the object returned by
mapmapFactoredFunctions2.


.. spadInput
::

	nthFlag(g,1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| "nil"   |
+---------+




.. spadType

:sub:`Type: Union("nil",...)`



For more information about factored objects and their use, see
`FactoredXmpPage <section-9.22.html#FactoredXmpPage>`__ and
`ugProblemGaloisPage <ugProblemGaloisPage>`__ in Section
`ugProblemGaloisNumber <ugProblemGaloisNumber>`__ .



