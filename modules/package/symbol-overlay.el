;;; symbol-overlay -- simbol hilight

;;; Commentary:

;; wolray/symbol-overlay: Highlight symbols with keymap-enabled overlays
;;  - https://github.com/wolray/symbol-overlay

;; Emacsの補完 & 検索を超強化する - Qiita
;;  - https://qiita.com/blue0513/items/c0dc35a880170997c3f5

;; Code:

(el-get-bundle symbol-overlay)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)
(add-hook 'markdown-mode-hook #'symbol-overlay-mode)
(global-set-key (kbd "M-i") 'symbol-overlay-put)

;; (define-key symbol-overlay-map (kbd "p") 'symbol-overlay-jump-prev) ;; 次のシンボルへ
;; (define-key symbol-overlay-map (kbd "n") 'symbol-overlay-jump-next) ;; 前のシンボルへ
;; (define-key symbol-overlay-map (kbd "C-g") 'symbol-overlay-remove-all) ;; ハイライトキャンセル

;;; symbol-overlay.el ends here
