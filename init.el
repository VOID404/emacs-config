(setq package-enable-at-startup nil)

(set-foreground-color "white")
(set-background-color "black")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)

(setq gc-cons-threshold 2000000)

(set-face-attribute 'default nil :height 120)
(set-face-font 'default "FiraCode Nerd Font")

(delete-selection-mode 1)

(setq initial-scratch-message ";; Happy hacking!\n")
(setq inhibit-startup-screen t)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq package-enable-at-startup nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; ELPACA
(defvar elpaca-installer-version 0.5)
(load (expand-file-name "elpaca.el" user-emacs-directory))

(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

(elpaca org
  (require 'org))

(elpaca general
  (require 'general))

(elpaca goto-chg)

(elpaca evil
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-keybinding nil)
  (require 'evil)
  (evil-mode 1))

(elpaca evil-collection
  (require 'evil-collection)
  (evil-collection-init))

;; Block until current queue processed.
(elpaca-wait)

(org-babel-load-file
 (expand-file-name "settings.org" user-emacs-directory))
