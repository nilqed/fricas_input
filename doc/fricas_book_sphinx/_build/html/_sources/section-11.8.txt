.. status: ok


11.8 Conditionals
-----------------

When packages have parameters, you can say that an operation is or is
not conditional exported depending on the values of those parameters.
When the domain of objects S has an < operation, we can supply
one-argument versions of bubbleSort and insertionSort which use this
operation for sorting. The presence of the operation < is guaranteed
when S is an ordered set.


.. spadVerbatim

::

 Exports == with
     bubbleSort!: (A,(S,S) -> Boolean) -> A
     insertionSort!: (A, (S,S) -> Boolean) -> A
     if S has OrderedSet then
       bubbleSort!: A -> A
       insertionSort!: A -> A



In addition to exporting the one-argument sort operations sort:bubble
conditionally, we must provide conditional definitions for the
sort:insertion operations in the Implementation part. This is easy: just
have the one-argument functions call the corresponding two-argument
functions with the operation < from S.


.. spadVerbatim

::

   Implementation == add
        ...
     if S has OrderedSet then
       bubbleSort!(m) == bubbleSort!(m,< $S)
       insertionSort!(m) == insertionSort!(m,< $S)



In `ugUserBlocks <section-6.15.html#ugUserBlocks>`__ , we give an
alternative definition of bubbleSort using firstfirstList and
restrestList that is more efficient for a list (for which access to any
element requires traversing the list from its first node). To implement
a more efficient algorithm for lists, we need the operation setelt which
allows us to destructively change the first and rest of a list. Using
Browse, you find that these operations come from category
UnaryRecursiveAggregate. Several aggregate types are unary recursive
aggregates including those of List and AssociationList. We provide two
different implementations for bubbleSort! and insertionSort!: one for
list-like structures, another for array-like structures.


.. spadVerbatim

::

 Implementation == add
         ...
     if A has UnaryRecursiveAggregate(S) then
       bubbleSort!(m,fn) ==
         empty? m => m
         l := m
         while not empty? (r := l.rest) repeat
            r := bubbleSort! r
            x := l.first
            if fn(r.first,x) then
              l.first := r.first
              r.first := x
            l.rest := r
            l := l.rest
          m
        insertionSort!(m,fn) ==
           ...



The ordering of definitions is important. The standard definitions come
first and then the predicate


.. spadVerbatim

::

 A has UnaryRecursiveAggregate(S)



is evaluated. If true, the special definitions cover up the standard
ones.

Another equivalent way to write the capsule is to use an if-then-else
expression: if


.. spadVerbatim

::

      if A has UnaryRecursiveAggregate(S) then
         ...
      else
         ...





