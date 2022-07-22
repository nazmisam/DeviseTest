class Admin < ApplicationRecord
  has_many :products
  has_many :splits
  has_many :payments
  has_many :splitsettlements
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum roles: [ :merchant, :admin], _prefix: "as"
end
