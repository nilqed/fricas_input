.. status: ok



6.18 Example: A Database
------------------------

This example shows how you can use FriCAS to organize a database of
lineage data and then query the database for relationships.

The database is entered as assertions that are really pieces of a
function definition.


.. spadInput
::

	children("albert") == ["albertJr","richard","diane"]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Each piece children(x)==y means the children of x are y.


.. spadInput
::

	children("richard") == ["douglas","daniel","susan"]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



This family tree thus spans four generations.


.. spadInput
::

	children("douglas") == ["dougie","valerie"]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Say no one else has children.


.. spadInput
::

	children(x) == []


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



We need some functions for computing lineage. Start with childOf.


.. spadInput
::

	childOf(x,y) == member?(x,children(y))


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



To find the parentOf someone, you have to scan the database of people
applying children.


.. spadVerbatim

::

 parentOf(x) ==
   for y in people repeat
     (if childOf(x,y) then return y)
   "unknown"




.. spadType

:sub:`Type: Void`



And a grandparent of x is just a parent of a parent of x.


.. spadInput
::

	grandParentOf(x) == parentOf parentOf x


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



The grandchildren of x are the people y such that x is a grandparent of
y.


.. spadInput
::

	grandchildren(x) == [y for y in people | grandParentOf(y) = x]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



Suppose you want to make a list of all great-grandparents. Well, a
great-grandparent is a grandparent of a person who has children.


.. spadVerbatim

::

 greatGrandParents == [x for x in people |
   reduce(_or,
     [not empty? children(y) for y in grandchildren(x)],false)]




.. spadType

:sub:`Type: Void`



Define descendants to include the parent as well.


.. spadVerbatim

::

 descendants(x) ==
   kids := children(x)
   null kids => [x]
   concat(x,reduce(concat,[descendants(y)
     for y in kids],[]))




.. spadType

:sub:`Type: Void`



Finally, we need a list of people. Since all people are descendants of
albert, let's say so.


.. spadInput
::

	people == descendants "albert"


.. spadMathAnswer
.. spadType

:sub:`Type: Void`



We have used == to define the database and some functions to query the
database. But no computation is done until we ask for some information.
Then, once and for all, the functions are analyzed and compiled to
machine code for run-time efficiency. Notice that no types are given
anywhere in this example. They are not needed.

Who are the grandchildren of richard?


.. spadInput
::

	grandchildren "richard"


.. spadMathAnswer
.. spadVerbatim

::

 Compiling function children with type String -> List String 
 Compiling function descendants with type String -> List String 
 Compiling body of rule people to compute value of type List String 
 Compiling function childOf with type (String,String) -> Boolean 
 Compiling function parentOf with type String -> String 
 Compiling function grandParentOf with type String -> String 
 Compiling function grandchildren with type String -> List String 




.. spadMathOutput
.. math::

+------------------------+
| ["dougie","valerie"]   |
+------------------------+




.. spadType

:sub:`Type: List String`



Who are the great-grandparents?


.. spadInput
::

	greatGrandParents


.. spadMathAnswer
.. spadVerbatim

::

 Compiling body of rule greatGrandParents to compute value of 
    type List String 




.. spadMathOutput
.. math::

+--------------+
| ["albert"]   |
+--------------+




.. spadType

:sub:`Type: List String`





