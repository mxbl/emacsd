(require-package 'hydra)

(defhydra buffer-hydra (:hint nil :exit t)
  ""
  ("b" (ido-switch-buffer))
  ("f" (ido-find-file)))

 (defhydra org-mode-hydra (:color pink :hint nil :exit t)
  "
_a_: agenda _o_: open _t_: todo
"
  ("a" org-agenda)
  ("o" org-open-at-point)
  ("t" org-todo :exit nil)
  ("q" nil))

(provide 'config-hydra)
