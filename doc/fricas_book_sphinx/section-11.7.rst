.. status: ok


11.7 Parameters
---------------

The power of packages becomes evident when packages have parameters.
Usually these parameters are domains and the exported operations have
types involving these parameters.

In Chapter `ugTypes <section-2.0.html#ugTypes>`__ , you learned that
categories denote classes of domains. Although we cover this notion in
detail in the next chapter, we now give you a sneak preview of its
usefulness.

In `ugUserBlocks <section-6.15.html#ugUserBlocks>`__ , we defined
functions bubbleSort(m) and insertionSort(m) to sort a list of integers.
If you look at the code for these functions, you see that they may be
used to sort any structure m with the right properties. Also, the
functions can be used to sort lists of any elements---not just integers.
Let us now recall the code for bubbleSort.


.. spadVerbatim

::

 bubbleSort(m) ==
   n := #m
   for i in 1..(n-1) repeat
     for j in n..(i+1) by -1 repeat
       if m.j < m.(j-1) then swap!(m,j,j-1)
   m



What properties of lists of integers are assumed by the sorting
algorithm? In the first line, the operation # computes the maximum index
of the list. The first obvious property is that m must have a finite
number of elements. In FriCAS, this is done by your telling FriCAS that
m has the attribute finiteAggregate. An attribute is a property that a
domain either has or does not have. As we show later in
`ugCategoriesAttributes <section-12.9.html#ugCategoriesAttributes>`__ ,
programs can query domains as to the presence or absence of an
attribute.

The operation swap swaps elements of m. Using Browse, you find that swap
requires its elements to come from a domain of category IndexedAggregate
with attribute shallowlyMutable. This attribute means that you can
change the internal components of m without changing its external
structure. Shallowly-mutable data structures include lists, streams,
one- and two-dimensional arrays, vectors, and matrices.

The category IndexedAggregate designates the class of aggregates whose
elements can be accessed by the notation m.s for suitable selectors s.
The category IndexedAggregate takes two arguments: Index, a domain of
selectors for the aggregate, and Entry, a domain of entries for the
aggregate. Since the sort functions access elements by integers, we must
choose Index=Integer. The most general class of domains for which
bubbleSort and insertionSort are defined are those of category
IndexedAggregate(Integer,Entry) with the two attributes shallowlyMutable
and finiteAggregate.

Using Browse, you can also discover that FriCAS has many kinds of
domains with attribute shallowlyMutable. Those of class
IndexedAggregate(Integer,Entry) include Bits, FlexibleArray,
OneDimensionalArray, List, String, and Vector, and also HashTable and
EqTable with integer keys. Although you may never want to sort all such
structures, we nonetheless demonstrate FriCAS's ability to do so.

Another requirement is that Entry has an operation <. One way to get
this operation is to assume that Entry has category OrderedSet. By
definition, will then export a < operation. A more general approach is
to allow any comparison function f to be used for sorting. This function
will be passed as an argument to the sorting functions.

Our sorting package then takes two arguments: a domain S of objects of
any type, and a domain A, an aggregate of type IndexedAggregate(Integer,
S) with the above two attributes. Here is its definition using what are
close to the original definitions of bubbleSort and insertionSort for
sorting lists of integers. The symbol ! is added to the ends of the
operation names. This uniform naming convention is used for FriCAS
operation names that destructively change one or more of their
arguments.


.. spadVerbatim

::

 SortPackage(S,A) : Exports == Implementation where
   S: Object
   A: IndexedAggregate(Integer,S)
     with (finiteAggregate; shallowlyMutable)
   Exports == with
     bubbleSort!: (A,(S,S) -> Boolean) -> A
     insertionSort!: (A, (S,S) -> Boolean) -> A
   Implementation == add
     bubbleSort!(m,f) ==
       n := #m
       for i in 1..(n-1) repeat
         for j in n..(i+1) by -1 repeat
           if f(m.j,m.(j-1)) then swap!(m,j,j-1)
       m
     insertionSort!(m,f) ==
       for i in 2..#m repeat
         j := i
         while j > 1 and f(m.j,m.(j-1)) repeat
           swap!(m,j,j-1)
           j := (j - 1) pretend PositiveInteger
       m





