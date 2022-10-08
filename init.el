;;; init.el --- My Emacs init file 📦
;;; --------------------------------------------------
;;; Commentary:
;;; This is file is constantly evolving.  What you see now may not be what I currently use.
;;; --------------------------------------------------
;;; Code:

(package-initialize)

;;; --------------------------------------------------
;;; melpa 📚
;;; --------------------------------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives '("melpa" . "http://melpa.org/packages/") t))

(if (version< "27.0" emacs-version)
    (set-fontset-font
     "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)
  (set-fontset-font
   t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))

;;; --------------------------------------------------
;;; use-package setup 🔧
;;; --------------------------------------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; --------------------------------------------------
;;;; Muh elisp files 🤷‍
;;; --------------------------------------------------
;;; load them
;;; --------------------------------------------------
(load (concat user-emacs-directory "custom.el"))
(load (concat user-emacs-directory "myelfun.el"))

;;; --------------------------------------------------
;;; changing the default shit 😂
;;; --------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t
      initial-buffer-choice 'eshell)

(defvar c-default-style "linux")

;;; --------------------------------------------------
;;; Eshell setup ✅
;;; --------------------------------------------------

(setq eshell-banner-message (concat (nth (random (length *eshell-welcome-messages*))
					 *eshell-welcome-messages*)  "\n\n"))

;;; --------------------------------------------------
;;;; Generic editing stuff 📝
;;; --------------------------------------------------
;;; editing
;;; --------------------------------------------------

(global-set-key (kbd "M-;")	'comment-or-uncomment-region)
(global-set-key (kbd "M-5") 	'query-replace)

;;; --------------------------------------------------
;;; Movement 💨👟
;;; --------------------------------------------------
;; --- Whitespace jumps
(global-set-key (kbd "s-f")	'forward-whitespace)

;; --- REGISTERS 💾

(global-set-key (kbd "M-3")   'point-to-register)
(global-set-key (kbd "C-3")   'jump-to-register)

;;; ---------------------------------------------------
;; --- unsetting
;;; --------------------------------------------------

(global-unset-key (kbd "C-x r SPC"))
(global-unset-key (kbd "C-x r j"))

;;; --------------------------------------------------
;;;; Misc
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-e C-b") 'eval-buffer)
(global-set-key (kbd "M-g M-c")	    'save-buffers-kill-emacs)
(global-unset-key (kbd "C-x C-c"))

;;; --------------------------------------------------
;;;; Muh packages 📦
;;; --------------------------------------------------

(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox-dark-soft t))

(use-package smartparens
  :ensure t
  :config (smartparens-global-mode)
  (show-smartparens-global-mode))

(use-package helm
  :ensure t
  :bind (("C-x C-f"	. 'helm-find-files)
	 ("C-s"		. 'helm-occur)
	 ("C-x b"	. 'helm-mini)
	 ("M-x"		. 'helm-M-x)
	 ("C-h r"	. 'helm-register)
	 ("C-h b"	. 'helm-bookmarks)
	 ("C-h C-h"	. 'helm-man-woman)
	 ("C-h c"	. 'helm-calcul-expression)
	 ("C-h g"	. 'helm-grep-do-git-grep)
	 ("C-h f"	. 'helm-find)
	 ("C-h C-k"	. 'helm-show-kill-ring)))

(use-package ace-window
  :ensure t
  :bind	  ("C-x o" . 'ace-window)
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package ace-jump-mode
  :ensure t
  :bind   (("C-x w" . 'ace-jump-mode)
	  ("C-x j" . 'ace-jump-line-mode)))

(use-package magit
  :ensure t
  :bind (("C-; C-m" . 'magit-stage-modified)
	 ("C-; C-a" . 'magit-stage-file)
	 ("C-; C-c" . 'magit-commit)
	 ("C-; C-p" . 'magit-push)
	 ("C-; C-u" . 'magit-pull)
	 ("C-; C-d" . 'magit-diff)
	 ("C-; C-g" . 'magit-log)
	 ("C-; C-l" . 'magit-clone)
	 ("C-; C-s" . 'magit-status)
	 ("C-; C-i" . 'magit-init)
	 ("C-; C-m" . 'magit-merge)))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :config (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(use-package  yasnippet-classic-snippets
  :ensure t)

(use-package yasnippet
  :ensure t
  :config (yas-global-mode t)
  (yas-reload-all))

(use-package realgud
  :ensure t)

(use-package realgud-lldb
  :ensure t
  :bind (("C-c D" .  'realgud--lldb)))

(use-package company
  :ensure t
  :config (global-company-mode)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-t") 'company-search-toggle-filtering)
  (setq company-clang-arguments '("-I/opt/homebrew/include" "-I/usr/local/")))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode)
  (setq flycheck-clang-include-path '("/opt/homebrew/include/")))

;; (flycheck-define-checker c
;;   "Adding brew paths to clang"
;;   :command ("clang" "-Wall" "-Werror" "-Wextra" "-I /opt/homebrew/Cellar/*/*/include"))

(use-package org
  :ensure t
  :bind (("C-c l" . 'org-store-link)
	 ("C-c a" . 'org-agenda)
	 ("C-c c" . 'org-capture)
	 ("C-c b" . 'org-switchb))
  :config
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/.emacs.d/org/agendas/school.org"
			   "~/.emacs.d/org/agendas/home.org"
			   "~/.emacs.d/org/agendas/personal_projects.org")))

(use-package org-journal
  :ensure t
  :bind (("C-c j" . 'org-journal-new-entry)
	 ("C-c C-f" . 'org-journal-next-entry)
	 ("C-c C-b" . 'org-journal-previous-entry)
	 ("C-c C-s" . 'org-journal-search))
  :config
  (setq org-journal-dir "~/.org/journal"))

(use-package elfeed
  :ensure t
  :config
  (global-set-key (kbd "<f1>") #'elfeed)
  (mapcar #'elfeed-add-feed '("https://wwwnc.cdc.gov/eid/rss/ahead-of-print.xml"
			      "https://hnrss.org/frontpage"
			      "https://www.lemonde.fr/europe/rss_full.xml"
			      "https://www.lemonde.fr/politique/rss_full.xml"
			      "https://www.lemonde.fr/rss/une.xml")))

(use-package disaster
  :ensure t
  :config (define-key c-mode-base-map (kbd "C-c d") 'disaster))

(use-package rust-mode
  :ensure t)

;;; --------------------------------------------------
;;;; Misc. binding
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-v")	'browse-url)

;;; --------------------------------------------------
;;;; mode bindings & hooks
;;; --------------------------------------------------
;;; --------------------------------------------------
;;; C
;;; --------------------------------------------------

(add-hook 'c-mode-hook 'display-line-numbers-mode)
(global-set-key (kbd "C-c C-c c") 'compile)

;;; --------------------------------------------------
;;; LISP
;;; --------------------------------------------------
;; -- elisp
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;;; --------------------------------------------------
;;; PYTHON
;;; --------------------------------------------------
(setq python-shell-interpreter "python3.10")

;;; --------------------------------------------------
;;;; Transparency!
;;; --------------------------------------------------
(defun make-tansparent ()
  "Make the current frame transparent."
  (set-frame-parameter (selected-frame) 'alpha '(85 85))
  (add-to-list 'default-frame-alist '(alpha 85 85)))

;; (make-transparent)

;;;--------------------------------------------------
;;;; Quality of life stuffs
;;;--------------------------------------------------

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
	 (shell-command-to-string "$SHELL -i -l -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))
(add-to-list 'exec-path "~/.scripts")

;;;--------------------------------------------------
(provide 'init)
;;; init.el ends here
