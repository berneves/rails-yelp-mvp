class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end
  def new
    @restaurant = Restaurant.new
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant) # pq que o form aqui ja reconhece isso e traz aquela mensagem vermelha?
    else
      render 'new'
    end
  end
  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end
  # def edit
  #   @restaurant = Restaurant.find(params[:id])
  # end
  # def update
  #   @restaurant = Restaurant.find(params[:id])
  #   if @restaurant.update(restaurant_params)
  #     redirect_to restaurants_path
  #   else
  #     render "edit"
  #   end
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

end
