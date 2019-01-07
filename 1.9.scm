(define (inc a)
  (+ a 1))

(define (dec a)
  (- a 1))

; Linear recursive procedure
(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

; Evaluating recursive (plus 4 5):
; (plus 4 5)
; (inc (plus 3 5))
; (inc (inc (plus 2 5)))
; (inc (inc (inc (plus 1 5))))
; (inc (inc (inc (inc (plus 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

; Iterative procedure
(define (plus a b)
  (if (= a 0)
      b
      (plus (dec a) (inc b))))

; Evaluating iterative (plus 4 5):
; (plus 4 5)
; (plus 3 6)
; (plus 2 7)
; (plus 1 8)
; (plus 0 9)
; 9
