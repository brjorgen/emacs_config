;;; myelfun.el --- Elisp functions I wrote and, obvi, use at times.
;;;--------------------------------------------------
;;; Commentary:
;; Some of these are bound to be terrible but if they're here, they work.
;;;--------------------------------------------------
;;; Code:

(defvar light-theme 'gruvbox-light-soft)
(defvar dark-theme 'gruvbox-dark-hard)

(defun select-theme ()
  "Asks the user if they want to load a light theme."
  (if (y-or-n-p "Load light theme? ")
      (load-theme light-theme t)
    (load-theme dark-theme t)))

;; let's not forget that some insert-parens probably exists.

(defun surround-region ()
  "Wraps REGION in parens, then jumps to beginning of next word."
  (interactive)
  (save-excursion
    (goto-char (region-beginning))
    (insert (read-char)))
    (goto-char (region-end))
    (insert (read-char)))

(defun insert-counter (n x)
  "Insert counter at line break."
  (dotimes (n x) (insert (format "%2d.\n" (+ 1 n)))))

;;;--------------------------------------------------

(provide 'myelfun)

;;; myelfun.el ends here
