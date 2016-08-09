;;; nicovideo-mode.el --- ニコ動コーディングモード
;;; Commentary:
;;; require php-mode

;;; Code:

(add-hook 'php-mode-hook
          '(lambda()
             (setq indent-tabs-mode t)
             (setq c-basic-offset 4)))

;;; nicovideo-mode.el ends here
