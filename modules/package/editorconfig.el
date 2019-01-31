;;; editorconfig -- editorconfigを読む

;;; Commentary:

;; .editorconfigファイルを読み込んでくれる

;; editorcinfigの例

;; [*]
;; end_of_line = lf
;; charset = utf-8
;; trim_trailing_whitespace = true
;; insert_final_newline = true
;;
;; [*.md]
;; trim_trailing_whitespace = false
;;
;; [*.js]
;; indent_style = space
;; indent_size = 2

;; [*.{css,scss}]
;; indent_style = space
;; indent_size = 2

;; タブにしたければ以下のように設定
;; indent_style = tab
;; tab_width = 4

;;; Code:

(el-get-bundle editorconfig)
(editorconfig-mode 1)

;;; editorconfig.el ends here
