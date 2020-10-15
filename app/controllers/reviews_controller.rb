class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:new, :create]
  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant #daonde esta vindo esse restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant) # pq que o form aqui ja reconhece isso e traz aquela mensagem vermelha?
    else
      render 'new'
    end
  end

  private
  def set_reviews
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
