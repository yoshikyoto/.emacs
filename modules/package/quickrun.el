;;; quiclrun-init --- quickrunの設定
;;; Commentary:

;;; Code:
;; quickrunに関する設定
(el-get-bundle quickrun)

;; emacsからphpunitを実行するquickrun.el
;; 参考: http://syohex.hatenablog.com/entry/20120201/1328096495
;; phpunitの出力のOK/FAILURESに色を付ける
(defun quickrun/phpunit-outputter ()
  (save-excursion
    (goto-char (point-min))
    (while (replace-regexp "^M" "")
      nil))
  (highlight-phrase "^OK.*$" 'phpunit-pass)
  (highlight-phrase "^FAILURES.*$" 'phpunit-fail))
;; phpunitコマンドをquickrunに定義
(quickrun-add-command "phpunit" '((:command . "phpunit")
  (:exec . "%c %s")
  (:outputter . quickrun/phpunit-outputter)))
;; Test.phpサフィックスが付く場合はphpunitでquickrun
(add-to-list 'quickrun-file-alist '("Test\\.php$" . "phpunit"))

;;; quickrun-init.el ends here
