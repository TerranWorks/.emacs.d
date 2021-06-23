;; BASIC CUSTOMIZATION
;; --------------------------------------
;; Disables emacs startup screen
(setq inhibit-startup-screen t)

;; Saves backups and autosaves to .emacs_saves
(setq backup-directory-alist
      `((".*" . , ".emacs_saves")))
(setq auto-save-file-name-transforms
      `((".*" , ".emacs_saves" t)))

;; Disabled *Messages* 
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Disabled *Completions*
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))

;; Emacs window opens at maximum size
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disables menu and tool bars
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Enables Interactively Do Things mode
(ido-mode 1)

;; Enable line numbers globally
(global-linum-mode t)

;; Smex for M-x
(global-set-key (kbd "M-x") 'smex)

;; Shift lines up and down
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;;custom keybinds
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

(setq-default indent-tabs-mode nil)
(global-set-key (kbd "C-q") 'shell)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-a") 'mark-whole-buffer)


(global-set-key [(meta up)]  'move-line-up)
(global-set-key [(meta down)]  'move-line-down)

(global-whitespace-mode 1)
(setq tab-width 4)
(setq whitespace-style '(trailing tabs tab-mark))
(setq-default tab-width 4)

;;c++ mode
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-to-list 'auto-mode-alist '("\\.shader\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;Common Lisp
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(tab-stop-list (quote (4))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
