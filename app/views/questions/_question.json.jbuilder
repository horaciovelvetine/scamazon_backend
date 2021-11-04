json.extract! question, :id, :title, :body, :helpful, :user_id, :item_id, :created_at, :updated_at
json.url question_url(question, format: :json)
