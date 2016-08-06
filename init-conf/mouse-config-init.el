;; マウスに関する設定

;; xtermのマウスポインタ関連のイベントを取得する
;; TODO ドラッグでハイライトするのはいらない気がするけど銅やったら消せるか
(xterm-mouse-mode t)
(mouse-wheel-mode t)

;; ホイールでポインタを移動できるようにする
(global-set-key [mouse-4] (kbd "C-p"))
(global-set-key [mouse-5] (kbd "C-n"))

;; ポインタの移動ではなくて画面をスクロールさせたい場合はこっち
;; (global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
;; (global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))
