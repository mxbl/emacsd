(require-package 'hydra)

(defhydra buffer-hydra (:hint nil :exit t)
  ""
  ("b" (ido-switch-buffer))
  ("f" (ido-find-file)))

(provide 'config-hydra)
