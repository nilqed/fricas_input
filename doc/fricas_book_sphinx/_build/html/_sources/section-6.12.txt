.. status: ok



6.12 Caching Previously Computed Results
----------------------------------------

By default, FriCAS does not save the values of any function.
function:caching values You can cause it to save values and not to
recompute unnecessarily remembering function values by using )set
functions cache. set functions cache This should be used before the
functions are defined or, at least, before they are executed. The word
following cache should be 0 to turn off caching, a positive integer n to
save the last n computed values or all to save all computed values. If
you then give a list of names of functions, the caching only affects
those functions. Use no list of names or all when you want to define the
default behavior for functions not specifically mentioned in other )set
functions cache statements. If you give no list of names, all functions
will have the caching behavior. If you explicitly turn on caching for
one or more names, you must explicitly turn off caching for those names
when you want to stop saving their values.

This causes the functions f and g to have the last three computed values
saved.


.. spadInput
::

	)set functions cache 3 f g


.. spadMathAnswer
.. spadVerbatim

::

    function f will cache the last 3 values.
    function g will cache the last 3 values.



This is a sample definition for f.


.. spadInput
::

	f x == factorial(2^x)


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



A message is displayed stating what f will cache.


.. spadInput
::

	f(4)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function f with type PositiveInteger -> Integer 
    f will cache 3 most recently computed value(s).
 +++ |*1;f;1;G82322| redefined




.. spadMathOutput
.. math::

+------------------+
| 20922789888000   |
+------------------+




.. spadType

:sub:`Type: PositiveInteger`



This causes all other functions to have all computed values saved by
default.


.. spadInput
::

	)set functions cache all


.. spadMathAnswer
.. spadVerbatim

::

    In general, interpreter functions will cache all values.



This causes all functions that have not been specifically cached in some
way to have no computed values saved.


.. spadInput
::

	)set functions cache 0


.. spadMathAnswer
.. spadVerbatim

::

  In general, functions will cache no returned values.



We also make f and g uncached.


.. spadInput
::

	)set functions cache 0 f g


.. spadMathAnswer
.. spadVerbatim

::

    Caching for function f is turned off
    Caching for function g is turned off







| Be careful about caching functions that have side effects. Such a
function might destructively modify the elements of an array or issue a
draw command, for example. A function that you expect to execute every
time it is called should not be cached. Also, it is highly unlikely that
a function with no arguments should be cached.





You should also be careful about caching functions that depend on free
variables. See `ugUserFreeLocal <section-6.16.html#ugUserFreeLocal>`__
for an example.



