
(add-to-list 'load-path "~/elisp/emms/lisp")
(require 'emms-setup)
(emms-standard)
;; (emms-default-players)
(require 'emms-player-mpd)
(setq emms-player-mpd-server-name "127.0.0.1")
(setq emms-player-mpd-server-port "6600")
(setq emms-player-mpd-music-directory "~/music")
(add-to-list 'emms-info-functions 'emms-info-mpd)
(setq emms-volume-change-function 'emms-volume-mpd-change)
(add-to-list 'emms-player-list 'emms-player-mpd)
