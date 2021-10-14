class Stores::StoresController < ApplicationController

  def index
    @stores = Store.all
  end
  
end
