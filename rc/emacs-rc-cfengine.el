;
;

(require 'cfengine) ;; Preload to shadow system copy

(autoload 'cfengine-mode "cfengine" "cfengine editing" t)
(add-to-list 'auto-mode-alist '("\\.cf\\'" . cfengine3-mode))

;; (setq cfengine-parameters-indent (quote (promise arrow 4)))
