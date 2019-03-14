# Emacsの設定ファイル

Emacsの設定たち。

* Emacsのインストール方法はこのREADMEの下部に記載してあります。
* modules/config や modules/package ディレクトリ以下には、どのようなパッケージを導入しているかや、各パッケージの設定や詳細についても記載していますので参考にしてください。



## ディレクトリ構成

* bin - 便利なシェルスクリプトとかはここに
* modules - 個人的な設定や、パッケージのインストールなどのelispを置く。詳細は `modules/README.md` を参照
  * 
* snippets - yasnippetで作成されたスニペットたち

## dependency

* el-get

## Usage

```sh
cd ~/
git clone git@github.com:yoshikyoto/.emacs.git .emacs.d
cd .emacs.d
git submodule init
git submodule update
```

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
