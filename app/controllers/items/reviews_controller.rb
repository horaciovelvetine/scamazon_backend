class Items::ReviewsController < ApplicationController
  before_action :find_item, only: [:new, :create]
  before_action :find_review, only: [:show]

  def create
    @review = @item.reviews.create(review_params)
    @item.update_rating(@item)
    @item.save
    redirect_to item_path(@item)
  end

  def new; end
  
  def show
    @item = @review.item
  end



  def edit; end

  def update; end

  def destroy; end


  private 

  def review_params
    params.require(:review).permit(:title, :description, :rating, :user_id, :verified_purchaser)
  end

end
