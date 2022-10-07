(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
(defvar c-default-style "linux")

(load-theme 'modus-vivendi)

(global-set-key (kbd "C-c e b") 'eval-buffer)
(global-set-key (kbd "M-;")	'comment-or-uncomment-region)
(global-set-key (kbd "M-5") 	'query-replace)

(defun change-home-dir (dir)
  "makes the home dir where you tell it to be"
  (setenv "HOME" dir)
  (message (format "Home location has changed, it is now %s" (getenv "HOME"))))

(change-home-dir "c:/Users/x0bjorge")

(setenv "PATH" "/usr/local/bin:/usr/bin:/cygdrive/c/Oracle12/Client/bin:/cygdrive/c/ProgramData/Oracle/Java/javapath:/cygdrive/c/WINDOWS/system32:/cygdrive/c/WINDOWS:/cygdrive/c/WINDOWS/System32/Wbem:/cygdrive/c/WINDOWS/System32/WindowsPowerShell/v1.0:/cygdrive/c/WINDOWS/System32/OpenSSH:/cygdrive/o/NSRNT:/cygdrive/c/Program Files (x86)/Pico Technology/PicoScope6:/cygdrive/c/Program Files\ (x86)/Sennheiser/SenncomSDK:/cygdrive/c/Users/x0bjorge/AppData/Local/Microsoft/WindowsApps:/usr/bin")

(setq binary-process-input t) 
(setq w32-quote-process-args ?\") 
(setq shell-file-name "bash") ;; or sh if you rename your bash executable to sh. 
(setenv "SHELL" shell-file-name) 
(setq explicit-shell-file-name shell-file-name) 
(setq explicit-sh-args '("-login" "-i"))

(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)

(defun regexp-alternatives (regexps)
  "Return the alternation of a list of regexps."
  (mapconcat (lambda (regexp)
               (concat "\\(?:" regexp "\\)"))
             regexps "\\|"))

(defvar non-sgr-control-sequence-regexp nil
  "Regexp that matches non-SGR control sequences.")

(setq non-sgr-control-sequence-regexp
      (regexp-alternatives
       '(;; icon name escape sequences
         "\033\\][0-2];.*?\007"
         ;; non-SGR CSI escape sequences
         "\033\\[\\??[0-9;]*[^0-9;m]"
         ;; noop
         "\012\033\\[2K\033\\[1F"
         )))

(defun filter-non-sgr-control-sequences-in-region (begin end)
  (save-excursion
    (goto-char begin)
    (while (re-search-forward
            non-sgr-control-sequence-regexp end t)
      (replace-match ""))))

(defun filter-non-sgr-control-sequences-in-output (ignored)
  (let ((start-marker
         (or comint-last-output-start
             (point-min-marker)))
        (end-marker
         (process-mark
          (get-buffer-process (current-buffer)))))
    (filter-non-sgr-control-sequences-in-region
     start-marker
     end-marker)))

(add-hook 'comint-output-filter-functions
          'filter-non-sgr-control-sequences-in-output)


(setq inhibit-startup-message t
      initial-buffer-choice 'shell)

(electric-pair-mode)

(message "Welcome, wizard.")
