;; undo-tree
(el-get-bundle undo-tree)
(global-undo-tree-mode t) ; デフォルトをundo-treeのundoにする
;; C-M-z でredoを行えるようにする
(define-key global-map (kbd "C-M-z") 'undo-tree-redo)
