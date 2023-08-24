(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(use-modules (srfi srfi-64))
(test-begin "1-14")
(test-eqv 0 (fib 0))
(test-eqv 1 (fib 1))
(test-eqv 1 (fib 2))
(test-eqv 2 (fib 3))
(test-eqv 3 (fib 4))
(test-eqv 5 (fib 5))
(test-eqv 8 (fib 6))
(test-eqv 13 (fib 7))
(test-eqv 21 (fib 8))
(test-eqv 6765 (fib 20))
(test-eqv 267914296 (fib 42))
(test-eqv 26863810024485359386146727202142923967616609318986952340123175997617981700247881689338369654483356564191827856161443356312976673642210350324634850410377680367334151172899169723197082763985615764450078474174626 (fib 999))
(test-end "1-14")
