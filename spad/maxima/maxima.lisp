;;;
;;; Parts of code from R.J. Fateman's MMA **
;;;
;;;

(in-package :boot)

(eval-when (:load-toplevel)
  (if (find-package "MAXIMA") nil  (defpackage :maxima)))


;;; works, cool!
(defun maxima::mplus2 (a b) (list '(mplus) a b)) 
(defun maxima::mtimes2 (a b) (list '(mtimes) a b)) 

(defparameter macsubs '(
  
  (|Set| . maxima::msetq) 
  (= . maxima::mequal)
  (|Pattern| . maxima::|$Pattern|) 
  (|Blank| . maxima::|$Blank|)
  (|Increment| . maxima::$Increment) 
  (|Part| . maxima::|$Part|)
  (> . maxima::mgreaterp) 
  (>= . maxima::mgeqp)
  (<= . maxima::mleqp) 
  (+ . maxima::mplus2)
  (* . maxima::mtimes2) 
  (^ . maxima::mexpt)
  (/ . maxima::rat)
  (|sin| . maxima::%sin) 
  (|cos| . maxima::%cos) 
  (|construct| . maxima::mlist)
  (|N| . maxima::Numeric_eval) 
  (|CompoundExpression| . maxima::mprogn)
  (|If| . maxima::mcond) (|Module| . maxima::mprog) 
  (|Real| . maxima::mplus)  ;; huh?
  (|Sequence| . maxima::$segment)
  
))


(defparameter macsubsR '(
 (|Set| . msetq) 
 (= . mequal)
 (|Pattern| . |$Pattern|) 
 (|Blank| . |$Blank|)
 (|Increment| . $Increment) 
 (|Part| . |$Part|)
 (> . mgreaterp) 
 (>= . mgeqp)
 (<= . mleqp) 
 (+ . mplus)
 (* . mtimes) 
 (^ . mexpt)
 (|sin| . %sin) 
 (|cos| . %cos) 
 (|construct| . mlist)
 (|N| . Numeric_eval) 
 (|CompoundExpression| . mprogn)
 (|If| . mcond) (|Module| . mprog) 
 (/ . rat)
 ;(|Real| . mplus)  ;; huh?
 (|Sequence| . $segment)
))


(defun spad2max(r)
  (cond ((atom r)
	 (cond ((numberp r) 
		(cond ((floatp r) r)
		      ((complexp r);; do a+b*%i
		       (list '(maxima::mplus) (spad2max (realpart r))
			     (list '(maxima::mtimes) 'maxima::$%i(spad2max (imagpart r)))))
		      #+ignore
		      ((ratiop r)  ;; gcl has no ratiop
		       (list '(maxima::rat) (numerator r)(denominator r)))
		      (t r))) ;other number e.g. float
	       ;; an atom but not a number.
	       ;; if it is a user name e.g. foo, do we make it $foo?
	       ;; how can we tell?
	       ;; for now, we don't. but the dollarsign
	       ((symbolp r)
		(let ((l (assoc r macsubs)))
		  (cond (l (cdr l))	;found a translation
			(t (intern (format nil"$~a"r) :maxima)))))   
		   
	       (t r)))
	(t
	 (cons  (list (spad2max (car r)))
		(mapcar #'spad2max (cdr r))))))



(defun max2spad(e)
  (cond ((atom e) 
	 (cond ((symbolp e) 
		(let ((name(st$ e))) ;;fiddle with stripdollar,
		  ;; need to establish all symbols in the mockmma
		  ;; symbol table.  This might not be the place to
		  ;; do it (globally), but these are maxima symbols..
		  ;;(globinit name (max2spad (meval name))  nil ) ;;wrong
		   (let ((r (rassoc name macsubsR)))
		     (if r (car r) name))))
	       ((complexp e)`(|Complex| (realpart e)(imagpart e)))
	       (t e))) ; what, a number, a string, an array, a structure,.. 
	
	(t(cons (max2spad (caar e))
		(mapcar #'max2spad (cdr e))))))


(defun st$(x) ;; remove $ if any
  (let ((r (symbol-name x))
					;(p (symbol-package x))
	)
    (intern (if (or (char= (aref r 0) #\$)
		    (char= (aref r 0) #\%))
		(subseq r 1) r) :boot)))



(defun meval (e) (maxima::meval e))
(defun mevald (e) (maxima::displa (meval e))) 

(defun maxintegrate (x v) (maxima::$integrate x v))

