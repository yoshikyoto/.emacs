;; ディレクトリ閲覧中にrを押すとファイル名の編集などができる wdired モード
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
