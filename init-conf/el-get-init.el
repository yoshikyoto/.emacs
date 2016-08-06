;; el-get https://github.com/dimitri/el-get
;; el-getだけはload-pathに追加した↑でrequireしてやる必要がある
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
;; el-getでダウンロードしたパッケージは ~/.emacs.d/elistp に入るようにする
(setq el-get-dir (locate-user-emacs-file "elisp"))
