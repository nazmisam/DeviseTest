json.extract! payment, :id, :buyer_name, :buyer_email, :buyer_address, :buyer_phone, :product_id, :created_at, :updated_at
json.url product_payments_url(payment, format: :json)
