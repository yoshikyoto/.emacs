;;; dumb-jump -- だいたいどんなコードでもコードジャンプできる
;;; Commentary:

;; ag などの機能を使い、どんな言語でもだいたいいい感じにコードジャンプしてくれる
;; ただし、ジャンプボタンを押してからagコマンドが動くので、少し遅い
;; 素早いコードジャンプがしたいなら gtags などを使うことになるだろう

;;;;;;;
;; 参考

;; EmacsでWebサービスを開発して8ヶ月が経ちました - エムスリーテックブログ
;;  - https://www.m3tech.blog/entry/emacs-web-service
;; でらうま倶楽部 : helm と dumb-jump に首ったけ
;;  - http://blog.livedoor.jp/tek_nishi/archives/9626252.html

;;;;;;;;;;;;
;; リポジトリ

;; dumb-jump リポジトリ
;; - https://github.com/jacktasia/dumb-jump

;; ag コマンドののインストール方法
;;  - https://github.com/ggreer/the_silver_searcher

;;; Code:

;; 必要なライブラリ類のインストール
(el-get-bundle f)
(el-get-bundle s)
(el-get-bundle dash)
(el-get-bundle popup)

;; dumb-jump パッケージのインストール
(el-get-bundle dumb-jump)

;; これを設定しないとホームディレクトリ以下全部検索するらしい（ほんと？）
(setq dumb-jump-default-project "")

;; 検索にはagを使う
(setq dumb-jump-force-searcher 'ag)

;; dumb-jump-mode を常に有効にする
(dumb-jump-mode)

;; キーバインドの設定
(define-key global-map (kbd "M-.") 'dumb-jump-go)

;;; dumb-jump.el ends here
