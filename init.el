;;; init.el --- My Emacs init file.
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

;;; --------------------------------------------------
;;; use-package setup 🔧
;;; --------------------------------------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;;; --------------------------------------------------
;;; changing the default shi 😂
;;; --------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t
      initial-buffer-choice 'eshell)

(load (concat user-emacs-directory "custom.el"))
(load (concat user-emacs-directory "myelfun.el"))

(setq eshell-banner-message
      (concat (nth (random (length *eshell-welcome-messages*))
		   *eshell-welcome-messages*)  "\n\n"))

(global-set-key (kbd "M-;") 	    'comment-or-uncomment-region)
(global-set-key (kbd "M-5") 	    'query-replace)
(global-set-key (kbd "s-f") 	    'forward-whitespace)
(global-set-key (kbd "M-3") 	    'point-to-register)
(global-set-key (kbd "C-3") 	    'jump-to-register)
(global-set-key (kbd "C-c C-v")     'browse-ur)
(global-set-key (kbd "C-c C-e C-b") 'eval-buffer)
(global-set-key (kbd "C-c C-c C-c") 'compile)
(global-display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(defvar c-default-style "linux")

;;; --------------------------------------------------
;;; Packages 📦
;;; --------------------------------------------------

(use-package monokai-theme
  :config (load-theme 'monokai))

(use-package helm
  :ensure t
  :bind (("C-x C-f"	. 'helm-find-files)
	 ("C-s"		. 'helm-occur)
	 ("C-x b"	. 'helm-mini)
	 ("M-x"		. 'helm-M-x)
	 ("C-h C-r"	. 'helm-register)
	 ("C-h C-b"	. 'helm-bookmarks)
	 ("C-h C-h"	. 'helm-man-woman)
	 ("C-h C-c"	. 'helm-calcul-expression)
	 ("C-h C-g"	. 'helm-grep-do-git-grep)
	 ("C-h C-f"	. 'helm-find)
	 ("C-h C-k"	. 'helm-show-kill-ring)))

(use-package ace-window
  :ensure t
  :bind	  ("C-x o" . 'ace-window)
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 2.0))))))

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
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package  yasnippet-classic-snippets
  :ensure t)

(use-package yasnippet
  :ensure t
  :config (yas-global-mode t)
  (yas-reload-all))

(use-package company
  :ensure t
  :config (global-company-mode)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  :bind ("C-<tab>" . 'company-search-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config (setq flycheck-clang-include-path '("/opt/homebrew/include/"))
  :custom (flycheck-display-errors-delay .3))

(use-package elpy
  :ensure t
  :config (elpy-enable)
	  (when (require 'flycheck nil t)
	    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	    (add-hook 'elpy-mode-hook 'flycheck-mode)))

(use-package org
  :ensure t
  :bind (("C-c l" . 'org-store-link)
	 ("C-c a" . 'org-agenda)
	 ("C-c c" . 'org-capture)
	 ("C-c b" . 'org-switchb))
  :config
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/.emacs.d/org/agendas/work.org"
			   "~/.emacs.d/org/agendas/home.org"
			   "~/.emacs.d/org/agendas/personal_projects.org"))
  (org-babel-do-load-languages 'org-babel-load-languages
			       '((shell . t)(lisp  . t)(python . t))))

(use-package org-journal
  :ensure t
  :bind (("C-c j"   . 'org-journal-new-entry)
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
			      "https://www.lemonde.fr/rss/une.xml")))

;;;--------------------------------------------------
;;; init.el ends here
;;;--------------------------------------------------
(provide 'init)
