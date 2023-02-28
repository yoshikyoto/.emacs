;;; neotree-init --- neotree周りの設定
;;; Commentary:

;;; Code:

;; ディレクトリ構造を表示してくれるneotreeの設定周り
;; http://kiririmode.hatenablog.jp/entry/20150806/1438786800
(el-get-bundle neotree)
;; F8でnetreee-windowが開くようにする
(global-set-key [f8] 'neotree-toggle)

;; neotreeでファイルを新規作成した場合のそのファイルを開く
(setq neo-create-file-auto-open t)

;; delete-other-window で neotree ウィンドウを消さない
(setq neo-persist-show t)

;; C-x }, C-x { でwindowサイズを変更できるよにする
;; でもなんか事あるごとに幅がリセットされる
(setq neo-window-fixed-size nil)

;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open nil)

;; キーバインドをシンプルにする
;; C: ルートディレクトリの変更
;; c, +, p: ファイル作成
;; d: ファイル削除
;; r: ファイル名変更
;; e: ディレクトリを開く
(setq neo-keymap-style 'concise)

;;; neotree-init.el ends here
