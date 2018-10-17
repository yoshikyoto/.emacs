(defun nvapi-phpunit ()
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "phpunit --bootstrap=nvapi/test/phpunit/bootstrap.php "
    buffer-file-name)))

(defun nvapi-phpunit-function ()
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "phpunit --bootstrap=nvapi/test/phpunit/bootstrap.php "
    "--filter=\""
    (php-current-public-method-name)
    "\" "
    buffer-file-name)))
