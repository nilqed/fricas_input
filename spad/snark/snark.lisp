;(in-package :snark)

;(export 'assertion)
;(export 'negated_conjecture)
;(export 'assume)
;(export 'prove)



(in-package :boot)

;(defvar +snark+ nil)
;(if (find-package "SNARK") (setq +snark+ t))

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

;(defun prove_with_answer (x y) (prove x :answer y))


(defun allquant    (x y) (list snark-lisp::'forall x y))
(defun exquant     (x y) (list snark-lisp::'exists x y))
(defun conjunction (x y) (list snark-lisp::'and x y))
(defun disjunction (x y) (list snark-lisp::'or x y))
(defun negation      (x) (list snark-lisp::'not x))
(defun implication (x y) (list snark-lisp::'implies x y))
(defun equivalence (x y) (list snark-lisp::'iff x y))
(defun implied_by  (x y) (list snark-lisp::'implied-by x y))

(defun predicate   (s x) (cons s x))
(defun truesym        () snark-lisp::'true)
(defun falsesym       () snark-lisp::'false)
(defun eqlterm     (x y) (list '= x y))
(defun ltterm      (x y) (list '< x y))
(defun gtterm      (x y) (list '> x y))
(defun leqterm     (x y) (list '<= x y))
(defun geqterm     (x y) (list '>= x y))





