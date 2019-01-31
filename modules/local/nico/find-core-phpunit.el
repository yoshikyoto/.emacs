;;; edit-test -- コードからテストのコードに一発ジャンプ
;;; Commentary:

;;; Code:

;;(find-file)
(defun find-core-phpunit ()
  (interactive)
  (find-file
   (replace-regexp-in-string "\\.php" "Test.php"
   (replace-regexp-in-string "core" "core/test/phpunit/tests" buffer-file-name))))

;;; find-core-phpunit.el ends here
