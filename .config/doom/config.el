;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "James Teitsworth"
      user-mail-address "james@jamesteitsworth.com")
(setq shell-file-name (executable-find "bash"))
(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type t)
(setq org-directory "~/Nextcloud/org/")
(setq +org-capture-todo-file "~/Nextcloud/org/todo.org")
(setq +org-capture-notes-file "~/Nextcloud/org/inbox.org")
(setq +org-capture-journal-file "~/Nextcloud/org/resources.org")
(after! org
      (setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "SKIP(s)"))))


(use-package! org-modern
  :hook
  (org-mode . global-org-modern-mode)
  :config
  (setq org-modern-label-border 0.3))

(use-package! org-alert
  :config
  (org-alert-enable)
  (setq alert-default-style 'libnotify)
  (setq org-alert-interval 300
        org-alert-notify-cutoff 15
        org-alert-notify-after-event-cutoff 10))

(use-package! org-web-tools
  :config
  (setq org-web-tools-pandoc-sleep-time 0.5))

(use-package! doc-view
  :custom
  (doc-view-resolution 300)
  (large-file-warning-threshold (* 50 (expt 2 20))))

(use-package! nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package ox-odt
  :config
  (add-to-list 'auto-mode-alist
               '("\\.\\(?:OD[CFIGPST]\\|od[cfigpst]\\)\\'"
                 . doc-view-mode-maybe)))
