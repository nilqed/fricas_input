.. status: ok



11.2 Syntax
-----------

The definition of a package has the syntax:



PackageForm : Exports ==  Implementation



The syntax for defining a package constructor is the same as that syntax
for defining any function in FriCAS. In practice, the definition extends
over many lines so that this syntax is not practical. Also, the type of
a package is expressed by the operator with with followed by an explicit
list of operations. A preferable way to write the definition of a
package is with a where where expression:

| The definition of a package usually has the form:
|  PackageForm : Exports == Implementation where
 optional type declarations
 Exports == with
 list of exported operations
 Implementation == add
 list of function definitions for exported operations

The DrawComplex package takes no parameters and exports five operations,
each a separate item of a pile. Each operation is described as a
declaration: a name, followed by a colon (:), followed by the type of
the operation. All operations have types expressed as mappings with the
syntax



source ->  target





