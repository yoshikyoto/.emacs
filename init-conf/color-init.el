;; 色周りに関する設定

;; smart-cursor-color
;; カーソルとかハイライトで文字が見づらくなる現象を解消してくれる
(el-get-bundle smart-cursor-color)
(smart-cursor-color-mode +1)

;; カーソルのある行がハイライトされるようになる
;; (global-hl-line-mode t)
;; (custom-set-faces '(hl-line ((t (:background "dark gray")))))
;; (setq hl-line-face 'underline) ; 下線（ただしアンダーバーが見えない）

;; powerlineで見た目を変えるだけ
;; (el-get-bundle emacs-powerline)
;; (setq powerline-arrow-shape 'curve) ; これで角が変わるけどターミナルだと効かない
;; (setq powerline-color1 "grey22")
;; (setq powerline-color2 "grey40")
