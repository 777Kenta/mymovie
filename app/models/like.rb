class Like < ActiveRecord::Base
  belongs_to :review, counter_cache: :like_count
  belongs_to :user

  validates_uniqueness_of :review_id, scope: :user_id
end
