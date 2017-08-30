;; デフォルトのキーバインドのカスタマイズについて書かれたファイル

;; 矩形選択のキーバインドを C-x SPC に設定
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; cua-mode の不要なキーバインドは除去
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; サスペンドをC-tにし、UndoをC-zにする
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-t") 'suspend-frame)

;; M-x, M-p はそれぞれページ単位移動に設定
(define-key global-map (kbd "M-n") (kbd "C-v"))
(define-key global-map (kbd "M-p") (kbd "M-v"))

;; C-x o の other-window を C-o にバインド
(define-key global-map (kbd "C-o") 'other-window)
