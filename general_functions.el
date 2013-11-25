;; -*- elisp -*-
;;
;; Emacs Common functions
;;

(defmacro zotrix/gnus-conf (file &optional site)
  `(if site
       (expand-file-name ,file ,zotrix/site-home)
     (expand-file-name ,file ,zotrix/gnus-home)))

(defun zotrix/load-gnus (file &optional noerror site)
  "Load gnus configuration"
  (load (zotrix/gnus-conf file site) noerror))

(defun zotrix/gnus-site-load (file &optional noerror)
  "Load gnus site configuration"
  (zotrix/load-gnus file noerror t))

