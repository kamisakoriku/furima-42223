## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false,              |
| email              | string | null: false  unique: true |
|encrypted_password  | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false,              |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| info            | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false,                   |
| condition_id    | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false,                   |
| user            | references | null: false foreign_key: true  |

### Association
- belongs_to :user  
- has_one :order  
- belongs_to_active_hash :category  
- belongs_to_active_hash :condition  
- belongs_to_active_hash :shipping_fee  
- belongs_to_active_hash :prefecture  
- belongs_to_active_hash :shipping_day

## ordersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to :item
- has_one : shipping_address

### shipping_addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | text       | null: false                    |
| city            | integer    | null: false                    |
| addresses       | integer    | null: false,                   |
| building        | integer    |                                |
| phone_number    | integer    | null: false                    |
| order           | integer    | null: false, foreign_key: true |
### Association
- belongs_to :order
- belongs_to_active_hash :prefecture