#lang sicp

(define (square x) (* x x))
(define (sum_squares x y) (+ (square x) (square y)))

(define (sum_two_larger_squares a b c)
(cond ((and (< a b) (< a c)) (sum_squares b c)) ;a is the smallest
      ((and (< b a) (< b c)) (sum_squares a c)) ;b is the smallest
      ((and (< c b) (< c a)) (sum_squares a b)) ;c is the smallest
)
)

(sum_two_larger_squares 0 2 3)

; This can definitely be written better - we want minimal comparisons