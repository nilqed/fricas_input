.. status: ok


2.6 The Any Domain
------------------

With the exception of objects of type Record, all FriCAS data structures
are homogenous, that is, they hold objects all of the same type. If
you need to get around this, you can use type ``Any``. Using Any, for
example, you can create lists whose elements are integers, rational
numbers, strings, and even other lists.

Declare u to have type Any.

.. spadInput
::

	u: Any


.. spadMathAnswer
.. spadType
:sub:`Type: Void`


Assign a list of mixed type values to u


.. spadInput
::

	u := [1, 7.2, 3/2, x^2, "wally"]


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{[1,7.2,32,x2,"wally"]}   

.. spadType
:sub:`Type: List Any`



When we ask for the elements, FriCAS displays these types.


.. spadInput
::

	u.1


.. spadMathAnswer
.. spadMathOutput
.. math::

  1

.. spadType
:sub:`Type: PositiveInteger`



Actually, these objects belong to Any but FriCAS automatically converts
them to their natural types for you.


.. spadInput
::

	u.3


.. spadMathAnswer
.. spadMathOutput
.. math::

   \frac{3}{2}

.. spadType
:sub:`Type: Fraction Integer`



Since type Any can be anything, it can only belong to type ``Type``.
Therefore it **cannot** be used in algebraic domains.


.. spadInput
::

	v : Matrix(Any)


.. spadMathAnswer
.. spadVerbatim

.. warning::

    Matrix Any is not a valid type.



Perhaps you are wondering how FriCAS internally represents objects of
type ``Any``. An object of type ``Any`` consists not only of a data part
representing its normal value, but also a type part (a badge) giving
badge its type. For example, the value 1 of type PositiveInteger as an
object of type Any internally looks like [1,PositiveInteger()].

When should you use Any instead of a Union type? For a Union, you must
know in advance exactly which types you are going to allow. For Any,
anything that comes along can be accommodated.


