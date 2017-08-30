;; PSR2違反のコードはflycheckでエラーを出す
(setq flycheck-phpcs-standard "PSR2")
;; psr2準拠で自動フォーマットする
(setq php-mode-coding-style (quote psr2))
