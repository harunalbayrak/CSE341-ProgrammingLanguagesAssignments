;;; Harun ALBAYRAK
;;; CSE 341 -Programming Languages - Homework#2

(defparameter *count* 0)

(defun check-string-p (*strl* *op-str* *kw-op-str* my-stream *nn*)
    (if (string= *strl* *op-str*) 
        (progn
            ;;(format t "~d ~%" *kw-op-str*)
            (princ *kw-op-str* my-stream)
            (princ #\linefeed my-stream)
            (setf *num* *nn*)
            (string *kw-op-str*)
        )
    )
)

(defun check (*my-string* my-stream)
    (defparameter *list* (list))
    (defparameter *flag* 0)
    (defparameter *num* 0)
    (defparameter *num2* 0)
    (defparameter *length-1* (- (length *my-string*) 1))
    (defparameter *mylist* '())

    (loop for x from 0 to *length-1*
        do (setf *num2* 1)

        (if (string= (char *my-string* x) ";")
            (progn
                (push ";;" *list*)
                (return)
            )
        )

        (if (string= (char *my-string* x) "(")
            (progn
                (push (subseq *my-string* x (+ x 1)) *list*)
                (setf *flag* (+ x 1))
                (setf *num* 1)
            )
        )

        (if (or (string= (char *my-string* x) "+") (string= (char *my-string* x) "-")
            (string= (char *my-string* x) "**") (string= (char *my-string* x) "/")
            (string= (char *my-string* x) "?") (string= (char *my-string* x) "%")
            (string= (char *my-string* x) "!") (string= (char *my-string* x) "#")
            (string= (char *my-string* x) "½") (string= (char *my-string* x) "^")
            (string= (char *my-string* x) ".") (string= (char *my-string* x) "€")
            (string= (char *my-string* x) "{") (string= (char *my-string* x) "}")
            (string= (char *my-string* x) "&") (string= (char *my-string* x) "[")
            (string= (char *my-string* x) "]") (string= (char *my-string* x) "*")
            (string= (char *my-string* x) "$") (string= (char *my-string* x) "\\"))
            (progn
                (push (subseq *my-string* *flag* x) *list*)
                (push (subseq *my-string* x (+ x 1)) *list*)
                (setf *flag* (+ x 1))
                (setf *num* 4)
            )
        )

        (if (string= (char *my-string* x) " ")
            (progn
                (push (subseq *my-string* *flag* x) *list*)
                (setf *flag* (+ x 1))
                (setf *num* 2)
            )
        )

        (if (string= (char *my-string* x) ")")
            (progn
                (push (subseq *my-string* *flag* x) *list*)
                (push (subseq *my-string* x (+ x 1)) *list*)
                (setf *flag* (+ x 1))
                (setf *num* 3)
            )
        )

        (if (= x *length-1*)
            (progn
                (if (= *num* 0)
                    (push (subseq *my-string* 0 (+ x 1)) *list*)
                )
                (if (= *num* 4)
                    (push (subseq *my-string* *flag* (+ x 1)) *list*)
                )
            )
            
        )
    )

    (if (= *num2* 0)
        (progn
            (setf *count* (+ *count* 1))
            (if (= *count* 1)
                (exit)
            )
        )
    )

    (setf *list* (reverse *list*))
    ;(format t "~d ~%" *list*)
    (defparameter *length-1a* (- (length *list*) 1))

    ;(loop for x from 0 to *length-1a* do
     ; ;;(format t "~a ~%" (nth x *list*))
    ;)


    (loop for x from 0 to *length-1a* do
        (setf (nth x *list*) (string-upcase (nth x *list*)))
        (setf *num* 0)

        (if (= (length (nth x *list*)) 0) 
            (setf *num* 99)
        )
        
        (if (not (equal (check-string-p (nth x *list*) "LIST" "KW_LIST" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "LIST" "KW_LIST" my-stream 4) *mylist*))  
        (if (not (equal (check-string-p (nth x *list*) "DEFFUN" "KW_DEFFUN" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "DEFFUN" "KW_DEFFUN" my-stream 4) *mylist*))  
        (if (not (equal (check-string-p (nth x *list*) "AND" "KW_AND" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "AND" "KW_AND" my-stream 4) *mylist*))  
        (if (not (equal (check-string-p (nth x *list*) "OR" "KW_OR" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "OR" "KW_OR" my-stream 4) *mylist*))  
        (if (not (equal (check-string-p (nth x *list*) "NOT" "KW_NOT" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "NOT" "KW_NOT" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "EQUAL" "KW_EQUAL" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "EQUAL" "KW_EQUAL" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "LESS" "KW_LESS" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "LESS" "KW_LESS" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "NIL" "KW_NIL" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "NIL" "KW_NIL" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "APPEND" "KW_APPEND" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "APPEND" "KW_APPEND" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "CONCAT" "KW_CONCAT" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "CONCAT" "KW_CONCAT" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "SET" "KW_SET" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "SET" "KW_SET" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "FOR" "KW_FOR" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "FOR" "KW_FOR" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "IF" "KW_IF" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "IF" "KW_IF" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "EXIT" "KW_EXIT" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "EXIT" "KW_EXIT" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "LOAD" "KW_LOAD" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "LOAD" "KW_LOAD" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "DISP" "KW_DISP" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "DISP" "KW_DISP" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "TRUE" "KW_TRUE" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "TRUE" "KW_TRUE" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "FALSE" "KW_FALSE" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "FALSE" "KW_FALSE" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "(" "OP_OP" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "(" "OP_OP" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) ")" "OP_CP" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) ")" "OP_CP" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "+" "OP_PLUS" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "+" "OP_PLUS" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "-" "OP_MINUS" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "-" "OP_MINUS" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "/" "OP_DIV" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "/" "OP_DIV" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "*" "OP_MULT" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "*" "OP_MULT" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "**" "OP_DBMULT" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "**" "OP_DBMULT" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "“" "OP_OC" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "“" "OP_OC" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "”" "OP_CC" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "”" "OP_CC" my-stream 4) *mylist*)) 
        (if (not (equal (check-string-p (nth x *list*) "," "OP_COMMA" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "," "OP_COMMA" my-stream 4) *mylist*))   
        (if (not (equal (check-string-p (nth x *list*) "0" "VALUE" my-stream 4) NIL))
            (push (check-string-p (nth x *list*) "0" "VALUE" my-stream 4) *mylist*))   

        (if (and (= *num* 0) (string= (char (nth x *list*) 0) ";") (string= (char (nth x *list*) 1) ";"))
            (progn
                ;;(format t "COMMENT ~%")
                (princ "COMMENT" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 5)
                (push "COMMENT" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "+") (digit-char-p (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_PLUS ~%")
                ;;(format t "VALUE ~%")
                (princ "OP_PLUS" my-stream)
                (princ #\linefeed my-stream)
                (princ "VALUE" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 6)
                (push "OP_PLUS" *mylist*)
                (push "VALUE" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "-") (digit-char-p (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_MINUS ~%")
                ;;(format t "VALUE ~%")
                (princ "OP_MINUS" my-stream)
                (princ #\linefeed my-stream)
                (princ "VALUE" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 7)
                (push "OP_MINUS" *mylist*)
                (push "VALUE" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "*") (digit-char-p (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_MULT ~%")
                ;;(format t "VALUE ~%")
                (princ "OP_MULT" my-stream)
                (princ #\linefeed my-stream)
                (princ "VALUE" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 8)
                (push "OP_MULT" *mylist*)
                (push "VALUE" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "/") (digit-char-p (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_DIV ~%")
                ;;(format t "VALUE ~%")
                (princ "OP_DIV" my-stream)
                (princ #\linefeed my-stream)
                (princ "VALUE" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 9)
                (push "OP_DIV" *mylist*)
                (push "VALUE" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "+") (alphanumericp (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_PLUS ~%")
                ;;(format t "IDENTIFIER ~%")
                (princ "OP_PLUS" my-stream)
                (princ #\linefeed my-stream)
                (princ "IDENTIFIER" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 10)
                (push "OP_PLUS" *mylist*)
                (push "IDENTIFIER" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "-") (alphanumericp (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_MINUS ~%")
                ;;(format t "IDENTIFIER ~%")
                (princ "OP_MINUS" my-stream)
                (princ #\linefeed my-stream)
                (princ "IDENTIFIER" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 11)
                (push "OP_MINUS" *mylist*)
                (push "IDENTIFIER" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "*") (alphanumericp (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_MULT ~%")
                ;;(format t "IDENTIFIER ~%")
                (princ "OP_MULT" my-stream
                (princ #\linefeed my-stream))
                (princ "IDENTIFIER" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 12)
                (push "OP_MULT" *mylist*)
                (push "IDENTIFIER" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "/") (alphanumericp (char (nth x *list*) 1)))
            (progn
                ;;(format t "OP_DIV ~%")
                ;;(format t "IDENTIFIER ~%")
                (princ "OP_DIV" my-stream)
                (princ #\linefeed my-stream)
                (princ "IDENTIFIER" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 13)
                (push "OP_DIV" *mylist*)
                (push "IDENTIFIER" *mylist*)
            )
        )
        (if (and (= *num* 0) (string= (char (nth x *list*) 0) "0") (digit-char-p (char (nth x *list*) 1)))
            (progn
                ;;(format t "SYNTAX ERROR ~%")
                (princ "SYNTAX_ERROR" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 16)
                (push "SYNTAX_ERROR" mylist)
            )
        )
        (if (and (every #'digit-char-p (nth x *list*)) (= *num* 0))
            (progn
                ;;(format t "VALUE ~%")
                (princ "VALUE" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 14)
                (push "VALUE" *mylist*)
            )
        )
        (if (and (= *num* 0) (digit-char-p (char (nth x *list*) 0)) 
            (or (alpha-char-p (char (nth x *list*) 1)) (alpha-char-p (char (nth x *list*) 2))
            (alpha-char-p (char (nth x *list*) 3)) (alpha-char-p (char (nth x *list*) 4))
            (alpha-char-p (char (nth x *list*) 5)) (alpha-char-p (char (nth x *list*) 6))
            (alpha-char-p (char (nth x *list*) 7)) (alpha-char-p (char (nth x *list*) 8)) ))
            (progn
                ;;(format t "SYNTAX ERROR ~%")
                (princ "SYNTAX_ERROR" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 16)
                (push "SYNTAX_ERROR" *mylist*)
            )
        )
        (if (and (every #'alphanumericp (nth x *list*)) (= *num* 0))
            (progn
                ;;(format t "IDENTIFIER ~%")
                (princ "IDENTIFIER" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 15)
                (push "IDENTIFIER" *mylist*)
            )
        )
        (if (= *num* 0)
            (progn
                ;;(format t "SYNTAX ERROR ~%")
                (princ "SYNTAX_ERROR" my-stream)
                (princ #\linefeed my-stream)
                (setf *num* 16)
                (push "SYNTAX_ERROR" *mylist*)
            )
        )
    )
    (setf *mylist* (reverse *mylist*))  
    (list *mylist*)
)


