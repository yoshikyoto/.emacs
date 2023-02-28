;;; hlinum-mode.el -- https://github.com/tom-tan/hlinum-mode/
;;; Commentary: 現在の行番号をハイライトしてくれる

;; 使い方
;; http://d.hatena.ne.jp/tm_tn/20110605/1307238416

;;; Code:

(el-get-bundle tom-tan/hlinum-mode)
(hlinum-activate)

;; linum mode を有効にすると hlinum で現在行がハイライトされる
(custom-set-variables '(global-linum-mode t))

;;;
