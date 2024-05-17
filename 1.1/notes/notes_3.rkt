#lang sicp

#|
    1.1.8 Procedures as Black-Box Abstractions
    In the previous examples, sqrt-iter was defined recursively. Its definition follows the natural
    decompositon of the problem into subproblems. Each procedure here represents and identifiable
    task and could be reused in defining other procedures!

    When we define good-enough? in terms of 'square', the exact workings of the procedure are not
    important - it is treated like a black box. As far as 'good-enough?' is concerned, 'square' is
    not quite a procedure but a procedural abstraction - any procedure for computing a square would
    work in this context.

    Important point: A user should not need to know how the procedure is implemented to use it!

    Important detail of defining procedures is the locality of names! Formal parameters of a function
    are bound variables - the meaning of the procedure definition does not change when such param is
    renamed throughout the definition.

    If a variable is not bound, we say that it is free. The set of expressions for which a binding
    defines a names is called the scope of that name!

    Formal parameters of a procedure are local to the body of the procedure - this is a kind of
    name isolation. In the previous implementation of sqrt, we had a clutter of procedures which
    had to all be defined for sqrt to work - however, these procedures should be defines within the
    procedure!
|#

(define (sqrt x)
  (define (square x) (* x x))
  (define (average x y) (/ (+ x y) 2) )
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x) (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)) ; Almost looks like partial function - enforcing a default

  (sqrt 9.0)

#|
    The above structure is called block structure. In addition to internalizing the definitions of 
    auxiliary procedures, we can simplify them by internalizing x - no need to pass it around.

    In this scenario, x gets the value from the argument with which the enclosing procedure sqrt is
    called - lexical scoping!
|#

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2) )

(define (sqrt-simple x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess) (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter 1.0))

(sqrt-simple 9.0)

; Done with 1.1!