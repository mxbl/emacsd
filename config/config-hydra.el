
(require-package 'hydra)
(require 'hydra)

 (defhydra org-mode-hydra (:color pink :hint nil :exit t)
  "
_a_: agenda _o_: open _l_: store _t_: todo
"
  ("a" org-agenda)
  ("l" org-store-link)
  ("o" org-open-at-point)
  ("t" org-todo :exit nil)
  ("q" nil))

(require-package 'restart-emacs)
(defhydra my-quit-hydra (:hint nil :exit t)
  "
  quit: _q_ → quit  _r_ → restart
"
  ("q" save-buffers-kill-emacs)
  ("r" (restart-emacs '("--debug-init"))))


(defhydra my-toggle-hydra (:hint nil :exit t)
  "
  toggle: _t_ → truncate lines _p_ → paredit mode _l_ → linum mode
"
  ("t" toggle-truncate-lines)
  ("p" paredit-mode)
  ("l" linum-mode))

;"
;  buffer: _S_ → goto scratch  _b_ → buffer (ido)  _n_ → next  _p_ → prev   _l_ → list
;          _T_ → goto terminal _f_ → file   (ido)  _k_ → kill  _e_ → erase
;                              _N_ → switch/create
;  popup:  _s_ → scratch       _m_ → messages      _t_ → terminal _g_ → ghci
; "

(defhydra my-buffer-hydra (:hint nil :exit t)
  "
[goto → _S__T__N__b__f_] [nav → _n__p__l_] [popup → _s_cratch _m_sg _t_erm _g_hci] _e_rase _k_ill
"
  ("b" helm-buffers-list)
  ("f" ido-find-file)
  ("n" next-buffer)
  ("p" previous-buffer)
  ("k" ido-kill-buffer)
  ("e" erase-buffer)
  ("t" (popwin-term:term "/bin/zsh"))
  ("g" (popwin-term:term "/bin/ghci"))
  ("T" (switch-to-buffer "*terminal*"))
  ("m" popwin:messages)
  ("S" (switch-to-buffer "*scratch*"))
  ("s" (popwin:display-buffer-1 (get-buffer "*scratch*")))
  ("l" ibuffer)
  ("N" (call-interactively 'new-buffer)))

(defhydra my-grep-hydra (:hint nil :exit nil)
  "
  toggle: _g_ → rgrep _n_ → next error _p_ → previous error
"
  ("g" rgrep)
  ("n" next-error)
  ("p" previous-error))

(defhydra my-folding-hydra (:hint nil :exit nil)
  "
  toggle: _t_ → toggle _a_ → toggle all
"
  ("t" yafolding-toggle-element)
  ("a" yafolding-toggle-all))

(autoload 'magit-log-popup "magit-log" nil t)
(autoload 'magit-commit-popup "magit-commit" nil t)

(defhydra my-git-hydra (:hint nil :exit t)
  "
  magit: _s_ → status _l_ → log   _f_ → file   staging: _a_ → +hunk _A_ → +buffer
         _c_ → commit _d_ → diff  _z_ → stash           _r_ → -hunk _R_ → -buffer
         _p_ → push   _b_ → blame _m_ → merge
"
  ("s" magit-status)
  ("b" magit-blame-popup)
  ("f" magit-file-popup)
  ("z" magit-stash-popup)
  ("l" magit-log-popup)
  ("d" magit-diff-popup)
  ("c" magit-commit-popup)
  ("m" magit-merge-popup)
  ("p" magit-push-popup)
  ("a" magit-gutter+-stage-hunks)
  ("r" magit-gutter+-revert-hunk)
  ("A" magit-gutter+-stage-buffer)
  ("R" magit-gutter+-unstage-whole-buffer)
  )

(provide 'config-hydra)
