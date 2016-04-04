.. status: ok



6.7 Functions vs. Operations
----------------------------

A function is an object that you can create, manipulate, pass to, and
return from functions (for some interesting examples of library
functions that manipulate functions, see
`MappingPackage1XmpPage <MappingPackage1XmpPage>`__ ). Yet, we often
seem to use the term operation and function interchangeably in FriCAS.
What is the distinction?

First consider values and types associated with some variable n in your
workspace. You can make the declaration n : Integer, then assign n an
integer value. You then speak of the integer n. However, note that the
integer is not the name n itself, but the value that you assign to n.

Similarly, you can declare a variable f in your workspace to have type
Integer → Integer, then assign f, through a definition or an assignment
of an anonymous function. You then speak of the function f. However, the
function is not f, but the value that you assign to f.

A function is a value, in fact, some machine code for doing something.
Doing what? Well, performing some operation. Formally, an operation
consists of the constituent parts of f in your workspace, excluding the
value; thus an operation has a name and a type. An operation is what
domains and packages export. Thus Ring exports one operation ``+``.
Every ring also exports this operation. Also, the author of every ring
in the system is obliged under contract (see
`ugPackagesAbstract <section-11.3.html#ugPackagesAbstract>`__ ) to
provide an implementation for this operation.

This chapter is all about functions---how you create them interactively
and how you apply them to meet your needs. In Chapter
`ugPackages <section-11.0.html#ugPackages>`__ you will learn how to
create them for the FriCAS library. Then in Chapter
`ugCategories <section-12.0.html#ugCategories>`__ , you will learn
about categories and exported operations.



