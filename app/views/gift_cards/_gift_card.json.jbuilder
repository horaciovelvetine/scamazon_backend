json.extract! gift_card, :id, :redeem_code, :notes, :amount, :wallet_id, :created_at, :updated_at
json.url gift_card_url(gift_card, format: :json)
