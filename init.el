;;; init.el -- emacs設定ファイル
;;; Commentary:

;;; Code:

;; load path の設定
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "modules"))

;; パッケージ管理ソフトの el-get の設定
;; el-get https://github.com/dimitri/el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(load "el-get")
;; el-getでダウンロードしたパッケージは ~/.emacs.d/elistp に入るようにする
(setq el-get-dir (locate-user-emacs-file "elisp"))

;; 各パッケージの設定を分かりやすく書ける use-package
(el-get-bundle use-package)


(load "color-init")
(load "config/mykeybind") ;独自のキーバインドに関する設定
(load "mouse-config-init") ;マウスまわりのキーバインドに関する設定
(load "wdired-init")
(load "whitespace-init") ; tabや行末のスペースを表示してくれたり、綺麗にしてくれたりするやつ
(load "auto-complete-init")
(load "yasnippet-init")
(load "magit-init") ; magitが使えない環境がたまにあるのでデフォルトでは読み込まないようにしておく
(load "flycheck-init")
(load "undo-tree-init")
(load "neotree-init")
(load "wdired-init")
(load "helm-init")
(load "coding-config-init") ;インデントの設定とか
(load "web-mode-init")
(load "multiple-cursors-init")
(load "hlinum-init")

;; org-present プレゼンテーション用モード
(el-get-bundle org-present)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))
     ;; 文字をどれだけ大きくするかを設定する
     (setq org-present-text-scale 10)
     ;; プレゼンテーションモード切り替えkeymap
     (define-key org-present-mode-keymap (kbd "C-c C-;") 'org-present-big)
     ))

(el-get-bundle emacs-slack)

(load "scala-mode2-init")

;; gitで管理したくないもろもろのファイルを入れるためのディレクトリ
(add-to-list 'load-path (locate-user-emacs-file "local-conf"))

(load "local-config") ; 環境依存の設定（gitで管理したくないもの）を置きます

;; c++
;; 参考 http://futurismo.biz/archives/3071
;; clangを利用した補完をしてくれるclang-complete
(el-get-bundle auto-complete-clang)

;; php-mode
(el-get-bundle php-mode)

;; ocaml
(el-get-bundle tuareg-mode)
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)

;; phpunitも含めいい感じに実行できるquickrunの読み込み
(load "quickrun-init")

(add-to-list 'load-path (locate-user-emacs-file "modes"))

;;; init.el ends here
