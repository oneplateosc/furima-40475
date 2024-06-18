# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false |
| description        | text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| shipping_fee       | string     | null: false |
| shipping_from      | string     | null: false |
| shipping_days      | string     | null: false |
| price              | integer    | null: false |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| -------   | ---------- |                                |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| order              | references | null: false, foreign_key: true |
| postal_code        | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |

### Association
- belongs_to :order

