.. status: ok


5.3 if-then-else
----------------

Like many other programming languages, FriCAS uses the three keywords if
if, then then and else else to form conditional conditional expressions.
The else part of the conditional is optional. The expression between the
if and then keywords is a predicate: an expression that evaluates to or
is convertible to either true or false, that is, a Boolean. Boolean





The syntax for conditional expressions is



if predicate then  expression1 else  expression2



| where the else expression2 part is optional. The value returned from a
conditional expression is expression1 if the predicate evaluates to true
and expression2 otherwise. If no else clause is given, the value is
always the unique value of Void.





An if-then-else expression always returns a value. If the else clause is
missing then the entire expression returns the unique value of Void. If
both clauses are present, the type of the value returned by if is
obtained by resolving the types of the values of the two clauses. See
`ugTypesResolve <section-2.10.html#ugTypesResolve>`__ for more
information.

The predicate must evaluate to, or be convertible to, an object of type
Boolean: true or false. By default, the equal sign = creates equation an
equation.

This is an equation. Equation In particular, it is an object of type
Equation Polynomial Integer.


.. spadInput
::

	x + 1 = y


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| x+1=y   |
+---------+




.. spadType

:sub:`Type: Equation Polynomial Integer`



However, for predicates in if expressions, FriCAS equality testing
places a default target type of Boolean on the predicate and equality
testing is performed. Boolean Thus you need not qualify the = in any
way. In other contexts you may need to tell FriCAS that you want to test
for equality rather than create an equation. In those cases, use ``@``
and a target type of Boolean. See section
`ugTypesPkgCall <section-2.9.html#ugTypesPkgCall>`__ for more
information.

The compound symbol meaning not equal in FriCAS is inequality testing
``∼=``. _notequal@ ∼= This can be used directly without a package
call or a target specification. The expression a∼=b is directly
translated into not (a=b).

Many other functions have return values of type Boolean. These include
<, <=, >, >=, ``∼=`` and ``member?``. By convention, operations with
names ending in ? return Boolean values.

The usual rules for piles are suspended for conditional expressions. In
.input files, the then and else keywords can begin in the same column as
the corresponding if but may also appear to the right. Each of the
following styles of writing if-then-else expressions is acceptable:


.. spadVerbatim

::

 if i>0 then output("positive") else output("nonpositive")
 if i > 0 then output("positive")
   else output("nonpositive")
 if i > 0 then output("positive")
 else output("nonpositive")
 if i > 0
 then output("positive")
 else output("nonpositive")
 if i > 0
   then output("positive")
   else output("nonpositive")



A block can follow the then or else keywords. In the following two
assignments to a, the then and else clauses each are followed by
two-line piles. The value returned in each is the value of the second
line.


.. spadVerbatim

::

 a :=
   if i > 0 then
     j := sin(i * pi())
     exp(j + 1/j)
   else
     j := cos(i * 0.5 * pi())
     log(abs(j)^5 + 1)
 a :=
   if i > 0
     then
       j := sin(i * pi())
       exp(j + 1/j)
     else
       j := cos(i * 0.5 * pi())
       log(abs(j)^5 + 1)



These are both equivalent to the following:


.. spadVerbatim

::

 a :=
   if i > 0 then (j := sin(i * pi()); exp(j + 1/j))
   else (j := cos(i * 0.5 * pi()); log(abs(j)^5 + 1))





