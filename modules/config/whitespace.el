;;; whitespace -- tabを表示したり、行末の空白を表示するやつ
;;; Commentary:
;;; Code:
(require 'whitespace)

;; コードを書いていると、
;; タブと
;; 何を可視化するかをここで決める
(setq whitespace-style
      '(face           ; faceで可視化 以下何を可視化するか
        trailing       ; 行末
        tabs           ; タブ
        spaces         ; スペース
        empty          ; 先頭/末尾の空行
        space-mark     ; 表示のマッピング
        tab-mark))

;; 全角スペースとタブを可視化する
;; 全角スペースやタブが半角スペースに混ざっているとわからないのでわかるようにしておきます
;; ここでは文字コードとどう可視化するかを設定します。
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1]) ; 全角スペースは□で可視化
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t]))) ; タブは >> で可視化

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前にファイル末尾の無駄な改行や、
;; 行末尾の無駄なスペースを自動でクリーンアップする設定を入れます
(setq whitespace-action '(auto-cleanup))

;; 色の設定
;; 背景色を設定して、ちゃんと見やすい用意可視化されるようにします。
(defvar my/bg-color "#232323")

;; 行末の不要な空白の色
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)

;; タブの色
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)

;; 全角スペースの表示の色
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)

;; 普通の空白は表示しない
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

;; whitespace-mode を有効にする
(global-whitespace-mode 1)

;;; whitespace.el ends here
