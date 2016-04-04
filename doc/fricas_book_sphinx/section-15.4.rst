.. status: ok


15.4 Interactive Front-end and Language
---------------------------------------

ugWhatsNewLanguage

The leave keyword has been replaced by the break keyword for
compatibility with the new FriCAS extension language. See section
`ugLangLoopsBreak <section-5.4.html#ugLangLoopsBreak>`__ for more
information.

Curly braces are no longer used to create sets. Instead, use set
followed by a bracketed expression. For example,


.. spadInput
::

	set [1,2,3,4]


.. spadMathAnswer
Curly braces are now used to enclose a block (see section
`ugLangBlocks <section-5.2.html#ugLangBlocks>`__ for more information).
For compatibility, a block can still be enclosed by parentheses as well.

Free functions created by the Aldor compiler can now be loaded and used
within the FriCAS interpreter. A free function is a library function
that is implemented outside a domain or category constructor.

New coercions to and from type Expression have been added. For example,
it is now possible to map a polynomial represented as an expression to
an appropriate polynomial type.

Various messages have been added or rewritten for clarity.



