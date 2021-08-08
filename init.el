;;; init.el --- My Emacs init file
;;; --------------------------------------------------
;;; Commentary:
;;; This is file is constantly evolving.  What you see now may not be what I currently use.
;;; --------------------------------------------------
;;; Code:

(package-initialize)

;;; --------------------------------------------------
;;; melpa
;;; --------------------------------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives '("melpa" . "http://melpa.org/packages/") t))

;;; --------------------------------------------------
;;; custom-set-variables
;;; --------------------------------------------------
(setq custom-file (concat user-emacs-directory "/custom.el"))
(load-file custom-file)

;;; --------------------------------------------------
;;; use-package
;;; --------------------------------------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; --------------------------------------------------
;;; changing the default shit
;;; --------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
;; (defvar c-default-style "linux")
(setq inhibit-startup-message t
      initial-buffer-choice 'eshell)

(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
(setq eshell-prompt-function
(lambda ()
(concat
(propertize "┌─[" 'face `(:foreground "purple"))
(propertize (user-login-name) 'face `(:foreground "yellow"))
(propertize "@" 'face `(:foreground "purple"))
(propertize (system-name) 'face `(:foreground "green"))
(propertize "]──[" 'face `(:foreground "purple"))
(propertize (format-time-string "%H:%M" (current-time)) 'face `(:foreground "yellow"))
(propertize "]──[" 'face `(:foreground "purple"))
(propertize (concat (eshell/pwd)) 'face `(:foreground "white"))
(propertize "]\n" 'face `(:foreground "purple"))
(propertize "└─>" 'face `(:foreground "purple"))
(propertize (if (= (user-uid) 0) " # " " $ ") 'face `(:foreground "white"))
)))
(setq eshell-banner-message "
                     `. ___
                    __,' __`.                _..----....____   
        __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-'  
  _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'      
,'________________                          \\`-._`-','	       
 `._              ```````````------...___   '-.._'-:	       
    ```--.._      ,.                     ````--...__\\-.	       
            `.--. `-`                       ____    |  |`      
              `. `.                       ,'`````.  ;  ;`      
                `._`.        __________   `.      \\'__/`       
                   `-:._____/______/___/____`.     \  `        
                               |       `._    `.    \\	       
                               `._________`-.   `.   `.___     
                                                  `------'` Get 'em!\n\n\n")

;;; --------------------------------------------------
;;;; My elisp files
;;; --------------------------------------------------
;;; load them
;;; --------------------------------------------------
(load (concat user-emacs-directory "myelfun.el"))
(set-exec-path-from-shell-PATH)

;;; --------------------------------------------------
;;; (and in the darkness) Bind them
;;; --------------------------------------------------
(global-set-key (kbd "C-c p") 'surround-region)

;;; --------------------------------------------------
;;;; Generic editing stuff
;;; --------------------------------------------------
;;; editing
;;; --------------------------------------------------

(global-set-key (kbd "M-;")	'comment-or-uncomment-region)
(global-set-key (kbd "M-5") 	'query-replace)

;;; --------------------------------------------------
;;; Movement
;;; --------------------------------------------------
;; --- REGISTERS

(global-set-key (kbd "M-3")   'point-to-register)
(global-set-key (kbd "C-3")   'jump-to-register)

;;; ---------------------------------------------------
;; --- unsetting

(global-unset-key (kbd "C-x r SPC"))
(global-unset-key (kbd "C-x r j"))
(global-unset-key (kbd "C-c ! n"))
(global-unset-key (kbd "C-c ! p"))

;; c-u c-spc jumps.

;;; --------------------------------------------------
;;;; Misc
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-e C-b") 'eval-buffer)
(global-set-key (kbd "M-g M-c")	    'save-buffers-kill-emacs)
(global-unset-key (kbd "C-x C-c"))

;;(global-set-key (kbd "C-c C-q") (lambda () (interactive) (kill-emacs)))

;;; --------------------------------------------------
;;;; Muh plugins
;;; --------------------------------------------------

(load-theme 'brian-inkpot t)

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
	 ("C-h f"	. 'helm-find)))

(use-package ace-window
  :ensure t
  :bind	  ("C-x o" . 'ace-window))

(use-package ace-jump-mode
  :ensure t
  :bind   ("C-x w" . 'ace-jump-mode)
	  ("C-x j" . 'ace-jump-line-mode))

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
  :commands (undo-tree-visualizer-toggle-timestamps))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode t)
	  (yas-reload-all))

(use-package org
  :ensure t
  :bind (("C-c l" . 'org-store-link)
	 ("C-c a" . 'org-agenda)
	 ("C-c c" . 'org-capture)
	 ("C-c b" . 'org-switchb))
  :config
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/.org/agendas/school.org"
			   "~/.org/agendas/home.org"
			   "~/.org/agendas/personal_projects.org"
			   "~/.org/agendas/self_progress.org")))

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
  :config (mapcar #'elfeed-add-feed '("https://wwwnc.cdc.gov/eid/rss/ahead-of-print.xml"
				      "https://hnrss.org/frontpage"
				      "http://www.reddit.com/r/news/.rss")))

;;; --------------------------------------------------
;;;; Misc. binding
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-v") 'browse-url)
(global-set-key (kbd "C-h C-k") 'helm-show-kill-ring)
(global-set-key (kbd "C-c C-a")	'recompile)

;;; --------------------------------------------------
;;;; mode hooks & context-specific stuff
;;; --------------------------------------------------
;;; --------------------------------------------------
;;; C
;;; --------------------------------------------------
(add-hook 'c-mode-hook 'display-line-numbers-mode)

;;; --------------------------------------------------
;;; LISP
;;; --------------------------------------------------

(setq inferior-lisp-program "sbcl")

;; -- elisp
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;;;--------------------------------------------------
;;;; transparency!
;;;--------------------------------------------------
 ;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
 ;; (add-to-list 'default-frame-alist '(alpha 85 85))

;;;--------------------------------------------------
;;;; Quality of life stuffs
;;;--------------------------------------------------

(add-to-list 'exec-path "~/.scripts")

;;;--------------------------------------------------
(provide 'init)
;;; init.el ends here
