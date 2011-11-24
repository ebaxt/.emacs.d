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
                                  iy-go-to-char clojure-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand)

;; M-m: Move to char - similar to "f" in vim
(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "M-M") 'iy-go-to-char-backward)

;; Remap old M-m to M-i (better mnemonic for back-to-indentation)
;; We lose tab-to-tab-stop, which is no big loss in my use cases.
(global-set-key (kbd "M-i") 'back-to-indentation)
(load-theme 'misterioso)
