(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

; The interpreter will evaluate the else-clause of the if procedure
; before evaluating the predicate, which will throw it in an
; infinite recursive loop.
