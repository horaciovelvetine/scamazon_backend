module API
  module V1
    class CartsController < ActionController::Base
      # skip_before_action :verify_authenticity_token
      
      def show
        shopping_cart = ShoppingCart.all.order("RANDOM()").last
        render json: ShoppingCartSerializer.new(shopping_cart).serializable_hash.to_json
      end

      def update
        binding.pry
      end

      def destroy
        binding.pry
      end

      
    end
  end
end
