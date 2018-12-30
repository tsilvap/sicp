(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; Applicative-order
; Evaluate arguments: 0 -> 0, (p) -> (p) -> (p) -> ...
; The evaluation of p is an infinite loop, so test is never applied.

; Normal-order
; Apply procedure: (test 0 (p)) -> (if (= 0 0) 0 (p))
; Evaluate arguments: (= 0 0) -> true, therefore return 0, and (p)
; is never evaluated.
