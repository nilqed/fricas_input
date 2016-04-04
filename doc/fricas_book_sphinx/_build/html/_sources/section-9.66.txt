.. status: ok



9.66 RealClosure
----------------

The Real Closure 1.0 package provided by Renaud Rioboo
(Renaud.Rioboo@lip6.fr) consists of different packages, categories and
domains :





The package RealPolynomialUtilitiesPackage which needs a Field F and a
UnivariatePolynomialCategory domain with coefficients in F. It computes
some simple functions such as Sturm and Sylvester sequences
(sturmSequencesturmSequenceRealPolynomialUtilitiesPackage,
sylvesterSequencesylvesterSequenceRealPolynomialUtilitiesPackage).





The category RealRootCharacterizationCategory provides abstract
functions to work with real roots of univariate polynomials. These
resemble variables with some functionality needed to compute important
operations.





The category RealClosedField provides common operations available over
real closed fiels. These include finding all the roots of a univariate
polynomial, taking square (and higher) roots, ...





The domain RightOpenIntervalRootCharacterization is the main code that
provides the functionality of RealRootCharacterizationCategory for the
case of archimedean fields. Abstract roots are encoded with a left
closed right open interval containing the root together with a defining
polynomial for the root.





The RealClosure domain is the end-user code. It provides usual
arithmetic with real algebraic numbers, along with the functionality of
a real closed field. It also provides functions to approximate a real
algebraic number by an element of the base field. This approximation may
either be absolute (approximateapproximateRealClosure) or relative
(relativeApproxrelativeApproxRealClosure).







CAVEATS



Since real algebraic expressions are stored as depending on real roots
which are managed like variables, there is an ordering on these. This
ordering is dynamical in the sense that any new algebraic takes
precedence over older ones. In particular every creation function raises
a new real root. This has the effect that when you type something like
sqrt(2) + sqrt(2) you have two new variables which happen to be equal.
To avoid this name the expression such as in s2 := sqrt(2) ; s2 + s2

Also note that computing times depend strongly on the ordering you
implicitly provide. Please provide algebraics in the order which seems
most natural to you.



LIMITATIONS



These packages use algorithms which are published in [1] and [2] which
are based on field arithmetics, in particular for polynomial gcd related
algorithms. This can be quite slow for high degree polynomials and
subresultants methods usually work best. Beta versions of the package
try to use these techniques in a better way and work significantly
faster. These are mostly based on unpublished algorithms and cannot be
distributed. Please contact the author if you have a particular problem
to solve or want to use these versions.

Be aware that approximations behave as post-processing and that all
computations are done exactly. They can thus be quite time consuming
when depending on several real roots.



REFERENCES



[1] R. Rioboo : Real Algebraic Closure of an ordered Field :
Implementation in FriCAS. In proceedings of the ISSAC'92 Conference,
Berkeley 1992 pp. 206-215.

[2] Z. Ligatsikas, R. Rioboo, M. F. Roy : Generic computation of the
real closure of an ordered field. In Mathematics and Computers in
Simulation Volume 42, Issue 4-6, November 1996.



EXAMPLES



We shall work with the real closure of the ordered field of rational
numbers.


.. spadInput
::

	Ran := RECLOS(FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| RealClosureFractionInteger   |
+------------------------------+




.. spadType

:sub:`Type: Domain`



Some simple signs for square roots, these correspond to an extension of
degree 16 of the rational numbers. Examples provided by J. Abbot.


.. spadInput
::

	fourSquares(a:Ran,b:Ran,c:Ran,d:Ran):Ran == sqrt(a)+sqrt(b) -
sqrt(c)-sqrt(d)


.. spadMathAnswer
.. spadVerbatim

::

 Function declaration fourSquares : (RealClosure Fraction Integer,
    RealClosure Fraction Integer,RealClosure Fraction Integer,
    RealClosure Fraction Integer) -> RealClosure Fraction Integer has
    been added to workspace.




.. spadType

Void



These produce values very close to zero.


.. spadInput
::

	squareDiff1 := fourSquares(73,548,60,586)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| -586-60+548+73   |
+------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------+
| ((54602548+14960273)60+4950273548+9900895)586+(15470273548+30941947)60+10238421548+2805187173   |
+-------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	squareDiff2 := fourSquares(165,778,86,990)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| -990-86+778+165   |
+-------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------------+
| ((556778778+1209010165)86+401966165778+144019431)990+(1363822165778+488640503)86+162460913778+352774119165   |
+--------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	squareDiff3 := fourSquares(217,708,226,692)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| -692-226+708+217   |
+--------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------+
| ((-34102708-61598217)226-34802217708-13641141)692+(-60898217708-23869841)226-13486123708-24359809217   |
+--------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: Integer`




.. spadInput
::

	squareDiff4 := fourSquares(155,836,162,820)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| -820-162+836+155   |
+--------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------------------------------------+
| ((-37078836-86110155)162-37906155836-13645107)820+(-85282155836-30699151)162-13513901836-31384703155   |
+--------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: Integer`




.. spadInput
::

	squareDiff5 := fourSquares(591,772,552,818)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| -818-552+772+591   |
+--------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------+
| ((70922772+81058591)552+68542591772+46297673)818+(83438591772+56359389)552+47657051772+54468081591   |
+------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	squareDiff6 := fourSquares(434,1053,412,1088)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| -1088-412+1053+434   |
+----------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------------+
| ((1154421053+179818434)412+1124784341053+76037291)1088+(1827824341053+123564147)412+772906391053+120391609434   |
+-----------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff6)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	squareDiff7 := fourSquares(514,1049,446,1152)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| -1152-446+1049+514   |
+----------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------+
| ((3495221049+499322514)446+3255825141049+239072537)1152+(5232625141049+384227549)446+2505348731049+357910443514   |
+-------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	squareDiff8 := fourSquares(190,1751,208,1698)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| -1698-208+1751+190   |
+----------------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	recip(squareDiff8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------+
| ((-2147021751-651782190)208-2246421901751-129571901)1698+(-6418421901751-370209881)208-1275958651751-387349387190   |
+---------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(RealClosure Fraction Integer,...)`




.. spadInput
::

	sign(squareDiff8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: Integer`



This should give three digits of precision


.. spadInput
::

	relativeApprox(squareDiff8,10^(-3))::Float


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| -0.23405277715937700123E-10   |
+-------------------------------+




.. spadType

:sub:`Type: Float`



The sum of these 4 roots is 0


.. spadInput
::

	l := allRootsOf((x^2-2)^2-2)$Ran


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| [%A33,%A34,%A35,%A36]   |
+-------------------------+




.. spadType

:sub:`Type: List RealClosure Fraction Integer`



Check that they are all roots of the same polynomial


.. spadInput
::

	removeDuplicates map(mainDefiningPolynomial,l)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [?4-4?2+2]   |
+--------------+




.. spadType

:sub:`Type: List Union(SparseUnivariatePolynomial RealClosure Fraction`
Integer,"failed")



We can see at a glance that they are separate roots


.. spadInput
::

	map(mainCharacterization,l)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [[-2,-1[,[-1,0[,[0,1[,[1,2[]   |
+--------------------------------+




.. spadType

:sub:`Type: List Union( RightOpenIntervalRootCharacterization( RealClosure`
Fraction Integer, SparseUnivariatePolynomial RealClosure Fraction
Integer), "failed")



Check the sum and product


.. spadInput
::

	[reduce(+,l),reduce(*,l)-2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [0,0]   |
+---------+




.. spadType

:sub:`Type: List RealClosure Fraction Integer`



A more complicated test that involve an extension of degree 256. This is
a way of checking nested radical identities.


.. spadInput
::

	(s2, s5, s10) := (sqrt(2)$Ran, sqrt(5)$Ran, sqrt(10)$Ran)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 10   |
+------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	eq1:=sqrt(s10+3)*sqrt(s5+2) - sqrt(s10-3)*sqrt(s5-2) = sqrt(10*s2+10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| -10-35-2+10+35+2=102+10   |
+---------------------------+




.. spadType

:sub:`Type: Equation RealClosure Fraction Integer`




.. spadInput
::

	eq1::Boolean


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

	eq2:=sqrt(s5+2)*sqrt(s2+1) - sqrt(s5-2)*sqrt(s2-1) = sqrt(2*s10+2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| -5-22-1+5+22+1=210+2   |
+------------------------+




.. spadType

:sub:`Type: Equation RealClosure Fraction Integer`




.. spadInput
::

	eq2::Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Some more examples from J. M. Arnaudies


.. spadInput
::

	s3 := sqrt(3)$Ran


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	s7:= sqrt(7)$Ran


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	e1 := sqrt(2*s7-3*s3,3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 27-333   |
+----------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	e2 := sqrt(2*s7+3*s3,3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 27+333   |
+----------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`



This should be null


.. spadInput
::

	e2-e1-s3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: RealClosure Fraction Integer`



A quartic polynomial


.. spadInput
::

	pol : UP(x,Ran) := x^4+(7/3)*x^2+30*x-(100/3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| x4+73x2+30x-1003   |
+--------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,RealClosure Fraction Integer)`



Add some cubic roots


.. spadInput
::

	r1 := sqrt(7633)$Ran


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 7633   |
+--------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	alpha := sqrt(5*r1-436,3)/3


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 1357633-4363   |
+----------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	beta := -sqrt(5*r1+436,3)/3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| -1357633+4363   |
+-----------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`



this should be null


.. spadInput
::

	pol.(alpha+beta-1/3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: RealClosure Fraction Integer`



A quintic polynomial


.. spadInput
::

	qol : UP(x,Ran) := x^5+10*x^3+20*x+22


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| x5+10x3+20x+22   |
+------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,RealClosure Fraction Integer)`



Add some cubic roots


.. spadInput
::

	r2 := sqrt(153)$Ran


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 153   |
+-------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	alpha2 := sqrt(r2-11,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 153-115   |
+-----------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	beta2 := -sqrt(r2+11,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -153+115   |
+------------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`



this should be null


.. spadInput
::

	qol(alpha2+beta2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: RealClosure Fraction Integer`



Finally, some examples from the book Computer Algebra by Davenport,
Siret and Tournier (page 77). The last one is due to Ramanujan.


.. spadInput
::

	dst1:=sqrt(9+4*s2)=1+2*s2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 42+9=22+1   |
+-------------+




.. spadType

:sub:`Type: Equation RealClosure Fraction Integer`




.. spadInput
::

	dst1::Boolean


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

	s6:Ran:=sqrt 6


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 6   |
+-----+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	dst2:=sqrt(5+2*s6)+sqrt(5-2*s6) = 2*s3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| -26+5+26+5=23   |
+-----------------+




.. spadType

:sub:`Type: Equation RealClosure Fraction Integer`




.. spadInput
::

	dst2::Boolean


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

	s29:Ran:=sqrt 29


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 29   |
+------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	dst4:=sqrt(16-2*s29+2*sqrt(55-10*s29)) =
sqrt(22+2*s5)-sqrt(11+2*s29)+s5


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| 2-1029+55-229+16=-229+11+25+22+5   |
+------------------------------------+




.. spadType

:sub:`Type: Equation RealClosure Fraction Integer`




.. spadInput
::

	dst4::Boolean


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

	dst6:=sqrt((112+70*s2)+(46+34*s2)*s5) = (5+4*s2)+(3+s2)*s5


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| (342+46)5+702+112=(2+3)5+42+5   |
+---------------------------------+




.. spadType

:sub:`Type: Equation RealClosure Fraction Integer`




.. spadInput
::

	dst6::Boolean


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

	f3:Ran:=sqrt(3,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 35   |
+------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	f25:Ran:=sqrt(1/25,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1255   |
+--------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	f32:Ran:=sqrt(32/5,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 3255   |
+--------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	f27:Ran:=sqrt(27/5,5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 2755   |
+--------+




.. spadType

:sub:`Type: RealClosure Fraction Integer`




.. spadInput
::

	dst5:=sqrt((f32-f27,3)) = f25*(1+f3-f3^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| -2755+32553=(-352+35+1)1255   |
+-------------------------------+




.. spadType

:sub:`Type: Equation RealClosure Fraction Integer`




.. spadInput
::

	dst5::Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`





