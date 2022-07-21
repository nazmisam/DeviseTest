class Payment < ApplicationRecord
  belongs_to :product
  has_many :splitsettlements, dependent: :destroy
  before_validation :generate_order_number, on: :create
  after_update_commit :split_settlement

  def generate_order_number
    begin
      self.order_number = 5.times.map { [*0..9].sample }.join.to_i
    end while self.class.find_by(order_number: order_number)
  end

  def generate_checksum
    data = "#{buyer_email}|#{buyer_name}|#{buyer_phone}|#{""}|#{order_number}|#{product.name}|http://localhost:3000/users/products/#{product.id}/payments/paymentredirect|#{product.price}|#{"02b66d73-c60f-47e6-a07c-0aa3609ddddd"}"
    puts(data)
    checksum_token = "a69b33918639440dbc7adc2f0fea60f67d7d675d3a2876f061832eecd4c04592"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
  end

  def split_settlement
    return unless status == 'Paid'
    product.splits.each do |s|
      rate = s.split_percent
      sum = total_pay * rate / 100
      
      split_settlement = Splitsettlement.new(payment_id: id, split_amount: sum, product_name: product_name, product_id: product_id, order_number: order_number, payment_status: status, split_percent: rate, account_name: s.account, admin_id: s.admin_id)
      split_settlement.save
    end
  end

end