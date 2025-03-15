;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "James Teitsworth"
      user-mail-address "james@jamesteitsworth.com")
(setq shell-file-name (executable-find "bash"))
(setq display-line-numbers-type t)

;; Org-stuff
(setq org-directory "~/Nextcloud/org/")
(setq +org-capture-todo-file "~/Nextcloud/org/todo.org")
(setq +org-capture-notes-file "~/Nextcloud/org/inbox.org")
(setq +org-capture-journal-file "~/Nextcloud/org/resources.org")
(setq org-agenda-files '("~/Nextcloud/org"))
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
(use-package! org-make-toc)
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
  (setq org-web-tools-pandoc-sleep-time 0.9))

(use-package! doc-view
  :custom
  (doc-view-resolution 300)
  (large-file-warning-threshold (* 50 (expt 2 20))))

(use-package! nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package! ox-odt
  :config
  (add-to-list 'auto-mode-alist
               '("\\.\\(?:OD[CFIGPST]\\|od[cfigpst]\\)\\'"
                 . doc-view-mode-maybe)))

(use-package! modus-themes
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mixed-fonts t)
  (modus-themes-toggle
    '(modus-vivendi-tinted modus-operandi-tinted))
  :init
  (load-theme 'modus-vivendi-tinted :no-confirm))

(use-package! mixed-pitch
              :hook
              (org-mode . mixed-pitch-mode))

(use-package! text-mode
              :hook
              (text-mode . visual-line-mode)
              :init
              (delete-selection-mode t)
              :custom
              (sentence-end-double-space nil)
              (scroll-error-top-bottom t)
              (save-interprogram-paste-before-kill t))

(use-package! orderless
              :custom
              (completion-styles '(orderless basic))
              (completion-category-defaults nil)
              (completion-category-overrides
                '((file (styles partial-completion)))))

(use-package! emms
  :bind
  ("<XF86AudioPrev>" . emms-previous)
  ("<XF86AudioNext>" . emms-next)
  ("<XF86AudioPlay>" . emms-pause))

(after! ox-hugo
  (setq org-hugo-front-matter-format "yaml"))

;; keybindings
(map! :leader
      (:prefix ("J" . "JET Binds")
               :desc "Export Org to HTML"
               "e" #'org-html-export-to-html
               :desc "Play Music Directory"
               "f" #'emms-play-directory
               :desc "Shuffle music"
               "s" #'emms-shuffle
               :desc "Next track"
               "n" #'emms-next
               :desc "Read RSS"
               (:prefix ("r" . "RSS")
                        :desc "Elfeed"
                        "r" #'elfeed
                        :desc "Update Feeds"
                        "u" #'elfeed-update
                        )
               :desc "Last track"
               "p" #'emms-previous))


;; Custom timestamp function
(defun now()
  "Insert string for the current time."
  (interactive)
  (insert (format-time-string "%D %-I:%M %p")))
