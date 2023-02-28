;;; mykeybind.el -- Emacsのキーバインド設定
;;; Commentary:
;;; デフォルトのキーバインドここで独自にカスタマイズしています

;;; Code:

;; 矩形選択のキーバインドを C-x SPC に設定する
(cua-mode t)
(defvar cua-enable-cua-keys nil) ; cua-mode の不要なキーバインドは除去する
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; サスペンドをC-tにし、UndoをC-zにする
;; 一般的にUndoはどのPCでも C-z 担っているかと思いますが、
;; EmacsのデフォルトではUndoは C-x u または C-[Shift]-[-] で
;; サスペンドが C-z に設定されているのですが
;; Undoが使いづらいのと、Undoしようとしてサスペンドを誤爆するので
;; UndoをC-z、サスペンドはC-tに設定しています。
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-t") 'suspend-frame)

;; M-x, M-p はそれぞれページ単位移動に設定します。
;; ページ単位移動は意外と欲しくなります。
;; C-n, C-p が1行移動なのでそれに対応させて M-n, M-p としています。
;; C-N, C-P （C-Shift-p/n）にしたり、C-M-n, C-M-p にしたりも有りだと思います。
(define-key global-map (kbd "M-n") 'scroll-up)
(define-key global-map (kbd "M-p") 'scroll-down)

;; C-x o の other-window を C-o にバインド
;; コードを書いていると画面分割した先に移動したくなることが頻繁になりますが、
;; C-x o だと2タイプ必要になってしまい、面倒なので C-o （other-windot）にバインドしてしまいます。
(define-key global-map (kbd "C-o") 'other-window)

;; ディレクトリモード中にrを押すとファイル名の編集などができる wdired モードになるようにします
;; ディレクトリやファイルの名前を変更する際に非常に便利です。
;; ディレクトリモードに入り、rを押し、ファイル名を変更した上で、
;; C-c C-c を押すと変更が確定します。
;; このモードでファイル名を変更すると、
;; すでにバッファで開かれているものもちゃんと変更が反映されます。
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; mykeybind.el ends here
