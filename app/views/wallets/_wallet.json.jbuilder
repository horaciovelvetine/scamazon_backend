json.extract! wallet, :id, :name, :balance, :user_id, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
