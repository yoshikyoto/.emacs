;;; Commentary:
;; easy-mmode について http://tech.feedforce.jp/emacs-minor-mode.html
;; mode-hook について http://d.hatena.ne.jp/tomoya/20100112/1263298132

;;; Code:

;; mode 定義
(easy-mmode-define-minor-mode
 nico-php-mode ;モード名
 "Nico php mode." ;モードの説明
 nil ;初期値がONかどうか
 " Nico" ;モードラインに表示される文字列
 nil)

;; hookを登録
(add-hook
 'nico-php-mode-hook
 '(lambda ()
    (setq indent-tabs-mode t) ;インデントにはタブを使用
    (setq c-basic-offset 4) ;タブ幅を4に設定
    (c-set-offset 'case-label '+) ;switch-caseでインデントする
    ))
