;(in-package :snark)


(in-package :boot)

(import 'snark::initialize)
(import 'snark::closure)
(import 'snark::assertion)
(import 'snark::negated_conjecture)
(import 'snark::assume)
(import 'snark::prove)
(import 'snark::run-time-limit)
(import 'snark::run-time-limit?)
(import 'snark::use-resolution)
(import 'snark::use-resolution?)
(import 'snark::use-hyperresolution)
(import 'snark::use-hyperresolution?)
(import 'snark::use-paramodulation)
(import 'snark::use-paramodulation?)


(defun allquant    (x y) (list 'snark-lisp::forall x y))
(defun exquant     (x y) (list 'snark-lisp::exists x y))
(defun conjunction (x y) (list 'snark-lisp::and x y))
(defun disjunction (x y) (list 'snark-lisp::or x y))
(defun negation      (x) (list 'snark-lisp::not x))
(defun implication (x y) (list 'snark-lisp::implies x y))
(defun equivalence (x y) (list 'snark-lisp::iff x y))
(defun implied_by  (x y) (list 'snark-lisp::implied-by x y))

(defun predicate   (s x) (cons s x))
(defun truesym        () 'snark-lisp::true)
(defun falsesym       () 'snark-lisp::false)
(defun eqlterm     (x y) (list '= x y))
(defun ltterm      (x y) (list '< x y))
(defun gtterm      (x y) (list '> x y))
(defun leqterm     (x y) (list '<= x y))
(defun geqterm     (x y) (list '>= x y))



(defun set_snark_option (opt val) 
  (let ((*package* (find-package :snark)))
     (funcall (find-symbol (string-upcase opt)) 
        (read-from-string val))))

(defun get_snark_option (opt) 
  (let ((*package* (find-package :snark)))
     (funcall (find-symbol (string-upcase 
       (concatenate 'string opt "?"))))))

(defun initialize_quiet () (snark:initialize :verbose nil))
(defun prove_with_answer (x y) (snark:prove x :answer y))



