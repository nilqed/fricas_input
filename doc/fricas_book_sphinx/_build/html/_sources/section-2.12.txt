.. status: ok


2.12 Commands for Snooping
--------------------------

To conclude this chapter, we introduce you to some system commands that
you can use for getting more information about domains, packages,
categories, and operations. The most powerful FriCAS facility for
getting information about constructors and operations is the Browse
component of HyperDoc. This is discussed in Chapter
`ugBrowse <section-14.0.html#ugBrowse>`__ .

Use the ``)what system command`` to see lists of system objects whose name
contain a particular substring (uppercase or lowercase is not
significant). what

Issue this to see a list of all operations with complex in their names.
what operation


.. spadInput
::

	)what operation complex


.. spadMathAnswer
.. spadVerbatim

::

 Operations whose names satisfy the above pattern(s):
 complex                   complex?                          
 complexEigenvalues        complexEigenvectors               
 complexElementary         complexExpand                     
 complexForm               complexIntegrate                  
 complexLimit              complexNormalize                  
 complexNumeric            complexNumericIfCan               
 complexRoots              complexSolve                      
 complexZeros              createLowComplexityNormalBasis    
 createLowComplexityTable  doubleComplex?                    
 drawComplex               drawComplexVectorField            
 fortranComplex            fortranDoubleComplex              
 pmComplexintegrate                
    
 To get more information about an operation such as 
 complexZeros, issue the command )display op complexZeros 



If you want to see all domains with matrix in their names, issue this.
what domain


.. spadInput
::

	)what domain matrix


.. spadMathAnswer
.. spadVerbatim

::

 ----------------------- Domains -----------------------
 Domains with names matching patterns:
      matrix 
  DHMATRIX DenavitHartenbergMatrix      
  DPMM     DirectProductMatrixModule
  IMATRIX  IndexedMatrix                
  LSQM     LieSquareMatrix
  M3D      ThreeDimensionalMatrix       
  MATCAT-  MatrixCategory&
  MATRIX   Matrix                       
  RMATCAT- RectangularMatrixCategory&
  RMATRIX  RectangularMatrix            
  SMATCAT- SquareMatrixCategory&
  SQMATRIX SquareMatrix



Similarly, if you wish to see all packages whose names contain ``gauss``,
enter this. what packages


.. spadInput
::

	)what package gauss


.. spadMathAnswer
.. spadVerbatim

::

 ---------------------- Packages -----------------------
 Packages with names matching patterns:
      gauss 
  GAUSSFAC GaussianFactorizationPackage



This command shows all the operations that Any provides. Wherever ``$``
appears, it means Any. show


.. spadInput
::

	)show Any


.. spadMathAnswer
.. spadVerbatim

::

  Any  is a domain constructor
  Abbreviation for Any is ANY 
  This constructor is exposed in this frame.
  Issue )edit /usr/local/axiom/mnt/algebra/any.spad 
   to see algebra source code for ANY 
 --------------------- Operations ----------------------
  ?=? : (%,%) -> Boolean                
  any : (SExpression,None) -> %
  coerce : % -> OutputForm              
  dom : % -> SExpression
  domainOf : % -> OutputForm            
  hash : % -> SingleInteger
  latex : % -> String                   
  obj : % -> None
  objectOf : % -> OutputForm            
  ?~=? : (%,%) -> Boolean
  showTypeInOutput : Boolean -> String



This displays all operations with the name complex. display operation


.. spadInput
::

	)display operation complex


.. spadMathAnswer
.. spadVerbatim

::

 There is one exposed function called complex :
  [1] (D1,D1) -> D from D if D has COMPCAT D1 and D1 has COMRING



Let's analyze this output.

First we find out what some of the abbreviations mean.


.. spadInput
::

	)abbreviation query COMPCAT


.. spadMathAnswer
.. spadVerbatim

::

    COMPCAT abbreviates category ComplexCategory 




.. spadInput
::

	)abbreviation query COMRING


.. spadMathAnswer
.. spadVerbatim

::

    COMRING abbreviates category CommutativeRing 



So if D1 is a commutative ring (such as the integers or floats) and D
belongs to ComplexCategory D1, then there is an operation called complex
that takes two elements of D1 and creates an element of D. The primary
example of a constructor implementing domains belonging to
ComplexCategory is Complex. See
`Complex <chapter-9.1-12.html#Complex>`__ for more information on that
and see `ugUserDeclare <section-6.4.html#ugUserDeclare>`__ for more
information on function types.



