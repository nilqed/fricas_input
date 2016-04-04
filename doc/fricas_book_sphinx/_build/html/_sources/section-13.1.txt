.. status: ok


13.1 Domains vs. Packages
-------------------------

Packages are special cases of domains. What is the difference between a
package and a domain that is not a package? By definition, there is only
one difference: a domain that is not a package has the symbol $
appearing somewhere among the types of its exported operations. The $
denotes this domain. If the $ appears before the -> in the type of a
signature, it means the operation takes an element from the domain as an
argument. If it appears after the ->, then the operation returns an
element of the domain.

If no exported operations mention $, then evidently there is nothing of
interest to do with the objects of the domain. You might then say that a
package is a boring domain! But, as you saw in Chapter
`ugPackages <section-11.0.html#ugPackages>`__, packages are a very
useful notion indeed. The exported operations of a package depend solely
on the parameters to the package constructor and other explicit domains.

To summarize, domain constructors are versatile structures that serve
two distinct practical purposes: Those like Polynomial and List describe
classes of computational objects; others, like SortPackage, describe
packages of useful operations. As in the last chapter, we focus here on
the first kind.



