;; ターミナル以外でEmacsを立ち上げてもpathが通るようにする
;; (defun set-exec-path-from-shell-PATH ()
;;    "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
;;
;; This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
;;     (interactive)
;;     (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;       (setenv "PATH" path-from-shell)
;;       (setq exec-path (split-string path-from-shell path-separator))))
;; (set-exec-path-from-shell-PATH)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; init.el をいろいろ分割したやつを load-path に追加
(add-to-list 'load-path (locate-user-emacs-file "init-conf"))

(load "el-get-init")
(load "coding-config-init") ;インデントの設定とか
(load "language-init") ;言語と文字コード
(load "color-init") ;色に関する設定
(load "mykeybind-init") ;独自のキーバインドに関する設定
(load "mouse-config-init") ;マウスまわりのキーバインドに関する設定
(load "wdired-init")
(load "whitespace-init") ; tabや行末のスペースを表示してくれたり、綺麗にしてくれたりするやつ
(load "auto-complete-init")
(load "yasnippet-init")
;; (load "magit-init") ;maagit ;一部環境で動かないようなので保留
(load "flycheck-init")
(load "undo-tree-init")
(load "neotree-init")
(load "helm-init")
(load "web-mode-init")

;; c++
;; 参考 http://futurismo.biz/archives/3071
;; clangを利用した補完をしてくれるclang-complete
(el-get-bundle auto-complete-clang)



;; php-mode
(el-get-bundle php-mode)
;; (add-hook 'php-mode-hook
;;           '(lambda()
;;              (setq indent-tabs-mode t)
;;              (setq c-basic-offset 4)))

;; phpunitも含めいい感じに実行できるquickrunの読み込み
(load "quickrun-init")
