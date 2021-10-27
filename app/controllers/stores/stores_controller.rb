class Stores::StoresController < ApplicationController
  before_action :find_store, only: [:show]

  def index
    @stores = Store.all
  end

  def show; end

  
end
