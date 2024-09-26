class RestaurantsController < ApplicationController
  # READ - Show all restaurants
  def index
  @restaurants = Restaurant.all
  end

  # READ - Show a single restaurant
  def show
    @restaurant = Restaurant.find(params[:id])
  end


  # CREATE Step 1 - Display form for user to create new restaurant
  def new
    @restaurant = Restaurant.new
  end

  # CREATE Step 2 - Form sumbission and save new restaurant
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant) # Redirect only if save is successful
    else
      # Render the new form again with error messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Making the params of the restaurant accessable for passing to the create method
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
