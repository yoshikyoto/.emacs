;; vagrantを操作するためのコマンド
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
