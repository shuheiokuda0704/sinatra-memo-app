# sinatra-memo-app

## 前提条件

### Ruby Version
3.1.0
## 実行方法

1. アプリのルートディレクトリ (`sinatra-memo-app/`) に移動します
1. `bundle install` を実行します
1. `bundle exec ruby memo.rb` を実行します
1. ブラウザで `localhost:4567` にアクセスします

# メモデータの初期化

- メモデータは `db/memo.json` に保存されます
- 初期データとして、3つのサンプルデータが含まれています(title1/content1, title2/content2, title3/content3)
- データを初期化する場合は、 `memo.json` の変更をリバートしてください
  - `git checkout db/memo.json`
## テスト実行方法

1. *メモデータの初期化* を実行してください
1. アプリのルートディレクトリ (`sinatra-memo-app/`) に移動します
1. `bundle exec ruby test/models/memo_test.rb` を実行します

## rubocop実行方法

1. アプリのルートディレクトリ (`sinatra-memo-app/`) に移動します
1. `bundle exec rubocop` を実行します
