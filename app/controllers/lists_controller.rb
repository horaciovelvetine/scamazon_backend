class ListsController < ApplicationController

  # Should be used to update user/lists, then reduced to show action where it checks for that lists privacy first and only displays if authorized or redirects

  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  # def index
  #   @lists = List.all
  # end

  # GET /lists/1 or /lists/1.json
  def show
  #should check if a list is private redirect or make an alias of that list, freeze it, and send that information out to the client
    binding.pry
  
  end

end
