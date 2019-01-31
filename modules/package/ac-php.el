;;; ac-php - autocomplete for php
;; PHPのコードジャンプと補完をしてくれます

;; el-get を利用して ac-php をインストールします。
(el-get-bundle ac-php)

;; php-mode起動時にフックしてキーバインドを設定します。
;; お好きなキーバインドに設定してください。
(add-hook 'php-mode-hook
          '(lambda ()
             (setq ac-sources
                   '(
                     ac-source-php
                     ac-source-abbrev
                     ac-source-dictionary
                     ac-source-words-in-same-mode-buffers))
             ;; シンボルにジャンプ
             (define-key php-mode-map  (kbd "M-.") 'ac-php-find-symbol-at-point)
             ;; ジャンプ先からもとに戻る
             (define-key php-mode-map  (kbd "M-,") 'ac-php-location-stack-back)
             ))

;; 使い方:
;; プロジェクトルートで `touch .ac-php-conf.json` する
;; （これでプロジェクトルートを認識する）
;; M-x ac-php-remake-tags-all してタグファイルを作成します
;; これには少し時間が（プロジェクトの規模によりますが数分程度）かかります。
;; M-x ac-php-find-symbol-at-point してコードジャンプができるようになったら
;; タグの生成は完了しています。

;; 参考:
;; Emacs + ac-php で PHP の最強コード補完 - Qiita
;; https://qiita.com/nanasess/items/b5dc322bac34107cf067
