;;; ==========================================================================
;;; EMBEDDABLE-MAXIMA in FriCAS, Lisp interface SPAD <-> MAX, V 10-03-2016
;;; ==========================================================================
;;; Parts of code from R.J. Fateman's MMA **  (BSD licensed, as this code)
;;;
;;;
;;;

(in-package :boot)

(eval-when (:load-toplevel)
  (if (find-package "MAXIMA") nil  (defpackage :maxima)))

;;; Since _+ is 2-ary while mplus is n-ary we need a work-around.
;;; We define mplus2, mtimes2 in terms of mplus, mtimes ...
;;; works, cool!
;;; not necessary anymore (see function "spadify")
;(defun maxima::mplus2 (a b) (list '(maxima::mplus) a b)) 
;(defun maxima::mtimes2 (a b) (list '(maxima::mtimes) a b)) 


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
  (+ . maxima::mplus)
  (* . maxima::mtimes) 
  (^ . maxima::mexpt)
  ;(/ . maxima::rat)
  (/ . maxima::spadrat)
  (|sin| . maxima::%sin) 
  (|cos| . maxima::%cos)
  (|log| . maxima::%log)
  (|exp| . maxima::%exp)
  (|construct| . maxima::mlist)
  (|N| . maxima::Numeric_eval) 
  (|CompoundExpression| . maxima::mprogn)
  (|If| . maxima::mcond) (|Module| . maxima::mprog) 
  ;(|Real| . maxima::mplus)  ;; huh?
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
 ;(|msum| . mplus)
 (+ . mplus)
 ;(|mprod| . mtimes)
 (* . mtimes)
 (^ . mexpt)
 (|sin| . sin) 
 (|cos| . cos) 
 (|log| . log)
 (|%e| . %E)
 (|__integrate| . integrate)
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



(defun max2spad0(e)
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


(defun spadify(e)
  (cond ((atom e) e)
        ((eq (car e) '+) 
            (let ((a (spadify (cdr e))))
              (if (> (length a) 1)
                (reduce (lambda (x y) (list '+ x y)) a)
                (list (spadify (car a))))))
        ((eq (car e) '*) 
            (let ((a (spadify (cdr e))))
              (if (> (length a) 1)
                (reduce (lambda (x y) (list '* x y)) a)
                (list (spadify (car a))))))
        (t (cons (spadify (car e)) (spadify (cdr e))))))
 

(defun max2spad(e)
    (spadify (max2spad0 e)))
      
      
    

(import 'maxima::meval)
(import 'maxima::displa)
;(defun meval (e) (maxima::meval e))
(defun mevald (e) (maxima::displa (maxima::meval e))) 


;;; Problems with RAT (MRAT?, no way)
;;; http://def.fe.up.pt/pipermail/maxima-discuss/2010/033213.html
;;; We are going to circumvent RAT ...
(defun maxima::spadrat (a b)
   (list '(maxima::mtimes maxima::simp) 
        a (list '(maxima::mexpt maxima::simp) b -1))) 
   
;;;
;;; Maxima integrate (simple test case)
;;;
(defun maxintegrate (x v) (maxima::$integrate x v))
(defun maxdifferentiate (x v) (maxima::$diff x v))

