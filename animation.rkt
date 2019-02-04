(require 2htdp/image)
(require 2htdp/universe)
; define height and width becase variables are reused.
(define WIDTH  500)
(define HEIGHT  500)
; define an empty scene.
(define MTSCN  (empty-scene WIDTH HEIGHT "brown"))
; image of rocket definition.
(define ROCKET .)
; create a ground.
(define ground (overlay(rectangle WIDTH (- HEIGHT 20) "solid" "blue")
                       MTSCN))
; Creating a UFO Image.
(define UFO (overlay (circle 10 "solid" "green")
         (rectangle 40 4 "solid" "green")))
; calculate height of object from center of scene.
(define OBJECT-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))
 
; functions
(define (picture-of-rocket.v5 h)
  (cond
    [(<= h OBJECT-CENTER-TO-TOP)
     (place-image UFO 250 h ground)]
    [(> h OBJECT-CENTER-TO-TOP)
     (place-image UFO 250 OBJECT-CENTER-TO-TOP ground)]))

(animate picture-of-rocket.v5)
