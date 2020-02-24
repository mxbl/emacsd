(setq org-log-done t)
(setq org-agenda-files (list "~/org/diary.org"
			     "~/org/work.org"
			     "~/org/school.org"
			     "~/org/home.org"))

(org-babel-do-load-languages 'org-babel-load-languages
			     '((shell . t)
			       (haskell . t)
			       (python . t)))

(require-package 'org-journal)
(customize-set-variable 'org-journal-dir "~/org/")
(require 'org-journal)

;;(require 'org-roam)
;; (add-hook 'org-mode-hook
;;	    (org-roam-mode))

(provide 'config-org-mode)
