.. status: ok

0.5 General Points about FriCAS
-------------------------------


0.5.1 Computation Without Output
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is sometimes desirable to enter an expression and prevent FriCAS from
displaying the result. To do this the expression should be terminated
with a semicolon ``;``. In a previous section it was mentioned that a set of
expressions separated by semicolons would be evaluated and the result of
the last one displayed. Thus if a single expression is followed by a
semicolon no output will be produced (except for its type):


.. spadInput
::

    2 + 4*5;

.. spadMathAnswer

.. spadType
:sub:`Type: PositiveInteger`


0.5.2 Accessing Earlier Results
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``%`` macro represents the result of the previous computation. The
``%%`` macro is available which takes a single integer argument. If
the argument is positive then it refers to the step number of the
calculation where the numbering begins from one and can be seen at the
end of each prompt (the number in parentheses). If the argument is
negative then it refers to previous results counting backwards from the
last result. That is, ``%%(-1)`` is the same as ``%``. The value of
``%%(0)`` is not defined and will generate an error if requested.



0.5.3 Splitting Expressions Over Several Lines
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Although FriCAS will quite happily accept expressions that are longer
than the width of the screen (just keep typing without pressing the
Return key) it is often preferable to split the expression being entered
at a point where it would result in more readable input. To do this the
underscore ``_`` symbol is placed before the break point and then the
Return key is pressed. The rest of the expression is typed on the next
line, can be preceeded by any number of whitespace chars, for example:


.. spadVerbatim
::

  2_
  +_
  3

.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: PositiveInteger`



The underscore symbol is an escape character and its presence alters the
meaning of the characters that follow it. As mentions above whitespace
following an underscore is ignored (the Return key generates a
whitespace character). Any other character following an underscore loses
whatever special meaning it may have had. Thus one can create the
identifier ``a+b`` by typing ``a_+b`` although this might lead to
confusions. Also note the result of the following example:


.. spadInput
::

    ThisIsAVeryLong_ VariableName


.. spadMathAnswer
.. spadMathOutput
.. math::

  \mathrm{ThisIsAVeryLongVariableName}  

.. spadType
:sub:`Type: Variable ThisIsAVeryLongVariableName`



0.5.4 Comments and Descriptions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Comments and descriptions are really only of use in files of FriCAS code
but can be used when the output of an interactive session is being
spooled to a file (via the system command ``)spool``). A comment begins with
two dashes ``--`` and continues until the end of the line. Multi-line
comments are only possible if each individual line begins with two
dashes.

Descriptions are the same as comments except that the FriCAS compiler
will include them in the object files produced and make them availabe to
the end user for documentation purposes.

A description is placed before a calculation begins with three ``+++``
signs and a description placed after a calculation begins with two plus
symbols ``+``. The so-called plus plus comments are used within the
algebra files and are processed by the compiler to add to the
documentation. The so-called minus minus comments are ignored
everywhere.





0.5.5 Control of Result Types
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In earlier sections the type of an expression was converted to another
via the ``::`` operator. However, this is not the only method for
converting between types and two other operators need to be introduced
and explained.

The first operator is ``$`` and is used to specify the package to be
used to calculate the result. Thus:


.. spadInput
::

    (2/3)$Float

.. spadMathAnswer
.. spadMathOutput
.. math::

  0.66666666666666666667

.. spadType
:sub:`Type: Float`


tells FriCAS to use the ``/`` operator from the Float package to evaluate
the expression 2/3. This does not necessarily mean that the result will
be of the same type as the domain from which the operator was taken. In
the following example the sign operator is taken from the Float package
but the result is of type Integer.


.. spadInput
::

    sign(2.3)$Float

.. spadMathAnswer
.. spadMathOutput
.. math::

  1
 
.. spadType
:sub:`Type: Integer`


The other operator is ``@`` which is used to tell FriCAS what the
desired type of the result of the calculation is. In most situations all
three operators yield the same results but the example below should help
distinguish them.


.. spadInput
::

    (2 + 3)::String

.. spadMathAnswer
.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: String`




.. spadInput
::

    (2 + 3)@String

.. spadMathAnswer
.. spadVerbatim
.. warning::

    An expression involving @ String actually evaluated to one of 
    type PositiveInteger . Perhaps you should use :: String .




.. spadInput
::

    (2 + 3)$String


.. spadMathAnswer
.. spadVerbatim
.. error::

   The function + is not implemented in String .


If an expression X is converted using one of the three operators to type
T the interpretations are:::

 :: means explicitly convert X to type T if possible.

 $ means use the available operators for type T to compute X.

 @ means choose operators to compute X so that the result is of type T.

