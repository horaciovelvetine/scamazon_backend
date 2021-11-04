json.extract! shopping_cart, :id, :sub_tot, :user_id, :created_at, :updated_at
json.url shopping_cart_url(shopping_cart, format: :json)
