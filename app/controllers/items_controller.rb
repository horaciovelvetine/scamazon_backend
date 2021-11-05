class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    #needs JSON language response
    
    binding.pry
    @items = Item.all

  end

  # GET /items/1 or /items/1.json
  def show
    #needs JSON language response
    # doesnt need to check for authorization
    binding.pry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

end
