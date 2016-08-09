;;; smile-mode.el ---  smileコーディング規約モード

;;; Commentary:
;;; require flycheck, php-mode, phpcs, phpmd
;;; TODO modeといいつつmodeじゃないのでminor-modeとかにする

;;; Code:

;; smile専用: PSR2違反のコードはflycheckでエラーを出す
(setq flycheck-phpcs-standard "PSR2")
;; smile専用: psr2準拠で自動フォーマットする
(setq php-mode-coding-style (quote psr2))
;; php-mode
(add-hook 'php-mode-hook
          (lambda ()
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 4)))

;; smileのvagrantを操作するためのコマンド
(defun smile-vagrant-reload()
  (interactive)
  (async-shell-command "cd ~/smile/vagrant && vagrant reload"))

(defun smile-vagrant-up()
  (interactive)
  (async-shell-command "cd ~/smile/vagrant && vagrant up"))

(defun smile-vagrant-halt()
  (interactive)
  (async-shell-command "cd ~/smile/vagrant && vagrant halt"))


;;; smile-mode.el ends here
