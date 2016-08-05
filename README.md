# コア開発向けemacs

* phpのインデントはスペースじゃなくてtabになるようになってる
* 環境依存のパッケージとかはコメントアウトされている

## .zshrc

```
# Setting for Mac terminal
# Profile: Pro
# font: 11 pt.
# color: black alpha 90%
# シェル ウインドウを閉じる前の確認: しない

# 以下の設定は
# http://qiita.com/harapeko_wktk/items/47aee77e6e7f7800fa03
# https://gist.github.com/mollifier/4979906
# を参考に書かれたもの

export LANG=ja_JP.UTF-8

# 色を使用可能に
autoload -Uz colors
colors

# プロンプト
# 書き方参考: http://qiita.com/yamagen0915/items/77fb78d9c73369c784da
# PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %"
# ここを環境ごとに変えるといいかもしれない
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} ${fg[cyan]}%~${reset_color}
$ %"

# color: black red green yellow blue magenda cyan white

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
       /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# '#' 以降をコメントとして扱う
setopt interactive_comments

##################################################
# エイリアス

alias c='cd'
alias la='ls -la'
alias l='ls'

# lsの色付けをOSTYPEごとに行う
case ${OSTYPE} in
    darwin*)
	# Mac
	export CLICOLOR=1
	alias ls='ls -G -F'
	;;
    linux*)
	# Linux
	alias ls='ls -F --color=auto'
	;;
esac
```
