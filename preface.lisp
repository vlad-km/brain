;;; -*- mode:lisp; coding:utf-8 -*-

;;; This file is part of the BRAIN package
;;; Lisp wrap for brain.js library
;;; Copyright © 2017 Vladimir Mezentsev

(in-package :brain)

(unless #j:Brain_loaded_0
    (setf #j:Brain_loaded_0 (require "./dist/brainjs")))

(in-package :cl-user)

;;; EOF
