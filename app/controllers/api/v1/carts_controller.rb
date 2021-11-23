module API
  module V1
    class CartsController < ActionController::Base
      skip_before_action :verify_authenticity_token


      def show
        cart = ShoppingCart.all.order("RANDOM()").last
        render json: ShoppingCartSerializer.new(cart).serializable_hash.to_json
      end

      def update
        cart = ShoppingCart.find(params[:id])
        cart.update_style_quantities(params)
        render json: {message: 'Cart updated successfully'}
      end

      def destroy
        cart = ShoppingCart.find(params[:id])
        user = cart.user
        binding.pry
        # cart.destroy
        # user.create_cart
      end

      def remove_item
        style = ShoppingCart.find(params[:id]).styles.find(params[:style_id])
        style.destroy
        render json: {message: 'Item Removed Successfully'}
      end

      def add_item
        item = Item.find(params[:item_id])
        cart = ShoppingCart.find(params[:id])
        cart.add_sponsor_item(item, params)
        binding.pry
        render json:{ }
      end

    end
  end
end
