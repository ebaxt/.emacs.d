(require 'nrepl)

(declare-function nrepl-send-string-sync "nrepl.el")

(defun repl-reset-app ()
  (interactive)
  (message "Reloading application")
  (message (nth 3 (nrepl-send-string-sync "(reset)"))))




