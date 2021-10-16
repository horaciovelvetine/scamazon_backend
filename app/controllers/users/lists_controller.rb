class Users::ListsController < ApplicationController
  
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
  def create; end

  ## Form for new list
  def new; end

  ## Should show a specific list
  def show
    binding.pry
  end

  ## NO VIEW
  def edit; end

  ## NO VIEW
  def update; end

  ##NO VIEW
  def destroy; end
end
