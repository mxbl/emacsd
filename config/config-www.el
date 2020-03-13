
(defcustom www/use-lsp-html
  nil
  "Whether to use LSP mode for HTML buffers."
  :type 'boolean
  :group 'www)

(defun lsp/activate ()
  (interactive)
  (require-package 'lsp-mode)
  ;(require-package 'lsp-ui)
  (require-package 'lsp-treemacs)
  (require-package 'company-lsp)
  (setq lsp-prefer-flymake nil
	lsp-keep-workspace-alive nil
	lsp-ui-doc-include-signature t
	lsp-ui-doc-header t
	lsp-session-file (concat emacsd-cache-directory
				 ".lsp-session-v1"))

  (lsp)
  (lsp-ui-mode -1)
  ;(lsp-enable-which-key-integration)
  (lsp-treemacs-sync-mode t))

(lazy-major-mode "\\.jade$" jade-mode)
(lazy-major-mode "\\.scss$" scss-mode)
(lazy-major-mode "\\.sass$" sass-mode)
(lazy-major-mode "\\.less$" less-css-mode)
(lazy-major-mode "\\.coffee$" coffee-mode)
(lazy-major-mode "\\.html$" web-mode)

(require-package 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)

(setq coffee-indent-like-python-mode t)

(require-package 'web-mode)
(after 'web-mode

  (defun www/web-mode-hook ()
    (when www/use-lsp-html
      (lsp/activate)))

  (add-hook 'web-mode-hook #'www/web-mode-hook)

  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-element-content-fontification t)
  (setq web-mode-enable-element-tag-fontification t)
  (setq web-mode-enable-html-entities-fontification t)
  (setq web-mode-enable-inlays t)
  (setq web-mode-enable-sql-detection t)
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-part-face t))

;; javascript
(after 'js-mode
  (defun www/js-mode-hook ()
    (electric-pair-mode 1))

  (add-hook 'js-mode-hook #'www/js-mode-hook)

  (setq js-indent-level 2))

(provide 'config-www)
