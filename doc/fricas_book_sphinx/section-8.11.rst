.. status: ok



8.11 Finite Fields
------------------

A finite field (also called a Galois field) is a finite algebraic
structure where one can add, multiply and divide under the same laws
(for example, commutativity, associativity or distributivity) as apply
to the rational, real or complex numbers. Unlike those three fields, for
any finite field there exists a positive prime integer p, called the
characteristic, such that px=0 for any element x in the finite field. In
fact, the number of elements in a finite field is a power of the
characteristic and for each prime p and positive integer n there exists
exactly one finite field with pn elements, up to isomorphism. For more
information about the algebraic structure and properties of finite
fields, see, for example,
 S. Lang, Algebra, Second Edition, New York: Addison-Wesley Publishing
Company, Inc., 1984, ISBN 0 201 05487 6;
 or
 R. Lidl, H. Niederreiter, Finite Fields, Encyclopedia of Mathematics
and Its Applications, Vol. 20, Cambridge: Cambridge Univ. Press, 1983,
ISBN 0 521 30240 4.

When n=1, the field has p elements and is called a prime field,
discussed in the next section. There are several ways of implementing
extensions of finite fields, and FriCAS provides quite a bit of freedom
to allow you to choose the one that is best for your application.
Moreover, we provide operations for converting among the different
representations of extensions and different extensions of a single
field. Finally, note that you usually need to package-call operations
from finite fields if the operations do not take as an argument an
object of the field. See
`ugTypesPkgCall <section-2.9.html#ugTypesPkgCall>`__ for more
information on package-calling.



8.11.1 Modular Arithmetic and Prime Fields
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

finite field Galois:field field:finite:prime field:prime field:Galois
prime field modular arithmetic arithmetic:modular

Let n be a positive integer. It is well known that you can get the same
result if you perform addition, subtraction or multiplication of
integers and then take the remainder on dividing by n as if you had
first done such remaindering on the operands, performed the arithmetic
and then (if necessary) done remaindering again. This allows us to speak
of arithmetic modulo n or, more simply mod n.

In FriCAS, you use IntegerMod to do such arithmetic.


.. spadInput
::

	(a,b) : IntegerMod 12


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	(a, b) := (16, 7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: IntegerMod 12`




.. spadInput
::

	[a - b, a * b]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| [9,4]   |
+---------+




.. spadType

:sub:`Type: List IntegerMod 12`



If n is not prime, there is only a limited notion of reciprocals and
division.


.. spadInput
::

	a / b


.. spadMathAnswer
.. spadVerbatim

::

    There are 12 exposed and 13 unexposed library operations named / 
       having 2 argument(s) but none was determined to be applicable. 
       Use HyperDoc Browse, or issue
                                 )display op /
       to learn more about the available operations. Perhaps 
       package-calling the operation or using coercions on the arguments
       will allow you to apply the operation.
  
    Cannot find a definition or applicable library operation named / 
       with argument type(s) 
                                 IntegerMod 12
                                 IntegerMod 12
       
       Perhaps you should use "@" to indicate the required return type, 
       or "$" to specify which version of the function you need.




.. spadInput
::

	recip a


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| "failed"   |
+------------+




.. spadType

:sub:`Type: Union("failed",...)`



Here 7 and 12 are relatively prime, so 7 has a multiplicative inverse
modulo 12.


.. spadInput
::

	recip b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: Union(IntegerMod 12,...)`



If we take n to be a prime number p, then taking inverses and,
therefore, division are generally defined.

Use PrimeField instead of IntegerMod for n prime.


.. spadInput
::

	c : PrimeField 11 := 8


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PrimeField 11`




.. spadInput
::

	inv c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 7   |
+-----+




.. spadType

:sub:`Type: PrimeField 11`



You can also use 1/c and c**(-1) for the inverse of c.


.. spadInput
::

	9/c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PrimeField 11`



PrimeField (abbreviation PF) checks if its argument is prime when you
try to use an operation from it. If you know the argument is prime
(particularly if it is large), InnerPrimeField (abbreviation IPF)
assumes the argument has already been verified to be prime. If you do
use a number that is not prime, you will eventually get an error
message, most likely a division by zero message. For computer science
applications, the most important finite fields are PrimeField 2 and its
extensions.

In the following examples, we work with the finite field with p=101
elements.


.. spadInput
::

	GF101 := PF 101


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| PrimeField101   |
+-----------------+




.. spadType

:sub:`Type: Domain`



Like many domains in FriCAS, finite fields provide an operation for
returning a random element of the domain.


.. spadInput
::

	x := random()$GF101


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PrimeField 101`




.. spadInput
::

	y : GF101 := 37


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 37   |
+------+




.. spadType

:sub:`Type: PrimeField 101`




.. spadInput
::

	z := x/y


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 63   |
+------+




.. spadType

:sub:`Type: PrimeField 101`




.. spadInput
::

	z * y - x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: PrimeField 101`



The element 2 is a primitive element of this field, primitive element
element:primitive


.. spadInput
::

	pe := primitiveElement()$GF101


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PrimeField 101`



in the sense that its powers enumerate all nonzero elements.


.. spadInput
::

	[pe^i for i in 0..99]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [1,2,4,8,16,32,64,27,54,7,14,28,56,11,22,44,88,75,49,98,95,89,77,53,5,10,20,40,80,59,17,34,68,35,70,39,78,55,9,18,36,72,43,86,71,41,82,63,25,50,100,99,97,93,85,69,37,74,47,94,87,73,45,90,79,57,13,26,52,3,6,12,24,48,96,91,81,61,21,42,84,67,33,66,31,62,23,46,92,83,65,29,58,15,30,60,19,38,76,51]   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List PrimeField 101`



If every nonzero element is a power of a primitive element, how do you
determine what the exponent is? Use discrete logarithm discreteLog.
logarithm:discrete


.. spadInput
::

	ex := discreteLog(y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 56   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	pe ^ ex


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 37   |
+------+




.. spadType

:sub:`Type: PrimeField 101`



The order of a nonzero element x is the smallest positive integer t such
xt=1.


.. spadInput
::

	order y


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 25   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



The order of a primitive element is the defining p-1.


.. spadInput
::

	order pe


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 100   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`







8.11.2 Extensions of Finite Fields
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

finite field field:finite:extension of

When you want to work with an extension of a finite field in FriCAS, you
have three choices to make:

#. Do you want to generate an extension of the prime field (for example,
   PrimeField 2) or an extension of a given field?
#. Do you want to use a representation that is particularly efficient
   for multiplication, exponentiation and addition but uses a lot of
   computer memory (a representation that models the cyclic group
   structure of the multiplicative group of the field extension and uses
   a Zech logarithm table), one that Zech logarithm uses a normal basis
   for the vector space structure of the field extension, or one that
   performs arithmetic modulo an irreducible polynomial? The cyclic
   group representation is only usable up to medium (relative to your
   machine's performance) sized fields. If the field is large and the
   normal basis is relatively simple, the normal basis representation is
   more efficient for exponentiation than the irreducible polynomial
   representation.
#. Do you want to provide a polynomial explicitly, a root of which
   generates the extension in one of the three senses in (2), or do you
   wish to have the polynomial generated for you?

This illustrates one of the most important features of FriCAS: you can
choose exactly the right data-type and representation to suit your
application best.

We first tell you what domain constructors to use for each case above,
and then give some examples.

| Constructors that automatically generate extensions of the prime
field:
|  FiniteField
|  FiniteFieldCyclicGroup
|  FiniteFieldNormalBasis

| Constructors that generate extensions of an arbitrary field:
|  FiniteFieldExtension
|  FiniteFieldExtensionByPolynomial
|  FiniteFieldCyclicGroupExtension
|  FiniteFieldCyclicGroupExtensionByPolynomial
|  FiniteFieldNormalBasisExtension
|  FiniteFieldNormalBasisExtensionByPolynomial

| Constructors that use a cyclic group representation:
|  FiniteFieldCyclicGroup
|  FiniteFieldCyclicGroupExtension
|  FiniteFieldCyclicGroupExtensionByPolynomial

| Constructors that use a normal basis representation:
|  FiniteFieldNormalBasis
|  FiniteFieldNormalBasisExtension
|  FiniteFieldNormalBasisExtensionByPolynomial

| Constructors that use an irreducible modulus polynomial
representation:
|  FiniteField
|  FiniteFieldExtension
|  FiniteFieldExtensionByPolynomial

| Constructors that generate a polynomial for you:
|  FiniteField
|  FiniteFieldExtension
|  FiniteFieldCyclicGroup
|  FiniteFieldCyclicGroupExtension
|  FiniteFieldNormalBasis
|  FiniteFieldNormalBasisExtension

| Constructors for which you provide a polynomial:
|  FiniteFieldExtensionByPolynomial
|  FiniteFieldCyclicGroupExtensionByPolynomial
|  FiniteFieldNormalBasisExtensionByPolynomial

These constructors are discussed in the following sections where we
collect together descriptions of extension fields that have the same
underlying representation.For more information on the implementation
aspects of finite fields, see J. Grabmeier, A. Scheerhorn, Finite Fields
in AXIOM, Technical Report, IBM Heidelberg Scientific Center, 1992.

If you don't really care about all this detail, just use FiniteField. As
your knowledge of your application and its FriCAS implementation grows,
you can come back and choose an alternative constructor that may improve
the efficiency of your code. Note that the exported operations are
almost the same for all constructors of finite field extensions and
include the operations exported by PrimeField.





8.11.3 Irreducible Modulus Polynomial Representations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All finite field extension constructors discussed in this finite field
section field:finite:extension of use a representation that performs
arithmetic with univariate (one-variable) polynomials modulo an
irreducible polynomial. This polynomial may be given explicitly by you
or automatically generated. The ground field may be the prime field or
one you specify. See
`ugxProblemFiniteExtensionFinite <section-8.11.html#ugxProblemFiniteExtensionFinite>`__
for general information about finite field extensions.

For FiniteField (abbreviation FF) you provide a prime number p and an
extension degree n. This degree can be 1.

FriCAS uses the prime field PrimeField(p), here PrimeField 2, and it
chooses an irreducible polynomial of degree n, here 12, over the ground
field.


.. spadInput
::

	GF4096 := FF(2,12);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



The objects in the generated field extension are polynomials of degree
at most n-1 with coefficients in the prime field. The polynomial
indeterminate is automatically chosen by FriCAS and is typically
something like %A or %D. These (strange) variables are only for output
display; there are several ways to construct elements of this field.

The operation index enumerates the elements of the field extension and
accepts as argument the integers from 1 to pn.

The expression index(p) always gives the indeterminate.


.. spadInput
::

	a := index(2)$GF4096


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| %A   |
+------+




.. spadType

:sub:`Type: FiniteField(2,12)`



You can build polynomials in a and calculate in GF4096.


.. spadInput
::

	b := a^12 - a^5 + a


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| %A5+%A3+%A+1   |
+----------------+




.. spadType

:sub:`Type: FiniteField(2,12)`




.. spadInput
::

	b ^ 1000


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| %A10+%A9+%A7+%A5+%A4+%A3+%A   |
+-------------------------------+




.. spadType

:sub:`Type: FiniteField(2,12)`




.. spadInput
::

	c := a/b


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| %A11+%A8+%A7+%A5+%A4+%A3+%A2   |
+--------------------------------+




.. spadType

:sub:`Type: FiniteField(2,12)`



Among the available operations are norm and trace.


.. spadInput
::

	norm c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PrimeField 2`




.. spadInput
::

	trace c


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: PrimeField 2`



Since any nonzero element is a power of a primitive element, how do we
discover what the exponent is?

The operation discreteLog calculates discrete logarithm the exponent
and, logarithm:discrete if it is called with only one argument, always
refers to the primitive element returned by primitiveElement.


.. spadInput
::

	dL := discreteLog a


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1729   |
+--------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	g ^ dL


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| g1729   |
+---------+




.. spadType

:sub:`Type: Polynomial Integer`



FiniteFieldExtension (abbreviation FFX) is similar to FiniteField except
that the ground-field for FiniteFieldExtension is arbitrary and chosen
by you.

In case you select the prime field as ground field, there is essentially
no difference between the constructed two finite field extensions.


.. spadInput
::

	GF16 := FF(2,4);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	GF4096 := FFX(GF16,3);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	r := (random()$GF4096) ^ 20


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| (%B2+1)%C2+(%B3+%B2+1)%C+%B3+%B2+%B+1   |
+-----------------------------------------+




.. spadType

:sub:`Type: FiniteFieldExtension(FiniteField(2,4),3)`




.. spadInput
::

	norm(r)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| %B2+%B   |
+----------+




.. spadType

:sub:`Type: FiniteField(2,4)`



FiniteFieldExtensionByPolynomial (abbreviation FFP) is similar to
FiniteField and FiniteFieldExtension but is more general.


.. spadInput
::

	GF4 := FF(2,2);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	f := nextIrreduciblePoly(random(6)$FFPOLY(GF4))$FFPOLY(GF4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(SparseUnivariatePolynomial FiniteField(2,2),...)`



For FFP you choose both the ground field and the irreducible polynomial
used in the representation. The degree of the extension is the degree of
the polynomial.


.. spadInput
::

	GF4096 := FFP(GF4,f);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	discreteLog random()$GF4096


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 582   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`







8.11.4 Cyclic Group Representations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

finite field field:finite:extension of

In every finite field there exist elements whose powers are all the
nonzero elements of the field. Such an element is called a primitive
element.

In FiniteFieldCyclicGroup (abbreviation FFCG) group:cyclic the nonzero
elements are represented by the powers of a fixed primitive
element:primitive element primitive element of the field (that is, a
generator of its cyclic multiplicative group). Multiplication (and hence
exponentiation) using this representation is easy. To do addition, we
consider our primitive element as the root of a primitive polynomial (an
irreducible polynomial whose roots are all primitive). See
`ugxProblemFiniteUtility <section-8.11.html#ugxProblemFiniteUtility>`__
for examples of how to compute such a polynomial.

To use FiniteFieldCyclicGroup you provide a prime number and an
extension degree.


.. spadInput
::

	GF81 := FFCG(3,4);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



FriCAS uses the prime field, here PrimeField 3, as the ground field and
it chooses a primitive polynomial of degree n, here 4, over the prime
field.


.. spadInput
::

	a := primitiveElement()$GF81


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| %F1   |
+-------+




.. spadType

:sub:`Type: FiniteFieldCyclicGroup(3,4)`



You can calculate in GF81.


.. spadInput
::

	b := a^12 - a^5 + a


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| %F72   |
+--------+




.. spadType

:sub:`Type: FiniteFieldCyclicGroup(3,4)`



In this representation of finite fields the discrete logarithm of an
element can be seen directly in its output form.


.. spadInput
::

	b


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| %F72   |
+--------+




.. spadType

:sub:`Type: FiniteFieldCyclicGroup(3,4)`




.. spadInput
::

	discreteLog b


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 72   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



FiniteFieldCyclicGroupExtension (abbreviation FFCGX) is similar to
FiniteFieldCyclicGroup except that the ground field for
FiniteFieldCyclicGroupExtension is arbitrary and chosen by you. In case
you select the prime field as ground field, there is essentially no
difference between the constructed two finite field extensions.


.. spadInput
::

	GF9 := FF(3,2);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	GF729 := FFCGX(GF9,3);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	r := (random()$GF729) ^ 20


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| %H420   |
+---------+




.. spadType

:sub:`Type: FiniteFieldCyclicGroupExtension(FiniteField(3,2),3)`




.. spadInput
::

	trace(r)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: FiniteField(3,2)`



FiniteFieldCyclicGroupExtensionByPolynomial (abbreviation FFCGP) is
similar to FiniteFieldCyclicGroup and FiniteFieldCyclicGroupExtension
but is more general. For FiniteFieldCyclicGroupExtensionByPolynomial you
choose both the ground field and the irreducible polynomial used in the
representation. The degree of the extension is the degree of the
polynomial.


.. spadInput
::

	GF3 := PrimeField 3;


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



We use a utility operation to generate an irreducible primitive
polynomial (see
`ugxProblemFiniteUtility <section-8.11.html#ugxProblemFiniteUtility>`__
). The polynomial has one variable that is anonymous: it displays as a
question mark.


.. spadInput
::

	f := createPrimitivePoly(4)$FFPOLY(GF3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 3`




.. spadInput
::

	GF81 := FFCGP(GF3,f);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



Let's look at a random element from this field.


.. spadInput
::

	random()$GF81


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| %K13   |
+--------+




.. spadType

:sub:`Type: FiniteFieldCyclicGroupExtensionByPolynomial(PrimeField 3,?^4+?+2)`







8.11.5 Normal Basis Representations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

finite field field:finite:extension of basis:normal normal basis

Let K be a finite extension of degree n of the finite field F and let F
have q elements. An element x of K is said to be normal over F if the
elements


.. spadMathOutput
.. math::

+--------------------+
| 1,xq,xq2,…,xqn-1   |
+--------------------+



form a basis of K as a vector space over F. Such a basis is called a
normal basis.This agrees with the general definition of a normal basis
because the n distinct powers of the automorphism x↦xq constitute the
Galois group of K/F.

If x is normal over F, its minimal polynomial:minimal polynomial is also
said to be normal over F. minimal polynomial There exist normal bases
for all finite extensions of arbitrary finite fields.

In FiniteFieldNormalBasis (abbreviation FFNB), the elements of the
finite field are represented by coordinate vectors with respect to a
normal basis.

You provide a prime p and an extension degree n.


.. spadInput
::

	K := FFNB(3,8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| FiniteFieldNormalBasis(3,8)   |
+-------------------------------+




.. spadType

:sub:`Type: Domain`



FriCAS uses the prime field PrimeField(p), here PrimeField 3, and it
chooses a normal polynomial of degree n, here 8, over the ground field.
The remainder class of the indeterminate is used as the normal element.
The polynomial indeterminate is automatically chosen by FriCAS and is
typically something like %A or %D. These (strange) variables are only
for output display; there are several ways to construct elements of this
field. The output of the basis elements is something like %Aqi.


.. spadInput
::

	a := normalElement()$K


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| %I   |
+------+




.. spadType

:sub:`Type: FiniteFieldNormalBasis(3,8)`



You can calculate in K using a.


.. spadInput
::

	b := a^12 - a^5 + a


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| 2%Iq7+%Iq5+%Iq   |
+------------------+




.. spadType

:sub:`Type: FiniteFieldNormalBasis(3,8)`



FiniteFieldNormalBasisExtension (abbreviation FFNBX) is similar to
FiniteFieldNormalBasis except that the groundfield for
FiniteFieldNormalBasisExtension is arbitrary and chosen by you. In case
you select the prime field as ground field, there is essentially no
difference between the constructed two finite field extensions.


.. spadInput
::

	GF9 := FFNB(3,2);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	GF729 := FFNBX(GF9,3);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`




.. spadInput
::

	r := random()$GF729


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 2%K%Lq   |
+----------+




.. spadType

:sub:`Type: FiniteFieldNormalBasisExtension(FiniteFieldNormalBasis(3,2),3)`




.. spadInput
::

	r + r^3 + r^9 + r^27


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| 2%K%Lq2+(2%Kq+2%K)%Lq+2%Kq%L   |
+--------------------------------+




.. spadType

:sub:`Type: FiniteFieldNormalBasisExtension(FiniteFieldNormalBasis(3,2),3)`



FiniteFieldNormalBasisExtensionByPolynomial (abbreviation FFNBP) is
similar to FiniteFieldNormalBasis and FiniteFieldNormalBasisExtension
but is more general. For FiniteFieldNormalBasisExtensionByPolynomial you
choose both the ground field and the irreducible polynomial used in the
representation. The degree of the extension is the degree of the
polynomial.


.. spadInput
::

	GF3 := PrimeField 3;


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



We use a utility operation to generate an irreducible normal polynomial
(see
`ugxProblemFiniteUtility <section-8.11.html#ugxProblemFiniteUtility>`__
). The polynomial has one variable that is anonymous: it displays as a
question mark.


.. spadInput
::

	f := createNormalPoly(4)$FFPOLY(GF3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| ?4+2?3+2   |
+------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 3`




.. spadInput
::

	GF81 := FFNBP(GF3,f);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



Let's look at a random element from this field.


.. spadInput
::

	r := random()$GF81


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| %Mq2+2%Mq+2%M   |
+-----------------+




.. spadType

:sub:`Type: FiniteFieldNormalBasisExtensionByPolynomial(PrimeField`
3,?^4+2*?^3+2)




.. spadInput
::

	r * r^3 * r^9 * r^27


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| 2%Mq3+2%Mq2+2%Mq+2%M   |
+------------------------+




.. spadType

:sub:`Type: FiniteFieldNormalBasisExtensionByPolynomial(PrimeField`
3,?^4+2*?^3+2)




.. spadInput
::

	norm r


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PrimeField 3`







8.11.6 Conversion Operations for Finite Fields
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

field:finite:conversions

Let K be a finite field.


.. spadInput
::

	K := PrimeField 3


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| PrimeField3   |
+---------------+




.. spadType

:sub:`Type: Domain`



An extension field Km of degree m over K is a subfield of an extension
field Kn of degree n over K if and only if m divides n.



+-------------------------+-------------------------+-------------------------+
| Kn                      |                         |                         |
+-------------------------+-------------------------+-------------------------+
| ❘                       |                         |                         |
+-------------------------+-------------------------+-------------------------+
| Km                      | ⟺                       | m∣n                     |
+-------------------------+-------------------------+-------------------------+
| ❘                       |                         |                         |
+-------------------------+-------------------------+-------------------------+
| K                       |                         |                         |
+-------------------------+-------------------------+-------------------------+



FiniteFieldHomomorphisms provides conversion operations between
different extensions of one fixed finite ground field and between
different representations of these finite fields.

Let's choose m and n,


.. spadInput
::

	(m,n) := (4,8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 8   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



build the field extensions,


.. spadInput
::

	Km := FiniteFieldExtension(K,m)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| FiniteFieldExtension(PrimeField3,4)   |
+---------------------------------------+




.. spadType

:sub:`Type: Domain`



and pick two random elements from the smaller field.


.. spadInput
::

	Kn := FiniteFieldExtension(K,n)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------+
| FiniteFieldExtension(PrimeField3,8)   |
+---------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	a1 := random()$Km


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 2%A3+%A2   |
+------------+




.. spadType

:sub:`Type: FiniteFieldExtension(PrimeField 3,4)`




.. spadInput
::

	b1 := random()$Km


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| %A3+%A2+2%A+1   |
+-----------------+




.. spadType

:sub:`Type: FiniteFieldExtension(PrimeField 3,4)`



Since m divides n, Km is a subfield of Kn.


.. spadInput
::

	a2 := a1 :: Kn


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| %B4   |
+-------+




.. spadType

:sub:`Type: FiniteFieldExtension(PrimeField 3,8)`



Therefore we can convert the elements of Km into elements of Kn.


.. spadInput
::

	b2 := b1 :: Kn


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| 2%B6+2%B4+%B2+1   |
+-------------------+




.. spadType

:sub:`Type: FiniteFieldExtension(PrimeField 3,8)`



To check this, let's do some arithmetic.


.. spadInput
::

	a1+b1 - ((a2+b2) :: Km)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: FiniteFieldExtension(PrimeField 3,4)`




.. spadInput
::

	a1*b1 - ((a2*b2) :: Km)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: FiniteFieldExtension(PrimeField 3,4)`



There are also conversions available for the situation, when Km and Kn
are represented in different ways (see
`ugxProblemFiniteExtensionFinite <section-8.11.html#ugxProblemFiniteExtensionFinite>`__
). For example let's choose Km where the representation is 0 plus the
cyclic multiplicative group and Kn with a normal basis representation.


.. spadInput
::

	Km := FFCGX(K,m)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| FiniteFieldCyclicGroupExtension(PrimeField3,4)   |
+--------------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	Kn := FFNBX(K,n)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| FiniteFieldNormalBasisExtension(PrimeField3,8)   |
+--------------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	(a1,b1) := (random()$Km,random()$Km)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| %C13   |
+--------+




.. spadType

:sub:`Type: FiniteFieldCyclicGroupExtension(PrimeField 3,4)`




.. spadInput
::

	a2 := a1 :: Kn


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| 2%Dq6+2%Dq5+2%Dq4+2%Dq2+2%Dq+2%D   |
+------------------------------------+




.. spadType

:sub:`Type: FiniteFieldNormalBasisExtension(PrimeField 3,8)`




.. spadInput
::

	b2 := b1 :: Kn


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------+
| 2%Dq7+%Dq6+%Dq5+%Dq4+2%Dq3+%Dq2+%Dq+%D   |
+------------------------------------------+




.. spadType

:sub:`Type: FiniteFieldNormalBasisExtension(PrimeField 3,8)`



Check the arithmetic again.


.. spadInput
::

	a1+b1 - ((a2+b2) :: Km)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: FiniteFieldCyclicGroupExtension(PrimeField 3,4)`




.. spadInput
::

	a1*b1 - ((a2*b2) :: Km)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: FiniteFieldCyclicGroupExtension(PrimeField 3,4)`







8.11.7 Utility Operations for Finite Fields
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FiniteFieldPolynomialPackage (abbreviation FFPOLY) provides operations
for generating, counting and testing polynomials over finite fields.
Let's start with a couple of definitions:

-  A polynomial is primitive if its roots are primitive
   polynomial:primitive elements in an extension of the coefficient
   field of degree equal to the degree of the polynomial.
-  A polynomial is normal over its coefficient field polynomial:normal
   if its roots are linearly independent elements in an extension of the
   coefficient field of degree equal to the degree of the polynomial.

In what follows, many of the generated polynomials have one anonymous
variable. This indeterminate is displayed as a question mark (?).

To fix ideas, let's use the field with five elements for the first few
examples.


.. spadInput
::

	GF5 := PF 5;


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



You can generate irreducible polynomials of any (positive) degree
polynomial:irreducible (within the storage capabilities of the computer
and your ability to wait) by using
createIrreduciblePolycreateIrreduciblePolyFiniteFieldPolynomialPackage.


.. spadInput
::

	f := createIrreduciblePoly(8)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| ?8+?4+2   |
+-----------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`



Does this polynomial have other important properties? Use primitive? to
test whether it is a primitive polynomial.


.. spadInput
::

	primitive?(f)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Use normal? to test whether it is a normal polynomial.


.. spadInput
::

	normal?(f)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



Note that this is actually a trivial case, because a normal polynomial
of degree n must have a nonzero term of degree n-1. We will refer back
to this later.

To get a primitive polynomial of degree 8 just issue this.


.. spadInput
::

	p := createPrimitivePoly(8)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| ?8+?3+?2+?+2   |
+----------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`




.. spadInput
::

	primitive?(p)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



This polynomial is not normal,


.. spadInput
::

	normal?(p)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



but if you want a normal one simply write this.


.. spadInput
::

	n := createNormalPoly(8)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| ?8+4?7+?3+1   |
+---------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`



This polynomial is not primitive!


.. spadInput
::

	primitive?(n)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



This could have been seen directly, as the constant term is 1 here,
which is not a primitive element up to the factor ( -1) raised to the
degree of the polynomial.Cf. Lidl, R. & Niederreiter, H., Finite Fields,
Encycl. of Math. 20, (Addison-Wesley, 1983), p.90, Th. 3.18.

What about polynomials that are both primitive and normal? The existence
of such a polynomial is by no means obvious. The existence of such
polynomials is proved in Lenstra, H. W. & Schoof, R. J., Primitive
Normal Bases for Finite Fields, Math. Comp. 48, 1987, pp. 217-231.

If you really need one use either
createPrimitiveNormalPolycreatePrimitiveNormalPolyFiniteFieldPolynomialPackage
or
createNormalPrimitivePolycreateNormalPrimitivePolyFiniteFieldPolynomialPackage.


.. spadInput
::

	createPrimitiveNormalPoly(8)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| ?8+4?7+2?5+2   |
+----------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`



If you want to obtain additional polynomials of the various types above
as given by the create... operations above, you can use the next...
operations. For instance,
nextIrreduciblePolynextIrreduciblePolyFiniteFieldPolynomialPackage
yields the next monic irreducible polynomial with the same degree as the
input polynomial. By next we mean next in a natural order using the
terms and coefficients. This will become more clear in the following
examples.

This is the field with five elements.


.. spadInput
::

	GF5 := PF 5;


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



Our first example irreducible polynomial, say of degree 3, must be
greater than this.


.. spadInput
::

	h := monomial(1,8)$SUP(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| ?8   |
+------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`



You can generate it by doing this.


.. spadInput
::

	nh := nextIrreduciblePoly(h)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| ?8+2   |
+--------+




.. spadType

:sub:`Type: Union(SparseUnivariatePolynomial PrimeField 5,...)`



Notice that this polynomial is not the same as the one
createIrreduciblePolycreateIrreduciblePolyFiniteFieldPolynomialPackage.


.. spadInput
::

	createIrreduciblePoly(3)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| ?3+?+1   |
+----------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`



You can step through all irreducible polynomials of degree 8 over the
field with 5 elements by repeatedly issuing this.


.. spadInput
::

	nh := nextIrreduciblePoly(nh)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| ?8+3   |
+--------+




.. spadType

:sub:`Type: Union(SparseUnivariatePolynomial PrimeField 5,...)`



You could also ask for the total number of these.


.. spadInput
::

	numberOfIrreduciblePoly(5)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 624   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



We hope that natural order on polynomials is now clear: first we compare
the number of monomials of two polynomials (more is greater); then, if
necessary, the degrees of these monomials (lexicographically), and
lastly their coefficients (also lexicographically, and using the
operation lookup if our field is not a prime field). Also note that we
make both polynomials monic before looking at the coefficients:
multiplying either polynomial by a nonzero constant produces the same
result.

The package FiniteFieldPolynomialPackage also provides similar
operations for primitive and normal polynomials. With the exception of
the number of primitive normal polynomials; we're not aware of any known
formula for this.


.. spadInput
::

	numberOfPrimitivePoly(3)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 20   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Take these,


.. spadInput
::

	m := monomial(1,1)$SUP(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| ?   |
+-----+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`




.. spadInput
::

	f := m^3 + 4*m^2 + m + 2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| ?3+4?2+?+2   |
+--------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`



and then we have:


.. spadInput
::

	f1 := nextPrimitivePoly(f)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| ?3+4?2+4?+2   |
+---------------+




.. spadType

:sub:`Type: Union(SparseUnivariatePolynomial PrimeField 5,...)`



What happened?


.. spadInput
::

	nextPrimitivePoly(f1)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| ?3+2?2+3   |
+------------+




.. spadType

:sub:`Type: Union(SparseUnivariatePolynomial PrimeField 5,...)`



Well, for the ordering used in
nextPrimitivePolynextPrimitivePolyFiniteFieldPolynomialPackage we use as
first criterion a comparison of the constant terms of the polynomials.
Analogously, in nextNormalPolynextNormalPolyFiniteFieldPolynomialPackage
we first compare the monomials of degree 1 less than the degree of the
polynomials (which is nonzero, by an earlier remark).


.. spadInput
::

	f := m^3 + m^2 + 4*m + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| ?3+?2+4?+1   |
+--------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 5`




.. spadInput
::

	f1 := nextNormalPoly(f)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| ?3+?2+4?+3   |
+--------------+




.. spadType

:sub:`Type: Union(SparseUnivariatePolynomial PrimeField 5,...)`




.. spadInput
::

	nextNormalPoly(f1)$FFPOLY(GF5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| ?3+2?2+1   |
+------------+




.. spadType

:sub:`Type: Union(SparseUnivariatePolynomial PrimeField 5,...)`



We don't have to restrict ourselves to prime fields.

Let's consider, say, a field with 16 elements.


.. spadInput
::

	GF16 := FFX(FFX(PF 2,2),2);


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



We can apply any of the operations described above.


.. spadInput
::

	createIrreduciblePoly(5)$FFPOLY(GF16)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| ?5+%G   |
+---------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial`
FiniteFieldExtension(FiniteFieldExtension(PrimeField 2,2),2)



FriCAS also provides operations for producing random polynomials of a
given degree


.. spadInput
::

	random(5)$FFPOLY(GF16)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------+
| ?5+(%F%G+1)?4+%F%G?3+(%G+%F+1)?2+((%F+1)%G+%F)?+1   |
+-----------------------------------------------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial`
FiniteFieldExtension(FiniteFieldExtension(PrimeField 2,2),2)



or with degree between two given bounds.


.. spadInput
::

	random(3,9)$FFPOLY(GF16)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| ?3+(%F%G+1)?2+(%G+%F+1)?+1   |
+------------------------------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial`
FiniteFieldExtension(FiniteFieldExtension(PrimeField 2,2),2)



FiniteFieldPolynomialPackage2 (abbreviation FFPOLY2) exports an
operation rootOfIrreduciblePoly for finding one root of an irreducible
polynomial f polynomial:root of in an extension field of the coefficient
field. The degree of the extension has to be a multiple of the degree of
f. It is not checked whether f actually is irreducible.

To illustrate this operation, we fix a ground field GF


.. spadInput
::

	GF2 := PrimeField 2;


.. spadMathAnswer
.. spadType

:sub:`Type: Domain`



and then an extension field.


.. spadInput
::

	F := FFX(GF2,12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| FiniteFieldExtension(PrimeField2,12)   |
+----------------------------------------+




.. spadType

:sub:`Type: Domain`



We construct an irreducible polynomial over GF2.


.. spadInput
::

	f := createIrreduciblePoly(6)$FFPOLY(GF2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| ?6+?+1   |
+----------+




.. spadType

:sub:`Type: SparseUnivariatePolynomial PrimeField 2`



We compute a root of f.


.. spadInput
::

	root := rootOfIrreduciblePoly(f)$FFPOLY2(F,GF2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| %H11+%H8+%H7+%H5+%H+1   |
+-------------------------+




.. spadType

:sub:`Type: FiniteFieldExtension(PrimeField 2,12)`



and check the result


.. spadInput
::

	eval(f, monomial(1,1)$SUP(F) = root)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: SparseUnivariatePolynomial FiniteFieldExtension(PrimeField 2,12)`







