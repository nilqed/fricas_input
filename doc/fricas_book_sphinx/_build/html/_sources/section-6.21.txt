.. status: ok


6.21 Rules and Pattern Matching
-------------------------------

A common mathematical formula is log(y)+log(x)=log(xy)∀xandy The
presence of ``∀`` indicates that x and y can stand for arbitrary
mathematical expressions in the above formula. You can use such
mathematical formulas in FriCAS to specify rewrite rules. Rewrite rules
are objects in FriCAS that can be assigned to variables for later use,
often for the purpose of simplification. Rewrite rules look like
ordinary function definitions except that they are preceded by the
reserved word rule. rule For example, a rewrite rule for the above
formula is:


.. spadVerbatim

::

 rule log(x) + log(y) == log(x * y)



Like function definitions, no action is taken when a rewrite rule is
issued. Think of rewrite rules as functions that take one argument. When
a rewrite rule A=B is applied to an argument f, its meaning is: rewrite
every subexpression of f that matches A by B. The left-hand side of a
rewrite rule is called a pattern; its right-side side is called its
substitution.

Create a rewrite rule named logrule. The generated symbol beginning with
a ``%`` is a place-holder for any other terms that might occur in the
sum.


.. spadInput
::

	logrule := rule log(x) + log(y) == log(x * y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| log(y)+log(x)+%C==log(xy)+%C   |
+--------------------------------+




.. spadType

:sub:`Type: RewriteRule(Integer,Integer,Expression Integer)`



Create an expression with logarithms.


.. spadInput
::

	f := log sin x + log x


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| log(sin(x))+log(x)   |
+----------------------+




.. spadType

:sub:`Type: Expression Integer`



Apply logrule to f.


.. spadInput
::

	logrule f


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| log(xsin(x))   |
+----------------+




.. spadType

:sub:`Type: Expression Integer`



The meaning of our example rewrite rule is: ``for all expressions x
and y, rewrite log(x)+log(y) by log(x*y).`` Patterns generally have
both operation names (here, log and ``+``) and variables (here, x and
y). By default, every operation name stands for itself. Thus log matches
only log and not any other operation such as sin. On the other hand,
variables do not stand for themselves. Rather, a variable denotes a
pattern variable that is free to match any expression whatsoever.
pattern:variables

When a rewrite rule is applied, a process called pattern matching goes
to work by systematically scanning pattern:matching the subexpressions
of the argument. When a subexpression is found that matches the pattern,
the subexpression is replaced by the right-hand side of the rule. The
details of what happens will be covered later.

The customary FriCAS notation for patterns is actually a shorthand for a
longer, more general notation. Pattern variables can be made explicit by
using a percent ``%`` as the first character of the variable name. To
say that a name stands for itself, you can prefix that name with a quote
operator ````'. Although the current FriCAS parser does not let you
quote an operation name, this more general notation gives you an
alternate way of giving the same rewrite rule:


.. spadVerbatim

::

 rule log(%x) + log(%y) == log(x * y)



This longer notation gives you patterns that the standard notation won't
handle. For example, the rule


.. spadVerbatim

::

 rule %f(c * 'x) ==  c*%f(x)



means for all f and c, replace f(y) by c*f(x) when y is the product of
c and the explicit variable x.

Thus the pattern can have several adornments on the names that appear
there. Normally, all these adornments are dropped in the substitution on
the right-hand side.

To summarize:





To enter a single rule in FriCAS, use the following syntax: rule



rule leftHandSide == rightHandSide



| The leftHandSide is a pattern to be matched and the rightHandSide is
its substitution. The rule is an object of type RewriteRule that can be
assigned to a variable and applied to expressions to transform them.





Rewrite rules can be collected into rulesets so that a set of rules can
be applied at once. Here is another simplification rule for logarithms.
y⁢log(x)=log(xy)∀xandy If instead of giving a single rule following the
reserved word rule you give a pile of rules, you create what is called a
ruleset. ruleset Like rules, rulesets are objects in FriCAS and can be
assigned to variables. You will find it useful to group commonly used
rules into input files, and read them in as needed.

Create a ruleset named logrules.


.. spadVerbatim

::

 logrules := rule
   log(x) + log(y) == log(x * y)
   y * log x       == log(x ^ y)




.. spadMathOutput
.. math::

+---------------------------------------------------+
| {log(y)+log(x)+%B==log(xy)+%B,ylog(x)==log(xy)}   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Ruleset(Integer,Integer,Expression Integer)`



Again, create an expression f containing logarithms.


.. spadInput
::

	f := a * log(sin x) - 2 * log x


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| alog(sin(x))-2log(x)   |
+------------------------+




.. spadType

:sub:`Type: Expression Integer`



Apply the ruleset logrules to f.


.. spadInput
::

	logrules f


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| log(sin(x)ax2)   |
+------------------+




.. spadType

:sub:`Type: Expression Integer`



We have allowed pattern variables to match arbitrary expressions in the
above examples. Often you want a variable only to match expressions
satisfying some predicate. For example, we may want to apply the
transformation ylog(x)=log(xy) only when y is an integer.

The way to restrict a pattern variable y by a predicate f(y)
pattern:variable:predicate is by using a vertical bar ``|``, which
means such that, in such that much the same way it is used in function
definitions. predicate:on a pattern variable You do this only once, but
at the earliest (meaning deepest and leftmost) part of the pattern.

This restricts the logarithmic rule to create integer exponents only.


.. spadVerbatim

::

 logrules2 := rule
   log(x) + log(y)          == log(x * y)
   (y | integer? y) * log x == log(x ^ y)




.. spadMathOutput
.. math::

+---------------------------------------------------+
| {log(y)+log(x)+%D==log(xy)+%D,ylog(x)==log(xy)}   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Ruleset(Integer,Integer,Expression Integer)`



Compare this with the result of applying the previous set of rules.


.. spadInput
::

	f


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| alog(sin(x))-2log(x)   |
+------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	logrules2 f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------+
| alog(sin(x))+log(1x2)   |
+-------------------------+




.. spadType

:sub:`Type: Expression Integer`



You should be aware that you might need to apply a function like integer
within your predicate expression to actually apply the test function.

Here we use integer because n has type Expression Integer but even? is
an operation defined on integers.


.. spadInput
::

	evenRule := rule cos(x)^(n | integer? n and even? integer
n)==(1-sin(x)^2)^(n/2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| cos(x)n==(-sin(x)2+1)n2   |
+---------------------------+




.. spadType

:sub:`Type: RewriteRule(Integer,Integer,Expression Integer)`



Here is the application of the rule.


.. spadInput
::

	evenRule( cos(x)^2 )


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| -sin(x)2+1   |
+--------------+




.. spadType

:sub:`Type: Expression Integer`



This is an example of some of the usual identities involving products of
sines and cosines.


.. spadVerbatim

::

 sinCosProducts == rule
   sin(x) * sin(y) == (cos(x-y) - cos(x + y))/2
   cos(x) * cos(y) == (cos(x-y) + cos(x+y))/2
   sin(x) * cos(y) == (sin(x-y) + sin(x + y))/2




.. spadType

:sub:`Type: Void`




.. spadInput
::

	g := sin(a)*sin(b) + cos(b)*cos(a) + sin(2*a)*cos(2*a)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------+
| sin(a)sin(b)+cos(2a)sin(2a)+cos(a)cos(b)   |
+--------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	sinCosProducts g


.. spadMathAnswer
.. spadVerbatim

::

    Compiling body of rule sinCosProducts to compute value of type 
       Ruleset(Integer,Integer,Expression Integer) 




.. spadMathOutput
.. math::

+----------------------+
| sin(4a)+2cos(b-a)2   |
+----------------------+




.. spadType

:sub:`Type: Expression Integer`



Another qualification you will often want to use is to allow a pattern
to match an identity element. Using the pattern x+y, for example,
neither x nor y matches the expression 0. Similarly, if a pattern
contains a product x*y or an exponentiation x**y, then neither x or y
matches 1.

If identical elements were matched, pattern matching would generally
loop. Here is an expansion rule for exponentials.


.. spadInput
::

	exprule := rule exp(a + b) == exp(a) * exp(b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| e(b+a)==eaeb   |
+----------------+




.. spadType

:sub:`Type: RewriteRule(Integer,Integer,Expression Integer)`



This rule would cause infinite rewriting on this if either a or b were
allowed to match 0.


.. spadInput
::

	exprule exp x


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| ex   |
+------+




.. spadType

:sub:`Type: Expression Integer`



There are occasions when you do want a pattern variable in a sum or
product to match 0 or 1. If so, prefix its name with a ? whenever it
appears in a left-hand side of a rule. For example, consider the
following rule for the exponential integral: This rule is valid for y=0.
One solution is to create a Ruleset with two rules, one with and one
without y. A better solution is to use an optional pattern variable.

Define rule eirule with a pattern variable to indicate that an
expression may or may not occur.


.. spadInput
::

	eirule := rule integral((?y + exp x)/x,x) == integral(y/x,x) + Ei x


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------+
| ∫xe%M+y%Md%M=='integral(yx,x)+'Ei(x)   |
+----------------------------------------+




.. spadType

:sub:`Type: RewriteRule(Integer,Integer,Expression Integer)`



Apply rule eirule to an integral without this term.


.. spadInput
::

	eirule integral(exp u/u, u)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| Ei(u)   |
+---------+




.. spadType

:sub:`Type: Expression Integer`



Apply rule eirule to an integral with this term.


.. spadInput
::

	eirule integral(sin u + exp u/u, u)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| ∫usin(%M)d%M+Ei(u)   |
+----------------------+




.. spadType

:sub:`Type: Expression Integer`



Here is one final adornment you will find useful. When matching a
pattern of the form x+y to an expression containing a long sum of the
form a+…+b, there is no way to predict in advance which subset of the
sum matches x and which matches y. Aside from efficiency, this is
generally unimportant since the rule holds for any possible combination
of matches for x and y. In some situations, however, you may want to say
which pattern variable is a sum (or product) of several terms, and which
should match only a single term. To do this, put a prefix colon ``:``
before the pattern variable that you want to match multiple terms.
pattern:variable:matching several terms

The remaining rules involve operators u and v. operator


.. spadInput
::

	u := operator 'u


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| u   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



These definitions tell FriCAS that u and v are formal operators to be
used in expressions.


.. spadInput
::

	v := operator 'v


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| v   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



First define myRule with no restrictions on the pattern variables x and
y.


.. spadInput
::

	myRule := rule u(x + y) == u x + v y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| u(y+x)=='v(y)+'u(x)   |
+-----------------------+




.. spadType

:sub:`Type: RewriteRule(Integer,Integer,Expression Integer)`



Apply myRule to an expression.


.. spadInput
::

	myRule u(a + b + c + d)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------+
| v(d+c+b)+u(a)   |
+-----------------+




.. spadType

:sub:`Type: Expression Integer`



Define myOtherRule to match several terms so that the rule gets applied
recursively.


.. spadInput
::

	myOtherRule := rule u(:x + y) == u x + v y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| u(y+x)=='v(y)+'u(x)   |
+-----------------------+




.. spadType

:sub:`Type: RewriteRule(Integer,Integer,Expression Integer)`



Apply myOtherRule to the same expression.


.. spadInput
::

	myOtherRule u(a + b + c + d)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------+
| v(c)+v(b)+v(a)+u(d)   |
+-----------------------+




.. spadType

:sub:`Type: Expression Integer`







Summary of pattern variable adornments:

+------------------------+-------------------------------------------------------------------------+
| (x | predicate?(x))   | means that the substutution s for x must satisfy predicate(s) = true.   |
+------------------------+-------------------------------------------------------------------------+
| ?x                     | means that x can match an identity element (0 or 1).                    |
+------------------------+-------------------------------------------------------------------------+
| :x                     | means that x can match several terms in a sum.                          |
+------------------------+-------------------------------------------------------------------------+





Here are some final remarks on pattern matching. Pattern matching
provides a very useful paradigm for solving certain classes of problems,
namely, those that involve transformations of one form to another and
back. However, it is important to recognize its limitations.
pattern:matching:caveats

First, pattern matching slows down as the number of rules you have to
apply increases. Thus it is good practice to organize the sets of rules
you use optimally so that irrelevant rules are never included.

Second, careless use of pattern matching can lead to wrong answers. You
should avoid using pattern matching to handle hidden algebraic
relationships that can go undetected by other programs. As a simple
example, a symbol such as J can easily be used to represent the square
root of -1 or some other important algebraic quantity. Many algorithms
branch on whether an expression is zero or not, then divide by that
expression if it is not. If you fail to simplify an expression involving
powers of J to -1, algorithms may incorrectly assume an expression is
non-zero, take a wrong branch, and produce a meaningless result.

Pattern matching should also not be used as a substitute for a domain.
In FriCAS, objects of one domain are transformed to objects of other
domains using well-defined coerce operations. Pattern matching should be
used on objects that are all the same type. Thus if your application can
be handled by type Expression in FriCAS and you think you need pattern
matching, consider this choice carefully. Expression You may well be
better served by extending an existing domain or by building a new
domain of objects for your application.



