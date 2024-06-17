#lang racket

(require "../functions/functions.rkt"
         test-engine/racket-tests)

; valmap
(check-expect (valmap 1 (list zero?)) (list #f))
(check-expect (valmap 1 (list zero? positive?)) (list #f #t))

; true?
(check-expect (true? #t) #t)
(check-expect (true? #f) #f)

; string-contains?
(check-expect (string-contains? "a" "a") #t)
(check-expect (string-contains? "a" "b") #f)
(check-expect (string-contains? "abc" "b") #t)
(check-expect (string-contains? "abc" "d") #f)

; shift
(check-expect (shift empty) empty)
(check-expect (shift (list 1)) empty)
(check-expect (shift (list 1 2 3)) (list 2 3))

(test)
