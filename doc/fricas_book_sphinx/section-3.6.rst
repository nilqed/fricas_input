.. status: ok


3.6 Search Strings
------------------

A search string is used for searching some database. To learn about
search strings, we suggest that you bring up the HyperDoc glossary. To
do this from the top-level page of HyperDoc:

#. Click on Reference, bringing up the FriCAS Reference page.
#. Click on Glossary, bringing up the glossary.

The glossary has an input area at its bottom. We review the various
kinds of search strings you can enter to search the glossary.

The simplest search string is a word, for example, operation. A word
only matches an entry having exactly that spelling. Enter the word
operation into the input area above then click on Search. As you can
see, operation matches only one entry, namely with operation itself.

Normally matching is insensitive to whether the alphabetic characters of
your search string are in uppercase or lowercase. Thus operation and
OperAtion both have the same effect. If you prefer that matching be
case-sensitive, issue the command set HHyperName mixedCase command to
the interpreter.

You will very often want to use the wildcard * in your search string so
as to match multiple entries in the list. The search key * matches
every entry in the list. You can also use * anywhere within a search
string to match an arbitrary substring. Try cat* for example: enter
cat* into the input area and click on Search. This matches several
entries.

You use any number of wildcards in a search string as long as they are
not adjacent. Try search strings such as *dom*. As you see, this
search string matches domain, domain constructor, subdomain, and so on.



3.6.1 Logical Searches
~~~~~~~~~~~~~~~~~~~~~~

For more complicated searches, you can use and, or, and not with basic
search strings; write logical expressions using these three operators
just as in the FriCAS language. For example, domain or package matches
the two entries domain and package. Similarly, dom* and *con* matches
domain constructor and others. Also not *a* matches every entry that
does not contain the letter a somewhere.

Use parentheses for grouping. For example, dom* and (not *con*)
matches domain but not domain constructor.

There is no limit to how complex your logical expression can be. For
example,



a* or b* or c* or d* or e* and (not *a*)



is a valid expression.





