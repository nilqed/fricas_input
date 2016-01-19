(in-package :snark)
(defun snarkassert (x) (assert x))
(export 'snarkassert)

(in-package :boot)

(defvar +snark+ nil)
(if (find-package "SNARK") (setq +snark+ t))
(import 'snark::snarkassert)

(defun allquant (x y) (list 'forall x y))
(defun exquant (x y) (list 'exists x y))
(defun conjunction (x y) (list 'and x y))
(defun disjunction (x y) (list 'or x y))
(defun negation (x) (list 'not x))
(defun implication (x y) (list 'implies x y))
(defun equivalence (x y) (list 'iff x y))
(defun implied_by (x y) (list 'implied-by x y))

(defun predicate(s x) (cons s x))
(defun truesym () 'true)
(defun falsesym () 'false)
(defun eqlterm (x y) (list '= x y))
(defun ltterm (x y) (list '< x y))
(defun gtterm (x y) (list '> x y))
(defun leqterm (x y) (list '<= x y))
(defun geqterm (x y) (list '>= x y))
(defun tell (x y) (list 'assert x :name y))

