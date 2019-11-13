;;; init.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;; Code:
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(recentf-mode t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))
(setq frame-title-format "%b %f %+")
(setq inhibit-startup-screen t)

(package-initialize)
(require 'whitespace)

(require 'init-whitespace)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-org)
(require 'init-key)

;; Install packages
(require-package 'treemacs)
(require-package 'ggtags)
;; (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
(require-package 'rjsx-mode)
(require-package 'rust-mode)
(add-to-list 'auto-mode-alist '("\\\(\.js\\|\.jsx\\)\\'" . rjsx-mode))
(require-package 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\\(\.ts\\|\.tsx\\)\\'" . typescript-mode))
(require-package 'emmet-mode)
(require-package 'which-key)
(require-package 'window-numbering)
(require-package 'jedi-core)
(require-package 'company-jedi)
(require-package 'company-go)
(require-package 'multiple-cursors)
(require-package 'exec-path-from-shell)
(require-package 'flycheck)
(require-package 'restclient)
(require-package 'editorconfig)

(treemacs)
(treemacs-tag-follow-mode t)
(global-flycheck-mode)

(global-linum-mode t)
(window-numbering-mode t)
(ido-mode t)
(which-key-mode t)
(electric-indent-mode -1)
(editorconfig-mode 1)

;; company
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
;; (add-hook 'python-mode-hook 'jedi:setup) ; Manually active
(add-hook 'python-mode-hook
          (lambda ()
            (setq flycheck-python-pylint-executable "~/.local/bin/pylint")
            (ggtags-mode 1)
            ))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-jedi)
;;(add-to-list 'company-backends 'company-go) ; gocode for module: https://github.com/stamblerre/gocode
  )
(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (company-mode)))
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-<tab>") 'company-complete-common)

;; snippet
(if (eq (file-exists-p "~/.emacs.d/plugins/yasnippet") nil)
    (shell-command-to-string "git clone --recursive https://github.com/joaotavora/yasnippet.git ~/.emacs.d/plugins/yasnippet --depth 1")
  )
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode t)

(add-hook 'js2-mode-hook
          (lambda ()
            (setq js2-basic-offset 2)))

;; emmet
(add-hook 'emmet-mode-hook
          (lambda ()
            (setq emmet-indentation 4)
            (setq emmet-expand-jsx-className? t)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(add-hook 'after-save-hook
          (lambda ()
            (when (string-match ".md" buffer-file-name)
              (defvar out-file-name (replace-regexp-in-string ".md" ".html" buffer-file-name))
              ;(shell-command-to-string (concat "perl /opt/Markdown.pl " buffer-file-name " > " out-file-name))
              )))

;;; init.el ends here
