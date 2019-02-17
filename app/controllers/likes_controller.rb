class LikesController < ApplicationController
  before_action :set_variables

  def create
    like = current_user.likes.new(review_id: params[:review_id])
    like.save
  end

  def destroy
    like = current_user.likes.find_by(review_id: params[:review_id])
    like.destroy
  end

  private
  def set_variables
    @review = Review.find(params[:review_id])
    @id_name = "#like-link-#{@review.id}"
  end
end
