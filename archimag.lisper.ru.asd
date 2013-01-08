;;;; archimag.lisper.ru.asd

(defsystem #:archimag.lisper.ru
  :defsystem-depends-on (#:arblog-systems #:closure-template)
  :depends-on (#:arblog #:arblog-datastore-mongodb #:arblog-markup-rst
               #:arblog-theme-mirev #:arblog-theme-isimple)
  :serial t
  :components ((:file "defmodule")
               (:closure-template "archimag-mirev")
               (:closure-template "archimag-isimple")))
