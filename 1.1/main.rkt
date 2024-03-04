#lang sicp

; this is a very simple example of a combination - list of expressions delimited by parentheses
; this is the structure: (operator operand1 operand2 ...)
; arguments are values of the operands

(+ 137 349)

; placing the operators as the leftmost entry departs from the usual infix notation
; but it has the advantage of accomodating any number of operands

(* 137 456 672)

; it also easily extends to nesting
(+ (* 3 5)(- 10 6))

; there is no limit to nesting - pretty printing is our friend - operangs aligned vertically
(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

; cool thing to note - evaluating combinations is recursive in nature!

; define is the simplest means of abstraction in Lisp
(define size 2)
(* 5 size )