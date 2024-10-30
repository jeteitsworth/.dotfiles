;;; citar-denote-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from citar-denote.el

(autoload 'citar-denote-open-note "citar-denote" "\
Open a bibliographic note using Citar.

Provides a selection list of all bibliographic entries with notes." t)
(autoload 'citar-denote-find-citation "citar-denote" "\
Find Denote files that cite a bibliographic entry CITEKEY.

When called interactively, select an entry from a list with all
bibliographic entries cited in Denote files.

(fn CITEKEY)" t)
(autoload 'citar-denote-dwim "citar-denote" "\
Access attachments, notes and links of a bibliographic reference.

When more than one bibliographic item is referenced, select item first." t)
(autoload 'citar-denote-open-reference-entry "citar-denote" "\
Open BibTeX or JSON file associated with a bibliographic reference.

When more than one bibliographic item is referenced, select item first." t)
(autoload 'citar-denote-add-citekey "citar-denote" "\
Add citation key(s) to existing note.
Convert note to a bibliographic note when no existing reference exists." t)
(autoload 'citar-denote-remove-citekey "citar-denote" "\
Remove a reference from a bibliographic note.

If the only or last reference is removed, remove `_bib' keyword." t)
(autoload 'citar-denote-find-reference "citar-denote" "\
Find Denote file(s) citing one of the current reference(s).

When more than one bibliographic item is referenced, select item first." t)
(autoload 'citar-denote-link-reference "citar-denote" "\
Insert a Denote link to a bibliographic note using Citar selection." t)
(autoload 'citar-denote-nocite "citar-denote" "\
Open bibliographic entries not cited or referenced in Denote files with Citar." t)
(autoload 'citar-denote-cite-nocite "citar-denote" "\
Cite bibliographic entries not cited or referenced in Denote files." t)
(autoload 'citar-denote-nobib "citar-denote" "\
List citation keys referenced or cited in Denote, but not in bibliography." t)
(defvar citar-denote-mode nil "\
Non-nil if Citar-Denote mode is enabled.
See the `citar-denote-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `citar-denote-mode'.")
(custom-autoload 'citar-denote-mode "citar-denote" nil)
(autoload 'citar-denote-mode "citar-denote" "\
Toggle integration between Citar and Denote.

This is a global minor mode.  If called interactively, toggle the
`Citar-Denote mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='citar-denote-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "citar-denote" '("citar-denote-"))

;;; End of scraped data

(provide 'citar-denote-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; citar-denote-autoloads.el ends here