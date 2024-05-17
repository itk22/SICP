#lang sicp

#|
  1.1.1 Expressions
  This is a very simple example of a combination - a list of expressions delimited by parentheses.
  This is the structure: (operator operand1 operand2 ...) Arguments are values of the operands.
|#

(+ 137 349)

#|
  The operators as the leftmost entry departs from the usual infix notation. However, it has the
  advantage of accommodating any number of operands.
 |#
(* 137 456 672)

#| 
  1.1.2 Naming and the Environment
  Define is the simplest means of abstraction in Lisp.
|#
(define size 2)
(* 5 size )

#|
  Definitions are technically not combinations - (define size 2) is not evaluated by applying
  the operator define to the operands size and 2. Thus, define is a special form.
 |#

#| 
  1.1.3 Evaluating Combinations
  It also easily extends to nesting.
|#
(+ (* 3 5)(- 10 6))

#|
  There is no limit to nesting - pretty printing is our friend - operands aligned vertically.

  Cool thing to note - evaluating combinations is recursive in nature. Going up the computational
  tree, i.e., evaluating subexpressions and then their parent expressions, is an example of tree
  accumulation. 
|#

#|
  1.1.4 Compound Procedures
  Flow like a sentence - to square something, multiply it by itself.
 |#

(define (square x) (* x x))
(square 21)

(define (sum_of_squares x y)(+ (square x)(square y)))
(sum_of_squares 3 4)

(define (f a)
  (sum_of_squares (+ a 1)(* a 2)))
(f 5)

#| 1.1.5 The Substitution Model for Procedure Application
  This is simply a way of thinking about procedure application - in (f 5), the value of a is 5, etc.
  Fully expand and then reduce is known as normal order evaluation, while evaluate the arguments and
  then apply is applicative-order evaluation - Lisp uses applicative-order evaluation to avoid
  recomputing values - for example, in line 43, the operations (+ a 1) and (* a 2) would be computed
  twice when squaring in normal order evaluation (see pg. 21 for a detailed description).
|#

#| 1.1.6 Conditional Expressions and Predicates
  Cond is a special form that allows for conditional evaluation.
|#
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs -2)

#|
  The pairs of expressions above are called clauses - the first expression in each clause is the
  predicate, and the second is the consequent expression.

  Alternative formulation.
|#
(define (abs2 x) (cond ((< x 0) (- x))
                       (else x)))
(abs2 -2)

#| 
  Another possible structure uses (if <predicate> <consequent> <alternative>). In addition, there are
  logical operations - and, or, not. Note that and and or are special forms, while not is an ordinary
  procedure.
|#
