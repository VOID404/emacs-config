(set-foreground-color "white")
(set-background-color "black")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)

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

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package org)

(use-package general)

(use-package goto-chg)

(use-package evil
  :config
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-keybinding nil)
  (evil-mode 1))

(org-babel-load-file
 (expand-file-name "settings.org" user-emacs-directory))
