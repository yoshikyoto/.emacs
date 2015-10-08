;; ターミナル以外でEmacsを立ち上げてもpathが通るようにする
(defun set-exec-path-from-shell-PATH ()
    "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
    (interactive)
    (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
      (setenv "PATH" path-from-shell)
      (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get https://github.com/dimitri/el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
;; el-getでダウンロードしたパッケージは ~/.emacs.d/ に入るようにする
(setq el-get-dir (locate-user-emacs-file "elisp"))

;; emacsデフォルトの設定
;;;;;;;;;;;;;;;;;;;;;;;;;

;; 言語と文字コード
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(aset char-width-table #x25CB 2)
(aset char-width-table #x25CE 2)
(aset char-width-table #x25CF 2)
(aset char-width-table #x301C 2)
(aset char-width-table #x2606 2)
(aset char-width-table #x25A0 2)
(aset char-width-table #x25A1 2)
(aset char-width-table #x5294 2)
(aset char-width-table #x7981 2)

;; カーソルのある行がハイライトされる
;; (global-hl-line-mode t)
;; (custom-set-faces '(hl-line ((t (:background "dark gray")))))
;; (setq hl-line-face 'underline) ; 下線（ただしアンダーバーが見えない）

;; xtermのマウスポインタ関連のイベントを取得する
;; TODO ドラッグでハイライトするのはいらない気がするけど銅やったら消せるか
(xterm-mouse-mode t)
(mouse-wheel-mode t)
;; ホイールでポインタを移動できるようにする
(global-set-key [mouse-4] (kbd "C-p"))
(global-set-key [mouse-5] (kbd "C-n"))
;; ポインタの移動ではなくて画面をスクロールさせたい場合はこっち
;; (global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
;; (global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

;; ビープ音を消す
(setq ring-bell-function 'ignore)

;; デフォルトのインデント幅は4, タブは使わず半角スペースにする
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
;; php-modeの時はtabにする
;; (add-hook 'php-mode-common-hook
;;  	  '(lambda ()
;;  	     (setq indent-tabs-mode t)))

;; 矩形選択のキーバインドを C-x SPC に設定
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; cua-mode の不要なキーバインドは除去
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; サスペンドをC-tにし、UndoをC-zにする
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-t") 'suspend-frame)

;; M-x, M-p はそれぞれページ単位移動に設定
(define-key global-map (kbd "M-n") (kbd "C-v"))
(define-key global-map (kbd "M-p") (kbd "M-v"))

;; C-x o の other-window を C-o にバインド
(define-key global-map (kbd "C-o") 'other-window)

;; ディレクトリ閲覧中にrを押すとファイル名の編集などができる wdired モード
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
;; (setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                                        :background my/bg-color)


;; el-getを使ったemacsのパッケージ設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auto-conplete
(el-get-bundle auto-complete)
;; auto-complete が発動するキー
(ac-set-trigger-key "TAB")
;; 補完が出るまでの時間
(setq ac-quick-help-delay 0.5)

;; yasnippet
;; see http://konbu13.hatenablog.com/entry/2014/01/12/113300
(el-get-bundle yasnippet)
(yas-global-mode 1)

;; smart-cursor-color
;; カーソルとかハイライトで文字が見づらくなる現象を解消してくれる
(el-get-bundle smart-cursor-color)
(smart-cursor-color-mode +1)

;; term+
;; M-x term でターミナルが使えるようになるが、まだ設定の改良が必要
;; 終了する時は exit コマンド
(el-get-bundle term+)

;; powerline 見た目を変えるだけ
(el-get-bundle emacs-powerline)
(setq powerline-arrow-shape 'curve) ; これで角が変わるけどターミナルだと効かない
(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

;; magit
;; 使い方参考:
;; http://gom.hatenablog.com/entry/20090524/1243170341
;; http://blog.kzfmix.com/entry/1334196627
;; emacs 24.4 以上が必要なようなのでとりあえず保留
(el-get-bundle magit)

;; flycheck エラーチェックを行う
;; see http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b
;; texinfo がインストールされていないと makeinfo が動かない
;; apt-get install texinfo
;; brew instal texinfo
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; el-get で入れるとここでエラーが出る。
;; jsのモードを適切に設定するために必要なコマンドなので要調査
;; 詳細は上のURL
;; (flycheck-add-next-checker 'javascript-jshint
;;                           'javascript-gjslint)

;; tree-undo
(el-get-bundle undo-tree)
(global-undo-tree-mode t) ; デフォルトをundo-treeのundoにする
;; C-M-z でredoを行えるようにする
(define-key global-map (kbd "C-M-z") 'undo-tree-redo)

;; markdown-mode
;; TODO M-n M-p が衝突していると思うので削除する
(el-get-bundle markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; scala-mode2
(el-get-bundle scala-mode2)
;; javadocとscaladocでは微妙にフォーマットが違うっぽい？
;; javadoc-style を採用
(setq scala-indent:use-javadoc-style t)

;; ensimeを導入したい場合は導入する

;; csharp-mode
;; https://github.com/josteink/csharp-mode
(el-get-bundle josteink/csharp-mode)

;; c++
;; 参考 http://futurismo.biz/archives/3071
;; clangを利用した補完をしてくれるclang-complete
;; (el-get-bundle auto-complete-clang)


;; web-mode
(el-get-bundle web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; web-modeのインデント関係
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)
;; scala.htmlだけはweb-mode-htmlで正しく表示できないので、html-modeをつかう
;; ただしhtml-modeでも
(add-to-list 'auto-mode-alist '("\\.scala.html$" . html-mode))

;; php-mode
(el-get-bundle php-mode)
(add-hook 'php-mode-hook
          '(lambda()
             (setq indent-tabs-mode t)
             (setq c-basic-offset 4)))
