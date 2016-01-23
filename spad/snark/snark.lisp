(in-package :snark)
(defun snarkassert (x) (apply 'assert (list x)))
(defun snarkassert2 (x y) (apply 'assert '(x :name y)))
(defun snarkprove (x) (apply 'prove (list x)))
(export 'snarkassert)
(export 'snarkassert2)
(export 'snarkprove)
(export 'assertion)
(export 'negated_conjecture)
(export 'assume)
(export 'prove)

(in-package :boot)

;(defvar +snark+ nil)
;(if (find-package "SNARK") (setq +snark+ t))
(import 'snark::snarkassert)
(import 'snark::snarkassert2)
(import 'snark::snarkprove)
(import 'snark::assertion)
(import 'snark::negated_conjecture)
(import 'snark::assume)
(import 'snark::prove)

;(shadow 'row)
;(shadow '&)
;(shadow '(|$false| |$true| |type|))
;(shadow '(=> ~))
;(shadow '(VAR ARGS |file| EMBED ZERO _ ?))
;(shadow '(DEQUEUE IFF IMPLIES IMPLIED-BY FORALL FALSE EXISTS QUIT COLLECT))
;(shadow '(NONE TRUE))
;(use-package :snark-lisp)
;(use-package :snark-deque)
;(use-package :snark-sparse-array)
;(use-package :snark-dpll)
;(use-package :snark)



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


