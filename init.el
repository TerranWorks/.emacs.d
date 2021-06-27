;; BASIC CUSTOMIZATION
;; --------------------------------------

(add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))
(require 'borg)
(borg-initialize)

(setq inhibit-startup-screen t) ;; Disable startup screen
(setq inhibit-startup-message t) ;; Disable startup message
(menu-bar-mode 0) ;; Disable menubar
(tool-bar-mode 0) ;; Disable toolbar
(global-linum-mode t) ;; Enable line numbers globally

;; Disables *Messages* buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")


;; Disables *Completions* buffer
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))


;; Saves backups and autosaves to .emacs_saves
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/.emacs_saves/"))


;; Open Emacs window at maximum size
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Cua settings
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour


;; custom keybinds
(global-set-key (kbd "C-q") 'shell)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-a") 'mark-whole-buffer)


;;Tabs
(electric-indent-mode 0)
(setq-default tab-width 4) ;;set number of character spaces equal to one tab
;;(setq-default indent-tabs-mode nil) ;;use spaces instead of tabs
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-style '(trailing tabs tab-mark)) ;;make tabs characters visible


;; MODE CUSTOMIZATION
;; --------------------------------------
;;c++ mode
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-to-list 'auto-mode-alist '("\\.shader\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))


;; MODULE CUSTOMIZATION
;; --------------------------------------
;; Enables Interactively Do Things mode
(ido-mode 1)

;; Smex for M-x
(global-set-key (kbd "M-x") 'smex)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(vmd-mode smex py-autopep8 org material-theme markdown-mode+ jedi flymd flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
