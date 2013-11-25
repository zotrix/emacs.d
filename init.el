;; -*- elisp -*-
;;

(defvar zotrix/emacs-home
  (expand-file-name ".emacs.d" (getenv "HOME"))
  "EMACS Home Dir")

(defvar zotrix/private-dir
  (expand-file-name (file-name-as-directory "Private/emacs" )
		    (getenv "HOME"))
  "EMACS Private Dir")


(defmacro zotrix/my-conf (file &optional private)
  `(if private
       (expand-file-name ,file ,zotrix/private-dir)
     (expand-file-name ,file ,zotrix/emacs-home)))

(defun zotrix/load-conf (file &optional noerror private)
  " Load configuration "
  (load (zotrix/my-conf file private) noerror))

(defun zotrix/load-rc (file &optional noerror private)
  "Load configuration from rc dir"
  (zotrix/load-conf 
   (concat (file-name-as-directory "rc") file) noerror private))




  ;; Customize and load customization
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
