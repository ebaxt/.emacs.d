;; Expand region
(global-set-key (kbd "C-@") 'er/expand-region)

(define-key global-map (kbd "C-ø") 'ace-jump-mode)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand)

;; M-m: Move to char - similar to "f" in vim
(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "M-M") 'iy-go-to-char-backward)
;; Join lines
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

(global-set-key (kbd "C-x -") 'toggle-window-split)

;; Remap old M-m to M-i (better mnemonic for back-to-indentation)
;; We lose tab-to-tab-stop, which is no big loss in my use cases.
(global-set-key (kbd "M-i") 'back-to-indentation)

;; Reload application in nRepl
(global-set-key (kbd "C-c C-.") 'repl-reset-app)

;; Run toplevel form under cursor
(global-set-key (kbd "C-c C--") 'cider-eval-expression-at-point-in-repl)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")


;; Mark additional regions matching current region
(global-set-key (kbd "M-æ") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-å") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-æ") 'mc/mark-next-like-this)
(global-set-key (kbd "C-Æ") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "M-å") 'mc/mark-all-in-region)

;; Symbol and word specific mark-more
(global-set-key (kbd "s-æ") 'mc/mark-next-word-like-this)
(global-set-key (kbd "s-å") 'mc/mark-previous-word-like-this)
(global-set-key (kbd "M-s-æ") 'mc/mark-all-words-like-this)
(global-set-key (kbd "s-Æ") 'mc/mark-next-symbol-like-this)
(global-set-key (kbd "s-Å") 'mc/mark-previous-symbol-like-this)
(global-set-key (kbd "M-s-Æ") 'mc/mark-all-symbols-like-this)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)



(provide 'key-bindings)
