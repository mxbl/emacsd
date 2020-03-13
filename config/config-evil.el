(setq evil-want-C-u-scroll t)

(require-package 'evil)
(evil-mode)

(cl-loop for mode in '(eshell-mode
		       term-mode
		       dired-mode
		       diff-mode
		       git-commit-mode
		       custom-mode)
	 do (evil-set-initial-state mode 'emacs))

(require-package 'evil-surround)
(global-evil-surround-mode 1)

(setq evil-normal-state-cursor '("green" box)
      evil-visual-state-cursor '("orange" box)
      evil-motion-state-cursor '("orange" box)
      evil-insert-state-cursor '("red" bar)
      evil-replace-state-cursor '("red" bar)
      evil-operator-state-cursor '("red" hollow)
      evil-emacs-state-cursor '("red" box))

(evil-put-property 'evil-state-properties 'normal   :tag " NORMAL ")
(evil-put-property 'evil-state-properties 'insert   :tag " INSERT ")
(evil-put-property 'evil-state-properties 'visual   :tag " VISUAL ")
(evil-put-property 'evil-state-properties 'motion   :tag " MOTION ")
(evil-put-property 'evil-state-properties 'emacs    :tag " EMACS ")
(evil-put-property 'evil-state-properties 'replace  :tag " REPLACE ")
(evil-put-property 'evil-state-properties 'operator :tag " OPERATOR ")

(require-package 'magit)
(require-package 'evil-magit)
(require 'evil-magit)

(provide 'config-evil)
