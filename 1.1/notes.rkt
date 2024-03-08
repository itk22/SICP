#lang sicp


; 1.1.1 Expressions
; this is a very simple example of a combination - list of expressions delimited by parentheses
; this is the structure: (operator operand1 operand2 ...)
; arguments are values of the operands

(+ 137 349)

; the operators as the leftmost entry departs from the usual infix notation
; but it has the advantage of accomodating any number of operands
(* 137 456 672)

; 1.1.2 Naming and the Environment
; define is the simplest means of abstraction in Lisp
(define size 2)
(* 5 size )

; definitions are technically not combinations - (define size 2) is not evaluated by applying
; the operator define to the operands size and 2 - thus, define is a special form

; 1.1.3 Evaluating Combinations
; it also easily extends to nesting
(+ (* 3 5)(- 10 6))

; there is no limit to nesting - pretty printing is our friend - operangs aligned vertically

; cool thing to note - evaluating combinations is recursive in nature
; going up the computational tree, i.e. evaluating subexpressions, and then their parent
; expressions is an example of tree accumulation

; 1.1.4 Compound Procedures
; flow like a sentence - to square something, multiply it by itself
(define (square x) (* x x))
(square 21)

(define (sum_of_squares x y)(+ (square x)(square y)))

(sum_of_squares 3 4)

(define (f a)
  (sum_of_squares (+ a 1)(* a 2)))

(f 5)
; 1.1.5 The Substitution Model for Procedure Application
; this is simply a way of thinking about procedure application - in (f 5), value of a is 5, and so on
; fully expand and then reduce is known as normal order evaluation, while evaluate the arguments
; and then apply is applicative-order evaluation - Lisp uses applicative-order evaluation to avoid
; recomupting values - for example, in line 43, the oeprations (+ a 1) and (* a 2) would be computed
; twice when squaring in the normal order evaluation (see pg. 21 for detailed description)

; 1.1.6 Conditional Expressions and Predicates
; cond is a special form that allows for conditional evaluation

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(abs -2)

; the pairs of expressions above are called clauses - the first expression in each clause is the
; predicate and the second is the consequent expression

; alternative formulation
(define (abs2 x) (cond ((< x 0) (- x))
                       (else x)))

(abs2 -2)

; another possible structure uses (if <predicate> <consequent> <alternative>)
; in addition, there are logical operations - and, or, not
; Note that and and or are special forms, while not is an ordinary procedure