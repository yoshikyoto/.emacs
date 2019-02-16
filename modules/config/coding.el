;; 何故かutf-8じゃなくてunicodeと判定されてしまうことがあるので、
;; unicodeと判定されたらutf-8で読むようにする
(add-hook
 'find-file-hook
 '(lambda ()
    (cond ((string-match "undecided-?.*" (format "%s" buffer-file-coding-system))
           (let ((coding-system-for-read 'utf-8))
             (revert-buffer t t))))))
