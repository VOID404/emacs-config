(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (epresent yaml-mode winum which-key web-mode use-package sudo-edit spaceline smex smartparens rust-snippets rjsx-mode racer prodigy popwin pallet ox-reveal ob-restclient nyan-mode neotree multiple-cursors minimap linum-relative iflipb idle-highlight-mode htmlize general flycheck-rust flycheck-cask expand-region exec-path-from-shell evil-magit ensime drag-stuff dracula-theme dockerfile-mode counsel-projectile company-restclient base16-theme autopair ace-window ace-jump-buffer))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'cask "~/.cask/cask.el")
(cask-initialize)


(evil-mode 1)

(org-babel-load-file
 (expand-file-name "settings.org"
		   user-emacs-directory))
