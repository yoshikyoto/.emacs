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

;; エラーログをtail
(defun smile-local-critical-log-tail()
  (interactive)
  (async-shell-command
   "ssh smile@smile-local 'tail -f /var/log/smilevideo/critical.log'"))

(defun smile-local-info-log-tail()
  (interactive)
  (async-shell-command
   "ssh smile@smile-local 'tail -f /var/log/smilevideo/info.log'"))

(defun smile-local-warning-log-tail()
  (interactive)
  (async-shell-command
   "ssh smile@smile-local 'tail -f /var/log/smilevideo/warning.log'"))

(defun smile-local-notice-log-tail()
  (interactive)
  (async-shell-command
   "ssh smile@smile-local 'tail -f /var/log/smilevideo/notice.log'"))

(defun smile-local-debug-log-tail()
  (interactive)
  (async-shell-command
   (concat "ssh smile@smile-local 'tail -f /var/log/smilevideo/debug.log'")))

(defun smile-local-queue-restart()
  (interactive)
  (async-shell-command
   "ssh smile@smile-local 'cd smilevideo && export SMILE_ENV=local && php artisan queue:restart'"))

(defun smile-local-polling-job-start()
  (interactive)
  (async-shell-command
   (concat
    "ssh smile@smile-local "
    "'sudo /sbin/initctl start smilevideo-dmc-polling-queue-worker-boot && "
    "sudo /sbin/initctl start smilevideo-dmc-upload-queue-worker-boot'")))

;;; smile-mode.el ends here
