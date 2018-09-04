;;; local-config --- 環境ごとに異なる設定を書きたい場合に使う
;;; Commentary:

;;; Code:

;; 環境によってはmagitが動かないこともあるのでとりあえずここに
;; (load "package/magit")

(load "mode/nico/nico-php-mode")
(add-hook 'php-mode-hook 'nico-php-mode) ;php-modeの時にNicoモード起動
;; PHPUnitコマンド
(load "local/nico/core-phpunit")
(load "local/nico/nvapi-phpunit")

;; (load "mode/smile/smile-php-mode")
;; (add-hook 'php-mode-hook 'smile-php-mode) ;php-modeの時にSmileモード起動
;; (load "local/smile/local-vagrant")

;;; local-config.el ends here
