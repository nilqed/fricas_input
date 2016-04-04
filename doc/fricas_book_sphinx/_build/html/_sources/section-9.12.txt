.. status: ok



9.12 ContinuedFraction
----------------------

Continued fractions have been a fascinating and useful tool in
mathematics for well over three hundred years. FriCAS implements
continued fractions for fractions of any Euclidean domain. In practice,
this usually means rational numbers. In this section we demonstrate some
of the operations available for manipulating both finite and infinite
continued fractions. It may be helpful if you review
`StreamXmpPage <section-9.76.html#StreamXmpPage>`__ to remind yourself
of some of the operations with streams.

The ContinuedFraction domain is a field and therefore you can add,
subtract, multiply and divide the fractions.

The continuedFractioncontinuedFractionContinuedFraction operation
converts its fractional argument to a continued fraction.


.. spadInput
::

	c := continuedFraction(314159/100000)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| 3+1||7+1||15+1||1+1||25+1||1+1||7+1||4   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: ContinuedFraction Integer`



This display is a compact form of the bulkier


.. spadVerbatim

::

         3 +                 1
             -------------------------------
             7 +               1
                 ---------------------------
                 15 +            1
                      ----------------------
                      1 +          1
                          ------------------
                          25 +       1
                               -------------
                               1 +     1
                                   ---------
                                   7 +   1
                                       -----
                                         4



You can write any rational number in a similar form. The fraction will
be finite and you can always take the numerators to be 1. That is, any
rational number can be written as a simple, finite continued fraction of
the form


.. spadVerbatim

::

         a(1) +           1
                -------------------------
                a(2) +          1
                       --------------------
                       a(3) +
                              .
                               .
                                .
                                      1
                                -------------
                                a(n-1) +  1
                                         ----
                                         a(n)



The ai are called partial quotients and the operation
partialQuotientspartialQuotientsContinuedFraction creates a stream of
them.


.. spadInput
::

	partialQuotients c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| [3,7,15,1,25,1,7,…]   |
+-----------------------+




.. spadType

:sub:`Type: Stream Integer`



By considering more and more of the fraction, you get the
convergentsconvergentsContinuedFraction. For example, the first
convergent is a1, the second is a1+1/a2 and so on.


.. spadInput
::

	convergents c


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| [3,227,333106,355113,92082931,95633044,7614924239,…]   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



Since this is a finite continued fraction, the last convergent is the
original rational number, in reduced form. The result of
approximantsapproximantsContinuedFraction is always an infinite stream,
though it may just repeat the last value.


.. spadInput
::

	approximants c


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| [3,227,333106,355113,92082931,95633044,7614924239,…]   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



Inverting c only changes the partial quotients of its fraction by
inserting a 0 at the beginning of the list.


.. spadInput
::

	pq := partialQuotients(1/c)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| [0,3,7,15,1,25,1,…]   |
+-----------------------+




.. spadType

:sub:`Type: Stream Integer`



Do this to recover the original continued fraction from this list of
partial quotients. The three-argument form of the
continuedFractioncontinuedFractionContinuedFraction operation takes an
element which is the whole part of the fraction, a stream of elements
which are the numerators of the fraction, and a stream of elements which
are the denominators of the fraction.


.. spadInput
::

	continuedFraction(first pq,repeating [1],rest pq)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| 1||3+1||7+1||15+1||1+1||25+1||1+1||7   |
+------------------------------------------------------+




.. spadType

:sub:`Type: ContinuedFraction Integer`



The streams need not be finite for
continuedFractioncontinuedFractionContinuedFraction. Can you guess which
irrational number has the following continued fraction? See the end of
this section for the answer.


.. spadInput
::

	z:=continuedFraction(3,repeating [1],repeating [3,6])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| 3+1||3+1||6+1||3+1||6+1||3+1||6+1||3   |
+------------------------------------------------------+




.. spadType

:sub:`Type: ContinuedFraction Integer`



In 1737 Euler discovered the infinite continued fraction expansion


.. spadVerbatim

::

         e - 1             1
         ----- = ---------------------
           2     1 +         1
                     -----------------
                     6 +       1
                         -------------
                         10 +    1
                              --------
                              14 + ...



We use this expansion to compute rational and floating point
approximations of e. For this and other interesting expansions, see C.
D. Olds, Continued Fractions, New Mathematical Library, (New York:
Random House, 1963), pp. 134--139.

By looking at the above expansion, we see that the whole part is 0 and
the numerators are all equal to 1. This constructs the stream of
denominators.


.. spadInput
::

	dens:Stream Integer := cons(1,generate((x+->x+4),6))


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [1,6,10,14,18,22,26,…]   |
+--------------------------+




.. spadType

:sub:`Type: Stream Integer`



Therefore this is the continued fraction expansion for (e-1)/2.


.. spadInput
::

	cf := continuedFraction(0,repeating [1],dens)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| 1||1+1||6+1||10+1||14+1||18+1||22+1||26   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: ContinuedFraction Integer`



These are the rational number convergents.


.. spadInput
::

	ccf := convergents cf


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| [0,1,67,6171,8601001,1554118089,342762398959,…]   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



You can get rational convergents for e by multiplying by 2 and adding 1.


.. spadInput
::

	eConvergents := [2*e + 1 for e in ccf]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------+
| [1,3,197,19371,27211001,4917118089,1084483398959,…]   |
+-------------------------------------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



You can also compute the floating point approximations to these
convergents.


.. spadInput
::

	eConvergents :: Stream Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------+
| [1.0,3.0,2.7142857142857142857,2.7183098591549295775,2.7182817182817182817,2.7182818287356957267,2.7182818284585634113,…]   |
+-----------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream Float`



Compare this to the value of e computed by the expexpFloat operation in
Float.


.. spadInput
::

	exp 1.0


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| 2.7182818284590452354   |
+-------------------------+




.. spadType

:sub:`Type: Float`



In about 1658, Lord Brouncker established the following expansion for
4/π,


.. spadVerbatim

::

         1 +            1
             -----------------------
             2 +          9
                 -------------------
                 2 +        25
                     ---------------
                     2 +      49
                         -----------
                         2 +    81
                             -------
                             2 + ...



Let's use this expansion to compute rational and floating point
approximations for π.


.. spadInput
::

	cf := continuedFraction(1,[(2*i+1)^2 for i in 0..],repeating [2])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------+
| 1+1||2+9||2+25||2+49||2+81||2+121||2+169||2   |
+-------------------------------------------------------------+




.. spadType

:sub:`Type: ContinuedFraction Integer`




.. spadInput
::

	ccf := convergents cf


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| [1,32,1513,10576,315263,34652578,4504536979,…]   |
+--------------------------------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`




.. spadInput
::

	piConvergents := [4/p for p in ccf]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| [4,83,5215,304105,1052315,103123465,14791645045,…]   |
+------------------------------------------------------+




.. spadType

:sub:`Type: Stream Fraction Integer`



As you can see, the values are converging to
π=3.14159265358979323846..., but not very quickly.


.. spadInput
::

	piConvergents :: Stream Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------------------------------------+
| [4.0,2.6666666666666666667,3.4666666666666666667,2.8952380952380952381,3.3396825396825396825,2.9760461760461760462,3.2837384837384837385,…]   |
+-----------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream Float`



You need not restrict yourself to continued fractions of integers. Here
is an expansion for a quotient of Gaussian integers.


.. spadInput
::

	continuedFraction((- 122 + 597*%i)/(4 - 4*%i))


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| -90+59i+1||1-2i+1||-1+2i   |
+--------------------------------+




.. spadType

:sub:`Type: ContinuedFraction Complex Integer`



This is an expansion for a quotient of polynomials in one variable with
rational number coefficients.


.. spadInput
::

	r : Fraction UnivariatePolynomial(x,Fraction Integer)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	r := ((x - 1) * (x - 2)) / ((x-3) * (x-4))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| x2-3x+2x2-7x+12   |
+-------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	continuedFraction r


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| 1+1||14x-98+1||163x-403   |
+-------------------------------+




.. spadType

:sub:`Type: ContinuedFraction UnivariatePolynomial(x,Fraction Integer)`



To conclude this section, we give you evidence that


.. spadVerbatim

::

     z = 3 +            1
             -----------------------
             3 +          1
                 -------------------
                 6 +        1
                     ---------------
                     3 +      1
                         -----------
                         6 +    1
                             -------
                             3 + ...



is the expansion of 11.


.. spadInput
::

	[i*i for i in convergents(z) :: Stream Float]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------------+
| [9.0,11.111111111111111111,10.99445983379501385,11.000277777777777778,10.999986076398799786,11.000000697929731039,10.999999965015834446,…]   |
+----------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Stream Float`





