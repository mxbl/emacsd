(defmacro -define-key (keymap sequence bindings)
  (declare (indent defun))
  `(define-key ,keymap (kbd ,sequence) ,bindings))

;; single escape to leave any minibuffer
(require 'utils)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(require-package 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(-define-key evil-normal-state-map "SPC f" #'find-file)
(-define-key evil-normal-state-map "SPC w" #'save-buffer)
(-define-key evil-normal-state-map "SPC ." #'mode-line-other-buffer)
(-define-key evil-normal-state-map "SPC b" #'my-buffer-hydra/body)
(-define-key evil-normal-state-map "SPC h" help-map)
(-define-key evil-normal-state-map "SPC x" #'smex)
(-define-key evil-normal-state-map ", q" #'my-quit-hydra/body)

;; ace jumping around
;(-define-key evil-normal-state-map ", l" #'evil-ace-jump-line-mode)
;(-define-key evil-normal-state-map ", w" #'evil-ace-jump-word-mode)
;(-define-key evil-normal-state-map ", c" #'evil-ace-jump-char-mode)
(key-chord-define evil-normal-state-map "ff" 'evil-ace-jump-word-mode)
;(-define-key evil-normal-state-map ", f" #'ace-window)

;; projectile
(-define-key evil-normal-state-map "SPC p" #'projectile-command-map)
(-define-key evil-normal-state-map ", p" #'helm-projectile-switch-project)

;; elisp evaluation
(-define-key evil-normal-state-map ", e" #'eval-last-sexp)
(-define-key evil-normal-state-map ", , e" #'eval-defun)
(-define-key evil-normal-state-map ", , b" #'eval-buffer)
(-define-key evil-visual-state-map ", e" #'eval-region)

(-define-key evil-normal-state-map ", o" #'org-mode-hydra/body)

;; Window Management
;; switching windows with `C-h',`C-j',`C-k' and `C-l' in different modes
(-define-key evil-normal-state-map "C-h" #'evil-window-left)
(-define-key evil-normal-state-map "C-j" #'evil-window-down)
(-define-key evil-normal-state-map "C-k" #'evil-window-up)
(-define-key evil-normal-state-map "C-l" #'evil-window-right)

;; terminal mode
(-define-key evil-emacs-state-map "C-j" #'evil-window-down)

(add-hook 'eshell-mode-hook
	  (lambda ()
	    (-define-key eshell-mode-map "C-h" #'evil-window-left)
	    (-define-key eshell-mode-map "C-j" #'evil-window-down)
	    (-define-key eshell-mode-map "C-k" #'evil-window-up)
	    (-define-key eshell-mode-map "C-l" #'evil-window-right)))

;; geiser / scheme
(add-hook 'scheme-mode-hook
	  (lambda ()
	    (-define-key evil-normal-mode-map ", e" #'geiser-eval-last-sexp)
	    (-define-key evil-normal-mode-map ", , b" #'geiser-eval-buffer)
	    (-define-key evil-normal-mode-map ", , e" #'geiser-eval-definition-and-go)))

(-define-key evil-normal-state-map "SPC v" (kbd "C-w v C-w l")) ; verical split
(-define-key evil-normal-state-map "SPC s" (kbd "C-w s C-w j")) ; horizontal split
(-define-key evil-normal-state-map "SPC o" (kbd "C-x 1"))       ; kill all but the current window
(-define-key evil-normal-state-map "SPC k" (kbd "C-x 0"))       ; kill current window
