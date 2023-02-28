(el-get-bundle nex3/dart-mode)
;;(el-get-bundle dart-mode
;;  :url "https://github.com/nex3/dart-mode.git"
;;  :features dart-mode)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
