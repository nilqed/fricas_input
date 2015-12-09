
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
         ((|r| (|List| (|String|))) (#1=#:G676 NIL) (|i| NIL) (#2=#:G675 NIL)
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

(SDEFUN |IO;readInputFile;SL;10| ((|f| |String|) ($ |List| (|String|)))
        (SPROG
         ((|l| (|List| (|String|))) (|s| (|String|)) (|f1| (|TextFile|))
          (|fi| (|FileName|)))
         (SEQ
          (LETT |fi| (SPADCALL |f| (QREFELT $ 33))
                . #1=(|IO;readInputFile;SL;10|))
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
                  (SPADCALL |f1| (QREFELT $ 39)) (EXIT |l|)))))))) 

(SDEFUN |IO;writeComment|
        ((|f| |TextFile|) (S |Stack| (|String|)) ($ |String|))
        (SPROG ((|r| (|String|)) (|s| (|String|)))
               (SEQ (LETT |r| "" . #1=(|IO;writeComment|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL S (QREFELT $ 42)) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ (LETT |s| (SPADCALL S (QREFELT $ 43)) . #1#)
                              (LETT |s|
                                    (SPADCALL |s| (|STR_to_CHAR| "-")
                                              (QREFELT $ 44))
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
                            (COND ((SPADCALL S (QREFELT $ 42)) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ (LETT |s| (SPADCALL S (QREFELT $ 43)) . #1#)
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
                            (COND ((SPADCALL S (QREFELT $ 42)) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ (LETT |s| (SPADCALL S (QREFELT $ 43)) . #1#)
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

(SDEFUN |IO;inputToNotebook;2S;14| ((|f| |String|) ($ |String|))
        (SPROG
         ((|t| (|String|)) (|s| (|String|)) (RS #1=(|Stack| (|String|)))
          (CI #1#) (CN #1#) (CO #1#) (SL #1#) (L (|List| (|String|)))
          (|f2| (|TextFile|)) (|fo| (|FileName|)))
         (SEQ
          (LETT |fo| (SPADCALL (STRCONC |f| ".ipynb") (QREFELT $ 33))
                . #2=(|IO;inputToNotebook;2S;14|))
          (EXIT
           (COND
            ((SPADCALL |fo| (QREFELT $ 34)) (|error| "File already exists."))
            ('T
             (SEQ (LETT |f2| (SPADCALL |fo| "output" (QREFELT $ 35)) . #2#)
                  (SPADCALL |f2| "{" (QREFELT $ 8))
                  (SPADCALL |f2| " \"cells\": [" (QREFELT $ 8))
                  (LETT L (SPADCALL (STRCONC |f| ".input") (QREFELT $ 40))
                        . #2#)
                  (LETT SL (SPADCALL L (QREFELT $ 45)) . #2#)
                  (LETT CO (SPADCALL NIL (QREFELT $ 45)) . #2#)
                  (LETT CN (SPADCALL NIL (QREFELT $ 45)) . #2#)
                  (LETT CI (SPADCALL NIL (QREFELT $ 45)) . #2#)
                  (LETT RS (SPADCALL NIL (QREFELT $ 45)) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL SL (QREFELT $ 42)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |s| (SPADCALL SL (QREFELT $ 43)) . #2#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND
                                     ((SPADCALL |s| (QREFELT $ 23))
                                      (COND ((SPADCALL SL (QREFELT $ 42)) 'NIL)
                                            ('T 'T)))
                                     ('T 'NIL)))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |s| (SPADCALL SL (QREFELT $ 43))
                                         . #2#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((SPADCALL SL (QREFELT $ 42)) (LETT |t| "" . #2#))
                             ('T
                              (LETT |t| (SPADCALL SL (QREFELT $ 46)) . #2#)))
                            (COND
                             ((SPADCALL |s| (QREFELT $ 16))
                              (SEQ (SPADCALL |s| CO (QREFELT $ 47))
                                   (EXIT
                                    (COND
                                     ((NULL (SPADCALL |t| (QREFELT $ 16)))
                                      (SEQ (|IO;writeComment| |f2| CO $)
                                           (EXIT
                                            (SPADCALL |f2| ","
                                                      (QREFELT $ 8))))))))))
                            (COND
                             ((SPADCALL |s| (QREFELT $ 21))
                              (SEQ (SPADCALL |s| CN (QREFELT $ 47))
                                   (EXIT
                                    (COND
                                     ((NULL (SPADCALL |t| (QREFELT $ 21)))
                                      (SEQ
                                       (SPADCALL (SPADCALL SL (QREFELT $ 43))
                                                 CN (QREFELT $ 47))
                                       (|IO;writeContinuation| |f2| CN $)
                                       (EXIT
                                        (SPADCALL |f2| ","
                                                  (QREFELT $ 8))))))))))
                            (COND
                             ((SPADCALL |s| (QREFELT $ 22))
                              (SEQ (SPADCALL |s| CI (QREFELT $ 47))
                                   (EXIT
                                    (COND
                                     ((NULL (SPADCALL |t| (QREFELT $ 22)))
                                      (SEQ (|IO;writeCode| |f2| CI $)
                                           (EXIT
                                            (SPADCALL |f2| ","
                                                      (QREFELT $ 8))))))))))
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |s| (QREFELT $ 22)))
                               (COND
                                ((NULL (SPADCALL |s| (QREFELT $ 16)))
                                 (COND
                                  ((NULL (SPADCALL |s| (QREFELT $ 21)))
                                   (SEQ (SPADCALL |s| CI (QREFELT $ 47))
                                        (EXIT
                                         (COND
                                          ((NULL (SPADCALL |t| (QREFELT $ 22)))
                                           (SEQ (|IO;writeCode| |f2| CI $)
                                                (EXIT
                                                 (SPADCALL |f2| ","
                                                           (QREFELT $
                                                                    8))))))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (COND
                   ((NULL (SPADCALL CI (QREFELT $ 42)))
                    (SEQ (|IO;writeCode| |f2| CI $)
                         (EXIT (SPADCALL |f2| "," (QREFELT $ 8))))))
                  (|IO;writeCodeCell| |f2| "--\\n-- EOF\\n--" $)
                  (SPADCALL |f2| " ]," (QREFELT $ 8))
                  (|IO;writeHeader| |f2| (SPADCALL |fo| (QREFELT $ 48)) $)
                  (SPADCALL |f2| "}" (QREFELT $ 8))
                  (SPADCALL |f2| (QREFELT $ 39))
                  (EXIT (SPADCALL |fo| (QREFELT $ 48)))))))))) 

(DECLAIM (NOTINLINE |InputOutput;|)) 

(DEFUN |InputOutput| ()
  (SPROG NIL
         (PROG (#1=#:G732)
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
          (LETT $ (GETREFV 50) . #1#)
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
              (84 . |endOfFile?|) (89 . |readLine!|) (94 . |concat|)
              (100 . |close!|) |IO;readInputFile;SL;10| (|Stack| 6)
              (105 . |empty?|) (110 . |pop!|) (115 . |leftTrim|)
              (121 . |stack|) (126 . |top|) (131 . |push!|) (137 . |coerce|)
              |IO;inputToNotebook;2S;14|)
           '#(|readInputFile| 142 |isIndent?| 147 |isEmpty?| 152
              |isContinuation?| 157 |isComment?| 162 |inputToNotebook| 167
              |combineCont| 172)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 49
                                                 '(2 7 6 0 6 8 1 6 0 9 10 2 12
                                                   0 11 11 13 2 6 0 0 12 14 1
                                                   17 0 11 18 2 6 0 0 17 19 2 6
                                                   17 0 11 20 2 6 0 0 0 24 2 26
                                                   0 25 0 27 1 17 0 6 29 2 17
                                                   15 0 0 30 1 6 0 17 31 1 32 0
                                                   6 33 1 32 15 0 34 2 7 0 32 6
                                                   35 1 7 15 0 36 1 7 6 0 37 2
                                                   26 0 0 6 38 1 7 0 0 39 1 41
                                                   15 0 42 1 41 6 0 43 2 6 0 0
                                                   17 44 1 41 0 26 45 1 41 6 0
                                                   46 2 41 6 6 0 47 1 32 6 0 48
                                                   1 0 26 6 40 1 0 15 6 22 1 0
                                                   15 6 23 1 0 15 6 21 1 0 15 6
                                                   16 1 0 6 6 49 1 0 6 26
                                                   28)))))
           '|lookupComplete|)) 

(MAKEPROP '|InputOutput| 'NILADIC T) 
