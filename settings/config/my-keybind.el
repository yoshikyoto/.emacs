;;; mykeybind.el -- Emacsのキーバインド設定
;;; Commentary:
;;; デフォルトのキーバインドここで独自にカスタマイズしています

;;; Code:

;; 矩形選択のキーバインドを C-x SPC に設定する
(cua-mode t)
(defvar cua-enable-cua-keys nil) ; cua-mode の不要なキーバインドは除去する
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; C-z を サスペンド -> Undo に変更
(define-key global-map (kbd "C-z") 'undo)
;; C-t を サスペンドに変更（C-t が空いていたので）
(define-key global-map (kbd "C-t") 'suspend-frame)

;; M-n, M-p をページ単位移動に変更
(define-key global-map (kbd "M-n") 'scroll-up)
(define-key global-map (kbd "M-p") 'scroll-down)

;; C-o を other-window に（元々は C-x o だが、よく使うので）
(define-key global-map (kbd "C-o") 'other-window)

;; ディレクトリモード中に r を押すとファイル名の編集などができる wdired モードになるように
;; ファイル名を変更した上で、 C-c C-c を押すと変更が確定
;; このモードでファイル名を変更すると、すでにバッファで開かれているものも変更が反映される
;; TODO Symbol's value as variable is void: dired-mode-map と言われてしまうので解決する
;; (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; mykeybind.el ends here
