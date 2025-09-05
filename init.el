;; No flash bang
(set-foreground-color "white")
(set-background-color "black")

;; Dracula-PRO
(let ((dracula-pro (expand-file-name "themes/dracula-pro" user-emacs-directory)))
  (when (file-exists-p dracula-pro)
    (add-to-list 'custom-theme-load-path dracula-pro)))

;; Separate customize file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (make-empty-file custom-file))
(load-file custom-file)

;; Basic GUI changes
(set-face-attribute 'default nil :height 120)
(set-face-font 'default "FiraCode Nerd Font")

(delete-selection-mode 1)

(setq initial-scratch-message ";; Happy hacking!\n")
(setq inhibit-startup-screen t)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(tab-bar-mode 1)

(show-paren-mode)
(electric-pair-mode)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Packages

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; GUI enhancements

(use-package all-the-icons
  :straight t)

(use-package doom-modeline
  :straight t
  :init
  (doom-modeline-mode 1))

;; Better search for everything - from M-x to C-s

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package counsel
  :straight t
  :init
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable)
  (counsel-mode 1))

(use-package swiper
  :bind (("C-s" . swiper)))

(use-package marginalia
  :straight t
  :init
  (marginalia-mode))

;; Completion

(use-package vertico
  :straight t
  :init
  (vertico-mode))

(use-package corfu
  :straight t
  :init
  (global-corfu-mode))

(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package which-key
  :straight t
  :init
  (which-key-mode 1))

(use-package helpful
  :straight t
  :bind (("C-h f" . helpful-callable)
	 ("C-h v" . helpful-variable)
	 ("C-h k" . helpful-key)
	 ("C-h x" . helpful-command)))

(use-package sqlite3
  :straight t)

(use-package org-roam 
  :straight t
  :init
  (setq org-roam-database-connector "sqlite-module")
  (setq org-roam-db-location (expand-file-name (locate-user-emacs-file "org-roam.db")))
  :bind (:prefix-map org-roam-entry-map
		     :prefix "C-c r"
		     (("c" . org-roam-capture)
		      ("f" . org-roam-node-find))))

(use-package vterm
  :straight t)

(use-package magit
  :straight t)

(add-to-list 'load-path (expand-file-name "scripts" user-emacs-directory))

(use-package unbound)

(use-package restclient
  :straight t)

(use-package verb
  :straight t)

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :config (define-key org-mode-map (kbd "C-c C-r") verb-command-map))

(use-package lsp-mode
  :straight t
  :commands lsp
  :config
  (setq lsp-format-buffer-on-save t))

(use-package lsp-ui
  :straight t
  :hook (lsp-mode . lsp-ui-mode))

(use-package treemacs
  :straight t
  :bind (("C-c t" . treemacs)))

;; Enable odin-mode and configure OLS as the language server
;; (use-package odin-mode
;;   :straight (:host github :repo "mattt-b/odin-mode")
;;   :mode ("\\.odin\\'" . odin-mode)
;;   :hook (odin-mode . lsp-deffered)
;;   :config
;;   (setq lsp-odin-ols-binary-path "/home/void/.bin/ols")
;;   :bind (:map odin-mode-map
;; 	      :prefix-map odin-mode-custom-map
;; 	      :prefix "C-c"
;; 	      ("C-c" . compile)
;; 	      ("C-f" . lsp-format-buffer)))

;; Or use the WIP tree-sitter mode
(use-package odin-ts-mode
  :straight (:host github :repo "Sampie159/odin-ts-mode")
  :mode ("\\.odin\\'" . odin-ts-mode)
  :hook (odin-ts-mode . lsp)
  :init
  (add-to-list 'treesit-language-source-alist '(odin "https://github.com/tree-sitter-grammars/tree-sitter-odin"))
  :config
  (setq lsp-odin-ols-binary-path "/home/void/.bin/ols")
  :bind (:map odin-ts-mode-map
	      :prefix-map odin-mode-custom-map
	      :prefix "C-c"
	      ("C-c" . compile)
	      ("C-f" . lsp-format-buffer)))

(use-package zig-ts-mode
  :straight (:type git :host codeberg :repo "meow_king/zig-ts-mode")
  :mode ("\\.zig\\'" . zig-ts-mode)
  :init
  (add-to-list 'treesit-language-source-alist '(zig "https://github.com/maxxnino/tree-sitter-zig"))
  :hook (zig-ts-mode . lsp)
  :bind (:map zig-ts-mode-map
	      :prefix-map zig-mode-custom-map
	      :prefix "C-c"
	      ("C-c" . compile)
	      ("C-f" . lsp-format-buffer)))

(use-package crux
  :straight t)

(defun open-init-file ()
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

(bind-keys ("C-c i" . open-init-file))
