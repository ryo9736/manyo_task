# manyou_task
  タスク管理システムです

# model

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


## スキーマー
