class Payment < ApplicationRecord
  belongs_to :product
  has_many :splits, dependent: :destroy
  before_validation :generate_order_number, on: :create

  def generate_order_number
    begin
      self.order_number = 5.times.map { [*0..9].sample }.join.to_i
    end while self.class.find_by(order_number: order_number)
  end

  def generate_checksum
    data = "#{buyer_email}|#{buyer_name}|#{buyer_phone}|#{''}|#{id}|#{product.name}|http://localhost:3000/users/products/#{product.id}/payments/paymentredirect|#{product.price}|#{"02b66d73-c60f-47e6-a07c-0aa3609ddddd"}"
    puts(data)
    checksum_token = 'a69b33918639440dbc7adc2f0fea60f67d7d675d3a2876f061832eecd4c04592'
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
  end
end
