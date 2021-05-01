## テーブル設計

## users テーブル

| Column             | Type        | Options                  |
| ------------------ | ----------- | ------------------------ |
| nickname           | string      | null: false              |
| email              | string      | null: false, unique:true |
| encrypted_password | string      | null: false              |
| first_name         | string      | null: false              |
| last_name          | string      | null: false              |
| first_name_kana    | string      | null: false              |
| last_name_kana     | string      | null: false              |
| birth_date         | date        | null: false              |

### Association

- has_many :items
- has_many :item_purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchase

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| home_number     | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :item_purchase

## item_purchases テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item          | integer | null: false, foreign_key: true |
| user          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
