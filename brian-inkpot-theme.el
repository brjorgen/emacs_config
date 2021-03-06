(deftheme brian-inkpot
  "Created 2021-08-08.")

(custom-theme-set-variables
 'brian-inkpot
 '(custom-safe-themes '("f956b10d80e774db159dadaf43429b334316f69becbd6037ee023833fb35e4bd" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "50ff65ab3c92ce4758cc6cd10ebb3d6150a0e2da15b751d7fbee3d68bba35a94" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "3be1f5387122b935a26e02795196bc90860c57a62940f768f138b02383d9a257" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "ed36f8e30f02520ec09be9d74fe2a49f99ce85a3dfdb3a182ccd5f182909f3ab" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default))
 '(elfeed-feeds '("https://wwwnc.cdc.gov/eid/rss/ahead-of-print.xml"))
 '(org-agenda-files '("~/.org/self_progress.org" "~/.org/thoughts.org"))
 '(org-babel-load-languages '((C . t) (emacs-lisp . t)))
 '(package-selected-packages '(inpot-theme inkpot-theme helm-ag ag racer cargo toml-mode flycheck-rust rust-mode elfeed dumb-jump flycheck smartparens nyan-mode yasnippet-snippets paredit cider clojure-mode helm-spotify-plus helm-spotify pdf-tools undo-tree org-journal flycheck-clang-tidy base16-theme powerline company find-file-in-project yasnippet gruvbox-theme ace-jump-mode org slime proof-general ace-window flymake-cppcheck solarized-theme magit dracula-theme helm))
 '(send-mail-function 'mailclient-send-it))

(custom-theme-set-faces
 'brian-inkpot
 '(button ((t (:underline t :foreground "#ff8bff"))))
 '(link ((t (:foreground "#ff8bff"))))
 '(link-visited ((t (:foreground "#c080d0"))))
 '(cursor ((t (:background "#8b8bff"))))
 '(widget-field ((t (:foreground "#c080d0" :background "#ffcd00"))))
 '(escape-glyph ((t (:foreground "#8b8bcd"))))
 '(fringe ((t (:background "#2e2e2e" :foreground "#8b8bcd"))))
 '(highlight ((t (:background "#404040"))))
 '(success ((t (:foreground "#00ff8b"))))
 '(warning ((t (:foreground "#ffffff" :background "#ce8e4e"))))
 '(font-lock-builtin-face ((t (:foreground "#ff8bff"))))
 '(font-lock-comment-face ((t (:foreground "#cd8b00"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-doc-face ((t (:foreground "#808bed"))))
 '(font-lock-constant-face ((t (:foreground "#409090"))))
 '(font-lock-function-name-face ((t (:foreground "chocolate"))))
 '(font-lock-keyword-face ((t (:foreground "DarkSlateGray2"))))
 '(font-lock-preprocessor-face ((t (:foreground "yellow1"))))
 '(font-lock-string-face ((t (:foreground "#ffcd8b" :background "#404040"))))
 '(font-lock-type-face ((t (:foreground "red"))))
 '(font-lock-variable-name-face ((t nil)))
 '(font-lock-warning-face ((t (:foreground "#ffffff" :background "#6e2e2e"))))
 '(font-lock-negation-char-face ((t (:foreground "#cfbfad"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#808bed" :weight bold))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#c080d0" :weight bold))))
 '(header-line ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e" :box (:line-width -1 :color "#7070a0")))))
 '(mode-line ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e" :box (:line-width -1 :color "#7070a0")))))
 '(mode-line-inactive ((t (:foreground "#b9b9b9" :background "#3e3e5e" :box (:line-width -1 :color "#7070a0")))))
 '(region ((t (:background "#4e4e8f" :foreground "#ffffff"))))
 '(secondary-selection ((t (:foreground "#b38363" :inverse-video t))))
 '(show-paren-match ((t (:background "hot pink"))))
 '(show-paren-match-expression ((t (:background "#2e2e3f"))))
 '(isearch ((t (:bold t :foreground "#303030" :background "#ad7b57"))))
 '(isearch-fail ((t (:foreground "#ffffff" :background "#ce4e4e"))))
 '(lazy-highlight ((t (:foreground "#303030" :background "#ad7b57"))))
 '(minibuffer-prompt ((t (:bold t :foreground "#7e7eae"))))
 '(line-number ((t (:background "#2e2e2e" :foreground "#8b8bcd"))))
 '(line-number-current-line ((t (:bold t :background "#1e1e27" :foreground "#ffcd00"))))
 '(tab-bar ((t (:bold t :foreground "#b9b9b9" :background "#2e2e37"))))
 '(tab-bar-tab ((t (:foreground "#b9b9b9" :background "#3e3e5e" :box (:line-width -1 :color "#7070a0")))))
 '(tab-bar-tab-inactive ((t (:bold nil :italic t :foreground "#b9b9b9" :background "#3e3e5e"))))
 '(which-func ((t (:bold t :foreground "#b9b9b9"))))
 '(diff-added ((t (:background "#163616"))))
 '(diff-removed ((t (:background "#361616"))))
 '(diff-refine-added ((t (:background "#306d30"))))
 '(diff-refine-removed ((t (:background "#6d3030"))))
 '(dired-directory ((t (:foreground "#00ff8b"))))
 '(dired-header ((t (:foreground "#cd8b00"))))
 '(dired-symlink ((t (:bold t :foreground "#ffcd00"))))
 '(info-xref ((t (:foreground "#409090"))))
 '(info-menu-star ((t (:foreground "#409090"))))
 '(message-cited-text-1 ((t (:foreground "#cd8b00"))))
 '(message-header-name ((t (:foreground "#ab60ed"))))
 '(message-header-other ((t (:foreground "#409090"))))
 '(message-header-subject ((t (:foreground "#808bed"))))
 '(message-header-to ((t (:foreground "#cd8b00"))))
 '(message-header-cc ((t (:foreground "#409090"))))
 '(org-hide ((t (:foreground "#708090"))))
 '(org-level-1 ((t (:bold t :foreground "#8b8bcd" :height 1.0))))
 '(org-level-2 ((t (:bold nil :foreground "#409090" :height 1.0))))
 '(org-level-3 ((t (:bold t :foreground "#df9f2d" :height 1.0))))
 '(org-level-4 ((t (:bold nil :foreground "#af4f4b" :height 1.0))))
 '(org-date ((t (:underline t :foreground "#f0ad6d"))))
 '(org-footnote ((t (:underline t :foreground "#ad600b"))))
 '(org-link ((t (:underline t :foreground "#708090"))))
 '(org-special-keyword ((t (:foreground "#ad600b"))))
 '(org-verbatim ((t (:foreground "#ffcd8b" :background "#404040"))))
 '(org-code ((t (:foreground "#ffcd8b" :background "#404040"))))
 '(org-block ((t (:foreground "#708090"))))
 '(org-quote ((t (:inherit org-block :slant italic))))
 '(org-verse ((t (:inherit org-block :slant italic))))
 '(org-todo ((t (:bold t :foreground "#af4f4b"))))
 '(org-done ((t (:bold t :foreground "#409090"))))
 '(org-warning ((t (:underline t :foreground "#409090"))))
 '(org-agenda-structure ((t (:weight bold :foreground "#af4f4b"))))
 '(org-agenda-date ((t (:foreground "#409090"))))
 '(org-agenda-date-weekend ((t (:weight normal :foreground "#8b8bcd"))))
 '(org-agenda-date-today ((t (:weight bold :foreground "#cd8b00"))))
 '(helm-selection ((t (:background "#2e2e37"))))
 '(default ((t (:background "gray9" :foreground "#cfbfad")))))

(provide-theme 'brian-inkpot)
