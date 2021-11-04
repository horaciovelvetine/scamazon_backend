json.extract! review, :id, :title, :body, :rating, :helpful, :verified_purchase, :user_id, :item_id, :created_at, :updated_at
json.url review_url(review, format: :json)
