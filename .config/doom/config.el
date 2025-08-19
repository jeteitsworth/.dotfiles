;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq display-line-numbers-type t)
(setq doom-font (font-spec :family "MesloLGLDZ Nerd Font" :size 14))
;; Org-stuff
(setq org-directory "/mnt/z/Dropbox/org")
(after! org
      (setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "SKIP(s)"))))

;; Specific package configs
(use-package! org-web-tools
  :config
  (setq org-web-tools-pandoc-sleep-time 0.9))

(use-package! nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package! ox-odt
  :config
  (add-to-list 'auto-mode-alist
               '("\\.\\(?:OD[CFIGPST]\\|od[cfigpst]\\)\\'"
                 . doc-view-mode-maybe)))

(use-package! org-bullets
  :hook (org-mode . org-bullets-mode))

;; keybindings
(map! :leader
      (:prefix ("J" . "JET Binds")
               :desc "Export Org to HTML"
               "e" #'org-html-export-to-html
               (:prefix ("r" . "RSS")
                        :desc "Elfeed"
                        "r" #'elfeed
                        :desc "Update Feeds"
                        "u" #'elfeed-update
                        )))


