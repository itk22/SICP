#lang sicp

; 1.1.7 Square Roots by Newton's Method

; Distinction between mathematical formulations and procedures - the former is declarative (describes
; what is) and the latter is imperative (derscribes how to)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
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