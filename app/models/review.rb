class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
