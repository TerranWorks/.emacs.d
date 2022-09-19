;; BASIC CUSTOMIZATION
;; --------------------------------------


(progn ;  startup
  (setq user-init-file (or load-file-name buffer-file-name))
  (setq user-emacs-directory (file-name-directory user-init-file))
  (when (< emacs-major-version 27)
    (setq package-enable-at-startup nil)
    (load-file (expand-file-name "early-init.el" user-emacs-directory)))
  (setq inhibit-startup-buffer-menu t)
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-message t)
  (setq inhibit-startup-echo-area-message "locutus")
  (setq initial-buffer-choice t)
  (setq initial-scratch-message "")
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
  (when (fboundp 'tool-bar-mode) (tool-bar-mode 0))
  (when (fboundp 'menu-bar-mode) (menu-bar-mode 0))
  (global-linum-mode t))

<<<<<<< HEAD
;;;; Defaults

;; Customize tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width-4)



;;temp
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "linux")
(setq c-basic-offset 4)
(c-set-offset 'comment-intro 0)

=======
;; Delete selected text when typing 
(delete-selection-mode 1)
>>>>>>> refs/remotes/origin/main

;; Disables *Messages* buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")


;; Disables *Completions* buffer
(add-hook 'minibuffer-exit-hook
(lambda ()
(let ((buffer "*Completions*"))
(and (get-buffer buffer)
(kill-buffer buffer)))))


;; Open Emacs window at maximum size
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Borg
(setq package-enable-at-startup nil)

(eval-and-compile ; `borg'
  (add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))
  (require 'borg)
  (borg-initialize))


(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lib/use-package" user-emacs-directory))
  (require 'use-package)
 ;;(advice-add 'use-package-ensure-function :override #'borg-assimilate)
 )


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


(use-package clang-format
  :config
  (global-set-key [C-M-tab] 'clang-format-region))


;;Markdown

(use-package pandoc)

(use-package markdown-mode
  ;;:ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :commands (markdown markdown-mode gfm-mode)
  :config
  (setq markdown-command "pandoc -t html5"))

(use-package simple-httpd
  ;;:ensure t
  :config
  (setq httpd-port 7070)
  (setq httpd-host (system-name)))

(use-package impatient-mode
  ;;:ensure t
  :commands impatient-mode imp-set-user-filter imp-visit-buffer)

(defun my-markdown-filter (buffer)
  (princ
   (with-temp-buffer
     (let ((tmp (buffer-name)))
       (set-buffer buffer)
       (set-buffer (markdown tmp))
       (format "<!DOCTYPE html><html><title>Markdown preview</title><link rel=\"stylesheet\" href = \"https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css\"/>
<body><article class=\"markdown-body\" style=\"box-sizing: border-box;min-width: 200px;max-width: 980px;margin: 0 auto;padding: 45px;\">%s</article></body></html>" (buffer-string))))
   (current-buffer)))

(defun my-markdown-preview ()
  "Preview markdown."
  (interactive)
  (unless (process-status "httpd")
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'my-markdown-filter)
  (imp-visit-buffer))


;; Tramp
(use-package tramp
  :config
  (setq tramp-default-method "ssh"))


;; Flyspell
;; (use-package flyspell
;;   :custom
;;   (ispell-program-name "aspell")
;;   (aspell-dictionary "en_US")
;;   (aspell-program-name "/usr/bin/aspell")
;;   (ispell-dictionary "en_US")
;;   (ispell-program-name "/usr/bin/aspell"))


;; Fountain
(use-package fountain-mode
  :commands fountain-mode
  :mode ("\\.fountain\\'" . fountain-mode)
  :hook ((fountain-mode . visual-line-mode)))

