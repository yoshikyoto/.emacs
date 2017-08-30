;;; Commentary: flycheck エラーチェックを行う
;;; Code:
;; see http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b
;; texinfo がインストールされていないと makeinfo が動かない
;; apt-get install texinfo
;; brew instal texinfo
(el-get-bundle flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)
