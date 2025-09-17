;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)
(when (doom-font-exists-p "MesloLGLDZ Nerd Font")
  (setq doom-font (font-spec :family "MesloLGLDZ Nerd Font" :size 15)))

;; Custom functions
(defun my/insert-em-dash ()
  "Inserts an EM-DASH (not a HYPEN, not an N-DASH)"
  (interactive)
  (insert "—"))
(global-set-key (kbd "C--") #'help/insert-em-dash)

(defun my/org-insert-scene-properties ()
  "Insert a property drawer for scene metadata"
  (interactive)
  (insert ":PROPERTIES:\n")
  (insert ":TYPE: \n")
  (insert ":POV: \n")
  (insert ":GOAL: \n")
  (insert ":ANTAGONIST: \n")
  (insert ":CONFLICT_TYPE: \n")
  (insert ":COMPLICATION/SETBACK: \n")
  (insert ":END:\n"))

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

(use-package! org2blog
  :ensure t)

(setq org-modern-fold-stars '(("" . "") ("" . "") ("▷" . "▽") ("▹" . "▿") ("▸" . "▾")))

(use-package! vimrc-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode)))

(add-hook 'org-mode-hook
          (lambda () (add-hook 'after-save-hook #'org-babel-tangle
                          :append :local)))

;; keybindings
(map! :leader
      "-" #'help/insert-em-dash
      (:prefix ("J" . "JET Binds")
               :desc "Export Org to HTML"
               "e" #'org-html-export-to-html
               (:prefix ("o" . "Org")
                        :desc "Insert Scene Properties"
                        "s" #'my/org-insert-scene-properties)
               (:prefix ("r" . "RSS")
                        :desc "Elfeed"
                        "r" #'elfeed
                        :desc "Update Feeds"
                        "u" #'elfeed-update
                        )))

;; org2blog
(setq org2blog/wp-blog-alist
      '(("James Teitsworth"
         :url "https://jamesteitsworth.com/xmlrpc.php"
         :username "jeteitsworth")))

;; Set org header sizes
(custom-theme-set-faces!
 'doom-one
 '(org-level-3 :inherit outline-3 :height 1.1)
 '(org-level-2 :inherit outline-2 :height 1.3)
 '(org-level-1 :inherit outline-1 :height 1.6)
 '(org-document-title :height 1.8 :bold t :underline nil))
