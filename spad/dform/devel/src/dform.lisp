(defparameter *dform* (asdf:system-source-directory :dform))

(defun compile-dform ()
  (progn
    (|doSystemCommand| (format nil "cd ~Alib" *dform*))
    (|doSystemCommand| (format nil "compile ../src/dform.spad )quiet"))))

(defun load-dform ()
  (if (probe-file (format nil "~Alib/DFORM.NRLIB/DFORM.lsp" *dform*))
     (|doSystemCommand| (format nil "lib )dir ~Alib/" *dform*))
     (compile-dform)))

(defun |testDFORM| () 
  (if (probe-file (format nil "~Atest/test_dform.input" *dform*))
     (|doSystemCommand| (format nil "read ~Atest/test_dform )quiet" *dform*))
     (print "Test file not found ...")))   
   
;;;
(catch 'spad_reader (load-dform))

;(format t "~%  ==========================================================~%")
;(format t "  You may run a test file by testDFORM()$Lisp ...~%")
;(format t "  Note: FriCAS should be restarted afterwards (clear all).~%")
;(format t "  ==========================================================~%")
  
  
