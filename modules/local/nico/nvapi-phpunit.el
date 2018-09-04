(defun nvapi-phpunit ()
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "phpunit --bootstrap=nvapi/test/phpunit/bootstrap.php "
    buffer-file-name)))
