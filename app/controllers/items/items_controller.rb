class Items::ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index; end

  def create; end

  def show; end

  def new; end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_item(item)
    @item = item
  end
  
end
