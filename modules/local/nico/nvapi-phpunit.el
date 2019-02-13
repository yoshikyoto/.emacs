;; TODO php-modeの機能で関数名を取るようにしたうえで nico-php-mode の方に移動する
;; http://www.utakata.work/entry/20181201/1543629600

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
