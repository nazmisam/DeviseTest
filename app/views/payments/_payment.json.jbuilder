json.extract! payment, :id, :buyer_name, :buyer_email, :buyer_address, :buyer_phone, :products_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
