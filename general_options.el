;; -*- elisp -*-
;;
;; Emacs general options
;;
;; Time-stamp: <2013-11-25 22:39:43 zotrix>

;; Take Mac Bin paths
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/bin" exec-path))


;; use home site lisp
(let ((default-directory  (concat zotrix/emacs-home
				  (convert-standard-filename "site-lisp/"))))
  (setq load-path
	(append
	 (let ((load-path (copy-sequence load-path))) ;; Shadow
	   (normal-top-level-add-subdirs-to-load-path))
	 load-path)))


(require 'font-lock)
(require 'paren)

;; (require 'show-wspace)
;; (require 'tabbar)


(set-language-environment "UTF-8")
(add-to-list 'locale-language-names '("ru_RU.UTF-8" . "UTF-8"))
(define-coding-system-alias 'UTF-8 'utf-8)
(define-coding-system-alias 'windows-1251 'cp1251)
(define-coding-system-alias 'microsoft-1251 'cp1251)
(define-coding-system-alias 'microsoft-cp1251 'cp1251)
(define-coding-system-alias 'windows-cp1251 'cp1251)
(define-coding-system-alias 'koi8-u 'cyrillic-koi8)
(define-coding-system-alias 'KOI8-R 'cyrillic-koi8)



(setenv "LC_MESSAGES" "C")
(setenv "PS1" "$ ")
(setenv "PROMPT" "$> ")
(setenv "SHELL" "/bin/sh")
(setenv "LC_TIME" "C")

(setq
;; browse-url-browser-function 'browse-url-generic
;; browse-url-generic-program "/usr/bin/chromium"
 visible-bell 1
 use-dialog-box nil
 size-indication-mode t
 column-number-mode t
 blink-cursor-mode 0
 tool-bar-mode 0
 transient-mark-mode t
 mouse-yank-at-point t
 debuild-option-list (list "-b" "-uc" "-us")
 develock-auto-enable nil
 diff-switches "-u"
 display-time-mode t
 display-time-24hr-format t
 display-time-day-and-date t
 bbdb-complete-name-allow-cycling t
 bbdb-use-pop-up nil
 bbdb-offer-save 'yes
 ;; bbdb-quiet-about-name-mismatches t
 ;; bbdb-use-alternate-names nil
 bbdb-always-add-addresses nil
 ispell-program-name "aspell"
 frame-title-format "GNU Emacs %S: %f")


(setq-default font-lock-maximum-decoration t)
(setq default-major-mode 'text-mode)

(unless (fboundp show-paren-mode)
  (show-paren-mode t))

(display-time)
(set-scroll-bar-mode nil)
(recentf-mode 1)
(transient-mark-mode t)
;; (tabbar-mode t)
(tool-bar-mode -1)


;; Gnus

(setq gnus-init-file (expand-file-name "gnus/init.el" zotrix/emacs-home))
(setq gnus-startup-file
      (concat (file-name-directory gnus-init-file)  "newsrc"))

(defvar zotrix/gnus-home nil "GNUS homedir")
(defvar zotrix/site-home "~/.emacs.d/site" "Site configuration")

(when (not (and (boundp 'zotrix/gnus-home)  zotrix/gnus-home))
  (progn
    (setq zotrix/gnus-home
          (file-name-directory gnus-init-file))
    (message "GNUS Home %s" zotrix/gnus-home)))

;; COpy/PAste
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq select-active-regions t)
;;(global-set-key [mouse-2] 'mouse-yank-primary)
(setq yank-pop-change-selection t)

;; (global-set-key [(shift delete)] 'clipboard-kill-region)
;; (global-set-key [(control insert)] 'clipboard-kill-ring-save)
;; (global-set-key [(shift insert)] 'clipboard-yank)

;; Theme
(if (< emacs-major-version 24)
    (progn
      (require 'color-theme)
      (color-theme-initialize)
      (color-theme-charcoal-black))
  (progn
    (load-theme 'zotrix t)))

(add-hook 'before-save-hook 'time-stamp)

(message "General options initialised.")


