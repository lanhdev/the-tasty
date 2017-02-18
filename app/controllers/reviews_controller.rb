class ReviewsController < ApplicationController
  def create
    @food_item = FoodItem.find(params[:food_item_id])
    @review = @food_item.reviews.create review_params
    redirect_to food_item_path(id: @food_item.id)
  end

  def destroy
    @food_item = FoodItem.find(params[:food_item_id])
    @review = @food_item.reviews.find(params[:id])
    @review.destroy
    redirect_to food_item_path(id: @food_item.id)
  end

  private
    def review_params
      params.require(:review).permit(:reviewer, :comment, :rating)
    end
end
