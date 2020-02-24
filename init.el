;; do not touch this !!
(package-initialize)

(eval-when-compile (require 'cl))

;; streamline the interface, do it early to reduce emacs flickering
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-echo-area-message t
      inhibit-startup-message t
      inhibit-splash-screen t
      initial-scratch-message "")

;; extend the `load-path'
(let ((config-dir (concat user-emacs-directory "config/"))
      (site-lisp-dir (concat user-emacs-directory "site-lisp/")))
  (add-to-list 'load-path config-dir)
  (add-to-list 'load-path site-lisp-dir))

;; set some global constants
(setq emacsd-cache-directory (concat user-emacs-directory ".cache/")
      custom-theme-directory (concat user-emacs-directory "themes")
      custom-file            (concat user-emacs-directory "custom.el")
      bindings-file          (concat user-emacs-directory "bindings.el"))

;; setup package management
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")))
(package-initialize)

(defun require-package (package)
  "Ensures that PACKAGE is installed."
  (unless (or (package-installed-p package)
	      (require package nil 'noerror))
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(defmacro after (feature &rest body)
  "Executes BODY after FEATURE has been loaded.

FEATURE may be anyone of:
    'evil      => (with-eval-after-load 'evil BODY)
    \"evil-autoloads\" => (with-eval-after-load \"evil-autoloads\" BODY)
    [evil cider]       => (with-eval-after-load 'evil
                            (with-eval-after-load 'cider
                              BODY))
"
  (declare (indent 1))
  (cond
   ((vectorp feature)
    (let ((prog (macroexp-progn body)))
      (cl-loop for f across feature
	       do
	       (progn
		 (setq prog (append `(',f) `(,prog)))
		 (setq prog (append '(with-eval-after-load) prog))))
      prog))
   (t
    `(with-eval-after-load ,feature ,@body))))

;; load customizations / eyecandys / theme
(when (file-exists-p custom-file) (load custom-file))
(load-theme 'default-dark)

(require 'config-core)
(require 'config-paredit)
(require 'config-evil)
(require 'config-hydra)
(require 'config-helm)
(require 'config-eshell)
(require 'config-org-mode)

;; load key bindings
(when (file-exists-p bindings-file) (load bindings-file))
