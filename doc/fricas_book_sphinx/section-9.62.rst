.. status: ok


9.62 Permanent
--------------

The package Permanent provides the function permanentpermanentPermanent
for square matrices. The permanentpermanentPermanent of a square matrix
can be computed in the same way as the determinant by expansion of
minors except that for the permanent the sign for each element is 1,
rather than being 1 if the row plus column indices is positive and -1
otherwise. This function is much more difficult to compute efficiently
than the determinantdeterminantMatrix. An example of the use of
permanentpermanentPermanent is the calculation of the n-th derangement
number, defined to be the number of different possibilities for n
couples to dance but never with their own spouse.

Consider an n by n matrix with entries 0 on the diagonal and 1
elsewhere. Think of the rows as one-half of each couple (for example,
the males) and the columns the other half. The permanent of such a
matrix gives the desired derangement number.


.. spadVerbatim

::

 kn n ==
   r : MATRIX INT := new(n,n,1)
   for i in 1..n repeat
     r.i.i := 0
   r




.. spadType

Void



Here are some derangement numbers, which you see grow quite fast.


.. spadInput
::

	permanent(kn(5) :: SQMATRIX(5,INT))


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function kn with type PositiveInteger -> Matrix Integer 




.. spadMathOutput
.. math::

+------+
| 44   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	[permanent(kn(n) :: SQMATRIX(n,INT)) for n in 1..13]


.. spadMathAnswer
.. spadVerbatim

::

 Cannot compile conversion for types involving local variables. 
    In particular, could not compile the expression involving 
    :: SQMATRIX(n,INT) 
 AXIOM will attempt to step through and interpret the code.




.. spadMathOutput
.. math::

+----------------------------------------------------------------------------+
| [0,1,2,9,44,265,1854,14833,133496,1334961,14684570,176214841,2290792932]   |
+----------------------------------------------------------------------------+




.. spadType

:sub:`Type: List NonNegativeInteger`





