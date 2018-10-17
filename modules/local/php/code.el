;;; phpのcodeを解釈するのに役に立つ関数

;; 今カーソルがいるpublic methodの名前を取得する
(defun php-current-public-method-name ()
  (search-backward "public function") ; カーソルから一番近い"public function"を探す
  (search-forward " function ") ; " function " の後ろの部分にカーソルを移動
  (setq method-name-start (point)) ; ここをメソッド名のスタートとする
  (search-forward "(") ; "(" を探す
  (left-char) ; "(" の一つ前にカーソルを移動
  (setq method-name-end (point)) ; ここがメソッド名の終わりとする
  ;; 最後に文字列を切り出した返す
  (string-trim (buffer-substring-no-properties method-name-start method-name-end))
  )
