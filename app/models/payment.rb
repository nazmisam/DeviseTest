class Payment < ApplicationRecord
  belongs_to :products

  def generate_checksum
    data = "#{buyer_email}|#{buyer_name}|#{buyer_phone}|#{""}|#{id}|#{product.name}|http://localhost:3000/users/products/#{product.id}/payments/paymentredirect|#{product.price}|#{"02b66d73-c60f-47e6-a07c-0aa3609ddddd"}"
    puts(data)
    checksum_token = "a69b33918639440dbc7adc2f0fea60f67d7d675d3a2876f061832eecd4c04592"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
  end
end
