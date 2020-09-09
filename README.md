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
- has_many :item_purchases


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
- has_one :item_purchase


## infomations テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| item_purchase      | references | null: false, foreign_key: true |

### Association

belongs_to :item_purchase
belongs_to :item


## item_purchases テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, forrign_key: true |
| item               | references | null: false, forrign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :information
