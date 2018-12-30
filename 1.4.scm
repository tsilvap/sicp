; If b > 0, a-plus-abs-b returns a + b. Otherwise, it returns a - b.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

