;; helm関連の設定

;; helmの導入
(el-get-bundle helm)

;; help-ls-git
;; http://takezoe.hatenablog.com/entry/2015/08/04/115353
;; C-x C-d で、git管理されてるファイルをいい感じに検索してくれるようにする
(el-get-bundle helm-ls-git)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
