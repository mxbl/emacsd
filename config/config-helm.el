(require-package 'helm)

(after 'helm
  (require-package 'helm-projectile)
  (require-package 'helm-ag)
  
  (setq helm-autoresize-min-height 10
	helm-autoresize-max-height 20
	helm-buffer-max-length 40
	helm-bookmark-show-location t
	helm-ag-fuzzy-match t
	helm-ag-use-agignore t)

  (helm-autoresize-mode t)

  ;; needed ?
  (if nil
      (after 'helm-ag
	(cond ((executable-find "ag") ; on debian install `silversearcher-ag'
	       t)))))

(provide 'config-helm)
