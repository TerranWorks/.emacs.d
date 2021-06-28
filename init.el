;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Borg
(setq package-enable-at-startup nil)

(eval-and-compile ; `borg'
  (add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))
  (require 'borg)
  (borg-initialize))


;; (progn ;    `;;use-package'
;;   (require  'use-package)
;;   (setq use-package-verbose t))

(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lib/use-package" user-emacs-directory))
  (require 'use-package))


(use-package epkg
  :defer t
  :init (setq epkg-repository
              (expand-file-name "var/epkgs/" user-emacs-directory)))


(use-package ivy
  :config
  (require 'ivy)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))


(use-package magit
  :defer t
  :commands (magit-add-section-hook)
  :config
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-modules
                          'magit-insert-stashes
                          'append))


(use-package no-littering)


(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

;; Vanilla Emacs Config
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

;;Tabs
;;(electric-indent-mode 0)
;;(setq-default tab-width 4) ;;set number of character spaces equal to one tab
;;(setq-default indent-tabs-mode nil) ;;use spaces instead of tabs
;;(require 'whitespace)
;;(global-whitespace-mode 1)
;;(setq whitespace-style '(trailing tabs tab-mark)) ;;make tabs characters visible


;; MODE CUSTOMIZATION
;; --------------------------------------
;;c++ mode
;;(defun my-c++-mode-hook ()
;;  (setq tab-width 4)
;;  (setq c-basic-offset 4)
;;  (c-set-offset 'substatement-open 0))
;;(add-hook 'c++-mode-hook 'my-c++-mode-hook)
;;(add-to-list 'auto-mode-alist '("\\.shader\\'" . c++-mode))
;;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;;(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
