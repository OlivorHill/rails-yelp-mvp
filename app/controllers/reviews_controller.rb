class ReviewsController < ApplicationController
  def new
  #### OLD METHOD FOR NEW ####
  @review = Review.new
  @restaurant = Restaurant.find(params[:restaurant_id])

    #### NEW METHOD FOR NEW REVIEW ####
    # Build a new review associated with the restaurant AUTOMATIC ASSOCIATION!
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = @restaurant.reviews.build
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # The below line does the exact same as the line below it
    # @review.restaurant_id = @restaurant.id
    @review.restaurant = @restaurant
    if @review.save
    # If the save has been successful, run the below code
    redirect_to restaurant_path(@restaurant)
    else
      # If the save was unsuccessful, run the below code!--------------
      # The below code redirects the user back to the view file for new
      # and the error code / status given changes the appearance of the form
      # displayed on that page-----------------------------------------
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
