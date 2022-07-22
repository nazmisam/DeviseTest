class Split < ApplicationRecord
  belongs_to :product
  belongs_to :admin

  validate :percentage_rate
 
  def percentage_rate
    rate = product.splits.sum(:split_percent)
    return if (rate + split_percent) <= 100

    errors.add(:base,"Your percentage can't be more than 100%")
  end
end
