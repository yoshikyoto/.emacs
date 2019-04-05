;;; aspell -- スペルチェック

;;; Commentary:

;; aspell-en をインストールしている必要があります。

;;; Cent OS

;; 以下のコマンドで aspell と aspell-en（英語ようのチェッカー）が入ります
;; yum install aspell-en

;;; Mac

;; brew install aspell --lang=en

;;; 参考:

;; Emacsでもスペルチェックをしようという話
;; - http://y0m0r.hateblo.jp/entry/20121219/1355930369

;; Emacsでスペルチェック - 計算物理屋の研究備忘録
;; - http://keisanbutsuriya.hateblo.jp/?page=1423560657

;; emacsで自動でスペルチェックをする方法 : 徒然なるままに
;; - https://hgw09.exblog.jp/24028953/

;;; Code:

;; スペルチェックのaspellを利用する
;; これを設定すると `M-x ispell` でスペルチェックが走るようになります。
;; ispellの操作の詳細は
;; http://y0m0r.hateblo.jp/entry/20121219/1355930369
;; を見ると良い


;; aspellコマンドを利用するように指定して
;; aspellコマンドにわたす引数を指定してやる
;;
;; --run-together を指定してやることで、 userData のような単語をつなげて生成してくれるやつも
;; いい感じにスペルチェックしてくれるが、ちょっとだけ判定が弱くなる。
;;
;; 例えば、 `followerrCount` などは通り抜けてしまう。
;; `follower` `r` `count` の3つの単語と判定されるからだろうか...
;;
;; 以下のブログでCamelCase でもいい感じに spellcheck してくれる設定が紹介されている
;; - https://stackoverflow.com/a/24878128/8888451
;;
(setq ispell-program-name "aspell"
  ispell-extra-args
  '(
    "--sug-mode=ultra"
    "--lang=en_US"
    "--run-together"
    "--run-together-limit=5"
    "--run-together-min=2"
    ))

;; この設定なんの設定だろう...？一旦コメントアウトしている
;;(eval-after-load "ispell"
;;  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; コードの変数などのスペルをチェックしたいので言語は英語で
(setq-default ispell-dictionary "english")

;; とりあえず php-mode でだけ有効になるようにしている
;; TODO 全モードで有効になるようにする
(add-hook
 'php-mode-hook
 '(lambda ()
    ;; flyspell-prog-mode というのもあるようだが、
    ;; こっちだと何故かうまくスペルチェックされなかったので
    ;; 通常のflyspell-mode を利用する
    (flyspell-mode 1)))

;;;;;;;;;;;
;; 関数定義

;; 辞書に単語を保存する
;; どこに保存しているんだ...
(defun my-flyspell-save-word ()
  "Save current word to dictionary."
  (interactive)
  (let
      (
       (current-location (point))
       (word (flyspell-get-word))
       )
    (when (consp word)
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))


;;;;;;;;;;;;;;;
;; キーバインド
;; 本当はflyspell-modeだけでset-keyしたいけど手抜きで
(add-hook
 'flyspell-mode-hook
 '(lambda ()
    ;; C-c C-c でバッファのスペルチェック
    (global-set-key (kbd "C-c C-v") 'flyspell-buffer)
    ;; C-c C-g でフォーカスしている単語を辞書に登録
    (global-set-key (kbd "C-c C-g") 'my-flyspell-save-word)
    ))

;;; aspell.el ends here
