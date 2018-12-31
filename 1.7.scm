; good-enough fails for numbers < 0.001 since that is the margin of
; error that we use.  For very small numbers, the margin of error is
; much larger than the number, therefore the result will be very
; innacurate.

; (square (sqrt 0.0000001)) -> 0.000976629102245155

; The program also fails for very large numbers, since the precision
; for large numbers is limited, meaning oftentimes we can't exactly
; represent a number within the (ans - 0.001, ans + 0.001) interval
; of good-enough guesses. The guesses alternate between two numbers
; that can be represented, both outside of the good-enough guess
; interval, and a result is never returned.

; (sqrt 99999999999999999) -> never returns, loops infinitely

; A better implementation of good-enough? analyzes how guess
; changes from one iteration to the next and stops when the
; change is a very small fraction of the guess.
(define (good-enough? guess previous-guess)
  (< (abs (- (/ guess previous-guess) 1)) 0.001))

(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (sqrt-iter (improve 1.0 x) 1.0 x))

