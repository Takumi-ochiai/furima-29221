# テーブル設計

## users テーブル

| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name(kana)  | string  | null: false |
| first_name(kana)   | string  | null: false |
| birth_year         | string  | null: false |
| birth_month        | string  | null: false |
| birth_day          | string  | null: false |

### Association

- has_many :items
- has_many :informations
- has_many :comments


## items テーブル

| Column             | Type       | Option                        |
| ------------------ | ---------- | ----------------------------- |
| image              | text       | null: false                   |
| name               | string     | null: false                   |
| description        | text       | null: false                   |
| category           | string     | null: false                   |
| state              | string     | null: false                   |
| delivery_charge    | string     | null: false                   |
| shipping_area      | string     | null: false                   |
| shipping_days      | string     | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: fals, foreign_key: true |

### Association

- has_meny :comments
- belongs_to :users
- has_one :informations


## infomations テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| card_number        | integer    | null: false                    |
| card_month         | integer    | null: false                    |
| card_year          | integer    | null: false                    |
| security_code      | integer    | null: false                    |
| postal_code        | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

belongs_to :users
belongs_to :items

## comments テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| comment_text       | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items