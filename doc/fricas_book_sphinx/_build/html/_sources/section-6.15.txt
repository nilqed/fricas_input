.. status: ok



6.15 Functions Defined with Blocks
----------------------------------

You need not restrict yourself to functions that only fit on one line or
are written in a piece-wise manner. The body of the function can be a
block, as discussed in `ugLangBlocks <section-5.2.html#ugLangBlocks>`__
.

Here is a short function that swaps two elements of a list, array or
vector.


.. spadVerbatim

::

 swap(m,i,j) ==
   temp := m.i
   m.i := m.j
   m.j := temp




.. spadType

:sub:`Type: Void`



The significance of swap is that it has a destructive effect on its
first argument.


.. spadInput
::

	k := [1,2,3,4,5]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [1,2,3,4,5]   |
+---------------+




.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	swap(k,2,4)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function swap with type (List PositiveInteger,
       PositiveInteger,PositiveInteger) -> PositiveInteger 




.. spadMathOutput
.. math::

+-----+
| 2   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



You see that the second and fourth elements are interchanged.


.. spadInput
::

	k


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| [1,4,3,2,5]   |
+---------------+




.. spadType

:sub:`Type: List PositiveInteger`



Using this, we write a couple of different sort functions. First, a
simple bubble sort. sort:bubble The operation # returns the number of
elements in an aggregate.


.. spadVerbatim

::

 bubbleSort(m) ==
   n := #m
   for i in 1..(n-1) repeat
     for j in n..(i+1) by -1 repeat
       if m.j < m.(j-1) then swap(m,j,j-1)
   m




.. spadType

:sub:`Type: Void`



Let this be the list we want to sort.


.. spadInput
::

	m := [8,4,-3,9]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [8,4,-3,9]   |
+--------------+




.. spadType

:sub:`Type: List Integer`



This is the result of sorting.


.. spadInput
::

	bubbleSort(m)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function swap with type (List Integer,Integer,Integer) -> 
       Integer 
 +++ |*3;swap;1;G82322| redefined
    Compiling function bubbleSort with type List Integer -> List Integer




.. spadMathOutput
.. math::

+--------------+
| [-3,4,8,9]   |
+--------------+




.. spadType

:sub:`Type: List Integer`



Moreover, m is destructively changed to be the sorted version.


.. spadInput
::

	m


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [-3,4,8,9]   |
+--------------+




.. spadType

:sub:`Type: List Integer`



This function implements an insertion sort. sort:insertion The basic
idea is to traverse the list and insert the i-th element in its correct
position among the i-1 previous elements. Since we start at the
beginning of the list, the list elements before the i-th element have
already been placed in ascending order.


.. spadVerbatim

::

 insertionSort(m) ==
   for i in 2..#m repeat
     j := i
     while j > 1 and m.j < m.(j-1) repeat
       swap(m,j,j-1)
       j := j - 1
   m




.. spadType

:sub:`Type: Void`



As with our bubble sort, this is a destructive function.


.. spadInput
::

	m := [8,4,-3,9]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [8,4,-3,9]   |
+--------------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	insertionSort(m)


.. spadMathAnswer
.. spadVerbatim

::

    Compiling function insertionSort with type List Integer -> List 
       Integer 




.. spadMathOutput
.. math::

+--------------+
| [-3,4,8,9]   |
+--------------+




.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	m


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------+
| [-3,4,8,9]   |
+--------------+




.. spadType

:sub:`Type: List Integer`



Neither of the above functions is efficient for sorting large lists
since they reference elements by asking for the j-th element of the
structure m.

Here is a more efficient bubble sort for lists.


.. spadVerbatim

::

 bubbleSort2(m: List Integer): List Integer ==
   null m => m
   l := m
   while not null (r := l.rest) repeat
      r := bubbleSort2 r
      x := l.first
      if x < r.first then
        l.first := r.first
        r.first := x
      l.rest := r
      l := l.rest
   m
    Function declaration bubbleSort2 : List Integer -> List Integer has 
       been added to workspace.




.. spadType

:sub:`Type: Void`



Try it out.


.. spadInput
::

	bubbleSort2 [3,7,2]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [7,3,2]   |
+-----------+




.. spadType

:sub:`Type: List Integer`



This definition is both recursive and iterative, and is tricky! Unless
you are really curious about this definition, we suggest you skip
immediately to the next section.

Here are the key points in the definition. First notice that if you are
sorting a list with less than two elements, there is nothing to do: just
return the list. This definition returns immediately if there are zero
elements, and skips the entire while loop if there is just one element.

The second point to realize is that on each outer iteration, the bubble
sort ensures that the minimum element is propagated leftmost. Each
iteration of the while loop calls bubbleSort2 recursively to sort all
but the first element. When finished, the minimum element is either in
the first or second position. The conditional expression ensures that it
comes first. If it is in the second, then a swap occurs. In any case,
the rest of the original list must be updated to hold the result of the
recursive call.



