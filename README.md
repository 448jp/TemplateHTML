# TemplateHTML

## 概要

webサイト開発のためのテンプレートです。

## 主なシステム構成
- Node.js v6
- Assemble（Handlebars -> HTMLのコンパイルに利用）
- gulp-sass（SCSS -> CSSのコンパイルに利用）
- Browserify + babelify（ES2015 -> JavaScriptのコンパイルに利用）
- その他、npmによってインストールされる各種モジュール

## 新規プロジェクトの開始手順

1. npmパッケージのインストール

	```
npm install
	```

2. 開発用サーバーの起動

	```
npm start
	```

以上で、完成ファイルを表示するためのローカルサーバー（ http://localhost:3000 ）を起動します。同時に、ソースの監視を始めます。監視中にファイルの変更が発生すると、自動的に該当ファイルのコンパイルなどの処理が実行されます。このとき、ブラウザでローカルサーバーを開いていれば、自動的に再読み込みされます。

## ディレクトリ構造

| ディレクトリ名 | 概要 |
| --- | --- |
| dist | 完成ファイル一式（Gitリポジトリには含めず） |
| gulp | gulpタスク |
| src | ソース一式 |
| src/_includes | Assembleのパーシャルファイル |
| src/_layouts | Assembleのレイアウトファイル |
| src/data | Assembleのデータファイル |
| src/images | 本プロジェクト用画像ファイル |
| src/js | 本プロジェクト用JavaScriptファイル |
| src/sass | 本プロジェクト用SCSSファイル |
| src/*.hbs | Assembleの各ページファイル |

### Sassファイルのディレクトリ構造（src/sass以下）

| ディレクトリ名 | 概要 |
| --- | --- |
| base/_footer.scss | 共通フッターのスタイル |
| base/_header.scss | 共通ヘッダーのスタイル |
| base/_mixin.scss | 各種mixin |
| base/_structure.scss | 全体の構造に関わるスタイル |
| base/_variable.scss | 各種変数 |
| pages/*.scss | 各ページごとのスタイル |
| parts/_others.scss | その他のスタイル（ライブラリ用スタイルの上書きなど） |
| screen.scss | 起点ファイル |

### 画像ファイルのディレクトリ構造（src/images以下）

| ディレクトリ名 | 概要 |
| --- | --- |
| base/footer/* | 共通フッターの画像 |
| base/header/* | 共通ヘッダーの画像 |
| pages/*/ | 各ページごとの画像 |
| parts/* | その他の画像（ライブラリ用画像など） |
| parts/dummy/* | ダミー画像 |

## Assembleについて

本プロジェクトでは、HTMLのテンプレートを使い回したり（レイアウト機能）、共通モジュールを別ファイルに独立させたり（パーシャル機能）、といった目的を達成するため、[Assemble](http://assemble.io/)を利用しています。

1つのHTMLを作成する主な流れは、以下の通りです。

1. ソース一式（src）直下に`*.hbs`を作成する。
1. hbsファイルの冒頭にYAML front matterでメタデータを定義する。
1. YAML front matter以後にコンテンツ部分のHTMLを記述する。
1. コンパイルによって完成ファイル一式（dist）直下に`*.html`が出力される。

### YAML front matterのメタデータ

| メタデータ名 | 概要 |
| --- | --- |
| layout | レイアウトファイル名 |
| dir | ディレクトリ名 |

## Sassについて

本プロジェクトでは、以下のような観点からSassで扱うクラス名を決定しています。

- クラスの独立性/更新性を担保する。

ベースとなるのは、[ECSS](http://ecss.io/)と[MindBEMding](https://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/)で、これらを組み合わせたような独自の命名ルールを採用しています。

### クラス名の例

書式：`.ディレクトリ名-ファイル名-ブロック名__エレメント名--モディファイア名`
例：`.home-index-service__button--close`

- ディレクトリ名およびファイル名は、該当のブロックがどのページで使われるかを入力します
	- ルートの場合、ディレクトリ名は`home`になります
    - ヘッダー/フッターなど共通で使われるブロックでは省略できます
- ブロック名、エレメント名、モディファイア名は、MindBEMdingに沿って命名します

### sass-lintについて

複数人でSassファイルを編集するため、sass-lintを使ったlintを導入しています。ローカルサーバーを起動時（ファイルの監視時）にSassファイルを変更、保存すると、自動的にsass-lintが実行され、結果が表示されます。

原則として、`error`は0になるようご対応ください。`warning`は存在してもOKですが、要注意の箇所ですので問題のない記述かどうかのチェックをお願いします。

不明なエラーや、修正できないエラーなどはご相談ください。

## JavaScriptについて

本プロジェクトでは、JavaScriptのモジュール管理および実装のため、Babelify、ならびにBrowserifyを利用しています。また、Babelでは、一部プラグインを利用しています。

ブラウザから利用するJavaScriptファイルは、`js/app.js`のみです。

### 各ページの挙動について

各ページには、ディレクトリ名とファイル名をもとにしたclassとIDが存在します。例えば、トップページであれば`.home#index`といった具合です。

JavaScript側は、このようなページ固有のclassの有無を判定し、該当ページに必要な機能のみを実行します。なお、グローバルナビゲーションのように全ページ共通の機能については、ページ固有のclassの有無に関わらず、実行されます。

## 文字コードについて

原則として、`utf-8`を指定します。
