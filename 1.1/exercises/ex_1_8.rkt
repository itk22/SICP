#lang sicp

; For now, we will just copy the code - later, we will load from other files

(define (sqrt-iter guess x counter)
  (if (good-enough? guess x)
      (list guess counter)  ; Return both the guess and the counter when done
      (sqrt-iter (improve guess x) x (+ counter 1))))  ; Increment the counter

(define (sqrt-iter-alt guess x counter)
  (if (good-enough? guess x)
      (list guess counter)  ; Return both the guess and the counter when done
      (sqrt-iter (improve-alt guess x) x (+ counter 1))))  ; Increment the counter

(define (improve guess x)
  (average guess (/ x guess)))


(define (improve-alt guess x)
(/ (+ (/ x (square guess)) (* 2 guess)) 3.0 ))


(define (average x y)
  (/ (+ x y) 2))

(define (square x ) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


; to be able to compare improve-alt and improve, we need to print the number of iterations to reach
; the required accuracy - we are using the old convergence criterion for now

; We will use the convergence criterion from previous question cause it leads to better
; quality solutions

; Initialize the iteration with a guess, x value, and counter
; Example usage for x = 9
(define initial-guess 1.0)
(define x-value 9)

(display "Answer using improve: ")
(display (sqrt-iter initial-guess x-value 0))
(newline)
(display "Answer using improve-alt: ")
(display (sqrt-iter-alt initial-guess x-value 0))

; With the same number of iterations, the alternative method returns a much smaller error!
