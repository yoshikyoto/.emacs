;;; yasnippet -- コードスニペット
;;; Commentary:

;; 参考:
;; 最強スニペット展開プラグイン yasnippet.elのインストール! - うめすこんぶ
;; https://konbu13.hatenablog.com/entry/2014/01/12/113300

;; 使い方:

;; yas-new-snippet
;; 新しくsnippetを作成する

;; snippetの書き方
;; $1, $2 などで変数（タブを押すと数字順にそこにカーソルが移動する）
;; $1 が複数ある場合は同じ文字が自動的に入る
;; e.g. @param $1 $1 $2

;; ${1:default} のようにデフォルト値を入れることが可能
;; e.g. ${1:private} function $2($3)

;; $0 を入れると全変数の入力後にそこにカーソルが移動する
;; 例えば下記の例の場合、通常入力が終わると `}` の後ろにカーソルが移動してしまうが
;; $0 を置いておくことで `{` と `}` の間に最終的にカーソルを持ってくることができる。
;;
;; e.g.
;; public function $1($2) {
;;     $0
;; }

;; 作成されたスニペットについて

;; デフォルトだと .emacs.d/snippets 以下に保存されるようになっている。
;; この snippets ディレクトリをリポジトリに含めることで、
;; 異なるPC間でスニペットの設定を共有することができる。

;;; Code:
(el-get-bundle yasnippet)

;; yasnnipetを有効にする
(yas-global-mode 1)

;;; yasnippet.el ends here
