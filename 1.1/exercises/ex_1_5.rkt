#lang sicp

#|

(p) is a an infinitely recursive procedure! Returns a call to itself!

Option 1: Applicative-order evaluation (eager evaluation)
In applicative order, the arguments of the function are evaluated before the function itself. Here,
trying to evaluate (p) would result in infinite recursion.

Option 2: Normal-order evaluation (lazy evaluation)
In normal-order evaluation, the expression is not evaluated until its value is actually needed. Here,
the program would just return 0.

This can be confirmed by changing line 1 to "#lang lazy"!

|#

;The base procedures are defined as follows: 

(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))

(test 0 (p))
