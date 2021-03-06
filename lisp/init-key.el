(require 'multiple-cursors-core)

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
(global-set-key (kbd "C-S-s") 'desktop-save)
(global-set-key (kbd "C-S-o") 'desktop-change-dir)

(define-key mc/keymap (kbd "<return>") nil)

(provide 'init-key)
