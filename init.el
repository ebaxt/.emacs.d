(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/")

(when (equal system-type 'darwin)
  (require 'mac))

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-eshell starter-kit-js
                                  starter-kit-lisp starter-kit-bindings
                                  iy-go-to-char clojure-mode sass-mode nrepl
                                  erlang expand-region ace-jump-mode clojure-test-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; NREPL settings
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl'")
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

;; Enable clojure-test-mode
(add-hook 'clojure-mode-hook 'clojure-test-mode)

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

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(global-set-key (kbd "C-x -") 'toggle-window-split)


;; Remap old M-m to M-i (better mnemonic for back-to-indentation)
;; We lose tab-to-tab-stop, which is no big loss in my use cases.
(global-set-key (kbd "M-i") 'back-to-indentation)
(load-theme 'deeper-blue)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d14db41612953d22506af16ef7a23c4d112150e5" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq slime-net-coding-system 'utf-8-unix)

(set-face-attribute 'default nil :height 140)
