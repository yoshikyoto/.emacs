;; ビープ音を消す
(setq ring-bell-function 'ignore)

;; デフォルトのインデント幅は4, タブは使わず半角スペースにする
(setq tab-width 4)
(setq-default indent-tabs-mode nil)

;; c modeをベースにしたモードの時にtabをインデントで使わないようにする
;; (defun my-c-c++-mode-init ()
;;   ;; 変数をバッファーローカルに
;;   (make-local-variable 'c-tab-always-indent)
;;   (setq c-tab-always-indent nil))
;; (add-hook 'c-mode-hook 'my-c-c++-mode-init)
;; (add-hook 'c++-mode-hook 'my-c-c++-mode-init)
