# sinatra-memo-app

## 前提条件

### Ruby Version
3.1.0

### 他

#### PostgreSQL

- psql コマンドが利用できること
- createdb / dropdb コマンドが利用できること
- 動作確認環境: psql (PostgreSQL) 14.1

#### OS

- 動作確認環境: macOS BigSur (11.3.1)

## 実行方法

1. アプリのルートディレクトリ (`sinatra-memo-app/`) に移動します
1. `bundle install` を実行します
1. DB を初期化します
  1. `chmod +x scripts/initiate_db.sh`
  1. `./scripts/initiate_db.sh`
1. `bundle exec ruby memo.rb` を実行します
1. ブラウザで `localhost:4567` にアクセスします

# DBの初期化

- 以下のシェルスクリプトを実行してください
  - `./scripts/initiate_db.sh`
- 初期化では以下の処理を行います
  - DB 削除 (存在する場合)
  - DB 作成
  - テーブル作成
  - 初期データ登録

## テスト実行方法

1. テスト実行前後で *メモデータの初期化* を実行してください
1. アプリのルートディレクトリ (`sinatra-memo-app/`) に移動します
1. `bundle exec ruby test/models/memo_test.rb` を実行します

## rubocop実行方法

1. アプリのルートディレクトリ (`sinatra-memo-app/`) に移動します
1. `bundle exec rubocop` を実行します
