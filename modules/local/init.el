;;; local-config --- 環境ごとに異なる設定を書きたい場合に使う
;;; Commentary:

;;; Code:

;; 環境によってはmagitが動かないこともあるのでとりあえずここに
;; (load "package/magit")

;; (load "local/smile/init")
(load "mode/nico-php-mode")
;; (add-hook 'php-mode-hook 'nico-php-mode) ;php-modeの時にNICOモード起動

;;; local-config.el ends here
