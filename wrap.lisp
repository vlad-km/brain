;;; -*- mode:lisp; coding:utf-8 -*-

;;; This file is part of the BRAIN package
;;; Lisp wrap for brain.js library
;;; Copyright © 2017 Vladimir Mezentsev


(in-package :brain)


;;; make neural net
(export '(make-neural-net))
(defun make-neural-net (&optional nno)
    (if nno
        (make-new #j:brain:NeuralNetwork nno)
        (make-new #j:brain:NeuralNetwork)))

;;; RNN
(export '(make-rnn))
(defun make-rnn (&optional nno)
    (if nno (make-new #j:brain:recurrent:RNN nno)
        (make-new #j:brain:recurrent:RNN)))

;;; GRU
(export '(make-gru))
(defun make-gru (&optional nno)
    (if nno (make-new #j:brain:recurrent:GRU nno)
        (make-new #j:brain:recurrent:GRU)))

;;; LSTM
(export '(make-lstm))
(defun make-lstm (&optional nno)
    (if nno (make-new #j:brain:recurrent:LSTM nno)
        (make-new #j:brain:recurrent:LSTM)))

;;; neural-net options - train & run
;;;
;;; (setq *nn (brain:make-neural-net
;;;     (brain:nno :hiddensizes #(6 3)
;;;                :callback (lambda (stats) (print (klib:jso-to-list stats)))
;;;                :callbackperiod 100)))
;;; (brain:train *nn
;;;       (train-data
;;;                (tp (mkjso "r" 0.3 "g" 0.7) (mkjso "black" 1))
;;;                (tp (mkjso "r" 0.16 "b" 0.2) (mkjso "white" 1))
;;;                (tp (mkjso "r" 0.5 "g" 0.5 "b" 1.0) (mkjso "white" 1)))
;;;       (brain:nno :iterations 200 :errorthres 0.02))
;;;
;;; (print (klib:jso-to-list (brain:run *nn (mkjso "r" 0 "g" 0.00 "b" 0.0))))
;;;
;;;
(export '(nno))
(defun nno (&key
              activation
              errorThresh
              iterations
              momentum
              learningRate
              callback callbackPeriod
              log logPeriod
              hiddenSizes
              inputSize inputRange outputSize)
    (let ((options (new)))
        (flet ((mko (key val) (setf (oget options key) val)))
            (if activation     (mko "activation" activation))
            (if errorThresh    (mko "errorThresh" errorThresh))
            (if iterations     (mko "iterations" iterations))
            (if momentum       (mko "momentum" momentum))
            (if learningrate   (mko "learningRate" learningrate))
            (if callback       (mko "callback" callback))
            (if callbackperiod (mko "callbackPeriod" callbackperiod))
            (if log            (mko "log" log))
            (if logperiod      (mko "logPeriod" logperiod))
            (if hiddensizes    (mko "hiddenSizes" hiddensizes))
            (if inputsize      (mko "inputSize" inputsize))
            (if inputRange     (mko "inputRange" inputRange))
            (if outputSize     (mko "outputSize" outputSize))
            options)))

;;; train
(export '(train))
(defun train (bro &optional input nno)
    (if nno
        (funcall ((oget bro "train" "bind") bro input nno))
        (if input
            (funcall ((oget bro "train" "bind") bro input))
            (funcall ((oget bro "train" "bind") bro)))))


;;; run
(export '(run))
(defun run (bro input &optional nno)
    (if nno
        (funcall ((oget bro "run" "bind") bro input nno))
        (funcall ((oget bro "run" "bind") bro input ))))



;;; train data set utils
;;;
;;; (train-data
;;;  (tp (mkjso "r" 0.3 "g" 0.7) (mkjso "black" 1))
;;;  (tp (mkjso "r" 0.16 "b" 0.2) (mkjso "white" 1))
;;;  (tp (mkjso "r" 0.5 "g" 0.5 "b" 1.0) (mkjso "white" 1)))


;;; train pattern
(export '(tp))
(defun tp (input output)
    (mkjso "input" input "output" output))

;;; train-data
(export '(train-data))
(defun train-data (&rest patterns)
    (apply #'vector patterns))


#|
(defun ncb (stats)
    (format *so* "~a~%" (klib:jso-to-list stats)))

(setq *hidden (nno :hiddensizes #(4 5)))

(setq *topt (nno :callback #ncb :callbackPeriod 1000 :errorThresh 0.002 :iterations 100000))

(setq *topt (nno :callback #ncb))

|#

(in-package :cl-user)

;;; EOF
