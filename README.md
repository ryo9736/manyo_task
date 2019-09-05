# manyou_task
タスク管理システムです

# Herokuにデプロイする手順
herokuにログインする
heroku login

アプリセットコンパイルを行う
rails assets:precompile RAILS_ENV=production

gitへコミットする
git add -A
git commit -m "init"

新しいアプリケーションを作成
heroku create

Herokuにデプロイする
git push heroku master

データベースの移行
heroku run rails db:migrate


## スキーマ

| model | 外部キー |カラム|カラム|カラム|カラム|カラム|
----|----|----|----|----|----|----
| user | ---- | name | email  | password_digest  | ---- | ---- |
| task | user_id | task_name | content | limit | status | priority |
| label| task_id | label_name | ---- | ---- | ---- | ---- |

## テーブル

User

| カラム | 型 |
----|----
| name | string |
| email | string |
| password_digest | string |

Task

| カラム | 型 |
----|----
| task_name | string |
| content | text |
| limit | string |
| status | string|
| priority | string |
| user_id | intger |

Label

| カラム | 型 |
----|----
| label_name | string |
| task_id | intger |
