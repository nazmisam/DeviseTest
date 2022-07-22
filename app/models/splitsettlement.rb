class Splitsettlement < ApplicationRecord
    belongs_to :payment
    belongs_to :product
    belongs_to :admin
 
end
