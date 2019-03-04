;;; flycheck -- flycheck

;;; Commentary: flycheck エラーチェックを行う

;;: 参考:  http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b

;;; texinfo がインストールされていないと makeinfo が動かない

;; apt-get install texinfo

;; brew instal texinfo

;;; Code:


(el-get-bundle flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)

;;; flycheck.el ends here
