(el-get-bundle kotlin-mode)
(add-to-list 'auto-mode-alist '("\\.kts$"     . kotlin-mode))

(add-hook
 'kotlin-mode-hook
 '(lambda ()
    (setq c-basic-offset 4)))
