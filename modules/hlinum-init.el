;;; hlinum-mode.el -- https://github.com/tom-tan/hlinum-mode/
;;; Commentary:

;; 使い方
;; http://d.hatena.ne.jp/tm_tn/20110605/1307238416

;;; Code:

(el-get-bundle tom-tan/hlinum-mode)
(require 'hlinum)
(hlinum-activate)
(custom-set-variables '(global-linum-mode t))

;;; hlinum-mode.el ends here
