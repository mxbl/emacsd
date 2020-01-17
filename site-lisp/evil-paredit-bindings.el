
;;
;; *** depth changing commands ***
;;
;;   M-(      paredit-wrap-round
;;   M-s      paedit-splice-sexp
;;   M-<up>   paredit-splice-sexp-killing-backward
;;   M-r      paredit-raise-sexp
;;
;; C-<right> paredit-forward-slurp-sexp
;; C-<left> paredit-forward-barf-sexp
;;
;; M-S paredit-split-sexp

;; ?
;(-define-key evil-normal-state-map ", k" #'paredit-splice-sexp-killing-backward)

;; not good
(-define-key evil-normal-state-map "b" #'paredit-backward)
(-define-key evil-normal-state-map "e" #'paredit-forward)

;; good bindings,
;; explicitly revert the d binding for visual mode, dunno why this is necessary but it is
(-define-key evil-normal-state-map "d" #'paredit-kill)
(-define-key evil-visual-state-map "d" #'evil-delete) 
(-define-key evil-normal-state-map "x" #'paredit-forward-delete)
(-define-key evil-normal-state-map "s" #'paredit-splice-sexp)
(-define-key evil-normal-state-map "L" #'paredit-forward-slurp-sexp)
(-define-key evil-normal-state-map "H" #'paredit-forward-barf-sexp)

;; revert changes to normal
(when nil
  (-define-key evil-normal-state-map "e" #'evil-forward-word-end)
  (-define-key evil-normal-state-map "b" #'evil-backward-word-begin)
  (-define-key evil-normal-state-map "d" #'evil-delete)
  (-define-key evil-normal-state-map "x" #'evil-delete-char)
  (-define-key evil-normal-state-map "s" #'evil-susbtitute))

(defun f (x)
  "i \"iid\" dfdf"
  (lambda (x) (< (+ (+ x 1) 1) 3) (test)))

(defun my-other-command ()
  (when (and (this-predicate)
	     (that-predicate))
    (let ((v (calculate-v))
	  (x (calculate-x)))
      (do-something)
      (do-something-more)
      (do-a-third-thing))))

