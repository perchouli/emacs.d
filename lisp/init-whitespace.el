(setq-default show-trailing-whitespace t)


;;; Whitespace

(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
		Info-mode-hook
		eww-mode-hook
		term-mode-hook
		comint-mode-hook
		compilation-mode-hook
		twittering-mode-hook
		minibuffer-setup-hook))
  (add-hook hook #'sanityinc/no-trailing-whitespace))


;; (require-package 'whitespace-cleanup-mode)
;; (global-whitespace-cleanup-mode t)
(global-whitespace-mode 2)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark face)))
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
      '(
	(space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
	(newline-mark 10 [8629 10]) ; 10 LINE FEED
	(tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
	))
;;(set-face-attribute 'whitespace-space nil :background nil :foreground nil)


;;(autoload 'whitespace-global-mode "whitespace"
;;  "Toggle whitespace visualization." t
;;  (setq whitespace-style (quote (face spaces tabs space-mark tab-mark)))
;;  )

(autoload 'whitespace-toggle-options "whitespace"
    "Toggle load `whitespace-mode' options." t)
(global-set-key [remap just-one-space] 'cycle-spacing)

(custom-set-faces
 '(whitespace-space ((t (:foreground "gray70")))))
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 

(provide 'init-whitespace)
