
(line-number-mode t)
(column-number-mode t)
(show-paren-mode 1)
(fringe-mode '(10 . 0))

;(set-face-attribute 'default nil :font "Monaco-10.5")
(set-face-attribute 'default nil :font "Source Code Pro for Powerline-11")

;; streamline the interface
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (setq mode-name "EL")))

(defalias 'yes-or-no-p 'y-or-n-p)
(setq visible-bell nil)
(blink-cursor-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(battery-mode-line-format "[%b%p%% - %t]")
 '(cursor-in-non-selected-windows nil)
 '(custom-safe-themes
   (quote
    ("89d8b0707b639a34422f76afe2be50dd8bb53d0d45ae9c6fa598e8b4b40f8e8d" "9805f784036757d2c75568afa977cdf908de5d5038d32b63b073560d2c15e152" default)))
 '(package-selected-packages
   (quote
    (ag helm-projectile helm-ag helm hydra projectile key-chord evil-surround evil paredit smex))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t nil)))
 '(mode-line ((t (:background "grey75" :foreground "black"))))
 '(mode-line-inactive ((t (:background "grey30" :foreground "grey80" :weight light)))))
