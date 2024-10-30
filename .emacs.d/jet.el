;;;###autoload
(defun insert-src-block ()
  (interactive)
  (let ((code_lang (read-from-minibuffer "Which language: ")))
    (insert (format "#+BEGIN_SRC %s\n#+END_SRC"
		    code_lang
		    ))))

