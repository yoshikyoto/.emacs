;; ディレクトリ構造を表示してくれるneotreeの設定周り
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
