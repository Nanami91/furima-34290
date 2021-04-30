## テーブル設計

## users テーブル

| Column          | Type        | Options     |
| --------------- | ----------- | ----------- |
| nickname        | string      | null: false |
| email           | string      | null: false |
| password        | string      | null: false |
| first-name      | string      | null: false |
| last-name       | string      | null: false |
| first-name-kana | string      | null: false |
| last-name-kana  | string      | null: false |
| birth-date      | date        | null: false |

### Association

- has_many :item
- has_one :credit-card

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item-name       | text       | null: false                    |
| description     | text       | null: false                    |
| category        | text       | null: false                    |
| status          | text       | null: false                    |
| shipping-charge | text       | null: false                    |
| shipping-area   | text       | null: false                    |
| shipping-days   | text       | null: false                    |
| price           | integer    | null: false                    |
| user-id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## credit_cards テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user-id     | text       | null: false, foreign_key: true |
| customer-id | references | null: false, foreign_key: true |
| card-id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post-code       | integer    | null: false                    |
| prefectures     | text       | null: false                    |
| city            | text       | null: false                    |
| home-number     | integer    | null: false                    |
| building-name   | text       | null: false                    |
| phone-number    | integer    | null: false                    |
| user-id         | references | null: false, foreign_key: true |
| item-id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
