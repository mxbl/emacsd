
;; this function is bind to the `escape'-key in various minibuffer key maps
;; resulting in not having to hit escape 3 times to cancel and leave
;; the bindings are set in `bindings.el'
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
the it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(require-package 'popwin)
(require 'popwin)
(popwin-mode)
(push '("*scratch*" :position top :height 16) popwin:special-display-config)
(push '(term-mode   :position top :height 16) popwin:special-display-config)

(defun popwin-term:term (exe)
  (interactive)
  (popwin:display-buffer-1
   (or (get-buffer "*terminal*")
       (save-window-excursion
         (term exe)))
   :default-config-keywords '(:position :top)))

(provide 'utils)
