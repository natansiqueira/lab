#lang racket

(define (abs x)
  (if (< x 0) 
      (- x) 
      x))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improved-guess guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x) 
      guess
      (sqrt-iter (improved-guess guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 16)
(sqrt 2)
(sqrt 144)
