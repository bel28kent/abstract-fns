#lang racket

(provide (all-defined-out))

; valmap
; X (listof proc) -> (listof Y)
; produce the list of results of calling each procedure on X
; CONSTRAINT: X is a valid parameter type to each procedure

(define (valmap val lop)
  (local [(define (valmap lop)
            (cond [(empty? lop) empty]
                  [else
                    (cons ((first lop) val) (valmap (rest lop)))]))]
    (valmap lop)))

; true?
; Boolean -> Boolean
; produce true if true

(define (true? bool)
  (not (false? bool)))

; string-contains?
; String String -> Boolean
; produces true if any character in first string equals second string

(define (string-contains? str char)
  (local [(define (string-is? s1 s2)
            (cond [(string=? s1 char) #t]
                  [(string=? s2 "") #f]
                  [else
                     (string-is? (substring s2 0 1) (substring s2 1))]))]
    (string-is? (substring str 0 1) (substring str 1))))

; shift
; (listof X) -> (listof X)
; Removes the first element and produces the resultant list

(define (shift lox)
  (cond [(empty? lox) empty]
        [else
          (rest lox)]))
