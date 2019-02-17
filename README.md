## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|mail|string|null: false, unique: true|
### Association
- has_many :reviews
- has_many :likes, dependent: :destroy
- has_many :like_reviews, through: :likes
-----------------------------------------------------
## productsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, unique: true|
|image_url|string|null: false, unique: true|
|director|string|null: false|
|detail|string|null: false, unique: true|
|open_date|string|null: false|
|link|string||

### Association
- has_many :reviews
-----------------------------------------------------
## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|nickname|references|null: false, foreign_key: true|
|rate|int|null: false|
|review|string|null: false|
|product_id|references|null: false, foreign_key: true|
|like_count|int|null: false|

### Association
- belongs_to :product
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes
-----------------------------------------------------
## likesテーブル

|Column|Type|Options|
|------|----|-------|
|review_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :review, counter_cache: :like_count
- belongs_to :user
