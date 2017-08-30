;;; init.el -- emacs設定ファイル
;;; Commentary:

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
;; (load "yasnippet-init")
;; (load "magit-init") ; magitが使えない環境がたまにあるのでデフォルトでは読み込まないようにしておく
;; (load "flycheck-init")
;; (load "undo-tree-init")
;; (load "neotree-init")
;; (load "wdired-init")
;; (load "helm-init")
(load "coding-config-init") ;インデントの設定とか
;; (load "web-mode-init")
;; (load "multiple-cursors-init")
;; (load "hlinum-init")
;; (load "scala-mode2-init")


;; (load "local-config") ; 環境依存の設定（gitで管理したくないもの）を置きます

;; c++
;; 参考 http://futurismo.biz/archives/3071
;; clangを利用した補完をしてくれるclang-complete
;; (el-get-bundle auto-complete-clang)

;; php-mode
;; (el-get-bundle php-mode)

;; ocaml
;; (el-get-bundle tuareg-mode)
;; (add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
;; (autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
;; (autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
;; (autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)

;; phpunitも含めいい感じに実行できるquickrunの読み込み
;; (load "quickrun-init")

;; (add-to-list 'load-path (locate-user-emacs-file "modes"))

;;; init.el ends here
