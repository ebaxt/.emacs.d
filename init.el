(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/")

(when (equal system-type 'darwin)
  (require 'mac))

(when (not package-archive-contents)
  (package-refresh-Add))

;; contents in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-eshell
                                  starter-kit-js
                                  starter-kit-lisp
                                  starter-kit-bindings
                                  iy-go-to-char
                                  clojure-mode
                                  cider
                                  expand-region
                                  ace-jump-mode
                                  clojure-test-mode
                                  multiple-cursors
                                  clj-refactor)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; CIDER settings
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq cider-popup-stacktraces nil)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(require 'clj-refactor)

;; Enable clojure-test-mode
(add-hook 'clojure-mode-hook 'clojure-test-mode (lambda ()
                                                  (clj-refactor-mode 1)
                                                  ;; insert keybinding setup heres
                                                  (cljr-add-keybindings-with-prefix "C-c C-x")))

(require 'key-bindings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

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

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
