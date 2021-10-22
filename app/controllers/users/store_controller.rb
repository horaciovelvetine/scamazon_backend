class Users::Store::StoreController < ApplicationController
before_action :get_user_store, only: [:show, :edit, :update, :destroy]

  layout false, only: [:new]
  
  def create
    binding.pry
    @store = current_user.store.create(store_params)
    @store.inventory.create
    redirect_to user_store_path(id: @store.id), notice: "Store created successfully, head over to your inventory page to add items and start selling!" 
    binding.pry
  end

  ## New Store View
  def new; end

  ## Store Dashboard view
  def show; end

  def edit; end

  def update; end

  def destroy; end

  private
    def get_user_store
      @store = User.store
    end


    def store_params
      params.require(:store).permit(:name, :email, :address, :description, :logo, :industry, :mission_statement, :ein, :user_id)
    end
end