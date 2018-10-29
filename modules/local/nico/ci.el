(defun nico-ci ()
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && sh ci.sh"
    buffer-file-name)))
