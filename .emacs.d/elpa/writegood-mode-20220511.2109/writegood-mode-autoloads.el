;;; writegood-mode-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from writegood-mode.el

(autoload 'writegood-reading-ease "writegood-mode" "\
Flesch-Kincaid reading ease test in the region bounded by START and END.

Scores roughly between 0 and 100.

(fn &optional START END)" t)
(autoload 'writegood-grade-level "writegood-mode" "\
Flesch-Kincaid grade level test. Converts reading ease score to a grade level (Score ~ years of school needed to read passage).

(fn &optional START END)" t)
(autoload 'writegood-mode "writegood-mode" "\
Colorize issues with the writing in the buffer.

This is a minor mode.  If called interactively, toggle the
`Writegood mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `writegood-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "writegood-mode" '("writegood-"))

;;; End of scraped data

(provide 'writegood-mode-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; writegood-mode-autoloads.el ends here
