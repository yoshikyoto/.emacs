;;; vue-mode -- Vue.js編集用モード

;;; Commentary:

;;; Code:

;; 本当は vue-mode をインストールして使いたいのだが
;; なぜかel-getでインストールできないので
;; (el-get-bundle vue-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;;; vue-mode.el ends here
