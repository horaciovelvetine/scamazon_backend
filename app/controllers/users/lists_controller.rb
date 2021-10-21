class Users::ListsController < ApplicationController
  before_action :add_set_list, only: [:add_item, :remove_item]
  helper_method :set_lists, :set_list
  
  ## Should redirect to show with a random list chosen
  def index
    @list = @user.lists.first

    if @list.nil?
      redirect_to new_user_list_path, notice: 'Start here by makeing your first list!'
    else
      redirect_to user_list_path(id: @list.id)
    end
  
  end

  ## NO VIEW creates a new list
  def create
    @list = @user.lists.create(list_params)
    
    if @list.save
      redirect_to user_list_path(id: @list.id), notice: "List was successfully created! Time to add some items"
    else
      redirect_to user_lists_path, notice: "Sorry! We can't make heads or tails out of that list right now, please try again in a moment."
    end

  end

  ## Form for new list
  def new; end

  ## Should show a specific list
  def show
    @lists = set_lists
    @list = set_list
  end

  def add_item
    @list.items << Item.find(params[:item_id])
    redirect_to user_list_path(id: @list.id), notice: "Item was successfully added to #{@list.name}"
  end

  def remove_item
    @list.items.delete(params[:item_id])
    redirect_to user_list_path(id: @list.id), notice: "Item was successfully removed from #{@list.name}"
  end

  ## NO VIEW
  def edit; end

  ## NO VIEW
  def update; end

  ##NO VIEW
  def destroy; end

  private

    def list_params
      params.require(:list).permit(:name, :description)
    end

    def set_lists
      @lists = @user.lists.all
    end

    def set_list
      if params[:id].nil?
        @list = @user.lists.first
      else
        @list = List.find(params[:id])
      end
    end

    def add_set_list
      @list = current_user.lists.find(params[:id])
    end

end
