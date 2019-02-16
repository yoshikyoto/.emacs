;;; python-mode -- python-modeの設定あれこれ

;;; Commentary:

;; Python用のモードの設定とか補完とかいろいろ

;;; Dependency


;;;;;;;;;;;;;;;;;;
;; python を入れる

;; pyenvがオススメ
;; TODO: pyenvのインストール方法
;; pyenvを使ってプロジェクトごとに特定のpythonバージョンを利用する

;; $ pyenv install 3.4.3 # <- 使いたいpythonのバージョン
;; $ cd path/to/project/root
;; $ pyenv local 3.4.3
;; python --version # <- これで3.4.3になるはず


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pipで依存モジュールを入れる

;; $ sudo pip install jedi epc autopep8 virtualenv


;;;;;;;;;
;; 参考:

;; Pythonをemacsで書く
;;  http://ksknw.hatenablog.com/entry/2016/05/07/171239

;;; Code:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jedi - pythonのコード補完をしてくれるパッケージ

;; jediとvirtualenvが必要
;; pip install jedi virtualenv

;; 初回起動すると `M-x jedi:install-server` しろと言われるので言われるがままにする。
(el-get-bundle jedi)
(add-hook 'python-mode-hook 'jedi:setup)

;; autocompleteの補完は競合して邪魔なので消してしまう
(setq ac-sources (delete 'ac-source-words-in-same-mode-buffers ac-sources))

;; Meta-. で定義にジャンプ
(define-key python-mode-map "M-." 'jedi:goto-definition)

;; 参考

;; jedi
;; emacsにjediを導入した話 -- qiita
;;  https://qiita.com/yuizho/items/4c121bdecc103109e4fd

;; emacs-jedi GitHub
;;  https://github.com/tkf/emacs-jedi
;;  http://tkf.github.io/emacs-jedi/latest/ (pages)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autopep8 - pythonのコーディング規約

;; (load "package/paetzke/py-autopep8")

;; (setq py-autopep8-options '("--max-line-length=200"))
;; (setq flycheck-flake8-maximum-line-length 200)
;; (py-autopep8-enable-on-save)

;; 参考

;; py-autopep8.el - github
;;  https://github.com/paetzke/py-autopep8.el

;;; python-mode.el ends here
