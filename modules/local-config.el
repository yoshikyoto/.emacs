;;; local-config --- 環境ごとに異なる設定を書きたい場合に使う
;;; Commentary:

;;; Code:

(load "smile-mode") ;smileコーディング規約モード
;; (load "nicovideo-mode") ;ニコ動コーディング規約モード


(el-get-bundle thorstadt/json.el)
(require 'json)
;; Slackにpostするための関数
(defun slack-times (s)
  "Slack #times_utakata に投稿"
  (interactive "sText:")
  (with-temp-buffer
    (let ((url                       "https://hooks.slack.com/services/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")
	  (url-request-method        "POST")
	  (url-request-extra-headers `(("Content-Type" . "application/x-www-form-urlencoded")))
	  (url-request-data          (format "payload={\"text\": %s, \"username\": \"utakata_emacs\", \"icon_emoji\": \":y_oshiki_utakata:\"}" (json-encode-string s)))
	  (mycallback                (lambda (x) (message (format "%s" x)))))
      (url-retrieve url mycallback))))

(define-key global-map (kbd "C-c C-M-p") 'times-niku)

;; diredを使った文字コード一括置換
(require 'dired-aux)
(add-hook 'dired-mode-hook
	  (lambda ()
	    (define-key (current-local-map) "T"
	      'dired-do-convert-coding-system)))

(defvar dired-default-file-coding-system nil
  "*Default coding system for converting file (s).")

(defvar dired-file-coding-system 'no-conversion)

(defun dired-convert-coding-system ()
  (let ((file (dired-get-filename))
	(coding-system-for-write dired-file-coding-system)
	failure)
    (condition-case err
	(with-temp-buffer
	  (insert-file file)
	  (write-region (point-min) (point-max) file))
      (error (setq failure err)))
    (if (not failure)
	nil
      (dired-log "convert coding system error for %s:\n%s\n" file failure)
      (dired-make-relative file))))

(defun dired-do-convert-coding-system (coding-system &optional arg)
  "Convert file (s) in specified coding system."
  (interactive
   (list (let ((default (or dired-default-file-coding-system
			    buffer-file-coding-system)))
	   (read-coding-system
	    (format "Coding system for converting file (s) (default, %s): "
		    default)
	    default))
	 current-prefix-arg))
  (check-coding-system coding-system)
  (setq dired-file-coding-system coding-system)
  (dired-map-over-marks-check
      (function dired-convert-coding-system) arg 'convert-coding-system t))


;;; local-config.el ends here
