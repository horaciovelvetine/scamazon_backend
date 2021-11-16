module API
  module V1
    class CartsController < ActionController::Base
      # skip_before_action :verify_authenticity_token
      
      def show
        ## This action will need to return some JSON which should include the details of a random users cart (the seeding provides any number of users w/ orders.)

        ## The details that are going to be needed:
          ##the cart: sub_tot, number of items(quantity of each style), and items themselves - needs a FE Object as a reflection

          ##ea item: name, price(range??), rating (number of ratings)

          ##ea style: quantity in stock, qty.

          ## JSON wise, I would like to return the shopping_cart with its associated items, which have associated styles
        shopping_cart = ShoppingCart.all.order("RANDOM()").last
        render json: ShoppingCartSerializer.new(shopping_cart).serializable_hash.to_json


      end
    end
  end
end
