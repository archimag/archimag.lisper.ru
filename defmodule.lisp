;;;; arblog-archimag.lisp

(restas:define-module #:archimag.lisper.ru
  (:use #:cl))

(in-package #:archimag.lisper.ru)

(closure-template:ensure-ttable-package
 '#:arblog.theme.mirev_archimag.tmpl
 :prototype (closure-template:package-ttable '#:arblog.theme.mirev.tmpl))

(closure-template:ensure-ttable-package
 '#:arblog.theme.isimple_archimag.tmpl
 :prototype (closure-template:package-ttable '#:arblog.theme.isimple.tmpl))

(arblog:register-theme-static-dir
 "archimag"
 (merge-pathnames "static/" (asdf:component-pathname  (asdf:find-system '#:archimag.lisper.ru))))


(restas:mount-module -arblog- (#:arblog)
  (arblog:*blog-name* "archimag")
  (arblog:*blog-author* "Andrey Moskvitin")
  (arblog:*posts-on-page* 10)
  
  (arblog.internal.datastore:*datastore* (make-instance 'arblog.datastore.mongodb:arblog-mongo-datastore))
  (arblog.internal.markup:*markup* (make-instance 'arblog.markup.rst:arblog-rst-markup))
  ;; (arblog.internal.theme:*theme* (make-instance 'arblog.theme.mirev:arblog-mirev-theme
  ;;                                               :templates-package '#:arblog.theme.mirev_archimag.tmpl))
  (arblog.internal.theme:*theme* (make-instance 'arblog.theme.isimple:arblog-isimple-theme
                                                :templates-package '#:arblog.theme.isimple_archimag.tmpl))
  
  (arblog:*disqus-shortname* "archimagblog")
  (arblog:*disqus-developer-mode* nil)
  (arblog:*disqus-enabled* t))
