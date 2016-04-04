.. status: ok

0.6 Data Structures in FriCAS
-----------------------------

This chapter is an overview of some of the data structures provided by
FriCAS.



0.6.1 Lists
~~~~~~~~~~~

The FriCAS List type constructor is used to create homogeneous lists of
finite size. The notation for lists and the names of the functions that
operate over them are similar to those found in functional languages
such as ML.

Lists can be created by placing a comma separated list of values inside
square brackets or if a list with just one element is desired then the
function list is available:


.. spadInput
::

    [4]

.. spadMathAnswer
.. spadMathOutput
.. math::

 [4]   

.. spadType
:sub:`Type: List PositiveInteger`




.. spadInput
::

    list(4)

.. spadMathAnswer
.. spadMathOutput
.. math::

 [4]   

.. spadType
:sub:`Type: List PositiveInteger`




.. spadInput
::

    [1,2,3,5,7,11]

.. spadMathAnswer
.. spadMathOutput
.. math::

 [1,2,3,5,7,11]   

.. spadType
:sub:`Type: List PositiveInteger`



The function append takes two lists as arguments and returns the list
consisting of the second argument appended to the first. A single
element can be added to the front of a list using cons:


.. spadInput
::
    
	append([1,2,3,5],[7,11])


.. spadMathAnswer
.. spadMathOutput
.. math::



 [1,2,3,5,7,11]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::
    
	cons(23,[65,42,19])


.. spadMathAnswer
.. spadMathOutput
.. math::



 [23,65,42,19]   





.. spadType

:sub:`Type: List PositiveInteger`



Lists are accessed sequentially so if FriCAS is asked for the value of
the twentieth element in the list it will move from the start of the
list over nineteen elements before it reaches the desired element. Each
element of a list is stored as a node consisting of the value of the
element and a pointer to the rest of the list. As a result the two main
operations on a list are called first and rest. Both of these functions
take a second optional argument which specifies the length of the first
part of the list:


.. spadInput
::

	first([1,5,6,2,3])


.. spadMathAnswer
.. spadMathOutput
.. math::



 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	first([1,5,6,2,3],2)


.. spadMathAnswer
.. spadMathOutput
.. math::



 [1,5]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	rest([1,5,6,2,3])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [5,6,2,3]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	rest([1,5,6,2,3],2)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [6,2,3]   





.. spadType

:sub:`Type: List PositiveInteger`



Other functions are empty? which tests to see if a list contains no
elements, member? which tests to see if the first argument is a member
of the second, reverse which reverses the order of the list, sort which
sorts a list, and removeDuplicates which removes any duplicates. The
length of a list can be obtained using the `` #`` operator.


.. spadInput
::

	empty?([7,2,-1,2])


.. spadMathAnswer
.. spadMathOutput
.. math::


 false   





.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	member?(-1,[7,2,-1,2])


.. spadMathAnswer
.. spadMathOutput
.. math::


 true   





.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	reverse([7,2,-1,2])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,-1,2,7]   





.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	sort([7,2,-1,2])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [-1,2,2,7]   





.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	removeDuplicates([1,5,3,5,1,1,2])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,5,3,2]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	#[7,2,-1,2]


.. spadMathAnswer
.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`



Lists in FriCAS are mutable and so their contents (the elements and the
links) can be modified in place. Functions that operator over lists in
this way have names ending in the symbol ``!``. For example, concat!
takes two lists as arguments and appends the second argument to the
first (except when the first argument is an empty list) and setrest!
changes the link emanating from the first argument to point to the
second argument:


.. spadInput
::

	u := [9,2,4,7]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,2,4,7]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	concat!(u,[1,5,42]); u


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,2,4,7,1,5,42]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	endOfu := rest(u,4)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,5,42]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	partOfu := rest(u,2)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,7,1,5,42]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	setrest!(endOfu,partOfu); u


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left\lbrack 9,2,\overline{4,7,1} \right\rbrack   
                                                        





.. spadType

:sub:`Type: List PositiveInteger`



From this it can be seen that the lists returned by first and rest are
pointers to the original list and not a copy. Thus great care must be
taken when dealing with lists in FriCAS.

Although the nth element of the list l can be obtained by applying the
first function to n-1 applications of rest to l, FriCAS provides a more
useful access method in the form of the . operator:


.. spadInput
::

	u.3


.. spadMathAnswer
.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	u.5


.. spadMathAnswer
.. spadMathOutput
.. math::


 1   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	u.6


.. spadMathAnswer
.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	first rest rest u -- Same as u.3


.. spadMathAnswer
.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	u.first


.. spadMathAnswer
.. spadMathOutput
.. math::


 9   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	u(3)


.. spadMathAnswer
.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`



The operation u.i is referred to as indexing into u or elting into u.
The latter term comes from the elt function which is used to extract
elements (the first element of the list is at index 1).


.. spadInput
::

	elt(u,4)


.. spadMathAnswer
.. spadMathOutput
.. math::


 7   





.. spadType

:sub:`Type: PositiveInteger`



If a list has no cycles then any attempt to access an element beyond the
end of the list will generate an error. However, in the example above
there was a cycle starting at the third element so the access to the
sixth element wrapped around to give the third element. Since lists are
mutable it is possible to modify elements directly:


.. spadInput
::

	u.3 := 42; u


.. spadMathAnswer
.. spadMathOutput
.. math::

  \left\lbrack 9,2,\overline{42,7,1} \right\rbrack   
                                                         





.. spadType

:sub:`Type: List PositiveInteger`



Other list operations are:


.. spadInput
::

	L := [9,3,4,7]; #L


.. spadMathAnswer
.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	last(L)


.. spadMathAnswer
.. spadMathOutput
.. math::


 7   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	L.last


.. spadMathAnswer
.. spadMathOutput
.. math::


 7   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	L.( #L - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::


 4   





.. spadType

:sub:`Type: PositiveInteger`



Note that using the `` #`` operator on a list with cycles causes
FriCAS to enter an infinite loop.

Note that any operation on a list L that returns a list LL′ will, in
general, be such that any changes to LL′ will have the side-effect of
altering L. For example:


.. spadInput
::

	m := rest(L,2)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,7]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	m.1 := 20; L


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,3,20,7]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	n := L


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,3,20,7]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	n.2 := 99; L


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,99,20,7]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	n


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,99,20,7]   





.. spadType

:sub:`Type: List PositiveInteger`



Thus the only save way of copying lists is to copy each element from one
to another and not use the assignment operator:


.. spadInput
::

	p := [i for i in n] -- Same as p := copy(n)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,99,20,7]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	p.2 := 5; p


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,5,20,7]   





.. spadType

:sub:`Type: List PositiveInteger`




.. spadInput
::

	n


.. spadMathAnswer
.. spadMathOutput
.. math::


 [9,99,20,7]   





.. spadType

:sub:`Type: List PositiveInteger`



In the previous example a new way of constructing lists was given. This
is a powerful method which gives the reader more information about the
contents of the list than before and which is extremely flexible. The
example


.. spadInput
::

	[i for i in 1..10]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,2,3,4,5,6,7,8,9,10]   





.. spadType

:sub:`Type: List PositiveInteger`



should be read as

  Using the expression i, generate each element of the list by
  iterating the symbol i over the range of integers [1,10]



To generate the list of the squares of the first ten elements we just
use:


.. spadInput
::

	[i^2 for i in 1..10]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,4,9,16,25,36,49,64,81,100]   





.. spadType

:sub:`Type: List PositiveInteger`



For more complex lists we can apply a condition to the elements that are
to be placed into the list to obtain a list of even numbers between 0
and 11:


.. spadInput
::

	[i for i in 1..10 | even?(i)]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,4,6,8,10]   





.. spadType

:sub:`Type: List PositiveInteger`



This example should be read as:



``Using the expression i, generate each element of the list by
iterating the symbol i over the range of integers [1,10] such that i is
even``



The following achieves the same result:


.. spadInput
::

	[i for i in 2..10 by 2]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,4,6,8,10]   





.. spadType

:sub:`Type: List PositiveInteger`







0.6.2 Segmented Lists
~~~~~~~~~~~~~~~~~~~~~

A segmented list is one in which some of the elements are ranges of
values. The expand function converts lists of this type into ordinary
lists:


.. spadInput
::

	[1..10]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1..10]   





.. spadType

:sub:`Type: List Segment PositiveInteger`




.. spadInput
::

	[1..3,5,6,8..10]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1..3,5..5,6..6,8..10]   





.. spadType

:sub:`Type: List Segment PositiveInteger`




.. spadInput
::

	expand(%)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,2,3,5,6,8,9,10]   





.. spadType

:sub:`Type: List Integer`



If the upper bound of a segment is omitted then a different type of
segmented list is obtained and expanding it will produce a stream (which
will be considered in the next section):


.. spadInput
::

	[1..]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1..]   





.. spadType

:sub:`Type: List UniversalSegment PositiveInteger`




.. spadInput
::

	expand(%)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,2,3,4,5,6,7,8,9,10,…]   





.. spadType

:sub:`Type: Stream Integer`







0.6.3 Streams
~~~~~~~~~~~~~

Streams are infinite lists which have the ability to calculate the next
element should it be required. For example, a stream of positive
integers and a list of prime numbers can be generated by:


.. spadInput
::

	[i for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,2,3,4,5,6,7,8,9,10,…]   





.. spadType

:sub:`Type: Stream PositiveInteger`




.. spadInput
::

	[i for i in 1.. | prime?(i)]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,3,5,7,11,13,17,19,23,29,…]   





.. spadType

:sub:`Type: Stream PositiveInteger`



In each case the first few elements of the stream are calculated for
display purposes but the rest of the stream remains unevaluated. The
value of items in a stream are only calculated when they are needed
which gives rise to their alternative name of lazy lists.

Another method of creating streams is to use the generate(f,a) function.
This applies its first argument repeatedly onto its second to produce
the stream [a,f(a),f(f(a)),f(f(f(a)))…]. Given that the function
nextPrime returns the lowest prime number greater than its argument we
can generate a stream of primes as follows:


.. spadInput
::

	generate(nextPrime,2)$Stream Integer


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,3,5,7,11,13,17,19,23,29,…]   





.. spadType

:sub:`Type: Stream Integer`



As a longer example a stream of Fibonacci numbers will be computed. The
Fibonacci numbers start at 1 and each following number is the addition
of the two numbers that precede it so the Fibonacci sequence is:
1,1,2,3,5,8,….

Since the generation of any Fibonacci number only relies on knowing the
previous two numbers we can look at the series through a window of two
elements. To create the series the window is placed at the start over
the values [1,1] and their sum obtained. The window is now shifted to
the right by one position and the sum placed into the empty slot of the
window; the process is then repeated. To implement this we require a
function that takes a list of two elements (the current view of the
window), adds them, and outputs the new window. The result is the
function [a,b]→b,a+b]:


.. spadInput
::

	win : List Integer -> List Integer


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	win(x) == [x.2, x.1 + x.2]


.. spadMathAnswer
.. spadType

:sub:`Type: Void`




.. spadInput
::

	win([1,1])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,2]   





.. spadType

:sub:`Type: List Integer`




.. spadInput
::

	win(%)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,3]   





.. spadType

:sub:`Type: List Integer`



Thus it can be seen that repeatedly applying win to the results of the
previous invocation each element of the series is obtained. Clearly win
is an ideal function to construct streams using the generate function:


.. spadInput
::

	fibs := [generate(win,[1,1])]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [[1,1],[1,2],[2,3],[3,5],[5,8],[8,13],[13,21],[21,34],[34,55],[55,89],…]   





.. spadType

:sub:`Type: Stream List Integer`



This isn't quite what is wanted -- we need to extract the first element
of each list and place that in our series:


.. spadInput
::

	fibs := [i.1 for i in [generate(win,[1,1])] ]


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,1,2,3,5,8,13,21,34,55,…]   





.. spadType

:sub:`Type: Stream Integer`



Obtaining the 200th Fibonacci number is trivial:


.. spadInput
::

	fibs.200


.. spadMathAnswer
.. spadMathOutput
.. math::


 280571172992510140037611932413038677189525   





.. spadType

:sub:`Type: PositiveInteger`



One other function of interest is complete which expands a finite stream
derived from an infinite one (and thus was still stored as an infinite
stream) to form a finite stream.





0.6.4 Arrays, Vectors, Strings, and Bits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The simplest array data structure is the one-dimensional array which can
be obtained by applying the oneDimensionalArray function to a list:


.. spadInput
::

	oneDimensionalArray([7,2,5,4,1,9])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [7,2,5,4,1,9]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`



One-dimensional array are homogenous (all elements must have the same
type) and mutable (elements can be changed) like lists but unlike lists
they are constant in size and have uniform access times (it is just as
quick to read the last element of a one-dimensional array as it is to
read the first; this is not true for lists).

Since these arrays are mutable all the warnings that apply to lists
apply to arrays. That is, it is possible to modify an element in a copy
of an array and change the original:


.. spadInput
::

	x := oneDimensionalArray([7,2,5,4,1,9])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [7,2,5,4,1,9]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`




.. spadInput
::

	y := x


.. spadMathAnswer
.. spadMathOutput
.. math::


 [7,2,5,4,1,9]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`




.. spadInput
::

	y.3 := 20 ; x


.. spadMathAnswer
.. spadMathOutput
.. math::


 [7,2,20,4,1,9]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`



Note that because these arrays are of fixed size the concat! function
cannot be applied to them without generating an error. If arrays of this
type are required use the FlexibleArray constructor.

One-dimensional arrays can be created using new which specifies the size
of the array and the initial value for each of the elements. Other
operations that can be applied to one-dimensional arrays are map! which
applies a mapping onto each element, swap! which swaps two elements and
copyInto!(a,b,c) which copies the array b onto a starting at position c.


.. spadInput
::

	a : ARRAY1 PositiveInteger := new(10,3)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [3,3,3,3,3,3,3,3,3,3]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`



(note that ARRAY1 is an abbreviation for the type OneDimensionalArray.)
Other types based on one-dimensional arrays are Vector, String, and
Bits.


.. spadInput
::

	map!(i +-> i+1,a); a


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,4,4,4,4,4,4,4,4,4]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`




.. spadInput
::

	b := oneDimensionalArray([2,3,4,5,6])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,3,4,5,6]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`




.. spadInput
::

	swap!(b,2,3); b


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,4,3,5,6]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`




.. spadInput
::

	copyInto!(a,b,3)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,4,2,4,3,5,6,4,4,4]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`




.. spadInput
::

	a


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,4,2,4,3,5,6,4,4,4]   





.. spadType

:sub:`Type: OneDimensionalArray PositiveInteger`




.. spadInput
::

	vector([1/2,1/3,1/14])


.. spadMathAnswer
.. spadMathOutput
.. math::


 [12,13,114]   





.. spadType

:sub:`Type: Vector Fraction Integer`




.. spadInput
::

	"Hello, World"


.. spadMathAnswer
.. spadMathOutput
.. math::


 \mathrm{"Hello,World"}   





.. spadType

:sub:`Type: String`




.. spadInput
::

	bits(8,true)


.. spadMathAnswer
.. spadMathOutput
.. math::


 "11111111"   





.. spadType

:sub:`Type: Bits`



A vector is similar to a one-dimensional array except that if its
components belong to a ring then arithmetic operations are provided.





0.6.5 Flexible Arrays
~~~~~~~~~~~~~~~~~~~~~

Flexible arrays are designed to provide the efficiency of
one-dimensional arrays while retaining the flexibility of lists. They
are implemented by allocating a fixed block of storage for the array. If
the array needs to be expanded then a larger block of storage is
allocated and the contents of the old block are copied into the new one.

There are several operations that can be applied to this type, most of
which modify the array in place. As a result these functions all have
names ending in ``!``. The physicalLength returns the actual length of
the array as stored in memory while the physicalLength! allows this
value to be changed by the user.


.. spadInput
::

	f : FARRAY INT := new(6,1)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [1,1,1,1,1,1]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	f.1:=4; f.2:=3 ; f.3:=8 ; f.5:=2 ; f


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,3,8,1,2,1]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	insert!(42,f,3); f


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,3,42,8,1,2,1]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	insert!(28,f,8); f


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,3,42,8,1,2,1,28]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	removeDuplicates!(f)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,3,42,8,1,2,28]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	delete!(f,5)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,3,42,8,2,28]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	g:=f(3..5)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [42,8,2]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	g.2:=7; f


.. spadMathAnswer
.. spadMathOutput
.. math::


 [4,3,42,8,2,28]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	insert!(g,f,1)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [42,7,2,4,3,42,8,2,28]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	physicalLength(f)


.. spadMathAnswer
.. spadMathOutput
.. math::


 10   





.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	physicalLength!(f,20)


.. spadMathAnswer
.. spadMathOutput
.. math::


 [42,7,2,4,3,42,8,2,28]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	merge!(sort!(f),sort!(g))


.. spadMathAnswer
.. spadMathOutput
.. math::


 [2,2,2,3,4,7,7,8,28,42,42,42]   





.. spadType

:sub:`Type: FlexibleArray Integer`




.. spadInput
::

	shrinkable(false)$FlexibleArray(Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::


 true   





.. spadType

:sub:`Type: Boolean`



There are several things to point out concerning these examples. First,
although flexible arrays are mutable, making copies of these arrays
creates separate entities. This can be seen by the fact that the
modification of element b.2 above did not alter a. Second, the merge!
function can take an extra argument before the two arrays are merged.
The argument is a comparison function and defaults to <= if omitted.
Lastly, shrinkable tells the system whether or not to let flexible
arrays contract when elements are deleted from them. An explicit package
reference must be given as in the example above.



