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
(require-package 'neotree)
(require-package 'typescript-mode)
(require-package 'emmet-mode)
(require-package 'guide-key)
(require-package 'window-numbering)
(require-package 'auto-complete)
(require-package 'multiple-cursors)

(require 'recentf)
(recentf-mode t)

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (ignore-errors
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "Microsoft YaHei" )))
)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\\(\.ts\\|\.tsx\\)\\'" . typescript-mode))

(global-linum-mode t)
(window-numbering-mode t)
(ido-mode t)
(ac-config-default)
;(global-auto-complete-mode t)
(add-to-list 'ac-modes 'typescript-mode)
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; snippet
(if (eq (file-exists-p "~/.emacs.d/plugins/yasnippet") nil)
  (shell-command-to-string "git clone --recursive https://github.com/joaotavora/yasnippet.git ~/.emacs.d/plugins/yasnippet --depth 1")
)
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode t)

;; emmet
(add-hook 'emmet-mode-hook (lambda ()
 (setq emmet-indentation 2)
 (setq emmet-expand-jsx-className? t)
))

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
