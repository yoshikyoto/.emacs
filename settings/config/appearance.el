;;; appearance -- Emacsの見た目の設定

;;; Commentary:

;; - メニューバーを非表示にする - 大石の雑記帳
;;   - http://d.hatena.ne.jp/oishikazuo/20110930/1317393156

;; - 【Emacs初級者から中級者への階段】テキスト表示スペースを広くする3つの方法
;;   - http://emacs.rubikitch.com/menu-bar-mode-tool-bar-mode/

;;; Code:

;; 上に表示されているメニューバーを消す
(menu-bar-mode 0)

;; 左に表示されているツールバーを消す
;; GUIのEmacsでのみ有効。
;; ターミナルで起動しているEmacsでこれを設定しようとするとエラーになる。
;; (tool-bar-mode 0)

;; スクロールバーをなくす。
;; これもGUI版のEmacsでのみ有効で、
;; ターミナルで起動しているEmacsで設定しようとするとエラーになる。
;; (scroll-bar-mode 0)

;;; appearance.el ends here
