;; flycheck エラーチェックを行う
;; see http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b
;; texinfo がインストールされていないと makeinfo が動かない
;; apt-get install texinfo
;; brew instal texinfo
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; el-get で入れるとここでエラーが出る。
;; jsのモードを適切に設定するために必要なコマンドなので要調査
;; 詳細は上のURL
;; (flycheck-add-next-checker 'javascript-jshint
;;                           'javascript-gjslint)
