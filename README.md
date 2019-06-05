# Emacsの設定ファイル

Emacsの設定たち。

* Emacsのインストール方法はこのREADMEの下部に記載してあります。
* modules/config や modules/package ディレクトリ以下には、どのようなパッケージを導入しているかや、各パッケージの設定や詳細についても記載していますので参考にしてください。

## Dependency

* el-get
* aspell
  * Mac: `brew install aspell --lang=en`
  * CentOS: `yum install aspell-en`
* ag
  * インストール方法は dumb-jump.el を参照


## Usage

```sh
cd ~
git clone git@github.com:yoshikyoto/.emacs.git .emacs.d
cd .emacs.d
git submodule init
git submodule update
```

## ディレクトリ構成

* bin - 便利なシェルスクリプトとかはここに
* modules - 個人的な設定や、パッケージのインストールなどのelispを置く。詳細は `modules/README.md` を参照
  *
* snippets - yasnippetで作成されたスニペットたち

## Add submodule




## Emacsのインストール方法

### Emacsのビルドに必要なパッケージのインストールなど

#### CentOS（Red Hat系）

```sh
sudo yum -y install gcc make ncurses-devel wget
```

#### Ubuntu（Debian系）

```sh
sudo apt-get install gcc make ncurses-dev wget
```

#### Mac OS

* developer toolsを入れておけばたぶん大丈夫
* wgetがなければ `brew install wget`
* brewがインストールされていることは前提とします

```sh
configure: error: The following required libraries were not found:
     gnutls
```

と言われたら

```sh
brew install pkg-config
brew install gnutls
```

```sh
xml.c:23:10: fatal error: 'libxml/tree.h' file not found
#include <libxml/tree.h>
         ^~~~~~~~~~~~~~~
1 error generated.
```
の場合

* https://masutaka.net/chalow/2014-10-25-1.html

でよい

### ソースをダウンロードしてビルド

以下のURLからビルドしたいEmacsのバージョンのアーカイブのURLを探します。

* http://ftp.jaist.ac.jp/pub/GNU/emacs/

ダウンロードしてインストールします。例えば、26.1 をインストールしたい場合はこうです。

```sh
$ wget http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-24.5.tar.gz
$ tar xvf emacs-26.1.tar.gz
$ cd emacs-26.1
$ ./configure
$ sudo make
$ sudo make install
```

パッケージが足りていない場合は `configure` や `make` で失敗することがありますが、
エラーを読んだうえでビルドオプションを変更するか、関連のパッケージを入れるなどして対処してください。

バージョンを確認し、正しくインストールされたかどうかを確認してください。

```sh
emacs --version
GNU Emacs 26.1
```

### gnutlsがないと言われた場合

```sh
sudo yum install gnutls-devel
```

#### インストールしたバージョンと異なる場合

brewやyumですでにEmacsがインストールされていた、などの可能性があります。
アンインストールしてから再度ビルド＆インストールし直すなどをお試しください。

```sh
brew uninstall emacs
```

### sudoできない環境でemacsをインストール

Emacsをホームディレクトリ以下にビルドし、PATHを通すようにすると良いでしょう。

```sh
$ tar xvf emacs-26.1.tar.gz
$ cd emacs-26.1
$ ./configure --prefix=$HOME/emacs
$ make
$ make install
```

これで、~/emacs 以下にビルドされるので、PATHを通してあげればOKです。
（ビルドするディレクトリはどこでも構いません）
以下のコマンドを `.zshrc` や `.bashrc` に追記しましょう。

```sh
export PATH=$PATH:~/emacs/bin
```

## 参考ページ

- [Emacsの補完 & 検索を超強化する - Qiita](https://qiita.com/blue0513/items/c0dc35a880170997c3f5)
- [EmacsでWebサービスを開発して8ヶ月が経ちました - エムスリーテックブログ](https://www.m3tech.blog/entry/emacs-web-service)
