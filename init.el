;;; init.el -- emacs設定ファイル
;;; Commentary:

;;; Code:

;; load-path の設定
;; (loca "xxx") とすると、 settings ディレクトリ以下から elisp を探す
(when load-file-name (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "settings"))

;;; パッケージ管理 el-get の設定 https://github.com/dimitri/el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(load "el-get")
;; el-get がダウンロードしてきた elisp が入るディレクトリ
(setq el-get-dir (locate-user-emacs-file "modules")) ; el-getでダウンロードしたパッケージが入る

(load "keybind-global")
(load "config/language")
(load "config/mouse")
(load "config/coding")
(load "config/whitespace")
(load "config/indent")
(load "config/javascript")
(load "config/ruby")

(load "package/smart-cursor-color")
(load "package/symbol-overlay")
(load "package/auto-complete")
(load "package/git-complete")
(load "package/yasnippet")
(load "package/flycheck")
(load "package/undo-tree")
(load "package/neotree")
;; (load "package/magit")
(load "package/helm-ls-git")
(load "package/dumb-jump")
(load "package/web-mode")
(load "package/hlinum")
(load "package/php-mode")

;; ac-php は コード補完などとのかみ合わせが悪かったため（設定がうまくできてなかっただけ？）
;; コードジャンプにはdumb-jumpを利用し、ac-phpは使わないことにした
;; (load "package/ac-php")

(load "package/scala-mode")
(load "package/dart-mode")
(load "package/kotlin-mode")
(load "package/vue-mode")
(load "package/auto-complete-clang")
(load "package/quickrun")
(load "package/go-mode")
(load "package/vue-mode")

;; flycheckに依存している
(load "package/aspell")

;; editorconfigをロードすることで、各modeの設定をeditorconfigで上書き
(load "package/editorconfig")
(load "function/eval-init")

;; 環境依存の設定（gitで管理したくないもの）を置きます
(load "local/init")

;; emacs 24 以降からは pckage.el が標準で使われるようになり、この行が勝手に追加される
;; el-get と競合するが、この行を消しても勝手に追加されてしまうので、
;; init.el の最後にこの行を持ってくるか、コメントアウトしなければならない
;; (package-initialize)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(package-selected-packages (quote (dumb-jump dart-mode smart-cursor-color let-alist)))
 '(safe-local-variable-values (quote ((php-project-root . git)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
