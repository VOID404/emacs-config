(set-foreground-color "white")
(set-background-color "black")

(set-face-attribute 'default nil :height 120)
(set-face-font 'default "Fira Code")

(setq initial-scratch-message ";; Happy hacking!")
(setq inhibit-startup-screen t)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(global-display-line-numbers-mode)
(setq-default display-line-numbers 'relative)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package org
  :straight t)

(org-babel-load-file
 (expand-file-name "settings.org" user-emacs-directory))
