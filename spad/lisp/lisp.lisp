(defun my_getenv (name &optional default)
    #+CMU
    (let ((x (assoc name ext:*environment-list*
                    :test #'string=)))
      (if x (cdr x) default))
    #-CMU
    (or
     #+Allegro (sys:getenv name)
     #+CCL (ccl:getenv name)
     #+CLISP (ext:getenv name)
     #+ECL (si:getenv name)
     #+SBCL (sb-ext::posix-getenv name)
     #+LISPWORKS (lispworks:environment-variable name)
     default))

(defun list_ext_symbols (p)
  (let (symbols)
    (do-external-symbols (s (find-package p))
      (push s symbols))
   symbols))

(defun list_all_symbols (p)
  (let (symbols)
    (do-symbols (s (find-package p))
      (push s symbols))
   symbols))

