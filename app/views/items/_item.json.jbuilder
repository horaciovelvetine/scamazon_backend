json.extract! item, :id, :name, :sku, :description, :price, :rating, :brand, :weight, :dimensions, :manufacturer, :origin, :colo, :material, :quantity, :inventory_id, :category_id, :order_id, :shopping_cart_id, :created_at, :updated_at
json.url item_url(item, format: :json)
