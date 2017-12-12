;;; -*- mode:lisp; coding:utf-8 -*-

;;; This file is part of the BRAIN package
;;; Lisp wrap for brain.js library
;;; Copyright © 2017 Vladimir Mezentsev


(lores:defsys :brain
    :path "git/brain"
    :components ((:file "brain-pkg")
                 (:file "preface")
                 (:file "wrap")))

;;; EOF
