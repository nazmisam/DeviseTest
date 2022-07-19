class Split < ApplicationRecord
  belongs_to :payment

  validate :percentage_rate
  before_validation :generate_split_settlement, on: :create

  def generate_split_settlement
    begin
      self.account = 
    end while self.class.find_by(order_number: order_number)
  end


  def percentage_rate  
    rate = product.splits.sum(:split_percent)
    return if (rate + split_percent) <= 1

    errors.add(:base,"Your percentage can't be more than 100%")
  end
end
