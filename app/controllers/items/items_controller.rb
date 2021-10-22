class Items::ItemsController < ApplicationController
  before_action :find_item, only: [:show]
  before_action :random_item, only: [:show]

  helper_method :find_item
  
  def index; end

  def create; end

  def show; end

  def new; end

  def edit; end

  def update; end

  def destroy; end


  private

  def random_item
    @rnd_item = Item.find(((params[:id].to_i) + 1).to_s )
  end

  
end
