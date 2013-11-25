
(require 'tramp)


;; Tramp Sudo
;;(add-to-list 'tramp-default-proxies-alist '(".*" "\`root\'" "/ssh:%h:"))

;;; Proxy root -> ssh+sudo
(add-to-list 'tramp-default-proxies-alist
	     '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
	     '((regexp-quote (system-name)) nil nil))
