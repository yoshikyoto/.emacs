;;; edit-test -- コードからテストのコードに一発ジャンプ
;;; Commentary:

;;; Code:

;; core/xxx/Xxxx.php から core/test/phpunit/tests/xxx/XxxxTest.php のファイルをfindする
;; ファイルが見つからない場合は新しいバッファを開く
;; replace-regexp-in-string は、regexp じゃないものは存在しないらしい。
(defun find-core-phpunit ()
  (interactive)
  (find-file
   (replace-regexp-in-string "\\.php" "Test.php"
   (replace-regexp-in-string "core" "core/test/phpunit/tests" buffer-file-name))))

;;; find-core-phpunit.el ends here
