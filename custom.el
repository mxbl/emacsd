(line-number-mode t)
(column-number-mode t)
(show-paren-mode 1)
(fringe-mode '(10 . 0))

;(set-face-attribute 'default nil :font "Monaco-10.5")
;(set-face-attribute 'default nil :font "Source Code Pro for Powerline-11")

(require-package 'diminish)
(with-eval-after-load 'undo-tree (diminish 'undo-tree-mode))
(with-eval-after-load 'paredit (diminish 'paredit-mode))

;; streamline the interface
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (setq mode-name "EL")))

(defalias 'yes-or-no-p 'y-or-n-p)
(setq visible-bell nil)
(blink-cursor-mode -1)

(require-package 'smart-mode-line)
(setq sm/theme 'light) ; 'dark
(sml/setup)
(if nil ; maybe with better colors ?
    (after 'evil
      (defvar emacsd--orig-mode-line-bg (face-background 'mode-line))
      (defadvice evil-set-cursor-color (after emacsd activate)
	(cond ((evil-emacs-state-p)
	       (set-face-background 'mode-line "#440000"))
	      ((evil-insert-state-p)
	       (set-face-background 'mode-line "#002244"))
	      ((evil-visual-state-p)
	       (set-face-background 'mode-line "#440044"))
	      (t
	       (set-face-background 'mode-line emacsd--orig-mode-line-bg))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(battery-mode-line-format "[%b%p%% - %t]")
 '(cursor-in-non-selected-windows nil)
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "09d1ed1560b3ca3bb064c07de2e51af3cc639bbe3f1aa24528c1023b1896a460" "89d8b0707b639a34422f76afe2be50dd8bb53d0d45ae9c6fa598e8b4b40f8e8d" "9805f784036757d2c75568afa977cdf908de5d5038d32b63b073560d2c15e152" default)))
 '(font-use-system-font t)
 '(package-selected-packages
   (quote
    (spaceline smart-mode-line diminish delight doom-modeline popwin ace-window ace-jump-mode eshell-z ag helm-projectile helm-ag helm hydra projectile key-chord evil-surround evil paredit smex))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t nil)))
 '(mode-line ((t (:background "grey75" :foreground "black"))))
 '(mode-line-inactive ((t (:background "grey30" :foreground "grey80" :weight light)))))
