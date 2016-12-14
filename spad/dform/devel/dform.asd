(in-package :common-lisp-user)

(asdf:defsystem #:dform
  :serial t
  :description "FriCAS package :: Differential Forms - based on DeRhamComplex"
  :version "1.0.0"
  :author "Kurt Pagani, <nilqed@gmail.com>"
  :license "BSD, see file LICENSE"
  :pathname "src/"
  :components ((:file "dform")))
