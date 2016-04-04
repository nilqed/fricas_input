.. status: ok



5.6 An Example: Streams of Primes
---------------------------------

We conclude this chapter with an example of the creation and
manipulation of infinite streams of prime integers. This might be useful
for experiments with numbers or other applications where you are using
sequences of primes over and over again. As for all streams, the stream
of primes is only computed as far out as you need. Once computed,
however, all the primes up to that point are saved for future reference.

Two useful operations provided by the FriCAS library are
prime?prime?IntegerPrimesPackage and
nextPrimenextPrimeIntegerPrimesPackage. A straight-forward way to create
a stream of prime numbers is to start with the stream of positive
integers [2,..] and filter out those that are prime.

Create a stream of primes.


.. spadInput
::

	primes : Stream Integer := [i for i in 2.. | prime? i]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [2,3,5,7,11,13,17,19,23,29,…]   |
+---------------------------------+




.. spadType

:sub:`Type: Stream Integer`



A more elegant way, however, is to use the generategenerateStream
operation from Stream. Given an initial value a and a function f,
generategenerateStream constructs the stream [a,f(a),f(f(a)),...]. This
function gives you the quickest method of getting the stream of primes.

This is how you use generategenerateStream to generate an infinite
stream of primes.


.. spadInput
::

	primes := generate(nextPrime,2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [2,3,5,7,11,13,17,19,23,29,…]   |
+---------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Once the stream is generated, you might only be interested in primes
starting at a particular value.


.. spadInput
::

	smallPrimes := [p for p in primes | p > 1000]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| [1009,1013,1019,1021,1031,1033,1039,1049,1051,1061,…]   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Here are the first 11 primes greater than 1000.


.. spadInput
::

	[p for p in smallPrimes for i in 1..11]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| [1009,1013,1019,1021,1031,1033,1039,1049,1051,1061,…]   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Here is a stream of primes between 1000 and 1200.


.. spadInput
::

	[p for p in smallPrimes while p < 1200]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| [1009,1013,1019,1021,1031,1033,1039,1049,1051,1061,…]   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



To get these expanded into a finite stream, you call
completecompleteStream on the stream.


.. spadInput
::

	complete %


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| [1009,1013,1019,1021,1031,1033,1039,1049,1051,1061,…]   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Twin primes are consecutive odd number pairs which are prime. Here is
the stream of twin primes.


.. spadInput
::

	twinPrimes := [ [p,p+2] for p in primes | prime?(p + 2)]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------+
| [[3,5],[5,7],[11,13],[17,19],[29,31],[41,43],[59,61],[71,73],..[101,103],[107,109],…]   |
+-----------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream List Integer`



Since we already have the primes computed we can avoid the call to
prime?prime?IntegerPrimesPackage by using a double iteration. This time
we'll just generate a stream of the first of the twin primes.


.. spadInput
::

	firstOfTwins:= [p for p in primes for q in rest primes | q=p+2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [3,5,11,17,29,41,59,71,101,107,…]   |
+-------------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Let's try to compute the infinite stream of triplet primes, the set of
primes p such that [p,p+2,p+4] are primes. For example, [3,5,7] is a
triple prime. We could do this by a triple for iteration. A more
economical way is to use firstOfTwins. This time however, put a
semicolon at the end of the line.

Create the stream of firstTriplets. Put a semicolon at the end so that
no elements are computed.


.. spadInput
::

	firstTriplets := [p for p in firstOfTwins for q in rest firstOfTwins |
q = p+2];


.. spadMathAnswer
.. spadType

:sub:`Type: Stream Integer`



What happened? As you know, by default FriCAS displays the first ten
elements of a stream when you first display it. And, therefore, it needs
to compute them! If you want no elements computed, just terminate the
expression by a semicolon (;). The semi-colon prevents the display of
the result of evaluating the expression. Since no stream elements are
needed for display (or anything else, so far), none are computed.

Compute the first triplet prime.


.. spadInput
::

	firstTriplets.1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



If you want to compute another, just ask for it. But wait a second!
Given three consecutive odd integers, one of them must be divisible by
3. Thus there is only one triplet prime. But suppose that you did not
know this and wanted to know what was the tenth triplet prime.


.. spadVerbatim

::

 firstTriples.10



To compute the tenth triplet prime, FriCAS first must compute the
second, the third, and so on. But since there isn't even a second
triplet prime, FriCAS will compute forever. Nonetheless, this effort can
produce a useful result. After waiting a bit, hit Ctrl-c. The system
responds as follows.


.. spadVerbatim

::

    >> System error:
    Console interrupt.
    You are being returned to the top level of
    the interpreter.



If you want to know how many primes have been computed, type:


.. spadVerbatim

::

 numberOfComputedEntries primes



and, for this discussion, let's say that the result is 2045. How big is
the 2045-th prime?


.. spadInput
::

	primes.2045


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 17837   |
+---------+




.. spadType

:sub:`Type: PositiveInteger`



What you have learned is that there are no triplet primes between 5 and
17837. Although this result is well known (some might even say trivial),
there are many experiments you could make where the result is not known.
What you see here is a paradigm for testing of hypotheses. Here our
hypothesis could have been: there is more than one triplet prime. We
have tested this hypothesis for 17837 cases. With streams, you can let
your machine run, interrupt it to see how far it has progressed, then
start it up and let it continue from where it left off.



