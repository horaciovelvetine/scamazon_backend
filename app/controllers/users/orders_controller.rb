class Users::OrdersController < ApplicationController
  prepend_view_path 'app/views/order'

  ## Should show all the users orders
  def index; end

  ## No view - should be action after user clicks order
  def create; end

  ## Should be the final confirmation screen before hitting order
  def new; end

  ## Should show completed orders singly
  def show; end

  
end
