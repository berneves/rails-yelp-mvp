class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant #daonde esta vindo esse restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant) # pq que o form aqui ja reconhece isso e traz aquela mensagem vermelha?
    else
      render 'new'
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
