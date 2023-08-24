(use-modules (ice-9 format))

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0)
         1)
        ((or (< amount 0) (= kinds-of-coins 0))
         0)
        (else
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (cc-dot amount kinds-of-coins node-id)
  (format #t "~a [label=\"(cc ~d ~d)\" style=filled]~%" node-id amount kinds-of-coins)
  (cond ((= amount 0)
         (format #t "~a [label=\"(cc ~d ~d)\" style=filled fillcolor=lightgreen]~%" node-id amount kinds-of-coins)
         (format #t "~a -> ~a~%" node-id (string-append node-id "1"))
         (format #t "~a [label=\"1\" shape=plaintext]~%" (string-append node-id "1"))
         1)
        ((or (< amount 0) (= kinds-of-coins 0))
         (format #t "~a [label=\"(cc ~d ~d)\" style=solid shape=plain fontcolor=indianred]~%" node-id amount kinds-of-coins)
         0)
        (else
         (format #t "~a -> ~a~%" node-id (string-append node-id "0"))
         (format #t "~a -> ~a~%" node-id (string-append node-id "1"))
         (+ (cc-dot amount (- kinds-of-coins 1) (string-append node-id "0"))
            (cc-dot (- amount (first-denomination
                               kinds-of-coins))
                    kinds-of-coins
                    (string-append node-id "1"))))))

(define (count-change-dot amount)
  (cc-dot amount 5 "1"))

(format #t "digraph {~%")
(count-change-dot 11)
(format #t "}~%")
