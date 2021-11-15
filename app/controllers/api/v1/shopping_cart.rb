module API
  module V1
    class ShoppingCarts < Grape::API
      include API::V1::Defaults
    
      resource :cart do
        desc "Shows the current cart"
        get "" do
          binding.pry
        end


    end
  end
end
