class Store::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]


  # GET /orders or /orders.json
  def index
    #check added devise/user scope for access to users/stores/items/orders
    #set_orders
    @orders = order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new

  # GET /orders/1/edit
  def edit
  end

  # # POST /orders or /orders.json
  # end

  # # PATCH/PUT /orders/1 or /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: "order was successfully updated." }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = order.find(params[:id])
    end
    def set_orders
      binding.pry
      @orders = @user.store.items.orders
    end

    # Only allow a list of trusted parameters through.
    # def order_params
    #   params.require(:order).permit(:name, :sku, :description, :price, :rating, :brand, :weight, :dimensions, :manufacturer, :origin, :colo, :material, :quantity, :inventory_id, :category_id, :order_id, :shopping_cart_id)
    # end
end
