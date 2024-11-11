;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "James Teitsworth"
      user-mail-address "james@jamesteitsworth.com")
(setq shell-file-name (executable-find "bash"))
(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type t)

;; Org-stuff
(setq org-directory "~/Nextcloud/org/")
(setq +org-capture-todo-file "~/Nextcloud/org/todo.org")
(setq +org-capture-notes-file "~/Nextcloud/org/inbox.org")
(setq +org-capture-journal-file "~/Nextcloud/org/resources.org")
(after! org
      (setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "SKIP(s)"))))

;; Org-capture templates
(after! org
  (setq org-capture-templates
        '(("m" "Medical Appointment" entry (file+headline "~/Nextcloud/org/appointments.org" "Medical")
           "* %? :medical:\n  %^T\n  %i"
           :empty-lines 1)

          ("p" "Personal Appointment" entry (file+headline "~/Nextcloud/org/appointments.org" "Personal")
           "* %? :personal:\n  %^T\n  %i"
           :empty-lines 1)

          ("w" "Work Appointment" entry (file+headline "~/Nextcloud/org/appointments.org" "Work")
           "* %? :work:\n  %^T\n  %i"
           :empty-lines 1)

          ("i" "Inbox note to refile" entry (file+headline "~/Nextcloud/org/inbox.org" "Inbox")
           "* %?\n %U\n %i\n %a"
           :empty-lines 1)

          ("t" "Todo" entry (file+headline "~/Nextcloud/org/todo.org" "Tasks")
           "* TODO %? %^G\n %i\n %a"
           :empty-lines 1))))

;; Specific package configs
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

;;mu4e settings
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtppro.zoho.com")
(setq smtpmail-smtp-service 465)
(setq smtpmail-stream-type 'ssl)

(set-email-account! "jamesteitsworth"
                    '((mu4e-sent-folder . "/jamesteitsworth/Sent")
                      (mu4e-drafts-folder . "/jamesteitsworth/Drafts")
                      (mu4e-trash-folder . "/jamesteitsworth/Trash")
                      (smtpmail-default-smtp-server . "smtppro.zoho.com")
                      (smtpmail-smtp-user . "james@jamesteitsworth.com")
                      (mu4e-compose-signature . "---\nJames E. Teitsworth"))
                    t)

