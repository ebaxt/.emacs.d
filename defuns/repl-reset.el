(require 'cider)

(declare-function nrepl-send-string-sync "nrepl.el")

(defun repl-reset-app ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(user/reset)")
    (cider-repl-return)))

