
(PUT '|MAXIMA;inputForm;$If;1| '|SPADreplace| 'QCAR) 

(SDEFUN |MAXIMA;inputForm;$If;1| ((|x| $) ($ |InputForm|)) (QCAR |x|)) 

(PUT '|MAXIMA;maximaForm;$If;2| '|SPADreplace| 'QCDR) 

(SDEFUN |MAXIMA;maximaForm;$If;2| ((|x| $) ($ |InputForm|)) (QCDR |x|)) 

(SDEFUN |MAXIMA;coerce;E$;3| ((|x| |Expression| R) ($ $))
        (SPROG ((|y| (|InputForm|)))
               (SEQ
                (LETT |y| (SPADCALL |x| (QREFELT $ 11)) |MAXIMA;coerce;E$;3|)
                (EXIT (CONS |y| (SPAD2MAX |y|)))))) 

(SDEFUN |MAXIMA;coerce;L$;4| ((|x| |List| $) ($ $))
        (SPROG
         ((|y| (|InputForm|)) (|u| (|List| (|InputForm|))) (#1=#:G1223 NIL)
          (|z| NIL) (#2=#:G1222 NIL) (|lst| (|InputForm|)))
         (SEQ
          (LETT |lst| (SPADCALL '|construct| (QREFELT $ 14))
                . #3=(|MAXIMA;coerce;L$;4|))
          (LETT |u|
                (CONS |lst|
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |z| NIL . #3#) (LETT #1# |x| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |z| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #2# (CONS (QCAR |z|) #2#) . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))
                . #3#)
          (LETT |y| (SPADCALL |u| (QREFELT $ 16)) . #3#)
          (EXIT (CONS |y| (SPAD2MAX |y|)))))) 

(SDEFUN |MAXIMA;coerce;L$;5| ((|x| |List| (|Expression| R)) ($ $))
        (SPROG ((|y| (|InputForm|)))
               (SEQ
                (LETT |y| (SPADCALL |x| (QREFELT $ 19)) |MAXIMA;coerce;L$;5|)
                (EXIT (CONS |y| (SPAD2MAX |y|)))))) 

(SDEFUN |MAXIMA;coerce;E$;6| ((|x| |Equation| (|Expression| R)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 22)) (QREFELT $ 12))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 12))
                  (QREFELT $ 24))) 

(SDEFUN |MAXIMA;=;3$;7| ((|x| $) (|y| $) ($ $))
        (SPROG ((|a| (|InputForm|)))
               (SEQ (LETT |a| (LIST '= (QCAR |x|) (QCAR |y|)) |MAXIMA;=;3$;7|)
                    (EXIT (CONS |a| (SPAD2MAX |a|)))))) 

(SDEFUN |MAXIMA;coerce;$Of;8| ((|x| $) ($ |OutputForm|))
        (SPADCALL (QCDR |x|) (QREFELT $ 27))) 

(DECLAIM (NOTINLINE |MaximaExpr;|)) 

(DEFUN |MaximaExpr| (#1=#:G1231)
  (SPROG NIL
         (PROG (#2=#:G1232)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|MaximaExpr|)
                                               '|domainEqualList|)
                    . #3=(|MaximaExpr|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|MaximaExpr;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|MaximaExpr|)))))))))) 

(DEFUN |MaximaExpr;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MaximaExpr|))
          (LETT |dv$| (LIST '|MaximaExpr| DV$1) . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MaximaExpr| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |inp| (|InputForm|))
                              (|:| |max| (|InputForm|))))
          $))) 

(MAKEPROP '|MaximaExpr| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InputForm|) (|local| |#1|) '|Rep|
              |MAXIMA;inputForm;$If;1| |MAXIMA;maximaForm;$If;2|
              (|Expression| 6) (0 . |convert|) |MAXIMA;coerce;E$;3| (|Symbol|)
              (5 . |convert|) (|List| $) (10 . |convert|) |MAXIMA;coerce;L$;4|
              (|List| 10) (15 . |convert|) |MAXIMA;coerce;L$;5| (|Equation| 10)
              (20 . |lhs|) (25 . |rhs|) |MAXIMA;=;3$;7| |MAXIMA;coerce;E$;6|
              (|OutputForm|) (30 . |coerce|) |MAXIMA;coerce;$Of;8|)
           '#(|maximaForm| 35 |inputForm| 40 |convert| 45 |coerce| 50 = 75)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS '#((|CoercibleTo| 26) (|ConvertibleTo| 5))
                             (|makeByteWordVec2| 28
                                                 '(1 10 5 0 11 1 5 0 13 14 1 5
                                                   0 15 16 1 18 5 0 19 1 21 10
                                                   0 22 1 21 10 0 23 1 5 26 0
                                                   27 1 0 5 0 9 1 0 5 0 8 1 0 5
                                                   0 1 1 0 0 21 25 1 0 0 18 20
                                                   1 0 0 15 17 1 0 0 10 12 1 0
                                                   26 0 28 2 0 0 0 0 24)))))
           '|lookupComplete|)) 
