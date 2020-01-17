(require-package 'paredit)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))
(provide 'config-paredit)
