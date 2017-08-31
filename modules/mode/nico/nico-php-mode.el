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

;; hook 関数の定義（モード切り替え時に呼ばれる）
 (defun nico-php-mode-hooks ()
   (setq indent-tabs-mode t) ;インデントはタブに変更
   (setq c-basic-offset 4) ;タブ幅を4に設定
   (c-set-offset 'case-label '+)) ;switch-caseでインデントする

;; hookを登録
(add-hook 'nico-php-mode-hook 'nico-php-mode-hooks)
