
(setq scroll-conservatively 101
      scroll-preserve-screen-position t
      scroll-margin 7)

;; remove the previously set scroll margin for terminal mode buffers
;; otherwise clear screen does not work properly
(cl-loop for mode in '(term-mode-hook eshell-mode-hook)
	 do (add-hook mode (lambda ()
			     (setq-local scroll-margin 0))))

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

(require-package 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat emacsd-cache-directory "places"))

(setq server-auth-dir (concat emacsd-cache-directory "server"))
(require 'server)
(unless (server-running-p)
  (server-start))

(setq create-lockfiles nil
      initial-major-mode 'emacs-lisp-mode)

;; use UTF-8 everywhere
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; clean up old buffer periodically
(midnight-mode)

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

(require-package 'ace-jump-mode)
(require-package 'ace-window)

(provide 'config-core)
