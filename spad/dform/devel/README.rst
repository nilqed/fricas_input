.. README https://github.com/nilqed/dform

=========================================
FriCAS package: DifferentialForms (DFORM)
=========================================

Builds on domain ``DeRhamComplex``, providing functions for computing volume 
forms, Hodge star dual and interior product of a differential form with respect 
to a (pseudo-) Riemannian metric. 

-------------
Documentation
-------------
The folder ``sphinx`` contains the sphinx sources of the manual while the 
compiled HTML files are in ``docs``. There is an online_ version served by 
GitHub pages (``master branch /docs folder``).

.. _online:  http://nilqed.github.io/dform/


Some documentation of DeRhamComplex can be found here_ or in the folder 
``sphinx/derham`` and in the API_ of course.

.. _here: http://kfp.bitbucket.org/fricas-derham/
.. _API: http://fricas.github.io/api/DeRhamComplex.html?highlight=derham
  

-------------
Quick Install
-------------
If you have Quicklisp_ installed (highly recommended) then follow the steps 
below:

1. Add the following code to your ``~/.fricas.input``:

::

   )set mess type off
   quickLoad(p) ==
     systemCommand("lisp (load _"~/quicklisp/setup_")")
     systemCommand(concat ["lisp (ql::quickload _"",string p,"_")"])
   )set mess type on  

Whereby assuming your Quicklisp home is ``~/quicklisp``. Otherwise adjust 
the path in the function defined above.

2. Clone https://github.com/nilqed/dform.git  to
   ``~/quicklisp/local-projects``, that is::

      cd ~/quicklisp/local-projects
      git clone https://github.com/nilqed/dform.git 

   
3. Start *FriCAS* (version 1.3 or later) and issue: ::
    
      quickLoad dform
 
   
**NOTE** 

  If you start fricas without the ``-nosman`` option then you have to use ::
    
    )frame next 
    
  in order to see the function ``quickLoad`` (This is because ``.fricas.input``
  is read into frame ``initial`` - use ``)frame names`` to see a list of all
  frames.
  If you do not like to use a startup file then you can use the lisp commands
  of course:

::

    )lisp (load "~/quicklisp/setup")
    )lisp (ql:quickload :dform)




.. _QuickLisp: https://www.quicklisp.org/beta/


The function ``quickLoad`` will compile everything once (src) and when called 
next time the binaries are loaded (lib). If you want to recompile the sources 
then either delete everything in ``lib`` or use::
    
    )lisp (compile-dform)
    


Installing manually ...
-----------------------
Just compile the file ``src/dform.spad``::

  )compile dform

This will produce the library ``lib/DFORM.NRLIB`` which has to be loaded 
manually each time you want to use the package.


Testing
-------
There is a test file ``test_dform.input`` in folder ``test`` which can be run
either by the function::
    
    testDFORM()$Lisp 
    
when installed using Quicklisp, or manually by::
    
    )read test_dform 
    
as usual. Note that a ``)clear all`` will be issued!

In the same folder there are some other examples and test files.

Sphinx
------
The folder ``sphinx`` contains the sources of the documentation. To rebuild
the *HTML* files or even building other formats (e.g. *LaTeX*) you will need
a Sphinx_ installation::
    
    make html
    
    
.. _Sphinx: http://www.sphinx-doc.org/en/stable/



