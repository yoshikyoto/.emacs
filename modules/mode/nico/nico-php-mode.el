;;; nico-php-mode -- nico php minor mode
;;; Commentary:
;; easy-mmode について http://tech.feedforce.jp/emacs-minor-mode.html
;; mode-hook について http://d.hatena.ne.jp/tomoya/20100112/1263298132

;;; Code:

;; ここで nico-php-mode-map 変数を定義する
;; nico-php-mode が有効になった時に、 nico-php-mode-map が有効になるようにする
;; nico-php-mode-map にキーバインドを追加すると nico-php-mode の時だけ使えるようになる
(setq nico-php-mode-map (make-sparse-keymap))

;; mode 定義する
(easy-mmode-define-minor-mode
 nico-php-mode ;モード名
 "Nico php mode." ;モードの説明
 nil ;初期値がONかどうか
 " Nico" ;モードラインに表示される文字列
 nico-php-mode-map ; このモード中はnico-php-mode-map のキーバインドを有効に
 )

;; hookを登録
(add-hook
 'nico-php-mode-hook
 '(lambda ()
    (setq indent-tabs-mode t) ;インデントにはタブを使用
    (setq c-basic-offset 4) ;タブ幅を4に設定
    (c-set-offset 'case-label '+) ;switch-caseでインデントする
    ))

;;;;;;;;;;;;;;;;;
;; 独自関数の定義

;; コードからテストのコードに一発ジャンプ
;; core/xxx/Xxxx.php から core/test/phpunit/tests/xxx/XxxxTest.php のファイルをfindする
;; find-file 関数を使っているので、 `C-x C-f` コマンドと同様に
;; ファイルがまだ存在しない場合はファイルを新規作成する。

;; replace-regexp-in-string は、regexp じゃないものは存在しないらしい。
(defun core-phpunit-find ()
  "Open nico core php unit test file."
  (interactive)
  (find-file
   ;; .php は Test.php に置き換える
   (replace-regexp-in-string
    "\\.php"
    "Test.php"
    ;; core は core/test/phpunit/tests に
    (replace-regexp-in-string
     "core/"
     "core/test/phpunit/tests/"
     ;; nvapi/src は nvapi/test... に
     (replace-regexp-in-string
      "nvapi/src/"
      "nvapi/test/phpunit/tests/"
      buffer-file-name
      )))))

;; phpunitの設定を読み込んだうえで
;; 開いているファイルのテスト実行する
;; quickrunに依存

;; nicolib版
(defun core-phpunit ()
  "Execute nico core phpunit command."
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "~/core/infra/vendor/bin/phpunit --bootstrap=core/test/phpunit/phpunit.php "
    buffer-file-name)))

;; nvapi版
(defun nvapi-phpunit ()
  "Execute nvapi phpunit command."
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "phpunit --bootstrap=nvapi/test/phpunit/bootstrap.php "
    buffer-file-name)))

;; いい感じにnvapi版とnicolib版を呼び分けるやつ
(defun nico-phpunit ()
  "Execute nico core or nvapi phpunit command."
  (interactive)
  ;; ファイル（ディレクトリ）にnvapi/が含まれていたらnvapiのテストと判断
  ;; そうでなければnicolibのテストと判断
  (if (cl-search "nvapi/" buffer-file-name)
      (nvapi-phpunit)
    (core-phpunit)))

;; core版 単体の関数だけ実行してくれる
(defun core-phpunit-function ()
  "Execute nico core phpunit test on current function."
  (interactive)
  (async-shell-command
   (concat
    "cd ~ && "
    "~/core/infra/vendor/bin/phpunit --bootstrap=core/test/phpunit/phpunit.php "
    "--filter=\""
    (php-current-public-method-name)
    "\" "
    buffer-file-name)))

;;;;;;;;;;;;;;;;;;;;;;
;; キーバインドの追加

;; C-c C-t で該当するコードのテストに飛ぶ
(define-key nico-php-mode-map (kbd "C-c C-t") 'core-phpunit-find)

;; C-c C-u でユニットテストを実行
;; もともと php-mode では c-up-conditional というのがバインドされているっぽいが
;; 特に使ったこと無いので上書きしてしまう
(define-key nico-php-mode-map (kbd "C-c C-u") 'nico-phpunit)

;; C-c C-y でフォーカスが合っている function のテストを実行
;; C-c C-y はphp-modeでは無いもバインドされていなかった
(define-key nico-php-mode-map (kbd "C-c C-y") 'nico-phpunit-function)

;;; nico-php-mode.el ends here
