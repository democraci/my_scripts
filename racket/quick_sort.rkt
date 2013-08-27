#lang racket
;quick sort
;input list
;output sorted list
(define (quick-sort lis)
  (cond [(empty? lis) lis] 
      [#t
       (let* (
         [pivot (car lis)]
         [tail (cdr lis)]
         [lsr (filter (lambda (i) (< i pivot)) tail)]
         [grt (filter (lambda (i) (>= i pivot)) tail)]
         )
         (append (quick-sort lsr) (list pivot) (quick-sort grt))
         )]))

;bubble sort
;input list
;output sorted list
;(define (bubble-sort vect)
;  (cond 
;    [(empty? vect) null]
;    [bubble-sort-tail vect (length vect)]))
;(define (bubble-sort-tail vect len)
;  (cond
;    [(equal? len 1) vect]
;    [#t (let* ([fst (first vect)]
;               [temp fst]) 
;          (


  
