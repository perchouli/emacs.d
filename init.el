;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))
(setq frame-title-format "%b %f %+")
(setq inhibit-startup-screen t)

(setq js2-strict-missing-semi-warning nil)

(package-initialize)
(require 'whitespace)

(require 'init-whitespace)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-org)
(require 'init-key)

;; Install packages
(require-package 'dired-details)
(require-package 'resize-window)
(require-package 'guide-key)
(require-package 'window-numbering)
(require-package 'auto-complete)
(require-package 'multiple-cursors)

(add-to-list 'auto-mode-alist '("\\\(\.js\\|\.jsx\\)\\'" . js2-mode))

(require 'recentf)
(recentf-mode 1)

(if (eq system-type 'windows-nt)
  (setq default-directory "C:/cygwin64/srv/")
)

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (ignore-errors
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "Microsoft YaHei" )))
)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)

(global-linum-mode t)
(window-numbering-mode 1)
(ido-mode 1)

(ac-config-default)

;; snippet
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
