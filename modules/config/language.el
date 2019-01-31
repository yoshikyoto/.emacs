;;; language -- 言語に関する設定

;;; Commentary:
;;; これいるのか？

;;; Code:
;; 言語に関する設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; たまに表示がおかしくなることがあるので、
;; ここで文字コードと幅の対応付けを書いておくと
;; 表示がぶっ壊れなくてよさげ
(aset char-width-table #x25CB 2)
(aset char-width-table #x25CE 2)
(aset char-width-table #x25CF 2)
(aset char-width-table #x301C 2)
(aset char-width-table #x2606 2)
(aset char-width-table #x25A0 2)
(aset char-width-table #x25A1 2)
(aset char-width-table #x5294 2)
(aset char-width-table #x7981 2)

;;; language.el ends here
