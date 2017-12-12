;;; -*- mode:lisp; coding:utf-8 -*-

;;; Package BRAIN - lisp wrapper for brain.js library
;;; It is intended for use in the Moren environment.
;;; Copyright © 2017 Vladimir Mezentsev
;;;
;;; BRAIN is free software: you can redistribute it and/or modify it under
;;; the terms of the GNU General  Public License as published by the Free
;;; Software Foundation,  either version  3 of the  License, or  (at your
;;; option) any later version.
;;;
;;; BRAIN is distributed  in the hope that it will  be useful, but WITHOUT
;;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;;; for more details.
;;;
;;; You should  have received a  copy of  the GNU General  Public License
;;; Version 3 from  <http://www.gnu.org/licenses/>.
;;;
;;;

(in-package :cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
    (unless (find-package :brain)
        (make-package :brain :use (list 'cl))))


(in-package :brain)

(export
 '(jscl::oget jscl::new jscl::concat
   jscl::make-new jscl::fset jscl::js-null-p
   ))

(in-package :cl-user)


;;; EOF
