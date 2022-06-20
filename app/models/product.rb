class Product < ApplicationRecord
    has_many :payments, dependent: :destroy
end
