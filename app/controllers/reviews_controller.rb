class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      @review.rating = @review.rating.round(1)
      @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end