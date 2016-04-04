#!/usr/bin/awk -f


/^]>/ {print ".. status: ok" ; next}
/Book Contents <book-contents.xhtml>/ {getline; getline; getline ; next}
#/Book Index <book-index.xhtml>/ {print ".. book_index: false" ; next}
{print;next}
