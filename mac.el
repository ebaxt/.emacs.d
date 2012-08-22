;; change command to meta, and ignore option to use weird norwegian keyboard
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

;; make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

(provide 'mac)

