
(setq scroll-conservatively 101
      scroll-preserve-screen-position t
      scroll-margin 7)

;; remove the previously set scroll margin for terminal mode buffers
(add-hook 'term-mode-hook (lambda ()
			    (setq-local scroll-margin 0)))

;; put auto saves in the cache
(let ((dir (expand-file-name (concat emacsd-cache-directory "auto-save/"))))
  (setq auto-save-list-file-prefix (concat dir "saves-")
	auto-save-file-name-transform `((".*" ,(concat dir "save-") t))))

(setq backup-directory-alist `((".*" . ,(expand-file-name (concat emacsd-cache-directory "backups/"))))
      backup-by-copying t
      version-control t
      kept-old-versions 0
      kept-new-versions 20
      delete-old-versions t)

(set-default 'truncate-lines t)

(require-package 'smex)
(smex-initialize)

(display-battery-mode t)

;; projectile
(require-package 'projectile)
(require-package 'helm-projectile)
(require-package 'ag)
(projectile-global-mode t)

(setq projectile-cache-file (concat emacsd-cache-directory "projectile.cache")
      projectile-known-projects-file (concat emacsd-cache-directory "projectile-bookmarks.eld")
      projectile-enable-caching t
      projectile-indexing-method 'alien)

(cl-loop for dir in '("elpa" ".cache" "node_modules")
	 do
	 (add-to-list 'projectile-globally-ignored-directories dir))



(provide 'config-core)
