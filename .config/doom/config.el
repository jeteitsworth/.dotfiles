;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "James Teitsworth"
      user-mail-address "james@jamesteitsworth.com")
(setq shell-file-name (executable-find "bash"))
;;(setq doom-theme 'doom-tokyo-night)
(setq doom-font (font-spec :family "GoMono Nerd Font Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Noto Sans Nerd Font" :size 14)
      doom-big-font (font-spec :family "GoMono Nerd Font Mono" :size 24))
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

(use-package! denote
              :defer t
              :custom
              (denote-sort-keywords t)
              (denote-link-description-function #'ews-denote-link-description-title-case)
              (denote-directory "~/Nextcloud/notes/")
              :hook
              (dired-mode . denote-dired-mode)
              :custom-face
              (denote-faces-link ((t (:slant italic))))
              :init
              (require 'denote-org-extras))

(use-package! denote-explore)

(use-package! consult-notes
              :init
              (consult-notes-denote-mode))

(after! ox-hugo
  (setq org-hugo-front-matter-format "yaml"))

;;mu4e settings
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtppro.zoho.com")
;(setq smtpmail-smtp-service 465)
(setq smtpmail-stream-type 'ssl)

(set-email-account! "jamesteitsworth"
                    '((mu4e-sent-folder . "/jamesteitsworth/Sent")
                      (mu4e-drafts-folder . "/jamesteitsworth/Drafts")
                      (mu4e-trash-folder . "/jamesteitsworth/Trash")
                      (smtpmail-default-smtp-server . "smtppro.zoho.com")
                      (smtpmail-smtp-service . 587)
                      (smtpmail-smtp-user . "james@jamesteitsworth.com")
                      (mu4e-compose-signature . "---\nJames E. Teitsworth"))
                    t)



;; keybindings
(map! :leader
      (:prefix ("J" . "JET Binds")
               :desc "Export Org to HTML"
               "e" #'org-html-export-to-html
               :desc "Play Music Directory"
               "f" #'emms-play-directory-tree
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
(map! :leader
      (:prefix ("D" . "Denote Binds")
               :desc "Find backlink"
               "b" #'denote-find-banklink
               :desc "Date"
               "d" #'denote-date
               (:prefix ("e" . "Explore")
                        :desc "Count notes"
                        "c" #'denote-explore-count-notes
                        "C" #'denote-explore-count-keywords
                        "b" #'denote-explore-barchart-keywords
                        "e" #'denote-explore-barchart-filetypes
                        "r" #'denote-explore-random-note
                        "l" #'denote-explore-random-link
                        "k" #'denote-explore-random-keyword
                        "x" #'denote-explore-random-regex
                        "d" #'denote-explore-identify-duplicate-notes
                        "z" #'denote-explore-zero-keywords
                        "s" #'denote-explore-single-keywords
                        "o" #'denote-explore-sort-keywords
                        "w" #'denote-explore-rename-keyword
                        "n" #'denote-explore-network
                        "v" #'denote-explore-network-regenerate
                        "D" #'denote-explore-degree-barchart)
               :desc "Find Link"
               "l" #'denote-find-link
               :desc "Link to heading"
               "h" #'denote-org-extras-link-to-heading
               :desc "Link or create"
               "i" #'denote-link-or-create
               :desc "Rename file keywords"
               "k" #'denote-rename-file-keywords
               :desc "Insert link"
               "l" #'denote-insert-link
               :desc "Denote"
               "n" #'denote
               :desc "Denote rename file"
               "r" #'denote-rename-file
               :desc "Denote rename file using front matter"
               "R" #'denote-rename-file-using-front-matter))

(setq org-publish-project-alist
      '(

  ("org-jekyll-author"
          ;; Path to your org files.
          :base-directory "~/code/jekyll-author/org/"
          :base-extension "org"

          ;; Path to your Jekyll project.
          :publishing-directory "~/code/jekyll-author/jekyll/"
          :recursive t
          :publishing-function org-html-publish-to-html
          :headline-levels 4
          :html-extension "html"
          :body-only t ;; Only export section between <body> </body>
    )
    ("assets-jekyll-author"
          :base-directory "~/code/jekyll-author/org/"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|opus"
          :publishing-directory "~/code/jekyll-author/jekyll/"
          :recursive t
          :publishing-function org-publish-attachment)

    ("jeteitsworth.com" :components ("org-jekyll-author" "assets-jekyll-author"))))
