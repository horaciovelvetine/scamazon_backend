class Users::Store::StoreController < ApplicationController
before_action :get_user_store

  def create; end

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
      params.require(:store).permit(:name, :email, :address, :store_description, :logo, :bank_account, :user_id)
    end
end