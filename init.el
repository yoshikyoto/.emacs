;;; init.el -- emacs設定ファイル
;;; Commentary:

;;; Code:

;; load-path の設定

(when load-file-name (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "modules"))

;;; パッケージ管理 el-get の設定 https://github.com/dimitri/el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(load "el-get")
(defvar el-get-dir (locate-user-emacs-file "elisp")) ; el-getでダウンロードしたパッケージが入る

(load "color-init")
(load "config/mykeybind")
(load "config/mouse")
(load "config/whitespace")
(load "package/auto-complete")
(load "package/yasnippet")
(load "package/flycheck")
(load "package/undo-tree")
(load "package/neotree")
(load "package/helm-ls-git")
(load "package/web-mode")
(load "package/hlinum")
(load "package/php-mode")
(load "package/auto-complete-clang")

;; (load "local-config") ; 環境依存の設定（gitで管理したくないもの）を置きます
(load "coding-config-init") ;インデントの設定とか

;; phpunitも含めいい感じに実行できるquickrunの読み込み
;; (load "quickrun-init")

;; (add-to-list 'load-path (locate-user-emacs-file "modes"))

;; emacs 24 以降からは pckage.el が標準で使われるようになり、この行が勝手に追加される
;; el-get と競合するが、この行を消しても勝手に追加されてしまうので、
;; init.el の最後にこの行を持ってくるか、コメントアウトしなければならない
;; (package-initialize)


;;; init.el ends here
