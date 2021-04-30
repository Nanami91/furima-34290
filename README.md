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

- has_many :item
- has_one :credit-card

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| shipping_charge | integer    | null: false                    |
| shipping_area   | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| home_number     | integer    | null: false                    |
| building_name   | text       | null: false                    |
| phone_number    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## item_purchases テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item          | integer | null: false, foreign_key: true |
| user          | integer | null: false, foreign_key: true |
| address       | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
