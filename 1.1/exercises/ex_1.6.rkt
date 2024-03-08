#lang sicp

#|
    "if" is a special form - its evaluation procedure is not dependent on the evaluation order. In
    applicative order, both the then-clause and else-clause are evaluated. In this example, the second
    alternatively calls itself recursively and goes into infinite loop. Again, this wouldn't happen
    with lazy evaluation
|#

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x))
  )

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x ) (* x x))

; the book comments that this is not a very good check - perhaps relative tolerance makes more sense
; here than the absolute?
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; note that in MIT Scheme it does make a difference whether you specify 2 or 2.0 (footnote 23, pg. 31)
(sqrt-iter 1.0 2.0)