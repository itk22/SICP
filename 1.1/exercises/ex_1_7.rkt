#lang sicp

; Copying over from 1.7

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

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; good-enough? calculates the absolute difference between the solution and the true value
; for a very small number, this might be off by a lot, e.g. for (4e-4), where the real sqrt is
;2e-2, 0.0, would be accepted as a correct solution, because the difference between 0 and the actual
; solution is less than 1e-3

; The check prints true and iteration will stagnate very quickly on a bad guess!
; (good-enough? 1e-3 4e-4)
(sqrt-iter 1e-3 4e-4)


; Due to limited precision, for very large numbers, we cannot guarantee that we will be precise up
; to enough digits

; We will test it on a number 2e12 - the real sqrt root should be sqrt(2) * 1e6
(- (sqrt-iter 1e6 2e12) (* (sqrt-iter 1.0 2) 1e6))

; The difference above is considerable -  this is due to finite precision of all underlying procedures

; Alternate strategy - watch how guess changes from one iteration to another to the next and stop when
; it is a very small fraction of the guess

(define (good-enough-alt? guess x)
  (< (/ (abs(- (improve guess x) guess)) guess) 1e-3))

(define (sqrt-iter-alt guess x)
  (if (good-enough-alt? guess x)
      guess
      (sqrt-iter-alt (improve guess x) x))
  )

; Let's try the same test as before for small numbers - now this is false, because we can improve
(sqrt-iter-alt 1e-3 4e-4)

; so with the same starting point we have a much much better guess
; now let's try for large numbers - the error is now 10 orders of magnitude smaller which is 
; a significant improvement

(- (sqrt-iter-alt 1e6 2e12) (* (sqrt-iter-alt 1.0 2) 1e6))












