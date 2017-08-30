;; web-mode
(el-get-bundle web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;; web-modeのインデント関係
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)

;; デフォルトのやつもtabにしちゃう
;; (setq-default indent-tabs-mode t)

;; scala.htmlだけはweb-mode-htmlで正しく表示できないので、html-modeをつかう
;; ただしhtml-modeでも
;; (add-to-list 'auto-mode-alist '("\\.scala.html$" . html-mode))
