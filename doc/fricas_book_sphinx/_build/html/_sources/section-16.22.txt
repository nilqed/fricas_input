.. status: ok


16.22 )show
-----------

ugSysCmdshow

show

 User Level Required: interpreter

 Command Syntax:





)show nameOrAbbrev





)show nameOrAbbrev )operations





)show nameOrAbbrev )attributes





 Command Description: This command displays information about FriCAS
domain, package and category constructors. If no options are given, the
)operations option is assumed. For example,


.. spadVerbatim

::

 )show POLY
 )show POLY )operations
 )show Polynomial
 )show Polynomial )operations



each display basic information about the Polynomial domain constructor
and then provide a listing of operations. Since Polynomial requires a
Ring (for example, Integer) as argument, the above commands all refer to
a unspecified ring R. In the list of operations, $ means Polynomial(R).

The basic information displayed includes the signature of the
constructor (the name and arguments), the constructor abbreviation, the
exposure status of the constructor, and the name of the library source
file for the constructor.

If operation information about a specific domain is wanted, the full or
abbreviated domain name may be used. For example,


.. spadVerbatim

::

 )show POLY INT
 )show POLY INT )operations
 )show Polynomial Integer
 )show Polynomial Integer )operations



are among the combinations that will display the operations exported by
the domain Polynomial(Integer) (as opposed to the general domain
constructor Polynomial). Attributes may be listed by using the
)attributes option.

 Also See: )display ugSysCmddisplay, )set ugSysCmdset, and )what
ugSysCmdwhat.



