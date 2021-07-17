#!/usr/bin/env racket
#lang racket
;; Produce interpose GIF images between image-a and image-b.
;; Those files can be used as animation-gif stuffs.
;; You can easily change the output format, PNG or JPG.
;; I'd like my Japanese students to read this code,
;; So I chose Japanese to comment on functions.
;;
;; programmed by hkimura, 2021-07-16.

(require racket/draw)

;; イメージ im の位置 (x,y) のピクセルを得る。
(define get-px
  (lambda (x y im)
    (let ((px (make-bytes 4)))
      (send im get-argb-pixels x y 1 1 px)
      px)))

;; イメージ im の位置 (x,y)のピクセルを px とする。
(define put-px!
  (lambda (px x y im)
    (send im set-argb-pixels x y 1 1 px)))

;; このプログラムの中心的関数。
;; ピクセル a とピクセル b の n 平均 を作る。
;; 難しくない。ノートに式を書き出してみよう。
(define moving-average
  (lambda (i n a b)
    (let ((p (make-bytes 4)))
      (for ([j (range 4)])
        (bytes-set! p j (floor
                          (/ (+ (* (- n i) (bytes-ref a j))
                                (* i (bytes-ref b j)))
                           n))))
      p)))

;; 01.gif, 02.gif,のようなファイル名を作る。
;; 100 ステップ以上には対応しないよ。そんなアニメは無用だろ。
(define name
  (lambda (i n)
    (if (< i 10)
        (format "0~a.png" i)
        (format "~a.png" i))))

;; file-a のイメージから file-b のイメージまで n ステップの中間イメージを作る。
;; file-a と file-b のイメージは縦横同じピクセル数であること。
;; 効率を無視し、ピクセルごとにループ。ださいが、このほうが読みやすいだろ。
;; イメージがピクセルからなり、
;; カラーのピクセルが RGBA の 4 バイトってことを理解すればこの
;; この関数は理解できるだろう。
(define blend-n
  (lambda (n file-a file-b)
    (let* ((im-a (make-object bitmap% file-a))
           (width (send im-a get-width))
           (height (send im-a get-height))
           (im-b (make-object bitmap% file-b))
           (im-c (make-object bitmap% width height))
           (px-a (make-bytes 4))
           (px-b (make-bytes 4))
           (px-c (make-bytes 4)))
      (for ([i (range n)])
        (for ([y (range height)])
          (for ([x (range width)])
            (set! px-a (get-px x y im-a))
            (set! px-b (get-px x y im-b))
            (set! px-c (moving-average i n px-a px-b))
            (put-px! px-c x y im-c)))
        (send im-c save-file (name i n) 'png)))))

;; テスト。
;;(blend-n 10 "../images/cat.png" "../images/virus.png")

;; ターミナルから関数を呼べるように。
;; 引数の個数を見てるだけ。手抜き。
(define main
  (lambda ()
    (let* ((args (current-command-line-arguments))
           (argc (vector-length args)))
      (cond
         ((= 2 argc) (blend-n 10
                              (vector-ref args 0)
                              (vector-ref args 1)))
         ((= 3 argc) (blend-n (string->number (vector-ref args 0))
                              (vector-ref args 1)
                              (vector-ref args 2)))
         (else (printf "usage: blendy [n] im-a im-b"))))))

;; 本番。ターミナルからの起動は blendy 10 a.png b.png のように。
(main)
