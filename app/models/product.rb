class Product < ApplicationRecord
    has_many :payments, dependent: :destroy
    has_one_attached :image
end
