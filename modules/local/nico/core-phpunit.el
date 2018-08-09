;;
(defun core-phpunit ()
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "phpunit --bootstrap=core/test/phpunit/phpunit.php "
    buffer-file-name)))
