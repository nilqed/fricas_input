.. status: ok


9.54 MultivariatePolynomial
---------------------------

The domain constructor MultivariatePolynomial is similar to Polynomial
except that it specifies the variables to be used. Polynomial are
available for MultivariatePolynomial. The abbreviation for
MultivariatePolynomial is MPOLY. The type expressions



MultivariatePolynomial([x,y],Integer)



and



MPOLY([x,y],INT)



refer to the domain of multivariate polynomials in the variables x and y
where the coefficients are restricted to be integers. The first variable
specified is the main variable and the display of the polynomial
reflects this.

This polynomial appears with terms in descending powers of the variable
x.


.. spadInput
::

	m : MPOLY([x,y],INT) := (x^2 - x*y^3 +3*y)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| x4-2y3x3+(y6+6y)x2-6y4x+9y2   |
+-------------------------------+




.. spadType

:sub:`Type: MultivariatePolynomial([x,y],Integer)`



It is easy to see a different variable ordering by doing a conversion.


.. spadInput
::

	m :: MPOLY([y,x],INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| x2y6-6xy4-2x3y3+9y2+6x2y+x4   |
+-------------------------------+




.. spadType

:sub:`Type: MultivariatePolynomial([y,x],Integer)`



You can use other, unspecified variables, by using Polynomial in the
coefficient type of MPOLY.


.. spadInput
::

	p : MPOLY([x,y],POLY INT)


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	p := (a^2*x - b*y^2 + 1)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| a4x2+(-2a2by2+2a2)x+b2y4-2by2+1   |
+-----------------------------------+




.. spadType

:sub:`Type: MultivariatePolynomial([x,y],Polynomial Integer)`



Conversions can be used to re-express such polynomials in terms of the
other variables. For example, you can first push all the variables into
a polynomial with integer coefficients.


.. spadInput
::

	p :: POLY INT


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| b2y4+(-2a2bx-2b)y2+a4x2+2a2x+1   |
+----------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`



Now pull out the variables of interest.


.. spadInput
::

	% :: MPOLY([a,b],POLY INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------+
| x2a4+(-2xy2b+2x)a2+y4b2-2y2b+1   |
+----------------------------------+




.. spadType

:sub:`Type: MultivariatePolynomial([a,b],Polynomial Integer)`







 Restriction:



FriCAS does not allow you to create types where MultivariatePolynomial
is contained in the coefficient type of Polynomial. Therefore,
MPOLY([x,y],POLY INT) is legal but POLY MPOLY([x,y],INT) is not.



.





Multivariate polynomials may be combined with univariate polynomials to
create types with special structures.


.. spadInput
::

	q : UP(x, FRAC MPOLY([y,z],INT))


.. spadMathAnswer
.. spadType

Void



This is a polynomial in x whose coefficients are quotients of
polynomials in y and z.


.. spadInput
::

	q := (x^2 - x*(z+1)/y +2)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| x4+-2z-2yx3+4y2+z2+2z+1y2x2+-4z-4yx+4   |
+-----------------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(x,Fraction`
MultivariatePolynomial([y,z],Integer))



Use conversions for structural rearrangements. z does not appear in a
denominator and so it can be made the main variable.


.. spadInput
::

	q :: UP(z, FRAC MPOLY([x,y],INT))


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| x2y2z2+-2yx3+2x2-4yxy2z+y2x4-2yx3+(4y2+1)x2-4yx+4y2y2   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: UnivariatePolynomial(z,Fraction`
MultivariatePolynomial([x,y],Integer))



Or you can make a multivariate polynomial in x and z whose coefficients
are fractions in polynomials in y.


.. spadInput
::

	q :: MPOLY([x,z], FRAC UP(y,INT))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| x4+(-2yz-2y)x3+(1y2z2+2y2z+4y2+1y2)x2+(-4yz-4y)x+4   |
+------------------------------------------------------+




.. spadType

:sub:`Type: MultivariatePolynomial([x,z],Fraction`
UnivariatePolynomial(y,Integer))



A conversion like q :: MPOLY([x,y], FRAC UP(z,INT)) is not possible in
this example because y appears in the denominator of a fraction. As you
can see, FriCAS provides extraordinary flexibility in the manipulation
and display of expressions via its conversion facility.

For more information on related topics, see
`PolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
,
`UnivariatePolynomialXmpPage <section-9.83.html#UnivariatePolynomialXmpPage>`__
, and
`DistributedMultivariatePolynomialXmpPage <section-9.16.html#DistributedMultivariatePolynomialXmpPage>`__
.



