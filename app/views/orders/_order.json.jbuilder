json.extract! order, :id, :sub_total, :grand_total, :shipping, :shipped_on, :slime, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
