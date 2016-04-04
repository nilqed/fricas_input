.. status: ok


8.7 Laplace Transforms
----------------------

FriCAS can compute some forward Laplace transforms, mostly Laplace
transform of elementary function:elementary functions transform:Laplace
not involving logarithms, although some cases of special functions are
handled.

To compute the forward Laplace transform of F(t) with respect to t and
express the result as f(s), issue the command laplace(F(t),t,s).


.. spadInput
::

	laplace(sin(a*t)*cosh(a*t)-cos(a*t)*sinh(a*t), t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 4a3s4+4a4   |
+-------------+




.. spadType

:sub:`Type: Expression Integer`



Here are some other non-trivial examples.


.. spadInput
::

	laplace((exp(a*t) - exp(b*t))/t, t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| -log(s-a)+log(s-b)   |
+----------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	laplace(2/t * (1 - cos(a*t)), t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| log(s2+a2)-2log(s)   |
+----------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	laplace(exp(-a*t) * sin(b*t) / b^2, t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| 1bs2+2abs+b3+a2b   |
+--------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	laplace((cos(a*t) - cos(b*t))/t, t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| log(s2+b2)-log(s2+a2)2   |
+--------------------------+




.. spadType

:sub:`Type: Expression Integer`



FriCAS also knows about a few special functions.


.. spadInput
::

	laplace(exp(a*t+b)*Ei(c*t), t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| eblog(s+c-ac)s-a   |
+--------------------+




.. spadType

:sub:`Type: Expression Integer`




.. spadInput
::

	laplace(a*Ci(b*t) + c*Si(d*t), t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| alog(s2+b2b2)+2carctan(ds)2s   |
+--------------------------------+




.. spadType

:sub:`Type: Expression Integer`



When FriCAS does not know about a particular transform, it keeps it as a
formal transform in the answer.


.. spadInput
::

	laplace(sin(a*t) - a*t*cos(a*t) + exp(t^2), t, s)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| (s4+2a2s2+a4)laplace(et2,t,s)+2a3s4+2a2s2+a4   |
+------------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`





