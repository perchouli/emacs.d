
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'whitespace)

(require 'linum)
(global-linum-mode t)

(require 'init-whitespace)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)

;;(require 'init-dired) ;; Bug on Windows
(require-package 'dired-details)
(require-package 'resize-window)
;;(require-package 'php-mode)


(require 'recentf)
(setq recentf-max-saved-items 100)
(recentf-mode 1)

(global-set-key (kbd "C-S-s") 'desktop-save)
(global-set-key (kbd "C-S-o") 'desktop-change-dir)
;;(desktop-save-mode 1)

(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)

)



(if (eq system-type 'windows-nt)
  (setq default-directory "C:/cygwin64/srv/")
(ignore-errors
  (set-face-attribute 'default nil :font "Consolas")
)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
  charset (font-spec :family "Microsoft YaHei" )))
)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq indent-line-function 'insert-tab)(setq org-startup-indented t)
(setq frame-title-format "%b %f %+")



(ignore-errors (tool-bar-mode -1))

(require-package 'window-numbering)
(window-numbering-mode 1)
(require-package 'multiple-cursors)

(require-package 'auto-complete)
(ac-config-default)
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))


(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-set-key (kbd "C-M-n")(lambda () (interactive) (next-line 5)))
(global-set-key (kbd "C-M-p")(lambda () (interactive) (previous-line 5)))
