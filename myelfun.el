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

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(defun surround-region ()
  "Wraps REGION in parens, then jumps to beginning of next word."
  (interactive)
  (save-excursion
    (goto-char (region-beginning))
    (insert (read-char)))
    (goto-char (region-end))
    (insert (read-char)))

(defun insert-counter (n x)
  "Insert numbers followed by whateverf aye?"
  (dotimes (n x) (insert (format "%2d.\n" (+ 1 n))))
  )


(defun run-game ()
  "Run the Play script with the argument provided by the user when prompted.
   It is to be noted that Emacs will only be useable again when the game has been quit."
  (interactive)
  (let ((script "~/scripts/play.sh")
	(choices '(("g" 1) ("m" 2) ("i" 3) ("p" 4) ("d" 5))))
    (let ((user-choice (completing-read
			"[g]oose [m]inecraft [i]saac [p]sx [d]warffortreess : " choices nil t "")))
      (cond ((string= user-choice "m") (shell-command (concat script " minecraft") nil nil))
	    ((string= user-choice "g") (shell-command (concat script " goose") nil nil))
	    ((string= user-choice "i") (shell-command (concat script " isaac") nil nil))
	    ((string= user-choice "d") (shell-command (concat script " dwarf") nil nil))
	    ((string= user-choice "p") (shell-command (concat script " psx") nil nil))))))

;;;--------------------------------------------------

(provide 'myelfun)

;;; myelfun.el ends here
