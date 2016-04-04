.. status: ok


12.0 Categories
---------------

This chapter unravels the mysteries of categories---what category they
are, how they are related to domains and packages, category:constructor
how they are defined in FriCAS, and how you can extend the
constructor:category system to include new categories of your own.

We assume that you have read the introductory material on domains and
categories in
`ugTypesBasicDomainCons <section-2.1.html#ugTypesBasicDomainCons>`__ .
There you learned that the notion of packages covered in the previous
chapter are special cases of domains. While this is in fact the case, it
is useful here to regard domains as distinct from packages.

Think of a domain as a datatype, a collection of objects (the objects of
the domain). From your sneak preview in the previous chapter, you might
conclude that categories are simply named clusters of operations
exported by domains. As it turns out, categories have a much deeper
meaning. Categories are fundamental to the design of FriCAS. They
control the interactions between domains and algorithmic packages, and,
in fact, between all the components of FriCAS.

Categories form hierarchies as shown on the inside cover pages of this
book. The inside front-cover pages illustrate the basic algebraic
hierarchy of the FriCAS programming language. The inside back-cover
pages show the hierarchy for data structures.

Think of the category structures of FriCAS as a foundation for a city on
which superstructures (domains) are built. The algebraic hierarchy, for
example, serves as a foundation for constructive mathematical algorithms
embedded in the domains of FriCAS. Once in place, domains can be
constructed, either independently or from one another.

Superstructures are built for quality---domains are compiled into
machine code for run-time efficiency. You can extend the foundation in
directions beyond the space directly beneath the superstructures, then
extend selected superstructures to cover the space. Because of the
compilation strategy, changing components of the foundation generally
means that the existing superstructures (domains) built on the changed
parts of the foundation (categories) have to be rebuilt---that is,
recompiled.

Before delving into some of the interesting facts about categories,
let's see how you define them in FriCAS.



