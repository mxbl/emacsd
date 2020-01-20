(setq eshell-directory-name (concat emacsd-cache-directory "eshell"))

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defalias 'eshell/clr #'eshell/clear)

(defun eshell/prev ()
  "Go back to previous buffer."
  (switch-to-buffer (other-buffer) nil t))

(defun eshell/h ()
  "Quickly run a previous command."
  (insert (completing-read
	   "Run previous command: "
	   (delete-dups (ring-elements eshell-history-ring))
	   nil
	   t)))

(defun eshell/other ()
  (other-window 1))

(defun eshell/hide ()
  (delete-window))

(defun eshell/ff (&rest args)
  "Opens a file in emacs"
  (when (not (null args))
    (mapc #'find-file
	  (mapcar #'expand-file-name
		  (eshell-flatten-list
		   (reverse args))))))

;(defalias 'eshell/o #'eshell/other)

;(require-package 'eshell-z)
;(setq eshell-z-freq-dir-hash-table-file-name (concat emacsd-cache-directory "eshell/z"))

(provide 'config-eshell)
