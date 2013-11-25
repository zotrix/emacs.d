
(require 'jabber)

;; Setting urgency hint for Emacs frame (only for X Window System).

(defun x-urgency-hint (frame arg &optional source)
  (let* ((wm-hints (append (x-window-property 
			    "WM_HINTS" frame "WM_HINTS" source nil t) nil))
	 (flags (car wm-hints)))
    (setcar wm-hints
	    (if arg
		(logior flags #x00000100)
	      (logand flags #x1ffffeff)))
    (x-change-window-property "WM_HINTS" wm-hints frame "WM_HINTS" 32 t)))

;; usage example
(defvar jabber-activity-jids-count 0)

(defun jabber-urgency-hint ()
  (let ((count (length jabber-activity-jids)))
    (unless (= jabber-activity-jids-count count)
      (if (zerop count)
	  (x-urgency-hint (selected-frame) nil)
	(x-urgency-hint (selected-frame) t))
      (setq jabber-activity-jids-count count))))

(add-hook 'jabber-activity-update-hook 'jabber-urgency-hint)

(setq 
 jabber-connection-ssl-program (quote gnutls)
 jabber-vcard-avatars-retrieve nil
 jabber-default-priority 5
 jabber-history-enabled t
 jabber-use-global-history nil
 jabber-use-sasl t
 jabber-vcard-avatars-publish nil
 jabber-vcard-avatars-retrieve nil
 jabber-version-show nil)

(setq  jabber-history-dir (zotrix/my-conf "emacs-jabber" t))

;; Debug...
;; (setq jabber-debug-log-xml t)
;; (setq jabber-debug-keep-process-buffers t)

