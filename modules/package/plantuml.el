;;; plantuml -- plantuml編集のためのモードなど

;;; Commentary:

;; ### plantuml コマンドが動く必要があります。
;; ```sh
;; $ plantuml -v
;; ``

;; ### plantuml コマンドがインストールされていない場合はインストールしてください

;; ### Mac OS
;; brewでplantumlコマンドを入れる
;; ```sh
;; $ brew install plantuml
;; $ plantuml -v
;; (0.000 - 245 Mo) 237 Mo - PlantUML Version 1.2019.01
;; (0.062 - 245 Mo) 237 Mo - GraphicsEnvironment.isHeadless() false
;; (0.063 - 245 Mo) 237 Mo - Found 0 files
;; No diagram found
;; ```
;; plantuml-mode は plantuml-bar-path で planluml.gar を指定する必要がある
;; brewでインストールされたplantumlコマンドは、内部でjawを実行しているだけなので、
;; コマンドの中身を見てjarファイルがどこにあるか調べる
;; ```sh
;; $ cat /usr/local/bin/plantuml
;;  #!/bin/bash
;;  GRAPHVIZ_DOT="/usr/local/opt/graphviz/bin/dot" exec java -jar /usr/local/Cellar/plantuml/1.2019.1/libexec/plantuml.jar "$@"
;; ```
;; この場合
;; `/usr/local/Cellar/plantuml/1.2019.1/libexec/plantuml.jar`
;; これがjarファイルの場所
;; これに関しては各環境で異なるのでこのファイルとは別のファイルで定義する

;; ### キーバインド
;; - `C-c C-c` plantumlをプレビューする
;; - C-u C-c C-c plantuml-preview in other window
;; - C-u C-u C-c C-c plantuml-preview in other frame

;; ### 参考
;; - emacsでplantUMLをplantuml-modeを使って作成する
;;   - https://joppot.info/2017/10/30/4091
;;   - このページがめっちゃわかりやすいので参考にするといい
;; - MacにPlantUML環境をbrewを使って構築する
;;   - https://joppot.info/2017/10/26/4078

;;; Code:

(el-get-bundle plantuml-mode)

;; どの拡張子の時にplantuml-modeで開くかの設定
(add-to-list 'auto-mode-alist '("\\.pu$" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.puml$" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.uml$" . plantuml-mode))

;; 日本語を含むUMLを書く場合はUTF-8を指定する必要がある
(setq plantuml-options "-charset UTF-8")

;; 環境依存の設定を読み込む
(load "package/plantuml-config")

;;; plantuml.el endgs here
