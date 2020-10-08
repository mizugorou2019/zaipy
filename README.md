## Users テーブル
| Column     | Type    | Options     |
| ---------- | ------  | ----------- |
| name       | string  | null: false |
| name_kana  | string  | null: false |
| tel_num    | string  | null: false |
| password   | string  | null: false |

### Association
- has_many :orders
- has_many :pickups



## Items テーブル
| Column        | Type    | Options       |
| ------------- | ------- | ------------- |
| name          | string  | null: false   |
| description   | text    | null: false   |
| quantity      | integer |               |
| category_id   | integer | null: false   |

### Association
- has_one :order
- has_one :pickup


## Pickups テーブル
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |
| quantity        | integer | null: false                    |

### Association
- belongs_to :user
- belongs_to :item


## Orders テーブル
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |
| quantity        | integer | null: false                    |

### Association
- belongs_to :user
- belongs_to :item