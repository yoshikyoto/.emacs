;;; mouse -- マウスの設定

;;; Commentary:
;;; マウスに関する設定
;; xtermのマウスポインタ関連のイベントを取得してなにかしたりとか

;;; Code:

;; マウスホイールがイベントとれる場合はmouse-wheel-modeを有効化する
(when (require 'mwheel nil 'noerror)
  (xterm-mouse-mode t))

;; ホイールでポインタを移動できるようにする
(global-set-key [mouse-4] (kbd "C-p"))
(global-set-key [mouse-5] (kbd "C-n"))

;; ポインタの移動ではなくて画面をスクロールさせたい場合はこうする
;; (global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
;; (global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

;;; mouse.el ends here
