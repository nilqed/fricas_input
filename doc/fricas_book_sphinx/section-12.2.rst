.. status: ok


12.2 Exports
------------

To the right of the with is a list of with all the exports of the
category. Each exported operation has a name and a type expressed by a
declaration of the form ``name: type``.

Categories can export symbols, as well as 0 and 1 which denote domain
constants.The numbers 0 and 1 are operation names in FriCAS. In the
current implementation, all other exports are operations with types
expressed as mappings with the syntax



source ->  target



The category SetCategory has a single export: the operation = whose type
is given by the mapping ($, $) -> Boolean. The $ in a mapping type
always means the domain. Thus the operation = takes two arguments from
the domain and returns a value of type Boolean.

The source part of the mapping here is given by a tuple tuple consisting
of two or more types separated by commas and enclosed in parentheses. If
an operation takes only one argument, you can drop the parentheses
around the source type. If the mapping has no arguments, the source part
of the mapping is either left blank or written as (). Here are examples
of formats of various operations with some contrived names.


.. spadVerbatim

::

 someIntegerConstant  :    $
 aZeroArgumentOperation:   () -> Integer
 aOneArgumentOperation:    Integer -> $
 aTwoArgumentOperation:    (Integer,$) -> Void
 aThreeArgumentOperation:  ($,Integer,$) -> Fraction($)





