class AddLikesCountToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :like_count, :integer
  end
end
