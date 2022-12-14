#lang racket

;10 10
;(+ 5 3 4) 12
;(- 9 1) 8
; (/ 6 2) 3
;(+ (* 2 4) (- 4 6)) 6
;(define a 3)
;(define b (+ a 1))
;(+ a b (* a b)) 19
;(= a b) #f

;(if (and (> b a) (< b (* a b))) b a) 4
;(cond ((= a 4) 6)
;((= b 4) (+ 6 7 a))
;(else 25)) 16

;(+ 2 (if (> b a) b a)) 6
;(* (cond ((> a b) a)
;((< a b) b)
;(else -1))
;(+ a 1)) 16

; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))) 37/-150

(define (square x) (* x x))

(define (sum-of-squares a b c)
(cond ((and (> a b) (> b c)) (+ (square a) (square b)))
      ((and (> b a) (> c a)) (+ (square b) (square c)))
      (else (+ (square c) (square a)))))

(sum-of-squares 1 5 4)
(sum-of-squares 3 3 1)
(sum-of-squares 7 5 12)
(sum-of-squares 10 10 10)
