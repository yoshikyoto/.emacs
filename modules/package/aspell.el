;;; aspell -- スペルチェック

;;; Commentary:

;; aspell-en をインストールしている必要があります。

;;; Cent OS

;; 以下のコマンドで aspell と aspell-en（英語ようのチェッカー）が入ります
;; yum install aspell-en

;;; Mac

;; brew install aspell --lang=en

;;; 参考:

;; - Emacsでもスペルチェックをしようという話
;;   - http://y0m0r.hateblo.jp/entry/20121219/1355930369

;; - Emacsでスペルチェック - 計算物理屋の研究備忘録
 ;;  - http://keisanbutsuriya.hateblo.jp/?page=1423560657

;;; Code:

;; スペルチェックのaspellを利用する
;; これを設定すると `M-x ispell` でスペルチェックが走るようになります。
;; ispennの操作の詳細は
;; http://y0m0r.hateblo.jp/entry/20121219/1355930369
;; を見ると良い
(setq ispell-program-name "aspell")

;; flycheckを利用してエラーを表示する
;; とりあえず常に有効にしておく
(setq-default flyspell-mode 1)

;;; aspell.el ends here
