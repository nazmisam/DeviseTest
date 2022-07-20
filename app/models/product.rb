class Product < ApplicationRecord
    belongs_to :admin
    has_many :splits, dependent: :destroy
    has_many :splitsettlements, dependent: :destroy
    has_many :payments, dependent: :destroy
    has_one_attached :image

    after_create_commit {broadcast_prepend_to "products"}
    after_update_commit {broadcast_replace_to "products"}
    after_destroy_commit {broadcast_remove_to "products"}
end
