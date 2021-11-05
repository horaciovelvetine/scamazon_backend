class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  # GET /stores or /stores.json
  def index
    #should show all of the stores on scamazon
    @stores = Store.all
    binding.pry
  end

  # GET /stores/1 or /stores/1.json
  def show
    #should show a specific stroes profile
    binding.pry
  end

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_store
        @store = Store.find(params[:id])
      end
end
