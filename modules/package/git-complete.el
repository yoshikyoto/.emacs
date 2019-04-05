;;; git-complete -- gitのデータを利用していい感じにコード補完

;;; Commentary:

;; git-complete は、 gitで管理されているコードの内容をもとに
;; いい感じにコード補完してくれるものです。
;; そのため特定の言語に依存せず、git管理されたプロジェクトであれば利用可能です

;; [Emacs] git のチカラで未知の言語でもオムニ補完 - Qiita
;;  - https://qiita.com/zk_phi/items/642b1e7dd12b44ea83ce

;; GitHub Repository
;;  - https://github.com/zk-phi/git-complete

;; el-get などパッケージ管理ツールではインストールできないので
;; サブモジュールに追加
;; ```sh
;; cd modules/packages/
;; git submodule add https://github.com/zk-phi/git-complete modules/package/git-complete
;; ls modules/package/git-complete
;; ```

;;; Code:

;; git submodule に追加した git-complete をここでloadする
(load "package/git-complete/git-complete")

;; M-x git-complete で補完できるけどもっと高速に補完してほしい...
;; （リポジトリが大きいと結構補完に時間がかかる）
;; 特にショートカットとかも設定していない

;;; git-complete.el ends here
