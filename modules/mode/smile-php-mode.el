(easy-mmode-define-minor-mode
 smile-php-mode ;モード名
 "Smile php coding mode." ;モードの説明
 nil ;初期値がONかどうか
 " Smile" ;モードラインに表示される文字列
 nil)

;; hook 関数の定義（モード切り替え時に呼ばれる）
 (defun nico-php-mode-hooks ()
   ;; PSR2違反のコードはflycheckでエラーを出す
   (setq flycheck-phpcs-standard "PSR2")
   ;; psr2準拠で自動フォーマットする
   (setq php-mode-coding-style (quote psr2)))

;; hookを登録
(add-hook 'smile-php-mode-hook 'smile-php-mode-hooks)
