.. status: ok


13.13 Example 2: Building A Query Facility
------------------------------------------

We now turn to an entirely different kind of application, building a
query language for a database.

Here is the practical problem to solve. The Browse facility of FriCAS
has a database for all operations and constructors which is stored on
disk and accessed by HyperDoc. For our purposes here, we regard each
line of this file as having eight fields: class, name, type, nargs,
exposed, kind, origin, and condition. Here is an example entry:


.. spadVerbatim

::

 o\`determinant\`$->R\`1\`x\`d\`Matrix(R)\`has(R,commutative("*"))



In English, the entry means:



The operation determinant: $->R with 1 argument, is exposed and is
exported by domain Matrix(R) if R has commutative("*").



Our task is to create a little query language that allows us to get
useful information from this database.



13.13.1 A Little Query Language
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First we design a simple language for accessing information from the
database. We have the following simple model in mind for its design.
Think of the database as a box of index cards. There is only one search
operation---it takes the name of a field and a predicate predicate (a
boolean-valued function) defined on the fields of the index cards. When
applied, the search operation goes through the entire box selecting only
those index cards for which the predicate is true. The result of a
search is a new box of index cards. This process can be repeated again
and again.

The predicates all have a particularly simple form: symbol = pattern,
where symbol designates one of the fields, and pattern is a search
string---a string that may contain a * as a wildcard. Wildcards match
any substring, including the empty string. Thus the pattern "*ma*t
matches "mat", doormat'' and smart.

To illustrate how queries are given, we give you a sneak preview of the
facility we are about to create.

Extract the database of all FriCAS operations.


.. spadInput
::

	.. spadMathAnswer
How many exposed three-argument map operations involving streams?


.. spadInput
::

	.. spadMathAnswer
As usual, the arguments of elt ( .) associate to the left. The first elt
produces the set of all operations with name map. The second elt
produces the set of all map operations with three arguments. The third
elt produces the set of all three-argument map operations having a type
mentioning Stream.

Another thing we'd like to do is to extract one field from each of the
index cards in the box and look at the result. Here is an example of
that kind of request.

What constructors explicitly export a determinant operation?


.. spadInput
::

	.. spadMathAnswer
The first elt produces the set of all index cards with name determinant.
The second elt extracts the origin component from each index card. Each
origin component is the name of a constructor which directly exports the
operation represented by the index card. Extracting a component from
each index card produces what we call a datalist. The third elt, sort,
causes the datalist of origins to be sorted in alphabetic order. The
fourth, unique, causes duplicates to be removed.

Before giving you a more extensive demo of this facility, we now build
the necessary domains and packages to implement it. We will introduce a
few of our minor conveniences.





13.13.2 The Database Constructor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We work from the top down. First, we define a database, our box of index
cards, as an abstract datatype. For sake of illustration and generality,
we assume that an index card is some type S, and that a database is a
box of objects of type S. Here is the FriCAS program defining the
Database domain.


.. spadVerbatim

::

 PI ==> PositiveInteger
 Database(S): Exports == Implementation where
   S: Object with 
     elt: ( $, Symbol) -> String
     display:  $ -> Void
     fullDisplay:  $ -> Void
   Exports == with

    elt: ( $,QueryEquation) ->  $                   Select by an equation

    elt: ( $, Symbol) -> DataList String            Select by a field name

    "+": ( $, $) ->  $                              Combine two databases

    "-": ( $, $) ->  $                              Subtract one from another

    display:  $ -> Void                             A brief database display

    fullDisplay:  $ -> Void                         A full database display
     fullDisplay: ( $,PI,PI) -> Void                 A selective display
     coerce:  $ -> OutputForm                        Display a database
   Implementation == add
       ...



The domain constructor takes a parameter S, which stands for the class
of index cards. We describe an index card later. Here think of an index
card as a string which has the eight fields mentioned above.

First we tell FriCAS what operations we are going to require from index
cards. We need an elt to extract the contents of a field (such as name
and type) as a string. For example, c.name returns a string that is the
content of the name field on the index card c. We need to display an
index card in two ways: display shows only the name and type of an
operation; fullDisplay displays all fields. The display operations
return no useful information and thus have return type Void.

Next we tell FriCAS what operations the user can apply to the database.
This part defines our little query language. The most important
operation is db . field = pattern which returns a new database,
consisting of all index cards of db such that the field part of the
index card is matched by the string pattern called pattern. The
expression field = pattern is an object of type QueryEquation (defined
in the next section).

Another elt is needed to produce a DataList object. Operation + is to
merge two databases together; - is used to subtract away common entries
in a second database from an initial database. There are three display
functions. The fullDisplay function has two versions: one that prints
all the records, the other that prints only a fixed number of records. A
coerce to OutputForm creates a display object.

The Implementation part of Database is straightforward.


.. spadVerbatim

::

   Implementation == add
     s: Symbol
     Rep := List S
     elt(db,equation) == ...
     elt(db,key) == [x.key for x in db]::DataList(String)
     display(db) ==  for x in db repeat display x
     fullDisplay(db) == for x in db repeat fullDisplay x
     fullDisplay(db, n, m) == for x in db for i in 1..m
       repeat
         if i >= n then fullDisplay x
     x+y == removeDuplicates! merge(x,y)
     x-y == mergeDifference(copy(x::Rep),
                            y::Rep)$MergeThing(S)
     coerce(db): OutputForm == (#db):: OutputForm



The database is represented by a list of elements of S (index cards). We
leave the definition of the first elt operation (on line 4) until the
next section. The second elt collects all the strings with field name
key into a list. The display function and first fullDisplay function
simply call the corresponding functions from S. The second fullDisplay
function provides an efficient way of printing out a portion of a large
list. The + is defined by using the existing mergemergeList operation
defined on lists, then removing duplicates from the result. The -
operation requires writing a corresponding subtraction operation. A
package MergeThing (not shown) provides this.

The coerce function converts the database to an OutputForm by computing
the number of index cards. This is a good example of the independence of
the representation of an FriCAS object from how it presents itself to
the user. We usually do not want to look at a database---but do care how
many hits we get for a given query. So we define the output
representation of a database to be simply the number of index cards our
query finds.





13.13.3 Query Equations
~~~~~~~~~~~~~~~~~~~~~~~

The predicate for our search is given by an object of type
QueryEquation. FriCAS does not have such an object yet so we have to
invent it.


.. spadVerbatim

::

 QueryEquation(): Exports == Implementation where
   Exports == with
     equation: (Symbol, String) ->  $
     variable:  $ -> Symbol
     value:     $ -> String
   Implementation == add
     Rep := Record(var:Symbol, val:String)
     equation(x, s) == [x, s]
     variable q == q.var
     value    q == q.val



FriCAS converts an input expression of the form a=b to equation(a,b).
Our equations always have a symbol on the left and a string on the
right. The Exports part thus specifies an operation equation to create a
query equation, and variable and value to select the left- and
right-hand sides. The Implementation part uses Record for a
space-efficient representation of an equation.

Here is the missing definition for the elt function of Database in the
last section:


.. spadVerbatim

::

     elt(db,eq) ==
       field  := variable eq
       value := value eq
       [x for x in db | matches?(value,x.field)]



Recall that a database is represented by a list. Line 4 simply runs over
that list collecting all elements such that the pattern (that is, value)
matches the selected field of the element.





13.13.4 DataLists
~~~~~~~~~~~~~~~~~

Type DataList is a new type invented to hold the result of selecting one
field from each of the index cards in the box. It is useful to make
datalists extensions of lists---lists that have special elt operations
defined on them for sorting and removing duplicates.


.. spadVerbatim

::

 DataList(S:OrderedSet) : Exports == Implementation where
   Exports == ListAggregate(S) with
     elt: ($,"unique") -> $
     elt: ($,"sort") -> $
     elt: ($,"count") -> NonNegativeInteger
     coerce: List S -> $
   Implementation ==  List(S) add
     Rep := List S
     elt(x,"unique") == removeDuplicates(x)
     elt(x,"sort") == sort(x)
     elt(x,"count") == #x
     coerce(x:List S) == x :: $



The Exports part asserts that datalists belong to the category
ListAggregate. Therefore, you can use all the usual list operations on
datalists, such as firstfirstList, restrestList, and concatconcatList.
In addition, datalists have four explicit operations. Besides the three
elt operations, there is a coerce operation that creates datalists from
lists.

The Implementation part needs only to define four functions. All the
rest are obtained from List(S).





13.13.5 Index Cards
~~~~~~~~~~~~~~~~~~~

An index card comes from a file as one long string. We define functions
that extract substrings from the long string. Each field has a name that
is passed as a second argument to elt.


.. spadVerbatim

::

 IndexCard() == Implementation where
   Exports == with
     elt: ($, Symbol) -> String
     display: $ -> Void
     fullDisplay: $ -> Void
     coerce: String -> $
   Implementation == String add ...



We leave the Implementation part to the reader. All operations involve
straightforward string manipulations.





13.13.6 Creating a Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~

We must not forget one important operation: one that builds the database
in the first place! We'll name it getDatabase and put it in a package.
This function is implemented by calling the Common Lisp function
getBrowseDatabase(s) to get appropriate information from Browse. This
operation takes a string indicating which lines you want from the
database: o gives you all operation lines, and k, all constructor lines.
Similarly, c, d, and p give you all category, domain and package lines
respectively.


.. spadVerbatim

::

 OperationsQuery(): Exports == Implementation where
   Exports == with
     getDatabase: String -> Database(IndexCard)
   Implementation == add
     getDatabase(s) == getBrowseDatabase(s)$Lisp



We do not bother creating a special name for databases of index cards.
Database (IndexCard) will do. Notice that we used the package
OperationsQuery to create, in effect, a new kind of domain:
Database(IndexCard).





13.13.7 Putting It All Together
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create the database facility, you put all these constructors into one
file.You could use separate files, but we are putting them all together
because, organizationally, that is the logical thing to do. At the top
of the file put )abbrev commands, giving the constructor abbreviations
you created.


.. spadVerbatim

::

 )abbrev domain  ICARD   IndexCard
 )abbrev domain  QEQUAT  QueryEquation
 )abbrev domain  MTHING  MergeThing
 )abbrev domain  DLIST   DataList
 )abbrev domain  DBASE   Database
 )abbrev package OPQUERY OperationsQuery



With all this in alql.spad, for example, compile it using compile


.. spadVerbatim

::

 )compile alql



and then load each of the constructors:


.. spadVerbatim

::

 )load ICARD QEQUAT MTHING DLIST DBASE OPQUERY



load You are ready to try some sample queries.





13.13.8 Example Queries
~~~~~~~~~~~~~~~~~~~~~~~

Our first set of queries give some statistics on constructors in the
current FriCAS system.

How many constructors does FriCAS have?


.. spadInput
::

	.. spadMathAnswer
Break this down into the number of categories, domains, and packages.


.. spadInput
::

	.. spadMathAnswer
What are all the domain constructors that take no parameters?


.. spadInput
::

	.. spadMathAnswer
How many constructors have Matrix in their name?


.. spadInput
::

	.. spadMathAnswer
What are the names of those that are domains?


.. spadInput
::

	.. spadMathAnswer
How many operations are there in the library?


.. spadInput
::

	.. spadMathAnswer
Break this down into categories, domains, and packages.


.. spadInput
::

	.. spadMathAnswer
The query language is helpful in getting information about a particular
operation you might like to apply. While this information can be
obtained with Browse, the use of the query database gives you data that
you can manipulate in the workspace.

How many operations have eigen in the name?


.. spadInput
::

	.. spadMathAnswer
What are their names?


.. spadInput
::

	.. spadMathAnswer
Where do they come from?


.. spadInput
::

	.. spadMathAnswer
The operations + and - are useful for constructing small databases and
combining them. However, remember that the only matching you can do is
string matching. Thus a pattern such as "*Matrix*" on the type field
matches any type containing Matrix, MatrixCategory, SquareMatrix, and so
on.

How many operations mention Matrix in their type?


.. spadInput
::

	.. spadMathAnswer
How many operations come from constructors with Matrix in their name?


.. spadInput
::

	.. spadMathAnswer
How many operations are in fm but not in tm?


.. spadInput
::

	.. spadMathAnswer
Display the operations that both mention Matrix in their type and come
from a constructor having Matrix in their name.


.. spadInput
::

	.. spadMathAnswer
How many operations involve matrices?


.. spadInput
::

	.. spadMathAnswer
Display 4 of them.


.. spadInput
::

	.. spadMathAnswer
How many distinct names of operations involving matrices are there?


.. spadInput
::

	.. spadMathAnswer
