json.extract! pay_method, :id, :type, :number, :expires, :code.integer, :name_on, :created_at, :updated_at
json.url pay_method_url(pay_method, format: :json)
