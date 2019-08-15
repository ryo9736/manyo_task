# manyou_task
  タスク管理システムです

#スキーマ

| model | 外部キー |カラム|カラム|カラム|カラム|カラム|
----|----|----|----|----|----|----
| user | ---- | name | ---- | ---- | ---- | ---- |
| task | user_id | task_name | content | limit | status | priority |
| label| task_id | label_name | ---- | ---- | ---- | ---- |

#テーブル

User

| カラム | 型 |
----|----
| name | string |

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
