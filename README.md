# テーブル設計

## users テーブル

| Column             | Type     | Option      |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| password           | string   | null: false |
| family_name        | string   | null: false |
| first_name         | string   | null: false |
| family_name_kana   | string   | null: false |
| first_name_kana    | string   | null: false |
| birthday           | date     | null: false |

### Association

- has_many :items
- has_many :informations


## items テーブル (出品画像投稿はactive_storageを使用)

| Column             | Type       | Option                        |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| description        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| state_id           | integer    | null: false                   |
| delivery_charge_id | integer    | null: false                   |
| shipping_area_id   | integer    | null: false                   |
| shipping_day_id    | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: fals, foreign_key: true |

### Association

- belongs_to :user
- has_one :information


## infomations テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item

## comments テーブル

## | Column             | Type       | Option                         |
## | ------------------ | ---------- | ------------------------------ |
## | comment_text       | text       | null: false                    |
## | user               | references | null: false, foreign_key: true |
## | item               | references | null: false, foreign_key: true |

### Association

## - belongs_to :users
## - belongs_to :items