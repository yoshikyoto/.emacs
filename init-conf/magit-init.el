;;; magit --- magitの設定
;;; Commentary:
;;; 使い方参考:
;;; http://gom.hatenablog.com/entry/20090524/1243170341
;;; http://blog.kzfmix.com/entry/1334196627
;;; emacs 24.4 以上が必要

;;; Code:

(el-get-bundle magit)
(require 'magit)

;; 色設定
;; http://blog.shibayu36.org/entry/2016/03/27/220552 参考
;; TODO 変更されてない箇所の背景色がちょっと鬱陶しいかも
;; cursorが載っていない状態でのaddedのface
(set-face-foreground 'magit-diff-added "#00FF00")
(set-face-background 'magit-diff-added "#000000")
;; cursorが載っている状態のaddedのface
(set-face-foreground 'magit-diff-added-highlight "#00FF00")
(set-face-background 'magit-diff-added-highlight "gray20")
;; cursor載っていない状態のremoved
(set-face-foreground 'magit-diff-removed "#FF0000")
(set-face-background 'magit-diff-removed "#000000")
;; cursor載っている状態のremoved
(set-face-foreground 'magit-diff-removed-highlight "#FF0000")
(set-face-background 'magit-diff-removed-highlight "gray20")
;; lineを選択してstageしようとするときのface
(set-face-background 'magit-diff-lines-boundary "blue")

(global-set-key (kbd "M-g s") 'magit-status)

;;; magit-init.el ends here
