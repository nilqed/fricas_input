
(SDEFUN |IO;writeCodeCell| ((|f| |TextFile|) (|s| |String|) ($ |String|))
        (SPROG ((|h| (|String|)))
               (SEQ (SPADCALL |f| "{" (QREFELT $ 8))
                    (SPADCALL |f| "\"cell_type\" : \"code\"," (QREFELT $ 8))
                    (SPADCALL |f| "\"execution_count\": null," (QREFELT $ 8))
                    (SPADCALL |f| "\"metadata\" : {" (QREFELT $ 8))
                    (SPADCALL |f| "    \"collapsed\" : false" (QREFELT $ 8))
                    (SPADCALL |f| "}," (QREFELT $ 8))
                    (LETT |h|
                          (SPADCALL (LIST "\"source\" : [\"" |s| "\"],")
                                    (QREFELT $ 10))
                          |IO;writeCodeCell|)
                    (SPADCALL |f| |h| (QREFELT $ 8))
                    (SPADCALL |f| "\"outputs\": []" (QREFELT $ 8))
                    (SPADCALL |f| "}" (QREFELT $ 8)) (EXIT |s|)))) 

(SDEFUN |IO;writeMarkdownCell| ((|f| |TextFile|) (|s| |String|) ($ |String|))
        (SPROG ((|h| (|String|)))
               (SEQ (SPADCALL |f| "{" (QREFELT $ 8))
                    (SPADCALL |f| "\"cell_type\" : \"markdown\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "\"metadata\" : {}," (QREFELT $ 8))
                    (LETT |h|
                          (SPADCALL (LIST "\"source\" : [\"" |s| "\"]")
                                    (QREFELT $ 10))
                          |IO;writeMarkdownCell|)
                    (SPADCALL |f| |h| (QREFELT $ 8))
                    (SPADCALL |f| "}" (QREFELT $ 8)) (EXIT |s|)))) 

(SDEFUN |IO;writeHeader| ((|f| |TextFile|) (|nb| |String|) ($ |Boolean|))
        (SPROG ((|h| (|String|)))
               (SEQ (SPADCALL |f| "\"metadata\": {" (QREFELT $ 8))
                    (SPADCALL |f| " \"kernelspec\": {" (QREFELT $ 8))
                    (SPADCALL |f| "  \"display_name\": \"FriCAS\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"language\": \"spad\"," (QREFELT $ 8))
                    (SPADCALL |f| "  \"name\": \"ifricas\"" (QREFELT $ 8))
                    (SPADCALL |f| " }," (QREFELT $ 8))
                    (SPADCALL |f| " \"language_info\": {" (QREFELT $ 8))
                    (SPADCALL |f| "  \"codemirror_mode\": \"spad\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"mimetype\": \"text/x-spad\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"name\": \"SPAD\"," (QREFELT $ 8))
                    (SPADCALL |f| "  \"pygments_lexer\": \"spad\","
                              (QREFELT $ 8))
                    (SPADCALL |f| "  \"version\": \"1.2.6\"" (QREFELT $ 8))
                    (SPADCALL |f| " }," (QREFELT $ 8))
                    (LETT |h|
                          (SPADCALL (LIST " \"name\": \"" |nb| "\"")
                                    (QREFELT $ 10))
                          |IO;writeHeader|)
                    (SPADCALL |f| |h| (QREFELT $ 8))
                    (SPADCALL |f| "}," (QREFELT $ 8))
                    (SPADCALL |f| "\"nbformat\": 4," (QREFELT $ 8))
                    (SPADCALL |f| "\"nbformat_minor\": 0" (QREFELT $ 8))
                    (EXIT 'T)))) 

(SDEFUN |IO;isComment?;SB;4| ((|s| |String|) ($ |Boolean|))
        (COND
         ((OR (< (QCSIZE |s|) 2)
              (NULL
               (OR
                (EQUAL
                 (SPADCALL |s| (SPADCALL 1 2 (QREFELT $ 13)) (QREFELT $ 14))
                 "--")
                (EQUAL
                 (SPADCALL |s| (SPADCALL 1 2 (QREFELT $ 13)) (QREFELT $ 14))
                 "++"))))
          'NIL)
         ('T 'T))) 

(SDEFUN |IO;isContinuation?;SB;5| ((|s| |String|) ($ |Boolean|))
        (SEQ
         (LETT |s| (SPADCALL |s| (SPADCALL 32 (QREFELT $ 18)) (QREFELT $ 19))
               |IO;isContinuation?;SB;5|)
         (EXIT
          (COND
           ((OR (EQUAL |s| "")
                (NULL
                 (|eql_SI| (SPADCALL |s| (QCSIZE |s|) (QREFELT $ 20))
                           (|STR_to_CHAR| "_"))))
            'NIL)
           ('T 'T))))) 

(SDEFUN |IO;isIndent?;SB;6| ((|s| |String|) ($ |Boolean|))
        (COND
         ((OR (EQUAL |s| "")
              (OR (SPADCALL |s| (QREFELT $ 21))
                  (NULL
                   (|eql_SI| (SPADCALL |s| 1 (QREFELT $ 20))
                             (SPADCALL 32 (QREFELT $ 18))))))
          'NIL)
         ('T 'T))) 

(SDEFUN |IO;isEmpty?;SB;7| ((|s| |String|) ($ |Boolean|))
        (COND ((EQUAL |s| "") 'T) ('T 'NIL))) 

(SDEFUN |IO;combineCont;LS;8| ((|l| |List| (|String|)) ($ |String|))
        (SPROG
         ((|ll| (|List| (|String|))) (|cnt| (|Mapping| (|String|) (|String|))))
         (SEQ
          (LETT |cnt| (CONS #'|IO;combineCont;LS;8!0| $)
                . #1=(|IO;combineCont;LS;8|))
          (LETT |ll| (SPADCALL |cnt| |l| (QREFELT $ 27)) . #1#)
          (EXIT (SPADCALL |ll| (QREFELT $ 10)))))) 

(SDEFUN |IO;combineCont;LS;8!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (SPADCALL 32 (QREFELT $ 18)) (QREFELT $ 19))
                  "\\n" (QREFELT $ 24))) 

(SDEFUN |IO;escapeQM| ((|s| |String|) ($ |String|))
        (SPROG
         ((|r| (|List| (|String|))) (#1=#:G679 NIL) (|i| NIL) (#2=#:G678 NIL)
          (|esc| (|Mapping| (|String|) (|Character|))))
         (SEQ (LETT |esc| (CONS #'|IO;escapeQM!0| $) . #3=(|IO;escapeQM|))
              (LETT |r|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |i| 1 . #3#) (LETT #1# (QCSIZE |s|) . #3#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (SPADCALL |s| |i| (QREFELT $ 20))
                                             |esc|)
                                   #2#)
                                  . #3#)))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |r| (QREFELT $ 10)))))) 

(SDEFUN |IO;escapeQM!0| ((|x| NIL) ($ NIL))
        (COND
         ((SPADCALL |x| (SPADCALL "\"" (QREFELT $ 29)) (QREFELT $ 30)) "\\\"")
         ('T (SPADCALL |x| (QREFELT $ 31))))) 

(SDEFUN |IO;inputToNotebook;2S;10| ((|f| |String|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|l| (|List| (|String|))) (|f2| #1=(|TextFile|))
          (|fo| (|FileName|)) (|f1| #1#) (|fi| (|FileName|)))
         (SEQ
          (LETT |fi| (SPADCALL (STRCONC |f| ".input") (QREFELT $ 33))
                . #2=(|IO;inputToNotebook;2S;10|))
          (EXIT
           (COND
            ((NOT (SPADCALL |fi| (QREFELT $ 34))) (|error| "No such file."))
            (#3='T
             (SEQ (LETT |f1| (SPADCALL |fi| "input" (QREFELT $ 35)) . #2#)
                  (LETT |fo| (SPADCALL (STRCONC |f| ".ipynb") (QREFELT $ 33))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |fo| (QREFELT $ 34))
                     (|error| "File already exists."))
                    (#3#
                     (SEQ
                      (LETT |f2| (SPADCALL |fo| "output" (QREFELT $ 35)) . #2#)
                      (SPADCALL |f2| "{" (QREFELT $ 8))
                      (SPADCALL |f2| " \"cells\": [" (QREFELT $ 8))
                      (LETT |l| NIL . #2#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((SPADCALL |f1| (QREFELT $ 36)) 'NIL)
                                    ('T 'T)))
                             (GO G191)))
                           (SEQ (LETT |s| (SPADCALL |f1| (QREFELT $ 37)) . #2#)
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (COND
                                         ((SPADCALL |s| (QREFELT $ 21))
                                          (NOT (SPADCALL |f1| (QREFELT $ 36))))
                                         ('T 'NIL)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |l|
                                            (SPADCALL |l| |s| (QREFELT $ 38))
                                            . #2#)
                                      (EXIT
                                       (LETT |s| (SPADCALL |f1| (QREFELT $ 37))
                                             . #2#)))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (COND
                                 ((SPADCALL |l| NIL (QREFELT $ 39))
                                  (SEQ
                                   (LETT |s|
                                         (SPADCALL
                                          (SPADCALL |l| |s| (QREFELT $ 38))
                                          (QREFELT $ 28))
                                         . #2#)
                                   (EXIT (LETT |l| NIL . #2#)))))
                                (LETT |s| (|IO;escapeQM| |s| $) . #2#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |s| (QREFELT $ 16))
                                   (SEQ
                                    (LETT |s|
                                          (SPADCALL |s|
                                                    (SPADCALL 3 (QCSIZE |s|)
                                                              (QREFELT $ 13))
                                                    (QREFELT $ 14))
                                          . #2#)
                                    (LETT |s|
                                          (|IO;writeMarkdownCell| |f2| |s| $)
                                          . #2#)
                                    (EXIT (SPADCALL |f2| "," (QREFELT $ 8)))))
                                  ((SPADCALL |s| "" (QREFELT $ 40))
                                   (SEQ
                                    (LETT |s| (|IO;writeCodeCell| |f2| |s| $)
                                          . #2#)
                                    (EXIT
                                     (SPADCALL |f2| "," (QREFELT $ 8))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (|IO;writeCodeCell| |f2| "" $)
                      (SPADCALL |f2| " ]," (QREFELT $ 8))
                      (|IO;writeHeader| |f2| (SPADCALL |fo| (QREFELT $ 41)) $)
                      (SPADCALL |f2| "}" (QREFELT $ 8))
                      (SPADCALL |f1| (QREFELT $ 42))
                      (SPADCALL |f2| (QREFELT $ 42))
                      (EXIT (SPADCALL |fo| (QREFELT $ 41)))))))))))))) 

(SDEFUN |IO;readInputFile;SL;11| ((|f| |String|) ($ |List| (|String|)))
        (SPROG
         ((|l| (|List| (|String|))) (|s| (|String|)) (|f1| (|TextFile|))
          (|fi| (|FileName|)))
         (SEQ
          (LETT |fi| (SPADCALL |f| (QREFELT $ 33))
                . #1=(|IO;readInputFile;SL;11|))
          (EXIT
           (COND
            ((NOT (SPADCALL |fi| (QREFELT $ 34))) (|error| "No such file."))
            ('T
             (SEQ (LETT |f1| (SPADCALL |fi| "input" (QREFELT $ 35)) . #1#)
                  (LETT |l| NIL . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |f1| (QREFELT $ 36)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |s| (SPADCALL |f1| (QREFELT $ 37)) . #1#)
                            (LETT |s| (|IO;escapeQM| |s| $) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |s| (QREFELT $ 38))
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (SPADCALL |f1| (QREFELT $ 42)) (EXIT |l|)))))))) 

(SDEFUN |IO;writeComment|
        ((|f| |TextFile|) (S |Stack| (|String|)) ($ |String|))
        (SPROG ((|r| (|String|)) (|s| (|String|)))
               (SEQ (LETT |r| "" . #1=(|IO;writeComment|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL S (QREFELT $ 46)) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ (LETT |s| (SPADCALL S (QREFELT $ 47)) . #1#)
                              (LETT |s|
                                    (SPADCALL |s| (|STR_to_CHAR| "-")
                                              (QREFELT $ 48))
                                    . #1#)
                              (LETT |s| (STRCONC |s| "\\n") . #1#)
                              (EXIT (LETT |r| (STRCONC |s| |r|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (|IO;writeMarkdownCell| |f| |r| $))))) 

(SDEFUN |IO;writeContinuation|
        ((|f| |TextFile|) (S |Stack| (|String|)) ($ |String|))
        (SPROG ((|r| (|String|)) (|s| (|String|)))
               (SEQ (LETT |r| "" . #1=(|IO;writeContinuation|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL S (QREFELT $ 46)) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ (LETT |s| (SPADCALL S (QREFELT $ 47)) . #1#)
                              (LETT |s| (STRCONC |s| "\\n") . #1#)
                              (EXIT (LETT |r| (STRCONC |s| |r|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (|IO;writeCodeCell| |f| |r| $))))) 

(SDEFUN |IO;writeCode| ((|f| |TextFile|) (S |Stack| (|String|)) ($ |String|))
        (SPROG ((|r| (|String|)) (|s| (|String|)))
               (SEQ (LETT |r| "" . #1=(|IO;writeCode|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL S (QREFELT $ 46)) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ (LETT |s| (SPADCALL S (QREFELT $ 47)) . #1#)
                              (LETT |s| (STRCONC |s| "\\n") . #1#)
                              (EXIT (LETT |r| (STRCONC |s| |r|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |r|
                          (SPADCALL |r|
                                    (SPADCALL 1 (- (QCSIZE |r|) 2)
                                              (QREFELT $ 13))
                                    (QREFELT $ 14))
                          . #1#)
                    (EXIT (|IO;writeCodeCell| |f| |r| $))))) 

(SDEFUN |IO;inputToIPyNB;2S;15| ((|f| |String|) ($ |String|))
        (SPROG
         ((#1=#:G750 NIL) (|s| (|String|)) (RS #2=(|Stack| (|String|)))
          (CI #2#) (CN #2#) (CO #2#) (SL #2#) (L (|List| (|String|)))
          (|f2| (|TextFile|)) (|fo| (|FileName|)))
         (SEQ
          (LETT |fo| (SPADCALL (STRCONC |f| ".ipynb") (QREFELT $ 33))
                . #3=(|IO;inputToIPyNB;2S;15|))
          (EXIT
           (COND
            ((SPADCALL |fo| (QREFELT $ 34)) (|error| "File already exists."))
            ('T
             (SEQ (LETT |f2| (SPADCALL |fo| "output" (QREFELT $ 35)) . #3#)
                  (SPADCALL |f2| "{" (QREFELT $ 8))
                  (SPADCALL |f2| " \"cells\": [" (QREFELT $ 8))
                  (LETT L (SPADCALL (STRCONC |f| ".input") (QREFELT $ 44))
                        . #3#)
                  (LETT SL (SPADCALL L (QREFELT $ 49)) . #3#)
                  (LETT CO (SPADCALL NIL (QREFELT $ 49)) . #3#)
                  (LETT CN (SPADCALL NIL (QREFELT $ 49)) . #3#)
                  (LETT CI (SPADCALL NIL (QREFELT $ 49)) . #3#)
                  (LETT RS (SPADCALL NIL (QREFELT $ 49)) . #3#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL SL (QREFELT $ 46)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |s| (SPADCALL SL (QREFELT $ 47)) . #3#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND
                                     ((SPADCALL |s| (QREFELT $ 23))
                                      (COND ((SPADCALL SL (QREFELT $ 46)) 'NIL)
                                            ('T 'T)))
                                     ('T 'NIL)))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |s| (SPADCALL SL (QREFELT $ 47))
                                         . #3#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (SEQ
                              (EXIT
                               (SEQ G190 (COND ((NULL 'T) (GO G191)))
                                    (SEQ
                                     (COND
                                      ((SPADCALL |s| (QREFELT $ 16))
                                       (SEQ (SPADCALL |s| CO (QREFELT $ 50))
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #3#)
                                              (GO #4=#:G742))))))
                                     (COND
                                      ((NULL (SPADCALL CO (QREFELT $ 46)))
                                       (SEQ (|IO;writeComment| |f2| CO $)
                                            (EXIT
                                             (SPADCALL |f2| ","
                                                       (QREFELT $ 8))))))
                                     (COND
                                      ((SPADCALL |s| (QREFELT $ 21))
                                       (SEQ (SPADCALL |s| CN (QREFELT $ 50))
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #3#)
                                              (GO #4#))))))
                                     (COND
                                      ((NULL (SPADCALL CN (QREFELT $ 46)))
                                       (SEQ (SPADCALL |s| CN (QREFELT $ 50))
                                            (|IO;writeContinuation| |f2| CN $)
                                            (SPADCALL |f2| "," (QREFELT $ 8))
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #3#)
                                              (GO #4#))))))
                                     (COND
                                      ((SPADCALL |s| (QREFELT $ 22))
                                       (COND
                                        ((NULL (SPADCALL CI (QREFELT $ 46)))
                                         (SEQ (SPADCALL |s| CI (QREFELT $ 50))
                                              (EXIT
                                               (PROGN
                                                (LETT #1# |$NoValue| . #3#)
                                                (GO #4#))))))))
                                     (COND
                                      ((NULL (SPADCALL CI (QREFELT $ 46)))
                                       (SEQ (|IO;writeCode| |f2| CI $)
                                            (EXIT
                                             (SPADCALL |f2| ","
                                                       (QREFELT $ 8))))))
                                     (SPADCALL |s| CI (QREFELT $ 50))
                                     (EXIT
                                      (PROGN
                                       (LETT #1# |$NoValue| . #3#)
                                       (GO #4#))))
                                    NIL (GO G190) G191 (EXIT NIL)))
                              #4# (EXIT #1#))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (COND
                   ((NULL (SPADCALL CI (QREFELT $ 46)))
                    (SEQ (|IO;writeCode| |f2| CI $)
                         (EXIT (SPADCALL |f2| "," (QREFELT $ 8))))))
                  (|IO;writeCodeCell| |f2| "" $)
                  (SPADCALL |f2| " ]," (QREFELT $ 8))
                  (|IO;writeHeader| |f2| (SPADCALL |fo| (QREFELT $ 41)) $)
                  (SPADCALL |f2| "}" (QREFELT $ 8))
                  (SPADCALL |f2| (QREFELT $ 42))
                  (EXIT (SPADCALL |fo| (QREFELT $ 41)))))))))) 

(DECLAIM (NOTINLINE |InputOutput;|)) 

(DEFUN |InputOutput| ()
  (SPROG NIL
         (PROG (#1=#:G752)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InputOutput|)
                    . #2=(|InputOutput|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InputOutput|
                             (LIST (CONS NIL (CONS 1 (|InputOutput;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|InputOutput|)))))))))) 

(DEFUN |InputOutput;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InputOutput|) . #1=(|InputOutput|))
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InputOutput| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InputOutput| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|TextFile|)
              (0 . |writeLine!|) (|List| $) (6 . |concat|) (|Integer|)
              (|UniversalSegment| 11) (11 . SEGMENT) (17 . |elt|) (|Boolean|)
              |IO;isComment?;SB;4| (|Character|) (23 . |char|)
              (28 . |rightTrim|) (34 . |elt|) |IO;isContinuation?;SB;5|
              |IO;isIndent?;SB;6| |IO;isEmpty?;SB;7| (40 . |concat|)
              (|Mapping| 6 6) (|List| 6) (46 . |map|) |IO;combineCont;LS;8|
              (52 . |char|) (57 . =) (63 . |coerce|) (|FileName|)
              (68 . |coerce|) (73 . |exists?|) (78 . |open|)
              (84 . |endOfFile?|) (89 . |readLine!|) (94 . |concat|) (100 . ~=)
              (106 . ~=) (112 . |coerce|) (117 . |close!|)
              |IO;inputToNotebook;2S;10| |IO;readInputFile;SL;11| (|Stack| 6)
              (122 . |empty?|) (127 . |pop!|) (132 . |leftTrim|)
              (138 . |stack|) (143 . |push!|) |IO;inputToIPyNB;2S;15|)
           '#(|readInputFile| 149 |isIndent?| 154 |isEmpty?| 159
              |isContinuation?| 164 |isComment?| 169 |inputToNotebook| 174
              |inputToIPyNB| 179 |combineCont| 184)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(2 7 6 0 6 8 1 6 0 9 10 2 12
                                                   0 11 11 13 2 6 0 0 12 14 1
                                                   17 0 11 18 2 6 0 0 17 19 2 6
                                                   17 0 11 20 2 6 0 0 0 24 2 26
                                                   0 25 0 27 1 17 0 6 29 2 17
                                                   15 0 0 30 1 6 0 17 31 1 32 0
                                                   6 33 1 32 15 0 34 2 7 0 32 6
                                                   35 1 7 15 0 36 1 7 6 0 37 2
                                                   26 0 0 6 38 2 26 15 0 0 39 2
                                                   6 15 0 0 40 1 32 6 0 41 1 7
                                                   0 0 42 1 45 15 0 46 1 45 6 0
                                                   47 2 6 0 0 17 48 1 45 0 26
                                                   49 2 45 6 6 0 50 1 0 26 6 44
                                                   1 0 15 6 22 1 0 15 6 23 1 0
                                                   15 6 21 1 0 15 6 16 1 0 6 6
                                                   43 1 0 6 6 51 1 0 6 26
                                                   28)))))
           '|lookupComplete|)) 

(MAKEPROP '|InputOutput| 'NILADIC T) 
