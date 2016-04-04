.. status: ok


11.10 How Packages Work
-----------------------

Recall that packages as abstract datatypes are compiled independently
and put into the library. The curious reader may ask: ``How is the
interpreter able to find an operation such as bubbleSort!? Also, how is
a single compiled function such as bubbleSort! able to sort data of
different types?``

After the interpreter loads the package SortPackage, the four operations
from the package become known to the interpreter. Each of these
operations is expressed as a modemap in which the type modemap of the
operation is written in terms of symbolic domains.

See the modemaps for bubbleSort!.

)display op bubbleSort!


.. spadVerbatim

::

 There are 2 exposed functions called bubbleSort! :
    [1] D1 -> D1 from SortPackage(D2,D1)
          if D2 has ORDSET and D2 has OBJECT and D1 has
          IndexedAggregate(Integer, D2) with
               finiteAggregate
               shallowlyMutable
    [2] (D1,((D3,D3) -> Boolean)) -> D1 from SortPackage(D3,D1)
          if D3 has OBJECT and D1 has
          IndexedAggregate(Integer,D3) with
               finiteAggregate
               shallowlyMutable



What happens if you ask for bubbleSort!([1,-5,3])? There is a unique
modemap for an operation named bubbleSort! with one argument. Since
[1,-5,3] is a list of integers, the symbolic domain D1 is defined as
List(Integer). For some operation to apply, it must satisfy the
predicate for some D2. What D2? The third expression of the and requires
D1 has IndexedAggregate(Integer, D2) with two attributes. So the
interpreter searches for an IndexedAggregate among the ancestors of List
(Integer) (see
`ugCategoriesHier <section-12.4.html#ugCategoriesHier>`__ ). It finds
one: IndexedAggregate(Integer, Integer). The interpreter tries defining
D2 as Integer. After substituting for D1 and D2, the predicate evaluates
to true. An applicable operation has been found!

Now FriCAS builds the package SortPackage(List(Integer), Integer).
According to its definition, this package exports the required
operation: bubbleSort!: List Integer->List Integer. The interpreter then
asks the package for a function implementing this operation. The package
gets all the functions it needs (for example, rest and swap) from the
appropriate domains and then it returns a bubbleSort! to the interpreter
together with the local environment for bubbleSort!. The interpreter
applies the function to the argument [1,-5,3]. The bubbleSort! function
is executed in its local environment and produces the result.



