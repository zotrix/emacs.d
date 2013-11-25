;; -*- elisp -*-
;;

(defvar zotrix/emacs-home
  (file-name-as-directory (expand-file-name ".emacs.d" (getenv "HOME")))
  "EMACS Home Dir")

(defvar zotrix/private-dir
  (file-name-as-directory (expand-file-name  "Private/emacs"
					     (getenv "HOME")))
  "EMACS Private Dir")

(defmacro zotrix/my-conf (file &optional private)
  `(if ,private
       (expand-file-name ,file ,zotrix/private-dir)
     (expand-file-name ,file ,zotrix/emacs-home)))

(defun zotrix/load-conf (file &optional noerror private)
  " Load configuration "
  (load (zotrix/my-conf file private) noerror))

(defun zotrix/load-rc (file &optional noerror private)
  "Load configuration from rc dir"
  (zotrix/load-conf 
   (concat (file-name-as-directory "rc") (format "emacs-rc-%s" file)) noerror private))

(zotrix/load-conf "general_functions")
(zotrix/load-conf "general_options")

  ;; Customize and load customization
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
