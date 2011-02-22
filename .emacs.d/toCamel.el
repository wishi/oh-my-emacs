;; From http://www.emacswiki.org/emacs/CamelCase

(defun mapcar-head (fn-head fn-rest list)
  "Like MAPCAR, but applies a different function to the first element."
      (if list
          (cons (funcall fn-head (car list)) (mapcar fn-rest (cdr list)))))

(defun camelize (s)
  "Convert under_score string S to CamelCase string."
  (mapconcat 'identity (mapcar
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))

(defun camelize-method (s)
  "Convert under_score string S to camelCase string."
  (mapconcat 'identity (mapcar-head
                        '(lambda (word) (downcase word))
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))

(defun camelize-constant-at-point ()
  "Convert word at point from CAPS_AND_UNDERSCORES to CamelCase string."
  (interactive)
  (let* ((case-fold-search nil)
    	 (be  (bounds-of-thing-at-point 'sexp))
    	 (beg (car be))
    	 (end (cdr be))
    	 (txt (buffer-substring beg end))
    	 (cml (camelize txt)) )
    (if cml (progn (delete-region beg end) (insert cml))) ))
